#!/bin/bash
# Security audit script for pnpm projects

set -e

echo "=== PNPM Security Audit ==="
echo ""

# Check if pnpm is installed
if ! command -v pnpm &> /dev/null; then
    echo "Error: pnpm is not installed. Please install it first."
    echo "Run: npm install -g pnpm"
    exit 1
fi

# Perform security audit
echo "Running security audit..."
pnpm audit

echo ""
echo "=== Audit Complete ==="
