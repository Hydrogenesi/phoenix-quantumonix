# Recursion Depth Law

## Overview
The Recursion Depth Law governs how deeply any cosmological engine
may recurse at any given cycle. It is the foundational constraint
of the Phoenix-Quantumonix system.

## Core Concepts

### Depth Bands
Discrete ranges of recursion depth with defined stability properties.
Each band has an entry condition, an exit condition, and a set of
permitted operations.

### Stability Metric
A scalar value computed by `compute_depth_stability()` representing
the current health of the recursion state. Range: 0.0 (collapse) to
1.0 (fully stable).

### Convergence Envelope
The bounded region in state-space within which recursion is permitted
to proceed. Breaching the envelope triggers enforcement exceptions.

### Safe Band
The subset of depth bands where the stability metric remains above
`stability_threshold` and the convergence envelope is intact.

## Exception Hierarchy

| Exception | Condition | Response |
|-----------|-----------|----------|
| `RecursionDepthError` | Base class | Log and assess |
| `DepthBoundsExceeded` | depth < min or > max | Clamp and warn |
| `StabilityViolation` | metric below threshold | Gate further recursion |
| `ConvergenceEnvelopeBreach` | state outside envelope | Hard block + rollback |
| `DepthLockedStateError` | no safe recursion possible | Halt, require operator |

## Config Reference

| Field | Description |
|-------|-------------|
| `min_depth` | Minimum permitted recursion depth |
| `max_depth` | Maximum permitted recursion depth |
| `stability_threshold` | Metric value below which recursion is gated |
| `convergence_window` | State-space window defining the envelope |
| `max_depth_increment_per_step` | Maximum depth increase per cycle |

## Physical Analogs
- Depth ↔ causal layering / information density
- Stability metric ↔ entropy gradient
- Convergence envelope ↔ stellar stability zone
- Collapse state ↔ core collapse in stellar evolution
