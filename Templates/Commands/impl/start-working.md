# Begin Development
<!-- Template Version: 0 | ContextKit: 0.0.0 | Updated: 2025-09-13 -->

> [!WARNING]
> **👩‍💻 FOR DEVELOPERS**: Do not edit the content above the developer customization section - changes will be overwritten during ContextKit updates.
>
> For project-specific customizations, use the designated section at the bottom of this file.
>
> Found a bug or improvement for everyone? Please report it: https://github.com/FlineDev/ContextKit/issues

## Description
Begin development workflow with context-aware setup and task execution guidance

## Parameters
- `feature_path` (optional): Path to specific feature directory, defaults to detecting active feature

## Execution Flow (main)
1. Detect active feature and validate prerequisites
   → Search Context/Features/ for features with completed Steps.md
   → If feature_path provided: use specified feature
   → If multiple candidates: ASK user to choose
   → If none ready: ERROR "Complete planning phase first (/Plan/create-spec, /Plan/define-tech, /Plan/plan-steps)"
2. Load development context
   → Read project Context.md for coding standards and preferences
   → Read workspace Context.md for client requirements and constraints
   → Load constitutional principles for project type
   → Check git status and branch management
3. Setup development environment
   → Ensure proper git branch (feature/[feature-name])
   → Verify dependencies are installed and up to date
   → Run any required setup scripts or formatters
   → Check that build passes before starting work
4. Load task execution plan
   → Read Context/Features/[FeatureName]/Steps.md for task breakdown
   → Identify next pending task or ask user to specify
   → Load task-specific context and requirements
   → Prepare constitutional validation checklist
5. Apply development workflow patterns
   → Swift Package: Import FlineDevKit, use typed throws, protocol-oriented design
   → iOS/macOS App: SwiftUI + SwiftData patterns, accessibility-first development
   → Universal: Apply workspace coding standards and architectural patterns
6. Initialize quality assurance hooks
   → Enable PostToolUse formatting hooks for code consistency
   → Setup constitutional validation subagents (accessibility, localization, etc.)
   → Configure continuous integration checks if available
7. Begin task execution with guidance
   → Show task description, file paths, and acceptance criteria
   → Remind of constitutional requirements for task type
   → Provide code pattern examples relevant to project type
   → Enable real-time validation during development
8. Return: SUCCESS (development environment ready, task guidance provided)

## Template Variables
${ACTIVE_FEATURE} - Currently active feature name
${CURRENT_TASK} - Next task to be executed from Steps.md
${PROJECT_PATTERNS} - Project-specific development patterns and standards
${CONSTITUTIONAL_CHECKS} - Relevant constitutional principle reminders for current task
${WORKSPACE_CONSTRAINTS} - Client-specific requirements and coding standards

## Development Environment Setup

### Git Branch Management
- Ensure feature branch exists and is current: `feature/[kebab-case-feature-name]`
- Check for uncommitted changes and guide resolution
- Verify branch is synchronized with remote if team collaboration enabled

### Dependency Verification
- Swift Package: Verify Package.swift dependencies resolve cleanly
- iOS/macOS: Check that Xcode project builds without errors
- Universal: Run project-specific dependency checks

### Code Formatting Setup
- Enable SwiftFormat + swift-format hooks for consistent style
- Apply project-specific formatting configurations
- Verify formatters are compatible with current codebase

## Constitutional Development Guidance

### Accessibility-First Development
- **UI Tasks**: Include VoiceOver labels, semantic colors, dynamic type support
- **Navigation**: Ensure keyboard accessibility, logical focus order
- **Content**: Use semantic markup, provide alternative content for visual elements

### Privacy by Design Implementation
- **Data Collection**: Minimize data collection, explicit user consent
- **Storage**: Use encrypted storage, respect user data deletion requests
- **Sharing**: Clear privacy policies, opt-in sharing mechanisms

### Localizability from Day One
- **Strings**: Externalize all user-facing strings with semantic keys
- **Formatting**: Use system formatters for numbers, dates, currencies
- **Layout**: Design for variable text lengths, RTL language support

### Code Maintainability Patterns
- **Architecture**: Follow established patterns (MVVM, protocol-oriented design)
- **Error Handling**: Use typed throws with ErrorKit, clear error messages
- **Documentation**: Inline documentation for complex logic, clear API documentation

## Task Execution Patterns

### For UI Implementation Tasks
```swift
// Accessibility-first SwiftUI development
struct FeatureView: View {
   var body: some View {
      VStack {
         Text("Feature Title")
            .accessibilityAddTraits(.isHeader)
         
         Button("Primary Action") { 
            // Action implementation
         }
         .accessibilityLabel("Perform primary feature action")
         .accessibilityHint("Double tap to execute the main feature functionality")
      }
      .navigationTitle("Feature")
   }
}
```

### For Data Model Tasks
```swift
// Constitutional data model with privacy considerations
struct UserPreferences: Codable {
   let id: UUID
   let preferences: [String: PreferenceValue]
   
   // Privacy: No sensitive data in model, use secure storage
   // Localizability: Preference keys externalized
   // Maintainability: Clear type safety, validation methods
}
```

### For Service Implementation Tasks
```swift
// Typed throws with constitutional error handling
enum FeatureError: Throwable, Catching {
   case invalidInput(field: String)
   case serviceUnavailable
   case caught(Error)
   
   var userFriendlyMessage: String {
      switch self {
      case .invalidInput(let field):
         String(localized: "Please check the \(field) field and try again.")
      case .serviceUnavailable:
         String(localized: "The service is temporarily unavailable. Please try again later.")
      case .caught(let error):
         ErrorKit.userFriendlyMessage(for: error)
      }
   }
}
```

## Validation Gates
- [ ] Prerequisites completed (Spec.md, Tech.md, Steps.md)?
- [ ] Development environment properly configured?
- [ ] Git branch management in place?
- [ ] Constitutional principles loaded for project type?
- [ ] Quality assurance hooks enabled?
- [ ] Task context and requirements clear?
- [ ] Code pattern guidance appropriate for current task?

## Error Conditions
- "Planning incomplete" → Must complete all planning phases first
- "Environment setup failed" → Must resolve dependency or configuration issues
- "Git conflicts" → Must resolve branch conflicts before starting development
- "No pending tasks" → All tasks complete or Steps.md needs updating
- "Constitutional requirements unclear" → Must specify which principles apply to current task

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