# Technical Architecture: [Feature from Spec.md]
<!-- Template Version: 1 | ContextKit: 0.0.0 | Updated: 2025-09-14 -->

## Description
Technical architecture template providing systematic iOS/macOS implementation planning with Context/Guidelines compliance validation and architectural decision documentation.

════════════════════════════════════════════════════════════════════════════════
║ 🤖 EXECUTION FLOW - TECHNICAL ARCHITECTURE GENERATION
════════════════════════════════════════════════════════════════════════════════
║
║ ## Execution Flow (main)
║
║ ### Phase 1: Prerequisites & Context Loading
║
║ 1. **Load Technical Research Results**
║    - Use `Read` tool to read current feature directory Research.md: `Read Context/Features/[FeatureName]/Research.md`
║    - If missing: ERROR "Technical research required before architecture planning - run research phase first"
║    - Extract: researched technology decisions, API constraints, architectural patterns
║    - Document research findings for informed architecture decisions
║
║ 2. **Load Feature Specification**
║    - Use `Read` tool to read current feature directory Spec.md: `Read Context/Features/[FeatureName]/Spec.md`
║    - If missing: ERROR "Feature specification required for architecture planning"
║    - Extract: user flows, functional requirements, business constraints
║    - Cross-reference with research findings for technology alignment
║
║ 3. **Load Project Context**
║    - Use `Read` tool to read project Context.md: `Read Context.md`
║    - Extract project type, existing architecture, tech stack preferences
║    - For workspace projects: Use `Read` tool on workspace Context.md for overrides
║
║ 4. **Load Development Guidelines**
║    - Based on project type detected:
║      - If Swift detected: Use `Read` tool: `Read Context/Guidelines/Swift.md`
║      - If SwiftUI detected: Use `Read` tool: `Read Context/Guidelines/SwiftUI.md`
║    - Document loaded guidelines for architectural compliance validation
║
║ ### Phase 2: Architecture Design & Validation
║
║ 5. **Apply Context/Guidelines Compliance Gates**
║    - Package-first principle: Can this be architected as Swift package?
║    - ErrorKit integration: How will errors be handled with typed throws?
║    - Code quality: Does architecture meet Context/Guidelines/Swift.md standards?
║    - Platform compliance: Does design follow Context/Guidelines/SwiftUI.md patterns?
║    - If any gate fails: DOCUMENT justification or ERROR "Simplify approach"
║
║ 6. **Design iOS/macOS Architecture with Research-Informed Decisions**
║    - SwiftUI structure: Views, ViewModels, navigation patterns
║    - Data layer: SwiftData, CoreData, CloudKit, or package-based storage
║    - Service layer: API integration, business logic separation
║    - For each decision: DOCUMENT rationale and alternatives considered
║
║ 7. **Generate Implementation Complexity Assessment"
║    - Estimate development time and effort requirements
║    - Identify potential risks and mitigation strategies
║    - Mark uncertain areas with [NEEDS CLARIFICATION: specific technical question]
║
║ ### Phase 3: Technical Plan Generation
║
║ 8. **Generate Technical Architecture Content"
║    - Use `Edit` tool to replace template header with specific feature information:
║      - Title: "# Technical Architecture: [Feature Name]"
║      - Created: [Current Date]
║      - Status: Technical Plan
║      - Prerequisites: Reference to completed Spec.md
║
║ 9. **Fill System Overview Section"
║    - High-level architecture description and component relationships
║    - Core components with clear responsibilities
║    - Data flow documentation
║
║ 10. **Complete Implementation Details Sections"
║    - SwiftUI structure with view hierarchy and state management
║    - Data layer design with storage strategy and model architecture
║    - Service layer with integration patterns and dependency management
║    - Platform-specific considerations (iOS/macOS requirements)
║
║ 11. **Generate Complexity Assessment"
║     - Development effort estimation with realistic timelines
║     - Risk assessment and mitigation strategies
║     - Dependency analysis (external and internal)
║
║ ### Phase 4: Validation & Completion
║
║ 12. **Run Technical Validation Gates"
║     - Architecture supports all user scenarios from specification?
║     - Context/Guidelines standards maintained throughout?
║     - Dependencies reasonable and well-justified?
║     - Performance implications assessed and acceptable?
║     - If validation fails: ERROR with specific remediation guidance
║
║ 13. **Update Technical Plan Status"
║     - Check off all completed technical planning items
║     - Mark any remaining [NEEDS CLARIFICATION] areas
║     - Validate all mandatory sections completed
║
║ 14. **COMPLETION"
║     - Use `Edit` tool to remove this entire boxed system instructions section
║     - Leave only the clean technical architecture content for team use
║     - Final document focused on architectural decisions and implementation guidance
║
║ ## Success Criteria
║ - All technical sections completed with specific architectural decisions
║ - Context/Guidelines compliance validated throughout architecture
║ - Implementation complexity realistically assessed with timelines
║ - Platform considerations (iOS/macOS) integrated throughout plan
║ - Technical decisions clearly documented with rationale
║ - All validation gates passed and dependencies identified
║ - [NEEDS CLARIFICATION] markers used for genuine technical uncertainties only
║ - System instructions completely removed from final technical plan document
║
════════════════════════════════════════════════════════════════════════════════

