---
meta: "Template Version: 0 | ContextKit: 0.0.0 | Updated: 2025-09-13"
name: check-error-handling
description: Review error handling implementation with ErrorKit patterns, typed throws, and user-friendly error messages
tools: Read, Grep, Glob
---

> [!WARNING]
> **👩‍💻 FOR DEVELOPERS**: Do not edit the content above the developer customization section - changes will be overwritten during ContextKit updates.
>
> For project-specific customizations, use the designated section at the bottom of this file.
>
> Found a bug or improvement for everyone? Please report it: https://github.com/FlineDev/ContextKit/issues

# Subagent: check-error-handling

## Purpose
Review and validate error handling implementation following ErrorKit patterns with typed throws, user-friendly messages, and proper error propagation.

## Context Requirements
- Project Swift files with error handling code
- Current feature specifications and technical requirements
- ErrorKit compliance expectations and constitutional principles
- Project type (ios-app, swift-package, vapor-server)

## Execution Flow (subagent)
```
1. Analyze provided Swift files for error handling patterns
   → Scan for error type definitions, throw statements, and error propagation
   → Identify functions using typed throws vs classic throws
   → Check for ErrorKit import and usage patterns
2. Validate ErrorKit compliance and typed throws implementation
   → Check error types implement Throwable protocol with userFriendlyMessage
   → Verify proper use of Catching protocol and caught(Error) cases
   → Ensure typed throws used appropriately vs classic throws exceptions
3. Review error propagation and catching patterns
   → Check for proper use of ErrorType.catch { } for error wrapping
   → Validate caught case ordering (must be last in enum and switch)
   → Identify manual do-catch blocks that should use .catch helper
4. Assess user-friendly message quality and localization
   → Check userFriendlyMessage implementations use String(localized:defaultValue:)
   → Verify meaningful, actionable error messages for users
   → Ensure technical details are logged separately from user messages
5. Check constitutional maintainability compliance
   → Validate error types placed near usage (not global directories)
   → Check for built-in ErrorKit types preference over custom types
   → Assess error handling logging patterns and frequency
6. Generate structured improvement recommendations
   → Critical issues requiring immediate fixes
   → Best practice improvements for ErrorKit compliance
   → Maintainability and constitutional principle alignments
7. Validate implementation against iOS/macOS platform requirements
   → Check SwiftUI error display patterns and UI error states
   → Verify proper error handling for platform-specific APIs
   → Ensure accessibility considerations for error messages
8. Return: SUCCESS (comprehensive error handling analysis complete)
```

## Input Format
```
Project Type: ${PROJECT_TYPE}
Target Platform: ${TARGET_PLATFORM}
Swift Files: ${ANALYZED_FILES}
Feature Context: ${FEATURE_DESCRIPTION}
ErrorKit Version: ${ERRORKIT_VERSION}
Constitutional Requirements: ${CONSTITUTIONAL_PRINCIPLES}
```

