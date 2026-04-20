#!/bin/bash

# Frontend Lint Script - READ-ONLY
# Checks code quality without modifying files. Perfect for CI/CD pipelines.
#
# What it does:
# 1. Checks formatting consistency with Prettier (read-only)
# 2. Lints JavaScript with ESLint (read-only)
#
# Exit code 0 = all checks pass, non-zero = issues found.
#
# Usage: ./scripts/frontend-lint.sh
# Prerequisites: cd frontend && npm install

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT_DIR="$(dirname "$SCRIPT_DIR")"

echo "Running frontend lint checks (read-only)..."

cd "$ROOT_DIR/frontend"

echo "1. Checking formatting with Prettier..."
npx prettier --check "*.html" "*.js" "*.css"

echo ""
echo "2. Linting JavaScript with ESLint..."
npx eslint "*.js"

echo ""
echo "Frontend lint checks completed! Exit code 0 = all checks pass."
