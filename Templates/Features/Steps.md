# Implementation Steps: [Feature from Tech.md]
<!-- Template Version: 0 | ContextKit: 0.0.0 | Updated: 2025-09-13 -->

**Phase**: 2 (Implementation Plan)  
**Input**: Technical plan from Tech.md  
**Prerequisites**: Spec.md (business case), Tech.md (architecture)  
**Purpose**: Implementation task breakdown template with S001-S999 numbering and parallel markers. Used by `/ctxk:plan:3-steps` command.

════════════════════════════════════════════════════════════════════════════════
║ 🤖 EXECUTION FLOW - IMPLEMENTATION STEPS GENERATION
════════════════════════════════════════════════════════════════════════════════
║
║ ## Execution Flow (main)

║
║ ```
║ 1. Load technical plan from Tech.md
║   → If missing: ERROR "Technical plan required - run /Plan/define-tech first"
║   → Extract: architecture decisions, file locations, dependencies
║ 2. Analyze plan complexity and scope
║   → Count: new files, modified files, new APIs, tests needed
║   → If scope > 20 tasks: WARN "Consider breaking into smaller features"
║ 3. Apply task generation rules:
║   → One task per file creation/modification
║   → One task per API endpoint
║   → One task per data model
║   → One task per significant UI component
║ 4. Generate tasks with S### enumeration (S001, S002...)
║   → Setup tasks: Project structure, dependencies, configuration
║   → Model tasks: Data layer implementation (TDD - tests first)
║   → Service tasks: Business logic and API integration
║   → UI tasks: SwiftUI views, navigation, user interaction
║   → Integration tasks: End-to-end flows and validation
║   → Polish tasks: Accessibility, localization, performance
║ 5. Apply parallel execution markers [P]:
║   → Different files = [P] parallel safe
║   → Same file = sequential only
║   → Independent components = [P] parallel safe
║   → Shared resources = sequential only
║ 6. Validate dependency chains:
║   → Models before Services before UI
║   → Tests can run parallel with implementation
║   → Configuration before usage
║   → Critical path identified and documented
║ 7. Run iOS-specific task validation:
║   → Privacy manifest updates included?
║   → Accessibility implementation planned?
║   → Localization tasks identified?
║   → App Store compliance verified?
║ 8. Generate completion verification checklist
║ 9. Return: SUCCESS (implementation plan ready for execution)
║ ```

║
║ ## Task Generation Rules
║
║ ### Rule 1: One Task Per File/Entity
║ - **File Creation**: Each new Swift file = separate task
║ - **File Modification**: Significant changes to existing file = separate task
║ - **API Endpoints**: Each endpoint implementation = separate task
║ - **Data Models**: Each model class/struct = separate task
║ - **UI Components**: Each significant view = separate task
║
║ ### Rule 2: Parallel Execution Safety
║ - **[P] Parallel Safe**: Different files, independent components, no shared state
║ - **Sequential Required**: Same file, shared resources, dependent functionality
║ - **Test Parallelism**: Tests can run [P] with their implementation counterparts
║
║ ### Rule 3: iOS-Specific Task Types
║ - **Privacy Tasks**: Manifest updates, permission requests, data handling
║ - **Accessibility Tasks**: VoiceOver labels, dynamic type, keyboard navigation
║ - **Localization Tasks**: String extraction, TranslateKit integration
║ - **Performance Tasks**: Memory optimization, render performance, battery usage
║ - **App Store Tasks**: Guidelines compliance, metadata updates, submission prep
║
║ ### Rule 4: Dependency Chain Validation
║ ```
║ Setup Tasks (S001-S010)
║    ↓
║ Model Layer (S011-S020) [P] within layer
║    ↓
║ Service Layer (S021-S030) [P] within layer
║    ↓
║ UI Layer (S031-S040) [P] within layer
║    ↓
║ Integration & Testing (S041-S050) [P] within phase
║    ↓
║ Polish & Release (S051-S060) [P] within phase
║ ```
════════════════════════════════════════════════════════════════════════════════

## Phase 3.1: Setup & Configuration
*Foundation tasks that must complete before development*

