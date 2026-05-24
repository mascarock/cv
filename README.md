# CV & Cover Letters

Source-of-truth HTML résumé and tailored cover letters for Niccolò Mascaro. PDFs in `dist/` are generated from the HTML sources.

## Layout

```
src/
  cv.html                          # Main CV (edit here)
  cover-letters/
    metallicus-2026-04.html        # One file per application
dist/
  cv.pdf                           # Generated
  cover-letters/
    metallicus-2026-04.pdf         # Generated
archive/
  …                                # Old exports / reference material (not built)
scripts/
  build.sh                         # HTML → PDF via headless Chrome
```

## Edit the CV

1. Open `src/cv.html` in a browser to preview.
2. Regenerate PDFs: `make build`
3. Commit both source and `dist/` when content changes.

## New cover letter

1. Copy an existing letter in `src/cover-letters/` or start from scratch (see `metallicus-2026-04.html` for layout).
2. Name it `{company}-{YYYY-MM}.html`.
3. Run `make build` — the script picks up every `.html` in `src/cover-letters/`.

## Requirements

- macOS with [Google Chrome](https://www.google.com/chrome/) (used headless for PDF export)
- Override browser path if needed: `CHROME=/path/to/chrome make build`

## Remote

```bash
git remote -v   # origin → git@github.com:mascarock/cv.git
```
