#!/bin/bash
OUTPUT="docs/navigation/plate_index.md"
mkdir -p "$(dirname "$OUTPUT")"
echo "# Plate Index" > "$OUTPUT"
echo "" >> "$OUTPUT"
echo "Auto-generated: $(date)" >> "$OUTPUT"
echo "" >> "$OUTPUT"
echo "| Plate | File | Diagram |" >> "$OUTPUT"
echo "|-------|------|---------|" >> "$OUTPUT"
for f in plates/*.md; do
  NAME=$(basename "$f" .md)
  MMD="docs/diagrams/${NAME}.mmd"
  if [ -f "$MMD" ]; then
    DIAG="[diagram](../diagrams/${NAME}.mmd)"
  else
    DIAG="none"
  fi
  echo "| $NAME | [source]($f) | $DIAG |" >> "$OUTPUT"
done
echo "Plate index written to $OUTPUT"