## Output Format
```
# Error Handling Analysis Report

## Critical Issues (Must Fix)
### Typed Throws Violations
- [ ] Function `loadUserData()` in UserService.swift:42 uses classic throws but only calls one typed throwing function
  **Issue**: Should use `throws(NetworkError)` to match dependency
  **Fix**: `func loadUserData() throws(NetworkError) -> UserData`
  **Impact**: Type safety and error handling clarity

### ErrorKit Compliance Issues  
- [ ] Custom error `ValidationError` in Models/Validation.swift:15 missing Throwable conformance
  **Issue**: Error type not ErrorKit-compliant
  **Fix**: `enum ValidationError: Throwable { ... var userFriendlyMessage: String { ... } }`
  **Impact**: Inconsistent error handling patterns

### Error Propagation Problems
- [ ] Manual do-catch block in FileManager.swift:67 should use .catch helper
  **Issue**: `do { try operation() } catch { throw ParsingError.caught(error) }`
  **Fix**: `try ParsingError.catch { try operation() }`
  **Impact**: Redundant error wrapping code

## Constitutional Compliance Issues (Should Fix)
### Maintainability Violations
- [ ] Error type `GlobalError` in Shared/Errors.swift violates placement principles
  **Issue**: Error types should be placed near usage, not in global directories
  **Fix**: Move specific error types to their respective domain modules
  **Constitutional Principle**: Code maintainability and proper organization

### Built-in Type Usage
- [ ] Custom `NetworkError` in Services/Network.swift:23 duplicates ErrorKit.NetworkError
  **Issue**: Custom implementation instead of built-in ErrorKit type
  **Fix**: Replace with `import FlineDevKit` and use `ErrorKit.NetworkError`
  **Impact**: Consistency and reduced maintenance burden

## Recommendations (Could Improve)
### Error Message Quality
- [ ] Error message in AuthError.invalidCredentials lacks actionable guidance
  **Current**: "Invalid credentials"
  **Suggested**: "Username or password is incorrect. Check your credentials and try again."
  **Impact**: Better user experience and clearer guidance

### Localization Improvements
- [ ] Hard-coded error messages in PaymentService.swift:89-94
  **Issue**: Direct string literals instead of String(localized:defaultValue:)
  **Fix**: Use `String(localized: "PaymentService.cardDeclined", defaultValue: "...")`
  **Impact**: Internationalization support

### Logging Pattern Optimizations
- [ ] High-frequency validation errors being logged in FormValidator.swift:156
  **Issue**: Expected control flow errors generating excessive logs
  **Fix**: Remove logging for normal form validation failures
  **Impact**: Cleaner logs and better performance

## SwiftUI Error Display Patterns
### UI Error State Management
- [ ] Missing error state binding in ContentView.swift:78
  **Issue**: Errors thrown but not displayed to user
  **Fix**: Add `@State private var errorMessage: String?` and error alert
  **Pattern**: 
  ```swift
  .alert("Error", isPresented: $errorMessage.isPresent(wrappedType: String.self)) {
      Button("OK") { errorMessage = nil }
  } message: {
      Text(errorMessage ?? "")
  }
  ```

### ErrorKit.handle Integration
- [ ] Manual error handling in SettingsView.swift:45 could use ErrorKit.handle
  **Current**: Manual error message extraction and binding
  **Suggested**: `ErrorKit.handle(context: "SettingsView.saveFailed", error: error, bindTo: $errorMessage)`
  **Impact**: Consistent error handling and automatic logging

## Level 1 vs Level 2 Error Strategy
### Correctly Implemented Level 1 (Standard Errors)
✅ `UserAccountError` in Models/User.swift:67 - Leaf node with Throwable conformance
✅ `ValidationError` in Utils/Validator.swift:23 - Simple cases with good messages

### Correctly Implemented Level 2 (Error Propagation)  
✅ `ProfileServiceError` in Services/Profile.swift:34 - Uses Catching + caught case for mixed dependencies
✅ `ImportError` in Features/Import.swift:89 - Proper .catch usage for heterogeneous errors

### Migration Opportunities
- [ ] `DataError` in Persistence/Data.swift:45 could upgrade to Level 2
  **Reason**: Function now calls multiple services with different error types
  **Fix**: Add `Catching` conformance and `caught(Error)` case

## Constitutional Gates Validation
### Accessibility-First Design
✅ Error messages include VoiceOver-friendly language
✅ Error alerts properly configured for screen readers

### Privacy by Design  
✅ No sensitive data leaked in error messages
✅ Proper separation of debug info from user-facing messages

### Code Maintainability
⚠️  Some error types violate placement principles (see Critical Issues)
✅ Most errors follow one-type-per-file organization

### Platform-Appropriate UX
✅ Error messages follow iOS Human Interface Guidelines
✅ Proper use of alert vs. sheet for different error severities

## Testing Recommendations
### Error Scenario Coverage
- [ ] Add unit tests for all custom error types' userFriendlyMessage implementations
- [ ] Test error propagation paths through .catch wrappers
- [ ] Verify SwiftUI error display integration with VoiceOver

### ErrorKit Integration Testing
- [ ] Validate ErrorKit.debug logging in debug builds
- [ ] Test ErrorKit.handle UI binding updates
- [ ] Verify TelemetryDeck error reporting integration

## Summary
**Overall Score**: 8.5/10 (Strong ErrorKit implementation with minor improvements needed)

**Strengths**:
- Good adoption of typed throws patterns
- Proper ErrorKit integration in most areas
- User-friendly error messages with localization support
- Constitutional compliance with accessibility and privacy principles

**Priority Fixes**:
1. Fix critical typed throws violations (immediate)
2. Address ErrorKit compliance issues (this sprint)  
3. Improve error message quality and localization (next sprint)
4. Optimize logging patterns for performance (ongoing)

**Constitutional Compliance**: 95% - Strong adherence to maintainability and platform UX principles
```

## Validation Gates (Auto-executed)
*Checked by execution flow before returning SUCCESS*

### Analysis Completeness Gates
- [ ] All Swift files with error handling analyzed?
- [ ] Error type definitions and conformances validated?
- [ ] Throw/catch patterns assessed for ErrorKit compliance?
- [ ] User-facing error messages reviewed for quality?

### Constitutional Compliance Gates  
- [ ] Code maintainability principles applied to error organization?
- [ ] Platform-appropriate error handling patterns validated?
- [ ] Accessibility considerations included in error display recommendations?
- [ ] Privacy impact assessed for error message content?

### ErrorKit Pattern Gates
- [ ] Level 1 vs Level 2 strategy correctly identified for each error type?
- [ ] Built-in ErrorKit types preference validated over custom implementations?
- [ ] Error propagation patterns (.catch vs manual do-catch) properly assessed?
- [ ] Logging frequency and appropriateness evaluated for each error scenario?

### Quality Assurance Gates
- [ ] All recommendations include specific file locations and line numbers?
- [ ] Code examples provided for suggested fixes?
- [ ] Constitutional principle violations clearly identified and linked?
- [ ] SwiftUI error display integration assessed where applicable?

**If any gate fails**: ERROR with specific guidance for completing the analysis
**If all gates pass**: SUCCESS (comprehensive error handling review complete)

## Error Conditions
- "No Swift files provided" → Subagent requires Swift source files for analysis
- "ErrorKit import not detected" → Project must import FlineDevKit or ErrorKit for compliance checking
- "No error handling patterns found" → Files must contain error types, throw statements, or catch blocks
- "Constitutional requirements missing" → Must specify constitutional principles for compliance validation
- "Analysis incomplete" → All validation gates must pass before returning results

## Integration Notes
### Constitutional Principles Enforcement
This subagent specifically validates error handling against constitutional maintainability principles:
- Error types placed near usage (not in global directories)
- Preference for built-in ErrorKit types over custom implementations
- Proper separation of logging from user-facing error messages
- Platform-appropriate error handling patterns for iOS/macOS

### SwiftUI Integration Validation
Special focus on SwiftUI error display patterns:
- Proper error state binding and alert presentation
- ErrorKit.handle integration for consistent error UI
- Accessibility compliance for error messages and alerts
- VoiceOver support validation for error scenarios

### Performance and Logging Analysis
Evaluates error handling performance implications:
- High-frequency error scenarios that shouldn't be logged
- Expected control flow vs genuine error conditions
- Proper use of Logger().error shorthand vs ErrorKit.debug
- TelemetryDeck integration for error tracking

---

*This subagent template integrates ContextKit constitutional principles with ErrorKit best practices for comprehensive error handling validation in Swift projects.*

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