# Commit Changes
<!-- Template Version: 0 | ContextKit: 0.0.0 | Updated: 2025-09-13 -->

> [!WARNING]
> **👩‍💻 FOR DEVELOPERS**: Do not edit the content above the developer customization section - changes will be overwritten during ContextKit updates.
>
> For project-specific customizations, use the designated section at the bottom of this file.
>
> Found a bug or improvement for everyone? Please report it: https://github.com/FlineDev/ContextKit/issues

## Description
Commit development changes with proper formatting, validation, and constitutional compliance checks

## Parameters
- `message` (optional): Custom commit message, defaults to generating from current task context

## Execution Flow (main)
1. Validate development state and prerequisites
   → Check that /Implement/start-working was executed and development context exists
   → Verify current feature and active task from development session
   → If no active development context: ERROR "Start development session first with /Implement/start-working"
2. Run pre-commit constitutional validation
   → Execute accessibility subagent for UI changes (VoiceOver labels, color contrast)
   → Execute privacy subagent for data handling changes (encryption, user consent)
   → Execute localization subagent for user-facing changes (string externalization)
   → Execute maintainability subagent for code changes (architecture, error handling)
   → If any validation fails: ERROR with specific guidance for fixes
3. Apply code formatting and linting
   → Run SwiftFormat for self-explicit syntax and structure
   → Run swift-format for line breaks and Apple style conformance
   → Apply project-specific formatting rules from workspace Context.md
   → Run any additional linters configured for project type
4. Verify build and test status
   → Ensure project builds successfully after formatting
   → Run relevant tests for changed components
   → For Swift Package: Verify Linux compatibility if cross-platform
   → For iOS/macOS: Run accessibility and UI tests if UI changes detected
5. Generate or validate commit message
   → If message provided: validate against GitCommit.md guidelines
   → If not provided: generate from active task description and constitutional compliance
   → Follow format: "[Action] [what] [+ additional context if needed]"
   → Ensure message is 50 characters or less, imperative mood, no period
   → NEVER include AI attribution, co-authorship, or emoji
6. Stage changes and create commit
   → Stage all formatter changes and implementation changes
   → Create commit with validated message following GitCommit.md standards
   → Update task tracking: mark current task as completed in Steps.md
   → Update development session context for next task
7. Post-commit validation and next steps
   → Verify commit was created successfully
   → Check if feature is complete (all tasks in Steps.md done)
   → If feature complete: suggest next steps (/Implement/release-app or /Implement/release-package)
   → If feature incomplete: suggest continuing with next task
8. Return: SUCCESS (changes committed with constitutional compliance)

## Template Variables
${CURRENT_TASK} - Active task being committed
${CONSTITUTIONAL_STATUS} - Results of constitutional validation checks
${FORMATTING_APPLIED} - List of formatters that were applied
${COMMIT_MESSAGE} - Generated or validated commit message
${NEXT_ACTION} - Suggested next step based on feature completion status

## Pre-Commit Constitutional Validation

### Accessibility Validation (for UI changes)
- **VoiceOver Support**: All interactive elements have accessibility labels and hints
- **Color Contrast**: Semantic colors used, sufficient contrast ratios maintained
- **Keyboard Navigation**: Logical focus order, all actions keyboard accessible
- **Dynamic Type**: Text scales properly, layouts adapt to larger text sizes

### Privacy Validation (for data changes)
- **Data Minimization**: Only necessary data collected and stored
- **User Consent**: Clear consent mechanisms for data collection/sharing
- **Secure Storage**: Sensitive data encrypted, keychain usage for credentials
- **Privacy Manifest**: Accurate declaration of data usage and third-party SDKs

### Localization Validation (for user-facing changes)
- **String Externalization**: All user-facing strings use String(localized:) or equivalent
- **Semantic Keys**: Localization keys are descriptive and context-aware
- **Formatting**: Numbers, dates, currencies use system formatters
- **Layout Adaptation**: UI handles variable text lengths and RTL languages

