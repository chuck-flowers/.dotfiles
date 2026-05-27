#!/bin/bash
# Display dependency tree

set -e

echo "=== PNPM Dependency Tree ==="
echo ""

# Check if pnpm is installed
if ! command -v pnpm &> /dev/null; then
    echo "Error: pnpm is not installed. Please install it first."
    echo "Run: npm install -g pnpm"
    exit 1
fi

# Display dependency tree
echo "Full dependency tree:"
pnpm install 2>&1 | tail -50

echo ""
echo "Top-level dependencies:"
pnpm list

echo ""
echo "=== Dependency Tree Complete ==="
