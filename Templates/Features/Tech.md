# Technical Architecture: [Feature from Spec.md]
<!-- Template Version: 0 | ContextKit: 0.0.0 | Updated: 2025-09-13 -->

**Phase**: 1 (Technical Architecture)  
**Input**: Specification from Phase 0 (Spec.md)  
**Output**: Technical implementation plan ready for task breakdown

Technical planning template for iOS/macOS features with Context/Guidelines compliance. Used by `/ctxk:plan:2-tech` command for architecture decisions.

════════════════════════════════════════════════════════════════════════════════
║ 🤖 EXECUTION FLOW - TECHNICAL ARCHITECTURE GENERATION  
════════════════════════════════════════════════════════════════════════════════
║ ## Execution Flow (main)
║
║ ```
║ 1. Load feature specification from current feature directory Spec.md
║   → If missing: ERROR "Phase 0 specification required before technical planning"
║   → If incomplete: ERROR "Resolve [NEEDS CLARIFICATION] markers in specification first"
║ 2. Analyze specification for technical requirements
║   → Extract: user flows, data models, integration needs, performance targets
║   → Identify: complexity factors, external dependencies, platform constraints
║ 3. Apply Context/Guidelines compliance gates (Phase -1)
║   → Package-first principle: Can this be a Swift package?
║   → ErrorKit integration: How will errors be handled?
║   → 3-space indentation: Coding style confirmed?
║   → If any gate fails: DOCUMENT justification or ERROR "Simplify approach"
║ 4. Design iOS/macOS architecture with rationale
║   → SwiftUI structure: Views, ViewModels, navigation patterns
║   → Data layer: CoreData, CloudKit, or package-based storage
║   → Service layer: API integration, business logic separation
║   → For each decision: DOCUMENT rationale and alternatives considered
║ 5. Validate architectural decisions against project context
║   → Review existing codebase patterns and consistency
║   → Check dependency compatibility and version requirements
║   → Assess performance impact on app launch and memory usage
║ 6. Generate implementation complexity assessment
║   → Estimate development time and effort requirements
║   → Identify potential risks and mitigation strategies
║   → Mark uncertain areas with [NEEDS CLARIFICATION: specific technical question]
║ 7. Run technical validation gates
║   → Architecture supports all user scenarios from specification?
║   → Context/Guidelines standards maintained throughout?
║   → Dependencies reasonable and well-justified?
║   → Performance implications acceptable?
║   → If validation fails: ERROR with specific remediation guidance
║ 8. Return: SUCCESS (technical plan ready for Phase 2 task breakdown)
║ ```

## Template Variables
- `${FEATURE_NAME}` - PascalCase feature name from specification
- `${PROJECT_TYPE}` - Detected project type (ios-app, swift-package, vapor-server)
- `${EXISTING_ARCHITECTURE}` - Current project architectural patterns
- `${GUIDELINE_STANDARDS}` - Applied Context/Guidelines compliance requirements
- `${PERFORMANCE_TARGETS}` - Extracted performance requirements from specification

## Phase -1: Context/Guidelines Compliance Gates
*Must pass before proceeding to architecture design*

### Swift Development Principles
- [ ] Architecture follows Context/Guidelines/Swift.md package-first approach?
- [ ] Error handling strategy aligns with Context/Guidelines/Swift.md ErrorKit patterns?
- [ ] Code quality meets Context/Guidelines/Swift.md standards (3-space, modern Swift)?

### SwiftUI Platform Standards
- [ ] UI design follows Context/Guidelines/SwiftUI.md accessibility principles?
- [ ] Platform integration aligns with Context/Guidelines/SwiftUI.md patterns?
- [ ] User experience meets Context/Guidelines/SwiftUI.md quality standards?

### Context/Guidelines Compliance Validation
- [ ] If any principle not followed: Documented justification with specific alternatives?
- [ ] All architectural decisions reference appropriate guideline sections?

**Gate Failure Handling**:
```
If any gate fails:
→ Document specific justification in Complexity Tracking section
→ If no valid justification exists: ERROR "Simplify approach to meet Context/Guidelines standards"
→ All gates must pass or have documented exceptions before proceeding
```

║
║ ## Technical Architecture Plan
║
║ ### System Overview
║ **High-Level Architecture**:
║ [ARCHITECTURE_DIAGRAM: Brief text description of component relationships]
║
║ **Core Components**:
║ - **${COMPONENT_1}**: ${RESPONSIBILITY_1}
║ - **${COMPONENT_2}**: ${RESPONSIBILITY_2}  
║ - **${COMPONENT_3}**: ${RESPONSIBILITY_3}
║
║ **Data Flow**:
║ [DATA_FLOW_DESCRIPTION: How data moves through the system]