# Technical Architecture: [AI Generated Feature Name]

**Created**: [AI Generated Current Date]
**Status**: Technical Plan
**Prerequisites**: Completed business specification (Spec.md) and technical research (Research.md)

## System Overview

### High-Level Architecture
[AI Generated: Brief description of component relationships and overall system design]

### Core Components
- **[Component Name]**: [AI Generated responsibility and purpose]
- **[Component Name]**: [AI Generated responsibility and purpose]
- **[Component Name]**: [AI Generated responsibility and purpose]

### Data Flow
[AI Generated: Description of how data moves through the system and key interaction patterns]

## iOS/macOS Implementation Details

### SwiftUI Structure

**View Hierarchy**:
```
[Feature Name]View (main entry point)
├── [Child View Name] ([AI Generated purpose])
├── [Child View Name] ([AI Generated purpose])
└── [Child View Name] ([AI Generated purpose])
```

**State Management**:
- **ViewModels**: [AI Generated strategy and patterns]
- **Data Binding**: [AI Generated binding approach]
- **Navigation**: [AI Generated navigation pattern]

**Architectural Decision Rationale**:
- **Why this structure**: [AI Generated reasoning for chosen structure]
- **Alternatives considered**: [AI Generated alternative options evaluated]
- **Trade-offs**: [AI Generated analysis of benefits vs costs]

### Data Layer Design

**Storage Strategy**: [AI Generated choice] (SwiftData | CoreData | CloudKit | Package-based | File-based)

**Model Architecture**:
```swift
// Primary entities (conceptual - detailed implementation in Steps phase)
struct [Primary Model] {
   // [AI Generated: Key properties identified from specification]
}

struct [Secondary Model] {
   // [AI Generated: Supporting data structures]
}
```

**Data Access Pattern**: [AI Generated data access strategy]
**Synchronization Strategy**: [AI Generated sync approach] (if applicable)

**Decision Rationale**:
- **Why this storage approach**: [AI Generated storage reasoning]
- **Performance characteristics**: [AI Generated performance analysis]
- **Scalability considerations**: [AI Generated scalability assessment]

### Service Layer Architecture

**Service Organization**:
- **[Service Name]**: [AI Generated service responsibility]
- **[Service Name]**: [AI Generated service responsibility]

**External Integration Strategy**:
- **APIs**: [AI Generated API integration approach]
- **Authentication**: [AI Generated auth strategy]
- **Error Handling**: [AI Generated error handling strategy using Context/Guidelines/Swift.md ErrorKit patterns]

**Dependency Management**:
- **Package Dependencies**: [AI Generated required packages]
- **Version Requirements**: [AI Generated version constraints]
- **Integration Points**: [AI Generated integration strategy]

### Platform-Specific Considerations

#### iOS Implementation
- **Minimum iOS Version**: [AI Generated version] (justified by feature requirements)
- **Device Support**: [AI Generated devices] (iPhone, iPad, Mac Catalyst)
- **Performance Targets**:
  - App launch impact: [AI Generated impact assessment]
  - Memory usage: [AI Generated memory analysis]
  - UI responsiveness: 60fps maintained during [AI Generated critical operations]

#### macOS Implementation (if applicable)
- **Minimum macOS Version**: [AI Generated version]
- **Mac-Specific Features**: [AI Generated Mac features]
- **Menu Integration**: [AI Generated menu strategy]

#### App Store Compliance
- **Privacy Manifest Updates**: [AI Generated privacy impact]
- **New Permissions Required**: [AI Generated permissions needed]
- **Review Guidelines Considerations**: [AI Generated review considerations]

## Implementation Complexity Assessment

### Development Effort Estimation
**Complexity Level**: [AI Generated Level] (Simple | Moderate | Complex | Very Complex)

**Estimated Timeline**: [AI Generated time estimate]
- Setup and infrastructure: [AI Generated setup time]
- Core implementation: [AI Generated core time]
- Testing and polish: [AI Generated testing time]
- Integration and validation: [AI Generated integration time]

**Risk Assessment**:
- **High Risk Areas**: [AI Generated high risks identified]
- **Mitigation Strategies**: [AI Generated risk mitigation approaches]
- **Unknowns Requiring Research**: [AI Generated research needs]

### Dependency Analysis

**External Dependencies**:
- **Swift Packages**: [AI Generated required packages]
- **iOS Frameworks**: [AI Generated iOS frameworks needed]
- **Third-Party Services**: [AI Generated external services]