### Maintainability Validation (for all changes)
- **Architecture Consistency**: Code follows established patterns and conventions
- **Error Handling**: Proper error types, user-friendly messages, typed throws
- **Documentation**: Complex logic documented, API changes documented
- **Testing**: Critical paths covered by tests, no broken existing tests

## Code Formatting Pipeline
*Executed in order during pre-commit process*

1. **SwiftFormat** (if Swift code changed)
   ```bash
   swiftformat . --config .swiftformat
   ```
   - Adds explicit `self.` where required
   - Enforces consistent spacing and structure

2. **swift-format** (if Swift code changed)
   ```bash
   swift-format --in-place --recursive Sources/
   ```
   - Applies Apple's official formatting rules
   - Handles line breaks and complex formatting

3. **Project-Specific Formatters**
   - Apply any additional formatters defined in workspace Context.md
   - Run language-specific linters (SwiftLint, ESLint, etc.)

## Commit Message Generation Rules
*Following GitCommit.md guidelines*

### Format: `[Action] [what] [+ additional context if needed]`
- **Action**: Add, Fix, Update, Remove, Rename, Merge, Apply, Clean, Document, Improve
- **Length**: 50 characters max, extend to 72 if clarity requires
- **Style**: Imperative mood, capitalize first word, no period
- **Content**: Focus on functionality, never mention formatting

### Examples
```bash
# Good examples
"Add user authentication with biometric support"
"Fix accessibility labels in settings screen"  
"Update privacy manifest for location usage"
"Improve error handling in network layer"

# Bad examples (avoid)
"Added user auth" (wrong tense)
"fix bug" (not capitalized, too vague)
"Update formatting and add feature" (mentions formatting)
"🤖 Add feature with AI assistance" (emoji, AI attribution)
```

## Task Completion Tracking

### Steps.md Update Process
1. Mark current task as complete: `- [x] T### Task description`
2. Add completion timestamp and constitutional compliance status
3. Update progress tracking for feature completion percentage
4. Identify next pending task for continued development

### Feature Completion Detection
- All tasks in Steps.md marked complete → Feature ready for release
- Remaining tasks → Continue development workflow
- Constitutional violations → Address before feature completion

## Validation Gates
- [ ] Development session active with current task context?
- [ ] All constitutional validation checks passed?
- [ ] Code formatting applied successfully?
- [ ] Project builds and tests pass?
- [ ] Commit message follows GitCommit.md guidelines?
- [ ] Task completion status updated in Steps.md?
- [ ] Next development step identified?

## Error Conditions
- "No development session" → Must run /Implement/start-working first
- "Constitutional violations" → Must fix accessibility, privacy, localization, or maintainability issues
- "Formatting failures" → Must resolve code formatting conflicts or errors
- "Build failures" → Must fix compilation errors before committing
- "Invalid commit message" → Must follow GitCommit.md format guidelines
- "Git conflicts" → Must resolve merge conflicts before committing

## Constitutional Compliance Enforcement

### Blocking Violations (prevent commit)
- Missing accessibility labels on interactive UI elements
- Hardcoded user-facing strings (not externalized for localization)
- Unencrypted sensitive data storage
- Missing error handling for network calls or file operations

### Warning Violations (allow commit with warning)
- Suboptimal color contrast (warn to improve)
- Complex methods without documentation (warn to add docs)
- Missing unit tests for new business logic (warn to add tests)
- Performance concerns with current implementation (warn to optimize)

════════════════════════════════════════════════════════════════════════════════
👩‍💻 DEVELOPER CUSTOMIZATIONS - EDITABLE SECTION
════════════════════════════════════════════════════════════════════════════════

This section is preserved during ContextKit migrations and updates.
Add project-specific instructions, examples, and overrides below.

## Project-Specific Instructions

<!-- Add project-specific guidance here -->

## Additional Examples

<!-- Add examples specific to your project here -->

## Override Behaviors

<!-- Document any project-specific overrides here -->