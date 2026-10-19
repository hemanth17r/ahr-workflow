---
name: big-tech-db-resilience
description: >-
  Universal database concurrency, production lock safety, and operational resilience standard. Codifies lock timeouts (preventing queue stalls during DDL), safe two-phase constraint validation (NOT VALID / VALIDATE), concurrent index building, race condition defenses (atomic guarded updates & optimistic concurrency control), partial index sizing, and runaway query circuit breakers (statement_timeout). Trigger when handling concurrent transactions, preventing race conditions, managing database locks, adding table constraints, or scaling under high write load.
---

# Big-Tech Database Concurrency, Locks & Resilience Standard

## 1. The Core Philosophy: Real-World Production Traffic Physics

Databases do not fail on single queries; they fail under **concurrency, lock contention, and resource starvation**:
* An unconstrained DDL migration queues behind an analytics query, blocking all subsequent application reads and taking down production.
* Two users click "Claim" at the same millisecond, and naive code allows both to succeed (the double-spend bug).
* A slow table scan hangs for 40 seconds, exhausting connection pool workers and starving web traffic.

True engineering resilience means designing every transaction, lock, and schema change so it **fails gracefully, executes non-blockingly, and maintains absolute data integrity**.

---

## 2. Safe Production DDL: Lock Timeouts & Concurrent Indexing

In PostgreSQL and MySQL, schema modifications (`ALTER TABLE`) request an `Access Exclusive Lock`. If any query is currently reading that table, the migration waits in line—and **every subsequent application query queues behind it**, freezing the site.

### A. The Lock Timeout Mandate
Always prepend DDL migrations with a strict lock timeout:
```sql
-- Abort if lock cannot be acquired within 2 seconds
SET lock_timeout = '2s';

ALTER TABLE bounties ADD COLUMN sector_code VARCHAR(16);
```
* **Why**: If traffic is heavy, the migration fails fast and rolls back, leaving production running normally. The deploy pipeline can safely retry off-peak.

### B. Concurrent Index Building (Zero Write Locks)
Standard `CREATE INDEX` blocks all write operations until indexing finishes. In production, always build indexes concurrently:
```sql
-- Builds the index in background without locking table writes
CREATE INDEX CONCURRENTLY idx_bounties_sector ON bounties (sector_id);
```

---

## 3. Two-Phase Safe Constraint Validation (`NOT VALID`)

Adding a Foreign Key or `CHECK` constraint on a large table scans every existing row while holding an exclusive lock.

### The 2-Phase Non-Blocking Standard:
```sql
-- Step 1: Enforce on NEW writes only (Instant metadata lock, zero scan)
ALTER TABLE bounties 
  ADD CONSTRAINT fk_bounty_claimer 
  FOREIGN KEY (claimer_id) REFERENCES profiles(id) 
  NOT VALID;

-- Step 2: Validate HISTORICAL rows concurrently (Takes only ShareUpdateExclusiveLock, zero write lock)
ALTER TABLE bounties VALIDATE CONSTRAINT fk_bounty_claimer;
```

---

## 4. Race Condition Defenses (Double-Claim / Double-Spend)

Amateur code performs a read (`SELECT`), checks business logic in application memory (`if status === 'OPEN'`), and issues an update (`UPDATE`). Under concurrent traffic, multiple workers read the same state and execute the mutation simultaneously.

### Strategy A: Atomic Guarded Updates (Preferred)
Incorporate the state precondition directly into the SQL `WHERE` clause:
```sql
-- Atomically transitions state ONLY if precondition is still satisfied
UPDATE bounties 
SET status = 'CLAIMED', 
    claimer_id = $1, 
    updated_at = NOW()
WHERE id = $2 
  AND status = 'OPEN'; -- Atomic lock guard
```
* Check the mutation result (`rowCount` / `affectedRows`). If `0`, another transaction won the race; return a clean conflict error immediately.

### Strategy B: Optimistic Concurrency Control (OCC with Versioning)
For complex domain models where state updates happen across multiple steps, maintain a monotonic `version` integer:
```sql
UPDATE wallets 
SET balance = balance - $1, 
    version = version + 1, 
    updated_at = NOW()
WHERE id = $2 
  AND version = $expected_version 
  AND balance >= $1;
```

### Strategy C: Pessimistic Locking for Queues (`SKIP LOCKED`)
When workers claim tasks from a shared table, prevent worker collision without blocking concurrent throughput:
```sql
SELECT id, payload 
FROM background_jobs 
WHERE status = 'PENDING' 
ORDER BY priority DESC, created_at ASC 
LIMIT 1 
FOR UPDATE SKIP LOCKED; -- Skips rows currently locked by other workers
```

---

## 5. Advanced Index Physics: Partial & Expression Indexes

### A. Partial Indexes (The 80% RAM Saver)
Never index inactive, soft-deleted, or terminal state rows if queries only search for active data:
```sql
-- Indexes ONLY active, non-deleted bounties
CREATE INDEX CONCURRENTLY idx_bounties_active_sector 
ON bounties (sector_id, created_at DESC) 
WHERE status = 'OPEN' AND deleted_at IS NULL;
```
* **Impact**: The index is 5× to 10× smaller, fits entirely in RAM cache, and accelerates search dramatically.

### B. Expression Indexes
If searching on transformed strings, standard B-trees will not trigger. Use functional expression indexes:
```sql
CREATE INDEX CONCURRENTLY idx_users_lower_email 
ON users (LOWER(email));
```

---

## 6. Runaway Query Circuit Breakers (`statement_timeout`)

A single bad query plan or missing join filter can run for minutes, consuming 100% CPU and exhausting the connection pool.

### The Standard:
* Mandate a session/transaction level timeout on all web request database connections:
  ```sql
  -- Terminates any query exceeding 3000ms
  SET statement_timeout = '3000ms';
  ```
* Never let user-facing HTTP request threads run unconstrained queries. Background reporting and migrations should explicitly run on separate dedicated connections with custom timeouts.

---

## 7. Pre-Flight Resilience Checklist

Before releasing any concurrent feature or high-traffic mutation, verify:
- [ ] **Lock Timeout Added**: Does DDL set `SET lock_timeout` to prevent queue deadlocks?
- [ ] **Concurrent Indexes**: Are new indexes created using `CONCURRENTLY`?
- [ ] **Two-Phase Constraints**: Are new foreign keys added with `NOT VALID` before validation?
- [ ] **Race Conditions Neutralized**: Are status claims and balance deductions guarded atomically in SQL or versioned with OCC?
- [ ] **Partial Indexes Used**: Are soft-deleted or terminal rows filtered out of hot index definitions?
- [ ] **Circuit Breakers Active**: Are user-facing web queries capped by a `statement_timeout`?