- [ ] S001 Create project structure per technical plan
  - Path: ${PROJECT_ROOT}/${NEW_DIRECTORIES}
  - Dependencies: None
  - Parallel: Individual directory creation [P]

- [ ] S002 Configure Swift package dependencies
  - Path: Package.swift or *.xcodeproj
  - Dependencies: S001 (project structure)
  - Add: ErrorKit, FreemiumKit, HandySwift, HandySwiftUI, TranslateKit

- [ ] S003 [P] Setup code formatting tools
  - Path: .swift-format, .swiftformat files
  - Dependencies: None (can run parallel with S001-S002)
  - Configure: 3-space indentation, constitutional style rules

## Phase 3.2: Model Layer (TDD - Tests First)
*Data models and business logic foundation*

### Tests First Approach
- [ ] S004 [P] Unit tests for ${MODEL_1} in Tests/${MODEL_1}Tests.swift
- [ ] S005 [P] Unit tests for ${MODEL_2} in Tests/${MODEL_2}Tests.swift
- [ ] S006 [P] Unit tests for ${MODEL_3} in Tests/${MODEL_3}Tests.swift

### Model Implementation  
- [ ] S007 [P] ${MODEL_1} implementation in Sources/Models/${MODEL_1}.swift
- [ ] S008 [P] ${MODEL_2} implementation in Sources/Models/${MODEL_2}.swift
- [ ] S009 [P] ${MODEL_3} implementation in Sources/Models/${MODEL_3}.swift

### Data Persistence
- [ ] S010 Core Data model configuration (if required)
  - Path: DataModel.xcdatamodeld
  - Dependencies: S007-S009 (model definitions)
  - Privacy: Update manifest for data storage

## Phase 3.3: Service Layer
*Business logic, API integration, data management*

### Service Tests
- [ ] S011 [P] ${SERVICE_1}Tests.swift - Integration tests for service layer
- [ ] S012 [P] ${SERVICE_2}Tests.swift - API integration validation tests

### Service Implementation
- [ ] S013 ${SERVICE_1} implementation in Sources/Services/${SERVICE_1}.swift
  - Dependencies: S007-S009 (models), S011 (tests)
  - API: RESTful endpoints or local data management
  - Error Handling: ErrorKit patterns with typed throws

- [ ] S014 ${SERVICE_2} implementation in Sources/Services/${SERVICE_2}.swift  
  - Dependencies: S013 (if services interact), S012 (tests)
  - Integration: External APIs, CloudKit, or third-party services

## Phase 3.4: UI Layer (SwiftUI)
*User interface, navigation, interaction design*

### SwiftUI View Tests
- [ ] S015 [P] UI tests for ${VIEW_1} in Tests/UI/${VIEW_1}Tests.swift
- [ ] S016 [P] UI tests for ${VIEW_2} in Tests/UI/${VIEW_2}Tests.swift

### SwiftUI Implementation
- [ ] S017 [P] ${VIEW_1} implementation in Sources/Views/${VIEW_1}.swift
  - Dependencies: S013-S014 (services for data)
  - Accessibility: Labels, hints, semantic markup
  - Localization: TranslateKit keys for all user text

- [ ] S018 [P] ${VIEW_2} implementation in Sources/Views/${VIEW_2}.swift
  - Dependencies: S017 (if views interact), S016 (tests)  
  - Navigation: SwiftUI navigation patterns
  - State Management: @State, @StateObject, @ObservedObject patterns

- [ ] S019 Navigation coordinator/flow implementation
  - Path: Sources/Navigation/${NAVIGATION_COORDINATOR}.swift
  - Dependencies: S017-S018 (views), navigation between screens
  - Patterns: Coordinator pattern or SwiftUI NavigationStack

## Phase 3.5: Integration & Quality Assurance  
*End-to-end functionality, error handling, edge cases*

### Integration Testing
- [ ] S020 [P] End-to-end flow testing for happy path scenarios
  - Dependencies: S017-S019 (UI complete)
  - Coverage: User journeys from feature specification

