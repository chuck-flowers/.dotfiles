#!/bin/bash
# Generate audit report

set -e

REPORT_FILE="audit-report.md"

echo "=== PNPM Audit Report Generator ==="
echo ""

# Check if pnpm is installed
if ! command -v pnpm &> /dev/null; then
    echo "Error: pnpm is not installed. Please install it first."
    echo "Run: npm install -g pnpm"
    exit 1
fi

# Initialize report
echo "# PNPM Security Audit Report" > "$REPORT_FILE"
echo "" >> "$REPORT_FILE"
echo "Generated: $(date)" >> "$REPORT_FILE"
echo "" >> "$REPORT_FILE"

# Security vulnerabilities
echo "## Security Vulnerabilities" >> "$REPORT_FILE"
echo "" >> "$REPORT_FILE"
echo "---" >> "$REPORT_FILE"
pnpm audit 2>&1 | head -20 >> "$REPORT_FILE" || echo "No vulnerabilities found" >> "$REPORT_FILE"
echo "" >> "$REPORT_FILE"

# Outdated dependencies
echo "## Outdated Dependencies" >> "$REPORT_FILE"
echo "" >> "$REPORT_FILE"
echo "---" >> "$REPORT_FILE"
pnpm outdated >> "$REPORT_FILE" 2>&1 || echo "No outdated packages found" >> "$REPORT_FILE"
echo "" >> "$REPORT_FILE"

# Dependency tree
echo "## Dependency Tree (Top Level)" >> "$REPORT_FILE"
echo "" >> "$REPORT_FILE"
echo "---" >> "$REPORT_FILE"
pnpm install 2>&1 | tail -10 >> "$REPORT_FILE" || echo "See pnpm install for details" >> "$REPORT_FILE"
echo "" >> "$REPORT_FILE"

echo "Report generated: $REPORT_FILE"
