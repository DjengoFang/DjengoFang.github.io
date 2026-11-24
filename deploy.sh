#!/usr/bin/env bash
# Build the site and publish it.
#   source branch : this Hugo source
#   main branch   : the built site that GitHub Pages serves (checked out in ./public)
# Usage: ./deploy.sh ["commit message"]
set -euo pipefail
cd "$(dirname "$0")"
HUGO="${HUGO:-../tools/hugo}"   # Hugo v0.53
command -v "$HUGO" >/dev/null || HUGO=hugo

if [ ! -e public/.git ]; then
  git worktree add public main
fi
git -C public rm -rq --ignore-unmatch .
"$HUGO"
touch public/.nojekyll
git -C public add -A
if git -C public diff --cached --quiet; then
  echo "Nothing changed in the built site."
else
  git -C public commit -q -m "${1:-Update site}"
fi
git -C public push origin main
echo "Published. Remember to commit and push the source branch too."