- [ ] S021 [P] Error scenario testing and validation
  - Dependencies: S013-S014 (services with error handling)
  - Test: Network failures, invalid input, edge cases

### Quality Gates
- [ ] S022 [P] Accessibility validation with check-accessibility agent
  - Dependencies: S017-S018 (UI implementation)
  - Verify: VoiceOver labels, dynamic type, keyboard navigation

- [ ] S023 [P] Localization validation with check-localization agent
  - Dependencies: S017-S018 (UI with strings), S002 (TranslateKit)
  - Verify: String catalog updated, context provided, pluralization

- [ ] S024 [P] Error handling review with check-error-handling agent
  - Dependencies: S013-S014 (services), S020-S021 (error tests)
  - Verify: Typed throws, user-friendly messages, proper propagation

## Phase 3.6: Polish & Release Preparation
*Performance, App Store compliance, deployment readiness*

### Performance Optimization
- [ ] S025 [P] Performance testing and optimization
  - Dependencies: S020 (integration complete)
  - Focus: SwiftUI render performance, memory usage, battery impact
  - Tools: Instruments profiling, performance benchmarks

### App Store Compliance
- [ ] S026 Privacy manifest updates for new data usage
  - Path: PrivacyInfo.xcprivacy
  - Dependencies: S013-S014 (services that collect/store data)
  - Review: Data types, usage purposes, third-party SDKs

- [ ] S027 App Store metadata and screenshots
  - Dependencies: S017-S018 (UI complete), S025 (polish complete)
  - Generate: Feature screenshots, update What's New text
  - Localization: Translate metadata for supported languages

### Final Validation  
- [ ] S028 [P] Code quality review with check-modern-code agent
  - Dependencies: All implementation tasks complete
  - Modernize: Replace legacy patterns, update to latest APIs

- [ ] S029 [P] Technical debt cleanup with check-code-debt agent  
  - Dependencies: All implementation tasks complete
  - Cleanup: Remove AI comments, consolidate duplicated code

- [ ] S030 Build validation with build-project agent
  - Dependencies: S028-S029 (code cleanup)
  - Verify: Clean builds, no warnings, tests pass

## Dependency Chain Validation

### Critical Path Analysis
**Longest Dependency Chain**: S001 → S002 → S007-S009 → S013-S014 → S017-S018 → S019 → S020-S021 → S026-S027 → S030

**Parallel Opportunities**:
- Models (S007-S009) can implement in parallel after tests (S004-S006)
- Services (S013-S014) can implement in parallel if independent  
- UI Views (S017-S018) can implement in parallel if non-interactive
- Quality gates (S022-S024) can run in parallel during integration phase
- Polish tasks (S025, S028-S029) can run in parallel in final phase

### iOS Development Dependencies
**Architectural Layers**:
- SwiftUI Views depend on ViewModels/Services for data
- Services depend on Models for data structures
- All layers depend on ErrorKit for error handling
- Localization depends on TranslateKit integration
- Privacy compliance depends on data flow understanding

**Platform-Specific Dependencies**:
- Privacy manifest (S026) requires understanding of data usage from services
- Accessibility implementation (S022) requires UI structure from views
- App Store submission (S027) requires feature completion and testing
- Performance optimization (S025) requires full implementation for profiling

## Completion Verification

### iOS Feature Completeness Checklist
- [ ] All user flows from Spec.md implemented and tested?
- [ ] Happy path and error scenarios validated with automated tests?
- [ ] Accessibility: VoiceOver labels, hints, and semantic markup complete?
- [ ] Localization: All user-facing text extracted and TranslateKit integrated?
- [ ] Privacy: Data usage documented in privacy manifest?
- [ ] Performance: 60fps UI confirmed, memory usage acceptable?
- [ ] Constitutional compliance: Package-first architecture, clean code practices?

### Quality Gate Validation
- [ ] Build passes cleanly with no warnings or errors?
- [ ] All unit tests and integration tests pass?
- [ ] Code follows constitutional principles (3-space indentation, ErrorKit patterns)?
- [ ] No [NEEDS CLARIFICATION] items remain unresolved?
- [ ] Feature branch ready for merge to main?

