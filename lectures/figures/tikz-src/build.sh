#!/bin/bash
# Build TikZ source files to SVG for inclusion in Quarto book.
# Requires: pdflatex (TeX Live), pdftocairo (poppler)
#
# Usage: cd tikz-src && bash build.sh

set -e

for tex in *.tex; do
  base="${tex%.tex}"
  echo "Building ${base}..."
  pdflatex -interaction=nonstopmode "$tex" > /dev/null 2>&1
  pdftocairo -svg "${base}.pdf" "../${base/trajectory/mdp-trajectory}.svg"
  echo "  -> ../${base/trajectory/mdp-trajectory}.svg"
done

# Clean up LaTeX artifacts
rm -f *.aux *.log *.pdf
echo "Done."
