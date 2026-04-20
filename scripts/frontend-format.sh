#!/bin/bash

# Frontend Format Script - MODIFIES FILES
# Formats HTML, JS, and CSS files using Prettier.
#
# What it does:
# 1. Formats all frontend files with Prettier (modifies files)
#
# Usage: ./scripts/frontend-format.sh
# Prerequisites: cd frontend && npm install

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT_DIR="$(dirname "$SCRIPT_DIR")"

echo "Running frontend format script (will modify files)..."

cd "$ROOT_DIR/frontend"

echo "1. Formatting with Prettier..."
npx prettier --write "*.html" "*.js" "*.css"

echo "Frontend formatting completed!"