### App Store Readiness  
- [ ] Privacy manifest updated for any new data collection/storage?
- [ ] Accessibility tested with VoiceOver and Accessibility Inspector?
- [ ] Feature screenshots generated for App Store metadata?
- [ ] Localized content prepared for supported languages?
- [ ] Beta testing completed with TestFlight (if applicable)?

## Template Variables

**Feature Context**:
- `${FEATURE_NAME}` - PascalCase feature name from Spec.md
- `${PROJECT_ROOT}` - Project root directory path
- `${TARGET_PLATFORMS}` - iOS, macOS, tvOS, watchOS support

**Architecture Context**:
- `${MODEL_1}`, `${MODEL_2}`, `${MODEL_3}` - Data models from Tech.md
- `${SERVICE_1}`, `${SERVICE_2}` - Service classes from Tech.md  
- `${VIEW_1}`, `${VIEW_2}` - SwiftUI views from Tech.md
- `${NAVIGATION_COORDINATOR}` - Navigation implementation from Tech.md

**File Structure**:
- `${NEW_DIRECTORIES}` - New directory structure required
- `${MODIFIED_FILES}` - Existing files that need updates
- `${TEST_FILES}` - Test files to be created
- `${CONFIG_FILES}` - Configuration files to be updated

## Error Conditions

**Planning Errors**:
- "Technical plan required" → Must complete `/Plan/define-tech` first
- "Architecture unclear" → Tech.md missing critical implementation details  
- "Scope too large" → Feature should be broken into smaller, focused features
- "Dependency conflicts" → Tasks have circular or unresolvable dependencies

**iOS-Specific Errors**:
- "Privacy impact unclear" → Data usage patterns must be documented
- "Accessibility gaps" → UI components lack sufficient accessibility planning
- "App Store compliance" → Feature may violate App Store Review Guidelines  
- "Performance concerns" → Implementation may cause performance degradation

**Constitutional Errors**:  
- "Package architecture violation" → Feature doesn't follow package-first principles
- "Error handling incomplete" → ErrorKit patterns not properly integrated
- "Code quality issues" → Implementation doesn't follow constitutional style
- "Localization missing" → TranslateKit integration not properly planned

════════════════════════════════════════════════════════════════════════════════
║ 🤖 EXECUTION FLOW - IMPLEMENTATION STEPS GENERATION
════════════════════════════════════════════════════════════════════════════════
║
║ ## For AI Generation
║
║ When creating implementation steps from a technical plan:
║
║ 1. **Apply Task Generation Rules**: Follow one-task-per-file/entity rule strictly
║ 2. **Mark Parallel Safety**: Use [P] only for truly independent tasks
║ 3. **Include iOS Specifics**: Privacy, accessibility, localization, App Store compliance
║ 4. **Validate Dependencies**: Ensure logical order and no circular dependencies
║ 5. **Constitutional Integration**: ErrorKit, 3-space style, package architecture
║ 6. **Quality Gates**: Build validation, testing, agent checks
║
║ ### Common iOS Task Patterns
║ ```
║ Setup → Models (TDD) → Services → UI → Integration → Polish → Release
║  ↓         ↓           ↓         ↓         ↓           ↓         ↓
║ S001    S004-S009   S011-S014  S015-S019  S020-S024   S025-S029  S030
║ ```
║
║ ### Parallel Execution Examples
║ - **Models**: Different model files can implement [P] in parallel
║ - **Services**: Independent services can implement [P] in parallel
║ - **UI Views**: Non-interacting views can implement [P] in parallel
║ - **Tests**: Tests can run [P] with their implementation counterparts
║ - **Quality**: Accessibility, localization, error handling checks can run [P]
║
║ **IMPORTANT**: This template creates the implementation roadmap. Each S### task should be specific enough to execute without
║ ambiguity while maintaining proper dependency order and parallel execution opportunities.
════════════════════════════════════════════════════════════════════════════════

*Template follows spec-kit execution flow patterns with iOS/macOS constitutional principle integration and ContextKit hierarchical context inheritance.*