**Internal Dependencies**:
- **Existing Code Modifications**: [AI Generated existing code changes]
- **New Shared Components**: [AI Generated new shared components]
- **Breaking Changes**: [AI Generated breaking changes] (if any)

### Quality Assurance Requirements

**Testing Strategy**:
- **Unit Tests**: [AI Generated unit test approach]
- **Integration Tests**: [AI Generated integration test approach]
- **UI Tests**: [AI Generated UI test approach]

**Validation Requirements**:
- **Context/Guidelines Validation**: Per Swift.md and SwiftUI.md compliance standards
- **Performance Testing**: [AI Generated performance test strategy]
- **Platform Testing**: [AI Generated platform-specific testing needs]

## Technical Clarifications

### Areas Requiring Resolution
[AI Generated: Mark any uncertain technical aspects requiring resolution before implementation]

- [NEEDS CLARIFICATION: [AI Generated specific technical question]]
- [NEEDS CLARIFICATION: [AI Generated specific technical question]]

### Research Requirements
**Technology Investigations**:
- [AI Generated research topic]: [AI Generated research reason]
- [AI Generated research topic]: [AI Generated research reason]

**Proof of Concept Needs**:
- [AI Generated POC need]: [AI Generated POC justification]
- [AI Generated POC need]: [AI Generated POC justification]

---

**Next Phase**: After this technical architecture is approved, proceed to `/ctxk:plan:3-steps` for implementation task breakdown and development planning.

---

════════════════════════════════════════════════════════════════════════════════
║ 🤖 VALIDATION & EXECUTION STATUS - AI WORKFLOW INSTRUCTIONS
════════════════════════════════════════════════════════════════════════════════
║
║ ## Architecture Validation Gates
║
║ ### Technical Completeness
║ - [ ] All user scenarios from specification have technical solutions?
║ - [ ] Data models support all required operations?
║ - [ ] Service layer handles all business logic requirements?
║ - [ ] Error scenarios have appropriate handling strategies?
║
║ ### iOS/macOS Standards Compliance
║ - [ ] SwiftUI patterns follow current best practices?
║ - [ ] Navigation structure appropriate for platform?
║ - [ ] State management scalable and maintainable?
║ - [ ] Performance implications assessed and acceptable?
║
║ ### Context/Guidelines Standards Adherence
║ - [ ] Swift.md principles applied or justified exceptions documented?
║ - [ ] SwiftUI.md standards incorporated throughout design?
║ - [ ] All guidelines referenced appropriately in architectural decisions?
║
║ ### Implementation Readiness
║ - [ ] Architecture sufficiently detailed for task breakdown?
║ - [ ] Dependencies identified and availability confirmed?
║ - [ ] Risk areas identified with mitigation plans?
║ - [ ] No blocking [NEEDS CLARIFICATION] items remain?
║
║ ## Project Type Specific Validation
║ *Applied automatically based on detected project type*
║
║ **For iOS App Projects**:
║ - [ ] App Store Guidelines compliance reviewed?
║ - [ ] Privacy manifest impact assessed?
║ - [ ] Platform accessibility requirements planned?
║ - [ ] Device compatibility confirmed?
║
║ **For Swift Package Projects**:
║ - [ ] Public API design follows package conventions?
║ - [ ] DocC documentation strategy defined?
║ - [ ] Linux compatibility considered?
║ - [ ] Semantic versioning impact assessed?
║
║ **For Vapor Server Projects**:
║ - [ ] Security implications reviewed?
║ - [ ] Performance benchmarks defined?
║ - [ ] Database migration strategy planned?
║ - [ ] Docker deployment considerations included?
║
║ ## Execution Status
║ *Updated by main() during processing*
║
║ ### Phase 1: Prerequisites & Context Loading
║ - [ ] Technical research results loaded from Research.md
║ - [ ] Feature specification loaded and cross-referenced with research
║ - [ ] Project Context.md loaded for tech stack preferences
║ - [ ] Development guidelines loaded based on project type
║ - [ ] Workspace Context.md loaded for overrides (if applicable)
║
║ ### Phase 2: Architecture Design & Validation
║ - [ ] Context/Guidelines compliance gates validated
║ - [ ] iOS/macOS architecture designed with rationale
║ - [ ] Implementation complexity assessed
║ - [ ] Technical uncertainties marked with [NEEDS CLARIFICATION]
║
║ ### Phase 3: Technical Plan Generation
║ - [ ] Technical architecture content generated
║ - [ ] System overview section completed
║ - [ ] Implementation details sections filled
║ - [ ] Complexity assessment completed
║
║ ### Phase 4: Validation & Completion
║ - [ ] Technical validation gates executed
║ - [ ] Technical plan status updated
║ - [ ] All mandatory sections completed
║ - [ ] System instructions removed from final document
║
║ **Next Phase**: After this technical architecture is approved, proceed to `/ctxk:plan:3-steps` for implementation task breakdown and development planning.
║
════════════════════════════════════════════════════════════════════════════════