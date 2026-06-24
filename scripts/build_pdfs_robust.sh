#!/bin/bash
# Enhanced Phoenix Codex PDF Builder with error handling and robustness
# Supports markdown syntax sanitization for pandoc + pdflatex compatibility

set -e  # Exit on error

OUTDIR="pdf"
LOGFILE="pdf_build.log"
TEMPDIR="_pdf_build_temp"

mkdir -p "$OUTDIR"
mkdir -p "$TEMPDIR"

echo ""
echo "╔════════════════════════════════════════════════════════════════╗"
echo "║  Phoenix Codex PDF Builder v2.0                               ║"
echo "║  Robust pandoc + pdflatex with markdown sanitization          ║"
echo "╚════════════════════════════════════════════════════════════════╝"
echo ""

COUNT=0
FAIL=0
WARN=0

# Function to sanitize markdown for pdflatex compatibility
sanitize_markdown() {
    local input_file="$1"
    local output_file="$2"
    
    # Replace problematic markdown constructs
    sed \
        -e 's/^│/|/g' \
        -e 's/│$/|/g' \
        -e 's/│/|/g' \
        -e 's/├/|/g' \
        -e 's/┤/|/g' \
        -e 's/└/|/g' \
        -e 's/┌/|/g' \
        -e 's/─/-/g' \
        -e 's/┬/-/g' \
        -e 's/┴/-/g' \
        "$input_file" > "$output_file"
}

log_message() {
    echo "$1" | tee -a "$LOGFILE"
}

for f in plates/*.md; do
    NAME=$(basename "$f" .md)
    OUT="$OUTDIR/${NAME}.pdf"
    TEMP_MD="$TEMPDIR/${NAME}_sanitized.md"
    
    echo -n "Building: $NAME ... "
    
    # Sanitize markdown
    if sanitize_markdown "$f" "$TEMP_MD" 2>/dev/null; then
        # Try build with sanitized version
        if pandoc "$TEMP_MD" -o "$OUT" --pdf-engine=pdflatex 2>&1 | tee -a "$LOGFILE" >/dev/null; then
            echo "✓ OK"
            log_message "  → $OUT ($(du -h "$OUT" | cut -f1))"
            ((COUNT++))
        else
            echo "⚠ FALLBACK"
            # Try direct build as fallback
            if pandoc "$f" -o "$OUT" --pdf-engine=pdflatex 2>/dev/null; then
                echo "  → Direct build succeeded"
                log_message "  → $OUT (fallback, $(du -h "$OUT" | cut -f1))"
                ((COUNT++))
            else
                echo "✗ FAILED"
                log_message "  → FAILED: pandoc error for $NAME"
                ((FAIL++))
            fi
        fi
    else
        echo "✗ FAILED"
        log_message "  → FAILED: sanitization error for $NAME"
        ((FAIL++))
    fi
done

# Cleanup
rm -rf "$TEMPDIR"

echo ""
echo "╔════════════════════════════════════════════════════════════════╗"
echo "║  BUILD SUMMARY                                                 ║"
echo "├────────────────────────────────────────────────────────────────┤"
echo "║  ✓ Built:   $COUNT                                                      ║"
echo "║  ✗ Failed:  $FAIL                                                      ║"
echo "║  PDFs saved to: $OUTDIR/                                      ║"
echo "║  Log file: $LOGFILE                                           ║"
echo "╚════════════════════════════════════════════════════════════════╝"
echo ""

if [ $FAIL -eq 0 ]; then
    exit 0
else
    exit 1
fi
