---
name: pnpm-audit
description: Audits pnpm projects for security vulnerabilities, outdated dependencies, and best practices. Use for maintaining secure and up-to-date project dependencies.
---

# PNPM Audit

A skill for auditing pnpm projects to find security vulnerabilities, outdated dependencies, and potential issues.

## Setup

Ensure you have pnpm installed globally or in your project:

```bash
# Global installation
npm install -g pnpm

# Or use pnpm bootstrap for new projects
pnpm init
```

## Basic Audit

Run the audit from your skill directory:

```bash
# Basic vulnerability scan
pnpm audit

# Check for outdated dependencies
pnpm outdated

# Full audit with detailed report
pnpm audit --depth=unlimited
```

## Audit Commands

### Security Audit
```bash
# Check for known vulnerabilities
./scripts/audit.sh

# Check for outdated packages
./scripts/outdated.sh
```

### Report Generation
```bash
# Generate human-readable report
./scripts/report.sh

# Generate JSON report for CI/CD
./scripts/ci-report.sh
```

### Dependency Review
```bash
# Review dependency tree
./scripts/tree.sh

# Show largest dependencies by size
./scripts/size-report.sh
```

## Usage

### From within a pnpm project:

```bash
cd /path/to/project && pnpm audit
```

### Using the skill commands:

```bash
# Load the skill and run audit
/skill:pnpm-audit audit

# Run with specific flags
/skill:pnpm-audit audit --depth=unlimited

# Generate detailed report
/skill:pnpm-audit report
```

## Commands

| Command | Description |
|---------|-------------|
| `audit` | Scan for security vulnerabilities |
| `outdated` | Find packages that can be updated |
| `report` | Generate human-readable report |
| `tree` | Display dependency tree |
| `fix` | Attempt to fix reported issues |

## Notes

- Run audits regularly as part of CI/CD
- Review all audit results before applying fixes
- Some vulnerabilities may require dependency updates that break your build
- Consider using `pnpm audit fix` to attempt automatic fixes
- For production, always test fixes in a staging environment first
