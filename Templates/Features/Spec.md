# Feature Specification Template
<!-- Template Version: 4 | ContextKit: 0.1.0 | Updated: 2025-09-22 -->

## Description
Feature specification template providing systematic business requirements generation with progress tracking and quality validation.

════════════════════════════════════════════════════════════════════════════════
║ 🤖 EXECUTION FLOW - FEATURE SPECIFICATION GENERATION
════════════════════════════════════════════════════════════════════════════════
║
║ ## Execution Flow (main)
║
║ ### Phase 1: Context Analysis & Guidelines Loading
║
║ 1. **Load Project Context**
║    - Use `Read` tool to read project Context.md: `Read Context.md`
║    - Extract project type, tech stack, development patterns, workspace reference
║    - Document project context for specification customization
║
║ 2. **Load All Available Development Guidelines**
║    - Use `Glob` tool to discover available guidelines: `Glob Context/Guidelines *.md`
║    - For each found guideline file:
║      - Use `Read` tool: `Read Context/Guidelines/[GuidelineName].md`
║      - Extract framework preferences, architectural patterns, API choices
║    - For workspace projects: Use `Read` tool on workspace Context.md for additional standards
║    - Document all loaded guidelines for comprehensive development pattern application
║
║ 3. **Extract User Requirements from Original Input**
║    - Parse original feature description provided by user
║    - Identify key concepts: primary functionality, user actors, data involved, platform targets
║    - Generate initial understanding of user needs and business value
║
║ ### Phase 2: Specification Content Generation
║
║ 4. **Generate Feature Information**
║    - Use `Edit` tool to replace template header with specific feature information:
║      - Title: "# Feature Specification: [Feature Name]"
║      - Feature Branch: `feature/[prefix]-[kebab-case-name]` (from parent command)
║      - Created: [Current Date]
║      - Status: Draft
║      - Input: [Original user description - preserve exactly verbatim, do NOT summarize]
║        Format as: **Input**:\n"""\n[user description]\n"""
║        Use triple quotes (""") not backticks - user input is quoted text, not code
║
║ 5. **Create Primary User Story**
║    - Generate "As a [User Type], I want to [User Goal] so that [User Benefit]"
║    - Include platform-specific context (iOS/macOS considerations)
║    - Add multi-platform context sections
║
║ 6. **Generate Acceptance Scenarios**
║    - Create comprehensive Given/When/Then scenarios
║    - Include Happy Path, Error Path, Edge Cases
║    - Add device-specific scenarios (iPhone, iPad, Mac)
║    - Consider network conditions and offline scenarios
║
║ 7. **Define Functional Requirements**
║    - Generate specific, testable requirements (FR-001, FR-002, etc.)
║    - Each requirement must be:
║      - Testable with clear success/failure criteria
║      - Platform-appropriate for iOS/macOS conventions
║      - User-focused and business-value driven
║
║ ### Phase 3: Business Validation & Scope Definition
║
║ 8. **Focus on Business Value**
║    - Keep specification focused on user needs and business requirements
║    - Avoid technical implementation details (frameworks, APIs, code structure)
║    - Document what users need, not how to build it
║
║ 9. **Feature Justification & Scope Definition**
║    - Apply Value Validation checks: user problem, success metrics, cost/benefit (internal validation)
║    - Generate clear scope boundaries for final specification:
║      - IN SCOPE: Specific features with clear user value
║      - OUT OF SCOPE: Exclude unnecessary features
║    - Note future considerations internally (do not include in final spec)
║    - Apply anti-speculation enforcement (internal validation only)
║
║ 10. **Mark Clarification Needs**
║     - For any ambiguous or underspecified requirements, mark with:
║       🚨 [NEEDS CLARIFICATION: specific question]
║     - Common areas: authentication methods, data persistence, target platforms,
║       performance targets, user flows, business requirements
║
║ ### Phase 4: Validation & Completion
║
║ 11. **Execute Business Validation Gates**
║     - User Value: Clear user problems solved, measurable success criteria
║     - Scope Clarity: Well-defined boundaries, no feature creep
║     - Testability: Requirements can be validated with clear pass/fail criteria
║     - Quality Assurance: Complete user flows, edge cases, measurable criteria
║
║ 12. **Template Quality Validation**
║     - Content Quality: No implementation details, focused on user value, stakeholder-appropriate
║     - Requirement Completeness: Testable requirements, clear scope, identified dependencies
║     - Business Focus: Requirements focused on what users need, not how to build it
║     - Check all boxes in template validation section
║
║ 13. **Update Execution Status**
║     - Check off all completed execution status items:
║       - User description parsed
║       - Development guidelines applied
║       - Key concepts extracted
║       - Ambiguities marked with 🚨 [NEEDS CLARIFICATION]
║       - Platform-specific user scenarios defined
║       - Platform-specific requirements generated
║       - Anti-speculation enforcement applied
║       - Validation gates executed
║       - Template self-validation completed
║       - Review checklist passed
║
║ 14. **Internal Validation Framework (DO NOT INCLUDE IN FINAL SPEC)**
║     - Value Validation: Feature solves specific user problem? Success metrics defined?
║     - Scope Boundaries: Clear IN SCOPE/OUT OF SCOPE/FUTURE CONSIDERATIONS?
║     - Anti-Speculation Enforcement: No speculative features? Tied to current needs?
║     - Implementation cost estimated? Maintenance burden acceptable?
║
║ 15. **COMPLETION**
║     - Use `Edit` tool to remove this entire boxed system instructions section
║     - Use `Edit` tool to remove the validation framework instructions box at the end of the file
║     - Leave only the clean feature specification content for team use
║     - Final document should end after the Scope Boundaries section
║     - Final document focused on business requirements, not generation process
║
║ ## Success Criteria
║ - All specification sections completed with specific, project-appropriate content
║ - Development guidelines from loaded standards properly applied throughout
║ - Requirements are specific, testable, and unambiguous with clear success criteria
║ - Platform considerations (iOS/macOS) integrated throughout specification
║ - User value clearly articulated without technical implementation details
║ - All validation gates passed and checkboxes marked appropriately
║ - 🚨 [NEEDS CLARIFICATION] markers used for genuine ambiguities only
║ - System instructions AND validation framework completely removed from final specification
║
════════════════════════════════════════════════════════════════════════════════

# Feature Specification: [AI Generated Feature Name]

**Feature Branch**: `feature/[prefix]-[ai-generated-branch-name]`
**Created**: [AI Generated Current Date]
**Status**: Draft
**Input**:
"""
[Original User Description - Preserve Exactly Verbatim - Can be multiple paragraphs]
"""

## User Scenarios & Testing *(mandatory)*

### Primary User Story
[AI Generated: As a [User Type], I want to [User Goal] so that [User Benefit]]

**Platform Context**:
- **Multi-platform**: [AI Generated platform-specific experience differences]
- **User Experience**: [AI Generated user experience considerations]
- **Data Handling**: [AI Generated data and user information considerations]

### Acceptance Scenarios
[AI Generated comprehensive Given/When/Then scenarios based on user input and business requirements]

1. **Given** [AI Generated Scenario Context], **When** [AI Generated User Action], **Then** [AI Generated Expected Outcome]
   - **Happy Path**: [AI Generated normal successful usage scenario]
   - **Error Path**: [AI Generated error handling scenario]
   - **Edge Cases**: [AI Generated edge case scenarios]

2. **Given** [AI Generated Additional Context], **When** [AI Generated Different Action], **Then** [AI Generated Different Outcome]
   - [AI Generated device-specific scenarios from loaded guidelines]

### Edge Cases
[AI Generated edge cases based on user requirements and business logic]
- **Platform variations**: [AI Generated device-specific behaviors if applicable]
- **Multi-device usage**: [AI Generated sync conflicts if applicable]
- **App lifecycle**: [AI Generated background processing, interruption scenarios]
- **Network conditions**: [AI Generated offline/online state changes]
- **User scenarios**: [AI Generated different user types, permissions, data states]

## Requirements *(mandatory)*

### Functional Requirements
[AI Generated specific requirements based on user input and loaded development guidelines]

- **FR-001**: System MUST [AI Generated Specific Requirement 1 based on user input]
- **FR-002**: System MUST [AI Generated Specific Requirement 2 based on user input]
- **FR-003**: System MUST [AI Generated Specific Requirement 3 based on user input]

*[AI ensures each requirement is:]*
- *Testable with clear success/failure criteria*
- *Focused on user value and business needs*
- *Free of technical implementation details*

## Scope Boundaries *(mandatory)*

- **IN SCOPE**: [AI Generated specific features with clear user value]
- **OUT OF SCOPE**: [AI Generated explicitly excluded tempting but unnecessary features]

---

════════════════════════════════════════════════════════════════════════════════
║ 🤖 VALIDATION FRAMEWORK & EXECUTION STATUS - AI WORKFLOW INSTRUCTIONS
════════════════════════════════════════════════════════════════════════════════
║
║ ## Feature Validation Framework (Internal Use Only)
║ *Apply these criteria during generation - do not include in final specification*
║
║ ### Value Validation
║ - [ ] Feature solves specific user problem (not "might be useful")?
║ - [ ] Success metrics defined and measurable?
║ - [ ] User research or feedback validates need?
║ - [ ] Implementation cost estimated and approved?
║ - [ ] Maintenance burden considered and acceptable?
║
║ ### Future Considerations (For Validation Only - Do Not Include in Final)
║ - **FUTURE CONSIDERATIONS**: [AI Generated ideas for later that shouldn't be implemented now]
║ - Use this internally to avoid scope creep, but do not include in final specification
║
║ ### Anti-Speculation Enforcement
║ - [ ] No speculative or "future-proofing" features included?
║ - [ ] Each feature tied to current user needs, not hypothetical scenarios?
║ - [ ] Feature set focused on core value proposition?
║ - [ ] Complexity intentionally constrained to essential functionality?
║
║
║ ## Business Validation Gates (Auto-executed)
║ *Checked by execution flow before returning SUCCESS*
║
║ ### Requirements Quality
║ - [ ] All user flows have Happy Path + Error Path scenarios?
║ - [ ] Edge cases documented with expected behaviors?
║ - [ ] Success criteria are measurable with specific metrics?
║ - [ ] No 🚨 [NEEDS CLARIFICATION] markers remain unresolved?
║
║ ### Business Value
║ - [ ] Clear user problems identified and documented?
║ - [ ] Success metrics defined and measurable?
║ - [ ] Feature scope properly bounded (IN/OUT/FUTURE)?
║ - [ ] Requirements focused on user needs, not technical implementation?
║
║ ## Template Validation (Auto-executed)
║ *Checked by execution flow before returning SUCCESS*
║
║ ### Content Quality
║ - [ ] No implementation details (languages, frameworks, APIs)
║ - [ ] Focused on user value and business needs
║ - [ ] Written for non-technical stakeholders
║ - [ ] All mandatory sections completed
║ - [ ] Platform-specific considerations integrated throughout
║
║ ### Requirement Completeness
║ - [ ] No 🚨 [NEEDS CLARIFICATION] markers remain
║ - [ ] Requirements are testable and unambiguous
║ - [ ] Success criteria are measurable
║ - [ ] Scope is clearly bounded with IN/OUT/FUTURE sections
║ - [ ] Dependencies and assumptions identified
║
║ ### Business Focus
║ - [ ] Requirements focused on user value, not technical implementation
║ - [ ] Anti-speculation enforcement applied
║ - [ ] Quality gates embedded throughout specification
║
║ ### Scope Clarity
║ - [ ] Platform differences considered if relevant to user experience
║ - [ ] Clear boundaries between business requirements and implementation details
║
║ ## Execution Status
║ *Updated by main() during processing*
║
║ - [ ] User description parsed
║ - [ ] Development guidelines applied
║ - [ ] Key concepts extracted
║ - [ ] Ambiguities marked with 🚨 [NEEDS CLARIFICATION]
║ - [ ] iOS/macOS user scenarios defined
║ - [ ] Platform-specific requirements generated
║ - [ ] Anti-speculation enforcement applied
║ - [ ] Validation gates executed
║ - [ ] Template self-validation completed
║ - [ ] Review checklist passed
║
║ **IMPORTANT**: This specification should remain high-level and readable. Any detailed technical implementations, code samples, or extensive technical specifications must be placed in separate implementation detail files in the Context/Features/[feature-name]/TechDetails/ directory during the technical planning phase.
║
║ **Command Arguments Used**:
║ - `$ARGUMENTS` - Original user input (e.g., "Add user authentication with Apple ID")
║ - AI generates feature name from `$ARGUMENTS` (e.g., "UserAuthentication")
║ - AI creates kebab-case branch name (e.g., "user-authentication")
║ - AI fills in current date and extracts user story components
║
║ ## Execution Status *(Progress Tracking)*
║ *Updated by AI during specification generation - check off completed steps*
║
║ ### Phase 1: Context Analysis & Guidelines Loading
║ - [ ] Project Context.md loaded and analyzed
║ - [ ] Development guidelines loaded based on project type
║ - [ ] Development patterns extracted from loaded guidelines
║ - [ ] User requirements extracted from original input
║
║ ### Phase 2: Specification Content Generation
║ - [ ] Feature information header generated
║ - [ ] Primary user story created with platform context
║ - [ ] Comprehensive acceptance scenarios generated
║ - [ ] Functional requirements defined with clear user value
║
║ ### Phase 3: Business Validation & Scope Definition
║ - [ ] Business value and user problems clearly documented
║ - [ ] Feature justification and scope boundaries defined
║ - [ ] Clarification needs marked with 🚨 [NEEDS CLARIFICATION] format
║ - [ ] All validation gates executed and boxes checked
║
║ ### Phase 4: Final Validation & Completion
║ - [ ] All validation sections completed with appropriate checks
║ - [ ] Template quality validation completed
║ - [ ] Execution status fully updated
║ - [ ] System instructions removed from final document
║
║ **Next Phase**: After this specification is approved, proceed to `/ctxk:plan:2-research-tech` for technical research, architecture planning and implementation design.
║
════════════════════════════════════════════════════════════════════════════════