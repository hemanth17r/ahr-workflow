---
name: big-tech-db-craft
description: >-
  Universal database architecture and performance standard adapted from Big Tech for lean systems. Codifies the 4-phase Expand/Contract zero-downtime migration lifecycle, query projection restraint, keyset cursor pagination over offset scans, defensive indexing (equality before range), and atomic transaction boundaries. Trigger when designing schemas, writing migrations, optimizing queries, creating indexes, building database models, or when the task involves "create a table", "add a column", "new migration", "schema change", "alter table", "database index", or "query optimization".
---

# Big-Tech Database Craft & Performance Standard

## 1. The Core Philosophy: The 5 Laws of Data Systems

A high-performance database layer obeys 5 mechanical laws regardless of scale:
1. **Never break active code during a schema change** (Zero-downtime Expand/Contract).
2. **Never query fields you aren't rendering** (Projection restraint).
3. **Never let pagination degrade as tables grow** (Keyset over Offset).
4. **Never let foreign keys or multi-column queries trigger full table scans** (Defensive indexing).
5. **Never mutate related state outside atomic boundaries** (Transactions & Idempotency).

---

## 2. Law 1: The Expand/Contract (Parallel Run) Migration Pattern

Synchronous migrations that rename columns, change data types, or add non-null constraints will lock tables or break running application instances.

### The 4-Phase Zero-Downtime Lifecycle:

```
[1. EXPAND] ──────────► [2. DUAL-WRITE] ────────► [3. BACKFILL] ────────► [4. CONTRACT]
Add nullable column.     Write to both cols;     Sync historical rows    Drop old column
App keeps running.       read from old.          and switch reads.       from database.
```

1. **Phase 1 (Expand)**: Add the new column as `NULLABLE` (or with a safe default). Running servers continue operating on the old column without interruption:
   ```sql
   ALTER TABLE users ADD COLUMN full_name TEXT;
   ```
2. **Phase 2 (Dual-Write)**: Deploy an application update that writes to **both** `name` and `full_name`, but continues reading from `name`.
3. **Phase 3 (Backfill & Switch Read)**:
   * Run background backfill: `UPDATE users SET full_name = name WHERE full_name IS NULL;`
   * Once synced, deploy code switching application reads exclusively to `full_name`.
4. **Phase 4 (Contract)**: Verify zero code references `name`, then drop the legacy column:
   ```sql
   ALTER TABLE users DROP COLUMN name;
   ```

---

## 3. Law 2: Query Projection Restraint & Zero $N+1$ Loops

Treating the database like an unconstrained storage bucket causes memory pressure and network saturation.

### A. Strict Column Projections (Ban `SELECT *`)
* ❌ **Amateur**: `SELECT * FROM bounties WHERE sector_id = $1;` (Pulls massive JSONB metadata, descriptions, and audit logs over the wire).
* ✅ **Big-Tech Standard**: Explicitly project only the fields needed for the active view:
  ```sql
  SELECT id, title, reward_amount, status, created_at 
  FROM bounties 
  WHERE sector_id = $1;
  ```

### B. Eliminate $N+1$ Query Loops
* ❌ **Amateur**: Querying parent items, then running a separate database call inside a loop for each child item.
* ✅ **Big-Tech Standard**: Use single batched queries with `IN (...)`, relational `JOIN`, or array containment (`ANY`):
  ```ts
  const userIds = users.map(u => u.id);
  const profiles = await db.query(
    'SELECT user_id, display_name, avatar_url FROM profiles WHERE user_id = ANY($1)',
    [userIds]
  );
  ```

---

## 4. Law 3: Keyset (Cursor) Pagination Over Offset Scans

`OFFSET 10000 LIMIT 20` forces the database engine into an $O(N)$ table scan, walking through 10,000 dead rows before returning 20.

### The Keyset Standard ($O(1)$)
Seek directly to the last-seen record using a composite index on `(created_at, id)`:

```sql
SELECT id, title, reward_amount, created_at
FROM bounties
WHERE (created_at, id) < ($1, $2)
ORDER BY created_at DESC, id DESC
LIMIT 20;
```
* **Performance**: Directly jumps to the index pointer in $O(\log N)$ and scans exactly 20 rows. Query response time stays identical at 100 rows or 10,000,000 rows.

---

## 5. Law 4: Defensive Indexing Physics

### A. The Foreign Key Index Mandate
Every foreign key column (`user_id`, `organization_id`, `bounty_id`) must have an explicit B-tree index. Unindexed foreign keys cause table locks during deletes and catastrophic table scans during joins.

### B. Composite Index Order: "Equality Before Range"
When a query filters by multiple columns, place **equality** columns first and **range/sort** columns second:

$$\text{Index Declaration Order: } (\text{Equality Column}, \text{Range / Sort Column})$$

* **Query**: `WHERE account_id = $1 AND created_at >= $2 ORDER BY created_at DESC`
* ❌ **Ineffective**: `CREATE INDEX idx ON transactions(created_at, account_id);`
* ✅ **Effective**: `CREATE INDEX idx ON transactions(account_id, created_at DESC);`

---

## 6. Law 5: Atomic Transactions & Idempotency

### A. Atomic Mutation Scope
Wrap multi-table state changes inside explicit transaction blocks so failures automatically roll back:
```sql
BEGIN;
  UPDATE balances SET amount = amount - 100 WHERE account_id = 'A';
  UPDATE balances SET amount = amount + 100 WHERE account_id = 'B';
  INSERT INTO transfer_logs (from_id, to_id, amount) VALUES ('A', 'B', 100);
COMMIT;
```

### B. Idempotent Upserts (`ON CONFLICT`)
Avoid `SELECT`-then-`INSERT` race conditions. Use atomic native upserts:
```sql
INSERT INTO user_preferences (user_id, theme, notifications)
VALUES ($1, $2, $3)
ON CONFLICT (user_id)
DO UPDATE SET 
  theme = EXCLUDED.theme,
  notifications = EXCLUDED.notifications,
  updated_at = NOW();
```

---

## 7. Pre-Flight Database Checklist

Before completing any database-related change, verify:
- [ ] **Zero-Downtime Safe**: Does this migration avoid renaming or dropping columns that running code relies on?
- [ ] **No `SELECT *`**: Are query columns explicitly named?
- [ ] **Zero $N+1$**: Are child records batched rather than queried inside loops?
- [ ] **Cursor Pagination**: Are infinite feeds using keyset comparisons rather than high `OFFSET`?
- [ ] **Foreign Keys Indexed**: Does every foreign key have a dedicated index?
- [ ] **Composite Index Order**: Are equality columns ordered before range columns?
- [ ] **Atomic Boundaries**: Are multi-step mutations enclosed in transactions?
