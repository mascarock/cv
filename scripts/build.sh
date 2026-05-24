#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
CHROME="${CHROME:-/Applications/Google Chrome.app/Contents/MacOS/Google Chrome}"

if [[ ! -x "$CHROME" ]]; then
  echo "Chrome not found at: $CHROME" >&2
  echo "Set CHROME to your headless-capable browser binary." >&2
  exit 1
fi

print_pdf() {
  local html="$1"
  local pdf="$2"
  mkdir -p "$(dirname "$pdf")"
  "$CHROME" \
    --headless=new \
    --disable-gpu \
    --no-pdf-header-footer \
    --print-to-pdf="$pdf" \
    "file://$html"
  echo "  → $pdf"
}

echo "Building CV PDFs…"
print_pdf "$ROOT/src/cv.html" "$ROOT/dist/cv.pdf"

for letter in "$ROOT"/src/cover-letters/*.html; do
  [[ -f "$letter" ]] || continue
  name="$(basename "$letter" .html)"
  print_pdf "$letter" "$ROOT/dist/cover-letters/${name}.pdf"
done

echo "Done."
