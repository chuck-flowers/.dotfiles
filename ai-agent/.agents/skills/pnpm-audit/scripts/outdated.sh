#!/bin/bash
# Find outdated dependencies

set -e

echo "=== PNPM Dependency Review ==="
echo ""

# Check if pnpm is installed
if ! command -v pnpm &> /dev/null; then
    echo "Error: pnpm is not installed. Please install it first."
    echo "Run: npm install -g pnpm"
    exit 1
fi

# Check for outdated packages
echo "Checking for outdated dependencies..."
pnpm outdated

echo ""
echo "=== Dependency Review Complete ==="
