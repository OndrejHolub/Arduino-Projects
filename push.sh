#!/bin/bash
# Push Arduino Projects to GitHub
# Usage: bash push.sh "commit message"
set -e

REPO_DIR="$HOME/Arduino-Projects"
ZIP="$HOME/Downloads/Arduino-Projects-upload.zip"
REMOTE="https://github.com/OndrejHolub/Arduino-Projects.git"
MSG="${1:-Update Arduino Projects}"

# 1. Unpack latest zip (if present) into the local repo folder
mkdir -p "$REPO_DIR"
if [ -f "$ZIP" ]; then
  unzip -oq "$ZIP" -d "$REPO_DIR"
  echo "✓ Unpacked $ZIP"
fi
cd "$REPO_DIR"

# 2. First run only: init git + connect to GitHub
if [ ! -d .git ]; then
  git init -q -b main
  git remote add origin "$REMOTE"
  echo "✓ Git initialised, remote set"
fi

# 3. Commit + push
git add -A
if git diff --cached --quiet; then
  echo "Nothing new to commit"
else
  git commit -qm "$MSG"
  echo "✓ Committed: $MSG"
fi
git push -u origin main
echo "✓ Pushed → https://github.com/OndrejHolub/Arduino-Projects"
