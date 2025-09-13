# Create Task List
<!-- Template Version: 0 | ContextKit: 0.0.0 | Updated: 2025-01-26 -->

> [!WARNING]
> **👩‍💻 FOR DEVELOPERS**: Do not edit the content above the developer customization section - changes will be overwritten during ContextKit updates.
>
> For project-specific customizations, use the designated section at the bottom of this file.
>
> Found a bug or improvement for everyone? Please report it: https://github.com/FlineDev/ContextKit/issues

## Description
Break down technical implementation plan into executable tasks following spec-kit methodology

## Parameters
- `feature_path` (required): Path to feature directory with Spec.md and Tech.md completed

## Execution Flow (main)
1. Load prerequisite documents
   → Read Context/Features/[FeatureName]/Spec.md for requirements
   → Read Context/Features/[FeatureName]/Tech.md for architecture
   → If either missing: ERROR "Complete /Plan/create-spec and /Plan/define-tech first"
2. Extract task generation inputs
   → User stories from specification → integration test tasks
   → Architecture components from tech plan → implementation tasks
   → Data models from tech plan → model creation tasks
   → API interfaces from contracts → endpoint implementation tasks
3. Apply ContextKit task generation rules
   → Setup tasks: Project structure, dependencies, configuration
   → Template tasks: Different template files marked [P] for parallel execution
   → Implementation tasks: Core functionality in dependency order
   → Integration tasks: Component connections and system integration
   → Quality tasks: Constitutional principle validation, testing, documentation
4. Generate ordered task list
   → Number tasks sequentially (T001, T002, etc.)
   → Mark parallel tasks with [P] where files don't conflict
   → Apply dependencies: Setup → Core → Integration → Quality
   → Include exact file paths for each task
5. Create parallel execution examples
   → Group [P] tasks that can run simultaneously
   → Show Task agent command examples for parallel work
6. Apply constitutional task requirements
   → Include accessibility validation tasks for UI features
   → Include privacy assessment tasks for data features
   → Include localization tasks for user-facing features
   → Include maintainability tasks for all components
7. Write Steps.md with complete task breakdown
   → Include dependency graph showing task relationships
   → Provide parallel execution guidance
   → Add validation checklist for task completion
8. Return: SUCCESS (executable task list ready for implementation)

## Template Variables
${FEATURE_NAME} - Feature name from specification
${PROJECT_TYPE} - Project architecture type
${TASK_COUNT} - Total number of generated tasks
${PARALLEL_GROUPS} - Number of parallel execution groups
${CONSTITUTIONAL_TASKS} - Tasks enforcing constitutional principles

## Task Generation Rules
*Applied during main() execution*

1. **From Requirements**:
   - Each user story → integration test task [P]
   - Each functional requirement → implementation task
   
2. **From Technical Architecture**:
   - Each data model → model creation task [P]
   - Each service → service implementation task
   - Each view/component → UI implementation task [P]
   
3. **From Constitutional Principles**:
   - UI features → accessibility validation task
   - Data features → privacy assessment task
   - User-facing features → localization task
   - All features → maintainability review task

4. **Ordering Strategy**:
   - Setup → Models → Services → UI → Integration → Quality
   - Dependencies block parallel execution
   - Constitutional validation in final quality phase

## Validation Gates
- [ ] All requirements have corresponding implementation tasks?
- [ ] All architecture components have creation tasks?
- [ ] Constitutional principle tasks included for relevant features?
- [ ] Parallel tasks truly independent (different files)?
- [ ] Each task specifies exact file path?
- [ ] Dependency graph shows clear execution order?
- [ ] Task descriptions specific enough for LLM execution?

## Error Conditions
- "Prerequisites missing" → Must complete spec and tech planning first
- "Insufficient detail" → Tech plan must specify components and architecture
- "Constitutional gaps" → Must include accessibility, privacy, localization, maintainability tasks
- "Dependency conflicts" → Must resolve circular or conflicting task dependencies

## Platform-Specific Task Patterns

### Swift Package
- **Setup**: Package.swift, directory structure, test targets
- **Core**: Protocol definitions, implementation types, utilities
- **Integration**: Cross-module dependencies, Linux compatibility
- **Quality**: Unit tests, DocC documentation, package validation

### iOS/macOS App
- **Setup**: Project configuration, Info.plist, privacy manifest
- **Core**: SwiftUI views, data models, business logic
- **Integration**: CloudKit sync, system integrations, platform APIs
- **Quality**: UI tests, accessibility testing, App Store validation

## Constitutional Task Templates

### Accessibility Tasks
- Accessibility audit with VoiceOver testing
- Color contrast validation and semantic colors
- Keyboard navigation flow testing
- Dynamic type support verification

### Privacy Tasks
- Privacy manifest accuracy review
- Data minimization assessment
- User consent flow implementation
- Encryption and secure storage validation

### Localization Tasks
- String externalization completeness
- Number and date formatting patterns
- Cultural considerations review
- RTL language support testing

### Maintainability Tasks
- Code architecture review against patterns
- Error handling consistency check
- Documentation completeness audit
- Technical debt assessment

════════════════════════════════════════════════════════════════════════════════
👩‍💻 DEVELOPER CUSTOMIZATIONS - EDITABLE SECTION
════════════════════════════════════════════════════════════════════════════════

This section is preserved during ContextKit migrations and updates.
Add project-specific instructions, examples, and overrides below.

## Project-Specific Instructions

<!-- Add any project-specific guidance for task breakdown and step creation here -->

## Additional Examples

<!-- Add examples of task breakdown patterns that work well with your project -->

## Override Behaviors

<!-- Document any project-specific task organization overrides here -->