---
description: Perform comprehensive code review on a project
argument-hint: "<file-path>"
---
Perform a comprehensive code review on the codebase. Analyze the following aspects:

## Security
- Identify potential security vulnerabilities
- Check for sensitive data exposure (API keys, tokens, passwords)
- Validate input sanitization and output encoding
- Review authentication/authorization mechanisms
- Check for SQL injection, XSS, and command injection risks
- Verify dependency versions for known vulnerabilities

## Code Quality
- Review for bugs and logic errors
- Check for code duplication and opportunities for refactoring
- Evaluate naming conventions and readability
- Assess adherence to the project's coding style
- Review error handling and edge cases
- Check for proper resource cleanup (file handles, database connections, timers)

## Performance
- Identify potential performance bottlenecks
- Review for unnecessary computations or redundant operations
- Check for efficient data structures and algorithms
- Look for memory leaks or inefficient memory usage patterns
- Review database queries for optimization opportunities

## Architecture & Design
- Evaluate code organization and modularity
- Check for proper separation of concerns
- Review dependency injection patterns
- Assess testability and maintainability
- Check for proper error propagation

## Testing
- Verify presence and coverage of unit tests
- Check for integration and end-to-end tests
- Review test cases for edge cases and error scenarios
- Assess test quality and independence

## Best Practices
- Follow DRY (Don't Repeat Yourself) principle
- Check for proper documentation and comments
- Review API design and consistency
- Validate use of modern language features appropriately

## Output Format
Present findings in the following format:
1. Critical issues (security vulnerabilities, major bugs)
2. High priority (significant code quality, performance issues)
3. Medium priority (code organization, maintainability concerns)
4. Low priority (style suggestions, minor improvements)

For each issue, provide:
- A clear description of the problem
- Code snippet with the issue
- Recommended fix
- Severity level (Critical/High/Medium/Low)

## Output File
Save the complete review report to a file named `REVIEW.md` in the same directory as the reviewed codebase. Include the following in the file:
- Review metadata (file path, date, reviewer)
- Summary of findings by priority level
- Complete list of all issues with severity levels
- Recommendations and next steps
