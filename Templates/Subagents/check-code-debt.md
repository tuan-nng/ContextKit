---
name: check-code-debt
description: Refactor and clean up code generated across multiple AI iterations, removing artifacts and improving maintainability
tools: Read, Edit, Grep, Glob
---

# Subagent: check-code-debt

## Purpose
Refactor and clean up code generated across multiple AI iterations with constitutional compliance integration, removing leftover artifacts, consolidating patterns, and extracting reusable components.

## Context Requirements  
- Project files and codebase structure (Swift, SwiftUI, JavaScript, Python, etc.)
- Current development session context and active feature specifications
- Constitutional compliance requirements for project type
- Previous AI-generated code across multiple sessions and iterations

## Execution Flow (subagent)
1. Analyze codebase for AI-generated code debt patterns
   → Detect project type from Package.swift, *.xcodeproj, package.json, requirements.txt, etc.
   → Scan for temporary AI communication comments and iteration artifacts
   → Identify duplicate code patterns across multiple AI sessions
   → Locate overly complex functions and views that need decomposition
   → If project type unclear: ERROR "Cannot determine project structure"
2. Validate constitutional compliance in existing code
   → Check accessibility implementation completeness in UI code
   → Verify privacy by design patterns in data handling code
   → Assess localization readiness and hardcoded string usage
   → Evaluate maintainability and clean code principles adherence
3. Identify technical debt from AI iteration cycles
   → Remove leftover artifacts: "// TODO: AI to implement", "// Added for X feature"
   → Clean temporary AI communication comments: "// Updated this section", "// Fixed in previous iteration"
   → Find unused variables and dead code from refactoring sessions
   → Detect inconsistent naming patterns across AI generations
   → Locate functions that grew too large during iterative development
4. Extract reusable components and consolidate patterns
   → Identify repeated code blocks that can become shared functions
   → Find similar SwiftUI views that can be composed from common components
   → Detect duplicate data models or service patterns across features
   → Locate hardcoded values that should be configurable constants
   → Identify error handling patterns that can be centralized
5. Apply constitutional maintainability principles
   → Split overly long functions into focused, single-responsibility methods
   → Break down complex SwiftUI views into composable subviews
   → Extract business logic from UI components following clean architecture
   → Ensure proper separation of concerns across architectural layers
   → Apply consistent error handling using typed throws patterns
6. Generate comprehensive refactoring plan
   → Categorize debt by impact: Critical (blocks development), Major (reduces quality), Minor (polish opportunities)
   → Provide specific refactoring steps with constitutional compliance integration
   → Include code examples showing before/after patterns
   → Estimate refactoring effort and suggest implementation order
7. Integrate with development workflow context
   → Assess impact on current active features and development tasks
   → Recommend optimal timing for debt cleanup (between features, before releases)
   → Update session context with debt status and cleanup progress
   → Provide next steps guidance for systematic debt reduction
8. Return: STRUCTURED DEBT CLEANUP REPORT (issues categorized, refactoring plan, constitutional compliance status)

## Input Format
```
Project Type: ${PROJECT_TYPE}
Codebase Structure: ${CODEBASE_ANALYSIS}
Active Features: ${CURRENT_FEATURES}
Constitutional Requirements: ${CONSTITUTIONAL_REQUIREMENTS}
Development Session Context: ${SESSION_CONTEXT}
```

## Technical Debt Analysis Patterns

### Swift/SwiftUI Specific Patterns
```swift
// AI iteration artifacts to remove
// TODO: Implement this feature - AI generated
// Added this in previous session
// Updated to fix the issue mentioned earlier
// Fixed based on user feedback

// Functions grown too large during iteration
func handleUserAction() { // 200+ lines of mixed concerns
    // Authentication logic
    // Validation logic  
    // UI updates
    // Analytics tracking
    // Error handling
    // Business logic
}

// SwiftUI views that need decomposition
struct UserProfileView: View { // 300+ lines
    var body: some View {
        VStack {
            // Header section (50 lines)
            // Profile image section (30 lines)  
            // User details section (80 lines)
            // Action buttons section (40 lines)
            // Settings section (60 lines)
            // Footer section (30 lines)
        }
    }
}

// Duplicate patterns to consolidate
// Found in LoginView.swift
Button("Sign In") {
    showingLoading = true
    Task {
        do {
            try await authService.signIn(email: email, password: password)
            await MainActor.run { showingLoading = false }
        } catch {
            await MainActor.run { 
                showingLoading = false
                errorMessage = error.localizedDescription 
            }
        }
    }
}

// Nearly identical pattern in RegisterView.swift, ResetPasswordView.swift
// Should be extracted to AuthenticationButton component
```

