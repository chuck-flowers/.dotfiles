# PNPM Audit Skill

A skill for auditing pnpm projects to find security vulnerabilities, outdated dependencies, and potential issues.

## Quick Start

1. Install pnpm (if not already installed):
   ```bash
   npm install -g pnpm
   ```

2. Navigate to your pnpm project:
   ```bash
   cd /path/to/your/project
   ```

3. Run audit commands:
   ```bash
   ./scripts/audit.sh
   ./scripts/outdated.sh
   ./scripts/report.sh
   ```

## Available Scripts

| Script | Description |
|--------|-------------|
| `audit.sh` | Security vulnerability scan |
| `outdated.sh` | Find packages that can be updated |
| `report.sh` | Generate comprehensive audit report |
| `tree.sh` | Display dependency tree |

## Usage with Skill Commands

Invoke the skill via:
```bash
/skill:pnpm-audit audit
/skill:pnpm-audit report
/skill:pnpm-audit tree
```

## CI/CD Integration

For CI/CD pipelines, use:
```bash
./scripts/ci-report.sh > audit-results.json
```
