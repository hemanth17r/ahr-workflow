---
name: production-performance-and-efficiency
description: >-
  Enforces production-grade performance, resource efficiency, and architectural rigor. Focuses on minimizing latency, unnecessary work, network transfers, and DB operations using justified optimizations. Trigger when the task involves optimizing bottlenecks, reducing payload/query overhead, or when asked to "build for efficiency", "optimize performance", "production performance", "performance audit", "this is slow", "speed this up", "speed up", "too slow", "reduce latency", "optimize this", or "too many DB calls".
---

# Production Performance & Efficiency Standards

## Core Principles
Build for correctness, security, reliability, maintainability, and efficiency. Minimize unnecessary computation, data transfer, database operations, network requests, and user waiting time.

## Rules
1. **Minimize Resource Overhead**: Avoid redundant work, duplicate queries, payload bloat, unnecessary re-renders, or blocking main-thread computations.
2. **Justified Optimization Patterns**: Apply pattern techniques only when justified by architecture or scale requirements:
   - **Caching**: Store expensive compute or frequent immutable queries.
   - **Batching & Concurrency**: Group operations and run independent tasks concurrently.
   - **Lazy Loading & Pagination**: Defer non-critical resource loading and paginate large datasets.
   - **Background Processing**: Offload long-running operations off the critical user-waiting path.
3. **No Premature Optimization**: Do NOT introduce complex optimizations without a demonstrated bottleneck, measurable impact, or clear architectural reason.
4. **Validation & Metrics**: Verify performance improvements using application-specific tests, metrics, or performance audits (e.g., Lighthouse / DevTools).

---

## 3. Just-In-Time (JIT) Telemetry & Sub-Module Isolation Protocol
When designing complex dashboards, administrative portals, or multi-tab screens:
1. **Single-Page In-Memory Living Shell (Zero Hard Multi-Page Roundtrips)**:
   - Strictly forbid splitting operator, merchant, or admin dashboards into separate hard Next.js routes (`/admin/tab-a`, `/store/tab-b`) with `force-dynamic` that destroy DOM state and force multi-hop SSR roundtrips on every tab tap.
   - Every operator dashboard MUST be architected as a single-page in-memory living shell where tab switches occur in **0ms** via URL hash (`#module`), preserving operator search terms, filters, and scroll positions in client memory (`loadedModules`).
2. **Sub-30ms Instant Mount Telemetry**:
   - Initial server-rendered payload or client mount must strictly fetch scalar aggregate counts (`count: 'exact'`, `head: true`, or specialized summary RPCs).
   - Strictly forbid dumping bulk entity rows, large catalog tables, or deep relational joins on root screen load.
3. **On-Demand JIT Sub-Module Fetching & Memory Caching**:
   - Defer sub-module, tab, drawer, and modal data loading until direct user activation.
   - Maintain client module state (`loadedModules`) to cache fetched results in memory—guaranteeing 0ms subsequent tab navigation without redundant database roundtrips.
   - Always expose an explicit "Sync Live / Refresh" trigger allowing operators to invalidate and reload the active module on demand.
4. **URL State & Navigation Reversibility**:
   - Synchronize active sub-modules with the URL (hash `#module` or search param `?tab=module`).
   - Ensure bookmarking, browser back/forward buttons, and page refreshes preserve the exact operator context.
5. **Domain-Isolated Sub-Component Architecture**:
   - Never build monolithic multi-tab components (>300 lines combining distinct operational domains).
   - Decompose every tab, filter strip, modal, and metric bar into single-responsibility sub-components under a dedicated `/components/` sub-directory.