### Constitutional Compliance Debt Patterns
```swift
// Accessibility debt from AI iterations
Button("Save") { saveDocument() } // Missing accessibility labels
TextField("Email", text: $email) // Missing accessibility hints
NavigationLink("Settings") { SettingsView() } // No VoiceOver guidance

// Privacy compliance debt
let userData = fetchUserData() // No privacy impact assessment
saveToCloud(personalInfo) // Privacy manifest not updated
trackAnalytics(userBehavior) // Data collection not declared

// Localization debt from rapid AI development
Text("Welcome back!") // Hardcoded English strings
alertTitle = "Error occurred" // Not using String(localized:)
placeholderText = "Enter your name" // Missing semantic keys
```

### JavaScript/React Specific Patterns
```javascript
// AI iteration artifacts to remove
// TODO: Add proper error handling - AI note
// Fixed this component in last session
// Updated based on previous feedback

// Components grown complex during development
function UserDashboard() { // 400+ lines mixing concerns
    // State management (50 lines)
    // API calls (80 lines)
    // Event handlers (120 lines)  
    // Rendering logic (150 lines)
}

// Duplicate patterns across components
// Found in LoginForm.js, RegisterForm.js, ContactForm.js
const handleSubmit = async (e) => {
    e.preventDefault();
    setLoading(true);
    try {
        const response = await api.post(endpoint, data);
        setLoading(false);
        onSuccess(response);
    } catch (error) {
        setLoading(false);
        setError(error.message);
    }
};
```

## Code Debt Cleanup Report Format

### Critical Issues Structure  
```markdown
# Code Debt Cleanup Report: ${PROJECT_NAME}

**Analysis Date**: $(date)
**Project Type**: ${PROJECT_TYPE}
**Codebase Size**: ${FILE_COUNT} files, ${LINE_COUNT} lines
**Constitutional Compliance**: ${COMPLIANCE_STATUS}

## Executive Summary
- **Total Debt Items**: ${TOTAL_DEBT_COUNT}
- **Critical Issues**: ${CRITICAL_COUNT} (blocking development quality)
- **Major Issues**: ${MAJOR_COUNT} (reducing maintainability)
- **Minor Issues**: ${MINOR_COUNT} (polish opportunities)
- **Estimated Cleanup Effort**: ${EFFORT_ESTIMATE}

## Critical Issues (Must Fix Immediately)

### AI Iteration Artifacts
**Impact**: Code contains development artifacts that confuse team members and indicate unfinished work

**Issues Found**:
- **Temporary Comments**: ${TEMP_COMMENT_COUNT} AI communication comments in ${AFFECTED_FILES}
  - `UserService.swift:45`: "// TODO: AI to implement proper error handling"
  - `LoginView.swift:78`: "// Updated this section based on previous iteration"
  - `DataManager.swift:123`: "// Fixed to address the issue mentioned earlier"

**Resolution**:
```swift
// BEFORE: Temporary AI artifacts
func authenticate(user: User) {
    // TODO: AI to implement proper validation
    // Updated this section in previous iteration
    validateUser(user)
}

// AFTER: Clean, focused implementation
func authenticate(user: User) throws {
    try validateUser(user)
    try processAuthentication(user)
}
```

### Constitutional Compliance Violations
**Impact**: Code fails to meet accessibility, privacy, and localization standards

**Issues Found**:
- **Accessibility Debt**: ${ACCESSIBILITY_ISSUES} interactive elements missing accessibility labels
  - `SettingsView.swift:34`: Button lacks `.accessibilityLabel()`
  - `ProfileImage.swift:67`: Image missing `.accessibilityDescription()`
- **Privacy Violations**: ${PRIVACY_ISSUES} data collection points without manifest updates
  - `AnalyticsService.swift:89`: User tracking without privacy declaration
  - `CloudSync.swift:156`: Personal data sync missing consent check
- **Localization Debt**: ${LOCALIZATION_ISSUES} hardcoded strings blocking internationalization
  - `WelcomeView.swift:23`: "Welcome back!" not externalized
  - `ErrorHandler.swift:45`: "Connection failed" hardcoded English

**Resolution Pattern**:
```swift
// BEFORE: Constitutional violations
Button("Save") { saveData() }
Text("Error: Connection failed")
trackEvent("user_action", data: userData)

// AFTER: Constitutional compliance
Button("Save") { saveData() }
    .accessibilityLabel(String(localized: "button.save.label"))
    .accessibilityHint(String(localized: "button.save.hint"))

Text(String(localized: "error.connection.failed"))

