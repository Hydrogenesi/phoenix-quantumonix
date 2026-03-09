#!/bin/bash
# Scans code and docs for known Codex terms
# Fails if any term is missing from wiki/glossary.md

GLOSSARY="wiki/glossary.md"
PASS=0
FAIL=0

TERMS=(
  "Convergence Envelope"
  "Recursion Depth"
  "Apex Locus"
  "Triadic Knot"
  "Topological Continuity"
  "Geometric Fidelity"
  "Self-Similarity"
  "Stability Band"
  "Fixed-Point"
  "Sigil Embedding"
)

echo ""
echo "Glossary Consistency Check"
echo "────────────────────────────────────"

for TERM in "${TERMS[@]}"; do
  if grep -qi "$TERM" "$GLOSSARY"; then
    echo "  PASS: $TERM"
    ((PASS++))
  else
    echo "  FAIL: '$TERM' not found in glossary"
    ((FAIL++))
  fi
done

echo "────────────────────────────────────"
echo "  Passed: $PASS | Failed: $FAIL"

if [ $FAIL -gt 0 ]; then
  echo "  Glossary check FAILED — update wiki/glossary.md"
  exit 1
else
  echo "  Glossary check PASSED"
  exit 0
fi
