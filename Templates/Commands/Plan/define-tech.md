# Command: /Plan/define-tech

## Description
Create technical implementation plan based on existing feature specification with platform-appropriate architecture

## Parameters
- `feature_path` (required): Path to feature specification directory (Context/Features/[FeatureName]/)

## Execution Flow (main)
1. Load feature specification
   → Read Context/Features/[FeatureName]/Spec.md
   → If not found: ERROR "Run /Plan/create-spec first"
2. Detect project architecture and constraints
   → Swift Package: Focus on modularity, Linux compatibility, DocC documentation
   → iOS App: Include App Store guidelines, accessibility, privacy manifest considerations
   → macOS App: Include sandboxing, system integration patterns
   → Universal: Apply workspace-specific technology preferences
3. Load workspace and project context
   → Inherit technology stack preferences from Context.md hierarchy
   → Apply client-specific constraints and coding standards
4. Generate technical architecture
   → Apply appropriate architectural patterns (SwiftUI + SwiftData, MVVM, etc.)
   → Include dependency decisions (FlineDevKit auto-import, third-party libraries)
   → Define data models and service layer structure
   → Plan testing strategy (unit tests, integration tests, UI tests)
5. Apply constitutional technical requirements
   → Accessibility: Semantic markup, VoiceOver support, dynamic type
   → Privacy: Data minimization, encryption, user consent flows
   → Localizability: String externalization, number/date formatting, RTL support
   → Maintainability: Clean architecture, error handling patterns, documentation
6. Create implementation plan documents
   → Tech.md: Architecture decisions and technology stack
   → DataModel.md: Entity definitions and relationships (if data-heavy)
   → Contracts.md: API definitions and interfaces (if service/package)
7. Run technical validation gates
   → Architecture aligns with platform conventions?
   → Dependencies are justified and minimal?
   → Constitutional requirements addressed?
   → Testing strategy is comprehensive?
8. Return: SUCCESS (technical plan ready for task breakdown)

## Template Variables
${PROJECT_TYPE} - Detected project architecture (swift-package, ios-app, macos-app, etc.)
${FEATURE_NAME} - Feature name from specification
${TECH_STACK} - Inherited technology preferences from workspace context
${CONSTITUTIONAL_TECH} - Platform-specific constitutional technical requirements
${ARCHITECTURE_PATTERN} - Recommended architectural pattern for project type

## Validation Gates
- [ ] Feature specification exists and is complete?
- [ ] Project architecture pattern selected and justified?
- [ ] Technology stack aligns with workspace preferences?
- [ ] Constitutional technical requirements addressed?
- [ ] Dependencies are minimal and justified?
- [ ] Testing strategy covers all critical paths?
- [ ] Documentation approach defined?
- [ ] Platform-specific considerations included?

## Error Conditions
- "Feature specification not found" → Must run /Plan/create-spec first
- "Architecture pattern unclear" → Must select appropriate pattern for project type
- "Constitutional requirements missing" → Must address accessibility, privacy, localizability, maintainability
- "Dependency conflicts" → Must resolve conflicting library choices

## Platform-Specific Technical Guidance

### Swift Package
- **Architecture**: Protocol-oriented design, value types, clear module boundaries
- **Dependencies**: Minimal external dependencies, prefer standard library
- **Testing**: Comprehensive unit tests, Linux compatibility testing
- **Documentation**: DocC documentation with examples

### iOS App  
- **Architecture**: SwiftUI + SwiftData, MVVM where appropriate
- **Platform Integration**: CloudKit, HealthKit, App Store guidelines
- **Constitutional**: Privacy manifest, accessibility identifiers, localization
- **Testing**: Unit tests + UI tests with accessibility testing

### macOS App
- **Architecture**: SwiftUI with AppKit integration where needed
- **Platform Integration**: Sandboxing considerations, system services
- **Constitutional**: Menu accessibility, keyboard navigation, system appearance
- **Testing**: Unit tests + integration tests for system interactions