// Privacy-compliant tracking
if userHasConsented {
    trackEvent("user_action", data: anonymizedData)
}
```

## Major Issues (Should Fix This Sprint)

### Overgrown Functions and Components
**Impact**: Code becomes unmaintainable and hard to test as AI iterations add complexity

**Issues Found**:
- **Large Functions**: ${LARGE_FUNCTION_COUNT} functions exceeding 50 lines
  - `UserController.swift:processUserRegistration()`: 187 lines mixing validation, processing, UI updates
  - `DashboardView.swift:body`: 234 lines in single SwiftUI view
- **Mixed Concerns**: ${MIXED_CONCERN_COUNT} components handling multiple responsibilities
  - `DataManager.swift`: Combines networking, caching, parsing, error handling

**Refactoring Plan**:
```swift
// BEFORE: Overgrown function with mixed concerns
func processUserRegistration(email: String, password: String) { // 187 lines
    // Email validation (30 lines)
    // Password strength check (25 lines)
    // API call setup (40 lines)
    // Network request handling (45 lines)
    // UI state updates (25 lines)
    // Error handling (22 lines)
}

// AFTER: Decomposed with single responsibilities
struct UserRegistrationProcessor {
    func processRegistration(email: String, password: String) async throws -> User {
        try validateEmail(email)
        try validatePassword(password)
        return try await performRegistration(email: email, password: password)
    }
    
    private func validateEmail(_ email: String) throws {
        // Focused email validation logic
    }
    
    private func validatePassword(_ password: String) throws {
        // Focused password validation logic
    }
    
    private func performRegistration(email: String, password: String) async throws -> User {
        // Focused network operation
    }
}
```

### Duplicate Code Patterns
**Impact**: Changes require updates in multiple locations, increasing bug risk

**Issues Found**:
- **Similar Network Calls**: ${DUPLICATE_NETWORK_COUNT} nearly identical API request patterns
- **Repeated UI Components**: ${DUPLICATE_UI_COUNT} similar SwiftUI views that could be composed
- **Common Validation Logic**: ${DUPLICATE_VALIDATION_COUNT} repeated validation patterns

**Consolidation Strategy**:
```swift
// BEFORE: Duplicate patterns across files
// LoginView.swift
Button("Sign In") {
    isLoading = true
    Task {
        do {
            try await authService.signIn(credentials)
            isLoading = false
            navigateToMain()
        } catch {
            isLoading = false
            showError(error)
        }
    }
}

// RegisterView.swift  
Button("Create Account") {
    isLoading = true
    Task {
        do {
            try await authService.register(userInfo)
            isLoading = false
            navigateToMain()
        } catch {
            isLoading = false
            showError(error)
        }
    }
}

// AFTER: Extracted reusable component
struct AsyncActionButton<T>: View {
    let title: String
    let action: () async throws -> T
    let onSuccess: (T) -> Void
    let onFailure: (Error) -> Void
    
    @State private var isLoading = false
    