║
║ ### iOS/macOS Implementation Details
║
║ #### SwiftUI Structure
║ **View Hierarchy**:
║ ```
║ ${FEATURE_NAME}View (main entry point)
║ ├── ${CHILD_VIEW_1} (${PURPOSE_1})
║ ├── ${CHILD_VIEW_2} (${PURPOSE_2})
║ └── ${CHILD_VIEW_3} (${PURPOSE_3})
║ ```
║
║ **State Management**:
║ - **ViewModels**: ${VIEWMODEL_STRATEGY}
║ - **Data Binding**: ${BINDING_APPROACH}
║ - **Navigation**: ${NAVIGATION_PATTERN}
║
║ **Architectural Decision Rationale**:
║ - **Why this structure**: ${STRUCTURE_RATIONALE}
║ - **Alternatives considered**: ${ALTERNATIVE_OPTIONS}
║ - **Trade-offs**: ${TRADEOFF_ANALYSIS}

║
║ #### Data Layer Design
║ **Storage Strategy**: ${STORAGE_CHOICE} (CoreData | CloudKit | Package-based | File-based)
║
║ **Model Architecture**:
║ ```swift
║ // Primary entities (conceptual - detailed implementation in Phase 2)
║ struct ${PRIMARY_MODEL} {
║    // Key properties identified from specification
║ }
║
║ struct ${SECONDARY_MODEL} {
║    // Supporting data structures
║ }
║ ```
║
║ **Data Access Pattern**: ${DATA_ACCESS_PATTERN}
║ **Synchronization Strategy**: ${SYNC_STRATEGY} (if applicable)
║
║ **Decision Rationale**:
║ - **Why this storage approach**: ${STORAGE_RATIONALE}  
║ - **Performance characteristics**: ${PERFORMANCE_ANALYSIS}
║ - **Scalability considerations**: ${SCALABILITY_ASSESSMENT}

║
║ #### Service Layer Architecture
║ **Service Organization**:
║ - **${SERVICE_1}**: ${SERVICE_RESPONSIBILITY_1}
║ - **${SERVICE_2}**: ${SERVICE_RESPONSIBILITY_2}
║
║ **External Integration Strategy**:
║ - **APIs**: ${API_INTEGRATION_APPROACH}
║ - **Authentication**: ${AUTH_STRATEGY}
║ - **Error Handling**: ${ERROR_HANDLING_STRATEGY} (using ErrorKit patterns)
║
║ **Dependency Management**:
║ - **Package Dependencies**: ${PACKAGE_DEPENDENCIES}
║ - **Version Requirements**: ${VERSION_CONSTRAINTS}
║ - **Integration Points**: ${INTEGRATION_STRATEGY}

║
║ ### Platform-Specific Considerations
║
║ #### iOS Implementation
║ - **Minimum iOS Version**: ${MIN_IOS_VERSION} (justified by feature requirements)
║ - **Device Support**: ${DEVICE_SUPPORT} (iPhone, iPad, Mac Catalyst)
║ - **Performance Targets**: 
║  - App launch impact: ${LAUNCH_IMPACT}
║  - Memory usage: ${MEMORY_IMPACT}  
║  - UI responsiveness: 60fps maintained during ${CRITICAL_OPERATIONS}
║
║ #### macOS Implementation (if applicable)
║ - **Minimum macOS Version**: ${MIN_MACOS_VERSION}
║ - **Mac-Specific Features**: ${MAC_FEATURES}
║ - **Menu Integration**: ${MENU_STRATEGY}
║
║ #### App Store Compliance
║ - **Privacy Manifest Updates**: ${PRIVACY_IMPACT}
║ - **New Permissions Required**: ${PERMISSIONS_NEEDED}
║ - **Review Guidelines Considerations**: ${REVIEW_CONSIDERATIONS}

║
║ ## Implementation Complexity Assessment
║
║ ### Development Effort Estimation
║ **Complexity Level**: ${COMPLEXITY_LEVEL} (Simple | Moderate | Complex | Very Complex)
║
║ **Estimated Timeline**: ${TIME_ESTIMATE}
║ - Setup and infrastructure: ${SETUP_TIME}
║ - Core implementation: ${CORE_TIME}  
║ - Testing and polish: ${TESTING_TIME}
║ - Integration and validation: ${INTEGRATION_TIME}
║
║ **Risk Assessment**:
║ - **High Risk Areas**: ${HIGH_RISKS}
║ - **Mitigation Strategies**: ${RISK_MITIGATION}
║ - **Unknowns Requiring Research**: ${RESEARCH_NEEDED}

║
║ ### Dependency Analysis
║ **External Dependencies**:
║ - **Swift Packages**: ${REQUIRED_PACKAGES}
║ - **iOS Frameworks**: ${IOS_FRAMEWORKS}  
║ - **Third-Party Services**: ${THIRD_PARTY_SERVICES}
║
║ **Internal Dependencies**:
║ - **Existing Code Modifications**: ${EXISTING_CODE_CHANGES}
║ - **New Shared Components**: ${NEW_SHARED_COMPONENTS}
║ - **Breaking Changes**: ${BREAKING_CHANGES} (if any)

║
║ ### Quality Assurance Requirements
║ **Testing Strategy**:
║ - **Unit Tests**: ${UNIT_TEST_APPROACH}
║ - **Integration Tests**: ${INTEGRATION_TEST_APPROACH}
║ - **UI Tests**: ${UI_TEST_APPROACH}
║
║ **Validation Requirements**:
║ - **Accessibility Testing**: VoiceOver validation, dynamic type testing
║ - **Performance Testing**: ${PERFORMANCE_TEST_STRATEGY}
║ - **Localization Testing**: ${L10N_TEST_STRATEGY}

