# Engine Architecture

## Overview
All cosmological engines in Phoenix-Quantumonix share a common
interface defined by the engine template and governed by the
Recursion Depth Law.

## Standard Engine Hooks

| Hook | Description |
|------|-------------|
| `initialize_state()` | Set up initial depth and coherence values |
| `step()` | Advance one recursion cycle |
| `compute_coherence()` | Return current coherence metric |
| `apply_depth_update()` | Request a depth change via the law module |

## Engine Registry

| Engine | Status | Module |
|--------|--------|--------|
| Collective Consciousness Engine | Active | `code/collective/` |
| Field Topology Simulator | Planned | `code/cosmology/` |
| Meta-Law Compiler | Planned | `code/meta/` |
| Cosmogenesis Loop Orchestrator | Planned | `code/cosmogenesis/` |
| Nano-Star Simulation | Active | `code/stellar_structure/` |

## Shared Law Module
All engines import from `code/shared/recursion_depth.py`:
- `RecursionDepthConfig`
- `compute_depth_stability()`
- `can_increase_recursion()`
- `enforce_depth_stability()`

## Error Handling Pattern
1. Engine calls `enforce_depth_stability()`
2. Law module raises typed exception if violated
3. Engine catches, logs structured context
4. Engine decides: rollback, reduce depth, or halt
5. Operator hooks fire: `on_depth_violation()`, `on_collapse()`