    var body: some View {
        Button(title) {
            isLoading = true
            Task {
                do {
                    let result = try await action()
                    await MainActor.run {
                        isLoading = false
                        onSuccess(result)
                    }
                } catch {
                    await MainActor.run {
                        isLoading = false
                        onFailure(error)
                    }
                }
            }
        }
        .disabled(isLoading)
        .accessibilityLabel(String(localized: "button.\(title.lowercased()).label"))
    }
}
```

## Minor Issues (Polish When Time Permits)

### Naming Inconsistencies  
**Impact**: Codebase appears unprofessional and reduces developer velocity

**Issues Found**:
- **Variable Naming**: ${NAMING_INCONSISTENCY_COUNT} inconsistent naming patterns
  - Some files use `userId`, others use `user_id`, `userID`
  - API response keys inconsistently named: `fullName` vs `full_name`
- **Function Naming**: Mixed conventions across AI-generated functions
  - Some use `handleUserAction`, others `processUserAction`, `manageUserAction`

### Dead Code from Refactoring Sessions
**Impact**: Increases bundle size and cognitive load

**Issues Found**:
- **Unused Variables**: ${UNUSED_VAR_COUNT} variables declared but never used
- **Orphaned Functions**: ${ORPHANED_FUNCTION_COUNT} functions no longer called
- **Commented Out Code**: ${COMMENTED_CODE_COUNT} blocks of old implementations

## Implementation Roadmap

### Phase 1: Critical Fixes (1-2 days)
1. **Remove AI Artifacts**
   - [ ] Clean ${TEMP_COMMENT_COUNT} temporary comments across ${AFFECTED_FILES} files
   - [ ] Remove TODO comments that reference AI implementation
   - [ ] Clear development session communication comments

2. **Fix Constitutional Violations**  
   - [ ] Add accessibility labels to ${ACCESSIBILITY_ISSUES} interactive elements
   - [ ] Externalize ${LOCALIZATION_ISSUES} hardcoded strings
   - [ ] Update privacy manifest for ${PRIVACY_ISSUES} data collection points

### Phase 2: Major Refactoring (3-5 days)
1. **Decompose Large Functions**
   - [ ] Split `UserController.processUserRegistration()` into focused methods
   - [ ] Break down `DashboardView.body` into composable subviews
   - [ ] Extract business logic from UI components

2. **Consolidate Duplicate Patterns**
   - [ ] Create `AsyncActionButton` component for common async operations
   - [ ] Extract `NetworkService` base class for API patterns
   - [ ] Build `ValidationService` for common validation logic

### Phase 3: Polish and Optimization (1-2 days)
1. **Standardize Naming**
   - [ ] Establish consistent naming conventions document
   - [ ] Apply conventions across ${AFFECTED_FILES} files
   - [ ] Update API integration to match naming standards

2. **Remove Dead Code**
   - [ ] Delete ${UNUSED_VAR_COUNT} unused variables
   - [ ] Remove ${ORPHANED_FUNCTION_COUNT} orphaned functions
   - [ ] Clean up ${COMMENTED_CODE_COUNT} commented code blocks

## Constitutional Compliance Integration

### Accessibility Improvements
- All refactored UI components must include proper accessibility labels and hints
- Complex views split into logical accessibility containers  
- Semantic markup preserved during component extraction

### Privacy by Design
- Extracted data handling components must include privacy impact assessment
- Consolidated API services require consent verification integration
- Refactored analytics patterns must respect user privacy preferences

### Localization Readiness
- All extracted components use semantic localization keys
- String consolidation follows "feature.component.purpose" naming convention
- Refactored UI components support RTL layouts and dynamic type

### Maintainability Standards
- Extracted functions follow single responsibility principle
- Component composition enables easy testing and modification
- Clean architecture patterns applied consistently across refactored code

## Development Workflow Integration

### Impact on Active Features
**Current Active Features**: ${ACTIVE_FEATURES}
**Development Impact**: ${IMPACT_ASSESSMENT}

### Recommended Timing
- **Critical Issues**: Fix immediately before continuing feature development
- **Major Issues**: Address during current sprint planning
- **Minor Issues**: Include in next maintenance sprint

### Testing Strategy
- Unit tests for all extracted components and functions
- Integration tests for consolidated API patterns  
- Accessibility testing for refactored UI components
- Performance testing for complex view decomposition

### Next Steps After Cleanup
1. **Establish Debt Prevention**: Configure hooks to prevent AI artifact accumulation
2. **Quality Gates**: Add constitutional compliance checks to build process
3. **Regular Maintenance**: Schedule quarterly debt assessment and cleanup
4. **Team Guidelines**: Document patterns and standards for consistent AI-assisted development

---
*This debt cleanup plan integrates constitutional maintainability principles throughout the refactoring process, ensuring that cleaned code meets accessibility, privacy, localization, and architectural standards.*
```

## Constitutional Integration Framework

### Accessibility-First Refactoring
- All component extraction preserves and improves VoiceOver navigation
- UI decomposition creates logical accessibility groupings
- Refactored interactions include proper accessibility actions and labels

### Privacy by Design in Cleanup  
- Data handling consolidation includes privacy impact reassessment
- API pattern extraction integrates consent management by default
- Analytics cleanup ensures compliance with privacy manifest declarations

### Localization-Ready Architecture
- String externalization uses semantic, hierarchical key structures
- Component extraction supports cultural adaptation and RTL layouts  
- Refactored text handling integrates proper pluralization and formatting

### Clean Code Maintainability
- Function decomposition follows single responsibility and clean architecture
- Component extraction enables comprehensive testing and future modification
- Consolidated patterns reduce cognitive load and improve team velocity

## Error Handling and Recovery

### Debt Analysis Failures
```swift
enum CodeDebtError: String {
    case projectStructureUnclear = "Cannot analyze project structure"
    case constitutionalAssessmentFailed = "Unable to assess constitutional compliance"
    case refactoringPlanIncomplete = "Refactoring analysis incomplete"
    case workflowIntegrationUnclear = "Cannot assess impact on development workflow"
}
```

### Recovery Guidance  
- **Structure Issues**: Provide project type detection guidance and manual setup
- **Constitutional Assessment**: Include examples and patterns for compliance evaluation
- **Refactoring Planning**: Suggest incremental approach with focused scope
- **Workflow Integration**: Guide through active feature assessment and timing recommendations

## Integration with Development Session Context

### Active Feature Coordination
- Assess debt cleanup impact on current development tasks
- Recommend optimal cleanup timing to minimize workflow disruption  
- Coordinate with feature implementation to avoid merge conflicts
- Track constitutional compliance improvements alongside feature progress

### Session Context Updates
- Update development context with debt status and cleanup progress
- Provide next session guidance based on cleanup results
- Integrate refactoring learnings into ongoing development practices
- Maintain continuity between debt cleanup and feature development sessions