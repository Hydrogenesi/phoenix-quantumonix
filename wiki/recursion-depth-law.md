# Recursion Depth Law (Law 5)

> "Depth increases with dimensional complexity. D₀ → D₁ → D₂ → ... → Apex"

---

## Definition
The Recursion Depth Law governs how deeply any cosmological engine
may recurse at any given simulation step. It is Law 5 of the
twelve Universal Laws of the Phoenix Archive.

---

## Depth Bands

| Band | Range | Status | Law Reference |
|------|-------|--------|---------------|
| Proto-depth | D₀ | Forming | Law 5 |
| Safe band | D₁–D₃ | Allowed | Law 8 (Stability Band) |
| Marginal band | D₄–D₅ | Gated | Law 9 (Convergence Envelope) |
| Divergent | D₆–D₈ | Blocked | Law 11 (Topological Continuity) |
| Collapse | D₉+ | Fatal | Law 10 (Apex Fixed-Point) |

---

## Stability Metric
Computed by `compute_depth_stability()`.
Range: `0.0` (collapse) → `1.0` (fully stable).

Tied to **Law 8 (Stability Band Law):**
Operators remain stable within bounded parameter space [λmin, λmax].

---

## Convergence Envelope
Bounded region in depth-stability space.
Defined by **Law 9:** `r(D) = r₀ × ρ^D`

Breaching the envelope triggers enforcement exceptions.

---

## Exception Hierarchy

| Exception | Trigger | Law Violated |
|-----------|---------|--------------|
| `RecursionDepthError` | Base class | — |
| `DepthBoundsExceeded` | Hard limit hit | Law 8 |
| `StabilityViolation` | Metric below threshold | Law 8 |
| `ConvergenceEnvelopeBreach` | Outside safe envelope | Law 9 |
| `DepthLockedStateError` | No safe recursion possible | Law 10 |

---

## Physical Analogs

| Law Concept | Physical Analog | Cosmological Scale |
|-------------|----------------|-------------------|
| Recursion depth | Causal layer count | Universal |
| Stability metric | Information density | Stellar |
| Convergence envelope | Entropy boundary | Collective |
| Collapse state | Singularity condition | Meta-level |

---

## Operator Modes vs Depth

| Mode | Pillar | Depth Behavior |
|------|--------|----------------|
| BEGIN | Phoenix | Initiates D₀ |
| EXTEND | Hydrogenesi | Propagates D₁→Dₙ |
| HOLD | The Third | Enforces envelope, prevents breach |

---

*See also: [Glossary](glossary.md) | [Operator Reference](operator-reference.md) | [Codex Spine](../docs/diagrams/codex_spine.mmd)*
