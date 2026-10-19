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