║
║ ## Uncertainty Tracking
║
║ ### Technical Clarifications Needed
║ [Mark any uncertain technical aspects requiring resolution before implementation]
║
║ - [NEEDS CLARIFICATION: ${TECHNICAL_QUESTION_1}]
║ - [NEEDS CLARIFICATION: ${TECHNICAL_QUESTION_2}]
║
║ ### Research Required
║ **Technology Investigations**:
║ - ${RESEARCH_TOPIC_1}: ${RESEARCH_REASON}
║ - ${RESEARCH_TOPIC_2}: ${RESEARCH_REASON}
║
║ **Proof of Concept Needs**:
║ - ${POC_1}: ${POC_JUSTIFICATION}
║ - ${POC_2}: ${POC_JUSTIFICATION}

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
║ **Validation Result**:
║ ```
║ If all gates pass: → Ready for Phase 2 (Implementation Planning)
║ If validation fails: → Return to architecture design with specific feedback
║ If clarifications needed: → Document uncertainties and request user input
║ ```

║
║ ## Context-Aware Project Integration
║
║ ### Project Type Specific Validation
║ *Applied automatically based on detected project type*
║
║ **For iOS App Projects**:
║ - [ ] App Store Guidelines compliance reviewed?
║ - [ ] Privacy manifest impact assessed?  
║ - [ ] Accessibility requirements planned?
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
║ ### Existing Codebase Integration
║ **Consistency Checks**:
║ - [ ] New architecture aligns with existing patterns?
║ - [ ] Dependencies compatible with current project setup?
║ - [ ] Code style matches established conventions?
║ - [ ] Integration points clearly defined?
║
║ **Impact Assessment**:
║ - **Files to be Modified**: ${MODIFIED_FILES}
║ - **New Files to be Created**: ${NEW_FILES}
║ - **Potential Conflicts**: ${POTENTIAL_CONFLICTS}

║
║ ## Next Phase Preparation
║
║ ### Ready for Implementation Planning (Phase 2)
║ **Deliverables for Steps Template**:
║ - ✅ Technical architecture decisions documented
║ - ✅ Context/Guidelines compliance validated
║ - ✅ Complexity assessment completed  
║ - ✅ Dependencies identified
║ - ✅ Platform requirements defined
║
║ **Information for Task Breakdown**:
║ - **Component Structure**: Clearly defined for file-level task creation
║ - **Implementation Order**: Dependency chain established
║ - **Parallel Opportunities**: Independent components identified
║ - **Testing Strategy**: Unit, integration, and UI test requirements defined
║
║ ### Success Criteria for This Phase
║ - [ ] Technical plan supports all specification requirements
║ - [ ] Architecture decisions documented with rationale
║ - [ ] Context/Guidelines standards maintained or exceptions justified
║ - [ ] Implementation complexity realistically assessed
║ - [ ] All blocking uncertainties resolved or clearly documented
║ - [ ] Plan ready for systematic task breakdown in Phase 2
════════════════════════════════════════════════════════════════════════════════

## For AI Generation

When creating this technical plan from a feature specification:

1. **Analyze the specification thoroughly**: Extract all technical implications from user scenarios and requirements
2. **Apply Context/Guidelines compliance rigorously**: Don't compromise on package-first, ErrorKit, or quality standards without explicit justification  
3. **Make architectural decisions explicit**: Document why you chose specific approaches and what alternatives you considered
4. **Be realistic about complexity**: Don't underestimate implementation effort or overlook potential risks
5. **Focus on iOS/macOS excellence**: Leverage platform-specific capabilities and follow platform conventions
6. **Mark genuine uncertainties**: Use [NEEDS CLARIFICATION] for technical questions that require domain expertise or user preference
7. **Validate completeness**: Ensure the technical plan addresses every requirement from the specification

### Common Technical Pitfalls to Avoid
- Over-engineering solutions when simple approaches would work
- Ignoring Context/Guidelines standards without proper justification
- Making assumptions about external dependencies or API availability  
- Underestimating integration complexity with existing code
- Forgetting platform-specific requirements (accessibility, privacy, App Store)
- Creating technical debt through shortcuts or temporary solutions

### Quality Checklist Before Completion
- [ ] Every specification requirement has a technical solution
- [ ] All architectural decisions include rationale  
- [ ] Context/Guidelines compliance verified at every level
- [ ] Complexity assessment includes realistic time estimates
- [ ] Risk mitigation strategies defined for high-risk areas
- [ ] Integration with existing codebase carefully planned
- [ ] Platform guidelines and best practices incorporated

**IMPORTANT**: This technical plan should provide sufficient detail for systematic task breakdown while remaining focused on architectural decisions rather than implementation minutiae. Detailed code examples and extensive technical specifications should be deferred to Phase 2 implementation planning.

---

*This template follows spec-kit methodology with Context/Guidelines compliance gates and iOS/macOS optimization. It ensures high-quality technical planning that leads to successful implementation.*