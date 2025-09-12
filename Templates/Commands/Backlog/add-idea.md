# Command: /Backlog/add-idea

## Description
Capture new app ideas with structured evaluation framework, constitutional principle assessment, and priority context following spec-kit methodology

## Parameters
- `description` (required): Brief description of the idea or feature concept

## Execution Flow (main)
1. Parse and validate idea description
   → If empty: ERROR "Idea description required"
   → If too vague: ERROR "Description must be specific and actionable"
   → Extract key concepts: user benefit, technical scope, complexity indicators
   → Identify actors, actions, and potential value proposition
2. Detect project context for idea assessment
   → Load Context.md to determine project type and architecture
   → If Context.md missing: ERROR "Must run in valid ContextKit project"
   → Identify existing features and technical capabilities from codebase
   → Assess alignment with project goals and user base
   → Load workspace context from parent directories if available
3. Generate idea metadata and classification
   → Create unique idea identifier: IDEA-${YEAR}-${SEQUENCE} (e.g., IDEA-2025-001)
   → Extract or generate clear idea title from description
   → Apply idea classification (feature, enhancement, performance, refactor, research, infrastructure)
   → Estimate initial effort level (Small, Medium, Large, XL) based on complexity indicators
4. Apply constitutional principle pre-assessment (mandatory gates)
   → **Accessibility Gate**: Assess UI impact, interaction models, assistive technology requirements
   → **Privacy Gate**: Evaluate data collection, storage, consent, and sharing implications
   → **Localizability Gate**: Analyze user-facing content, cultural sensitivity, technical complexity
   → **Maintainability Gate**: Review architecture impact, dependencies, code complexity, testing needs
   → If any gate assessment incomplete: ERROR "Constitutional assessment required for all relevant areas"
5. Create structured idea documentation
   → Ensure Context/Backlog/Ideas/ directory exists
   → Generate Context/Backlog/Ideas/${IDEA_ID}.md with complete evaluation framework
   → Include constitutional principle considerations and requirements
   → Document user value proposition, success criteria, and measurable outcomes
   → Identify potential dependencies, prerequisites, and integration points
6. Update backlog management system
   → Add entry to Context/Backlog/Index.md with metadata summary
   → Update Context/Backlog/Prioritization.md with new item for ranking
   → Tag idea with relevant categories (UI, Backend, Performance, API, etc.)
   → Link to related existing features or technical components
7. Generate implementation readiness assessment
   → Identify information gaps requiring clarification before specification
   → Suggest research tasks or technical spikes if needed
   → Propose next steps for idea refinement and validation
   → Mark constitutional principle areas requiring detailed planning during /Plan/create-spec
8. Run validation gates before completion
   → Verify all mandatory sections filled with specific, actionable content
   → Confirm constitutional assessment covers all relevant areas
   → Ensure user value proposition is clear and measurable
   → Validate technical considerations identify key integration points
   → Check that questions and uncertainties are specific and answerable
9. Return: SUCCESS (idea captured with constitutional assessment and prioritization context)

## Template Variables
${IDEA_ID} - Generated unique identifier (IDEA-YYYY-NNN)
${IDEA_TITLE} - Extracted or generated title from description
${PROJECT_TYPE} - Current project type (ios-app, swift-package, javascript-project, etc.)
${PROJECT_NAME} - Project name from Context.md or directory
${WORKSPACE_CONTEXT} - Inherited workspace settings and overrides
${CONSTITUTIONAL_ASSESSMENT} - Pre-assessment results for all constitutional principles
${EFFORT_ESTIMATE} - Initial effort level estimation (Small/Medium/Large/XL)
${USER_VALUE} - Identified user benefit and measurable value proposition
${CREATION_DATE} - ISO date when idea was captured
${SEQUENCE_NUMBER} - Auto-incremented sequence number for the year

## Idea Classification System

### Idea Types
```swift
enum IdeaType {
   case feature          // New user-facing functionality
   case enhancement     // Improvement to existing functionality
   case performance     // Performance optimization or improvement
   case refactor        // Code quality or architecture improvement
   case research        // Technical research or experimentation
   case infrastructure  // Development tooling or process improvement
}
```

### Effort Estimation Guidelines
```swift
enum EffortLevel {
   case small    // 1-3 days, single developer, minimal risk, clear implementation path
   case medium   // 1-2 weeks, may need collaboration, moderate complexity, some unknowns
   case large    // 2-6 weeks, team effort, significant complexity, major integration points
   case xl       // >6 weeks, major initiative, high complexity, architectural changes
}
```

## Constitutional Principle Pre-Assessment Framework

### Accessibility Pre-Assessment (mandatory for all UI-related ideas)
```markdown
## Accessibility Considerations
- **UI Impact Level**: [None/Minor/Major] - Does this affect user interface or interaction patterns?
- **Interaction Model**: [Standard/Enhanced/Complex] - New interaction patterns beyond standard controls?
- **Content Type**: [None/Text/Media/Interactive/Custom] - Type of content and complexity?
- **Assistive Technology Impact**: [Compatible/Needs Planning/Major Changes] - VoiceOver, Switch Control, Voice Control impact?
- **Specific Requirements**: [List concrete accessibility requirements to address during implementation]
- **Testing Strategy**: [How accessibility compliance will be validated]
```

### Privacy Pre-Assessment (mandatory for all data-related ideas)
```markdown
## Privacy Considerations
- **Data Collection**: [None/Minimal/Significant/Sensitive] - What user data would be collected or processed?
- **Data Storage**: [None/Local/iCloud/Third-party/Hybrid] - Where and how would data be stored?
- **User Consent**: [Not Required/Implicit/Explicit/Granular] - Consent mechanisms and user control needed?
- **Data Sharing**: [None/Internal/Apple Services/Third-party] - Any data sharing or analytics involved?
- **Privacy Manifest Impact**: [None/Updates Required/New Categories] - Effect on app privacy manifest
- **Specific Requirements**: [List concrete privacy requirements to address during implementation]
- **Compliance Strategy**: [How privacy compliance will be ensured and validated]
```

### Localization Pre-Assessment (mandatory for all user-facing ideas)
```markdown
## Localization Considerations
- **User-Facing Content**: [None/Minimal/Moderate/Extensive] - Amount and type of localizable content?
- **Cultural Sensitivity**: [Low/Medium/High/Critical] - Cultural considerations and regional differences?
- **Technical Complexity**: [Simple/Moderate/Complex/Advanced] - Layout, formatting, input method challenges?
- **Market Impact**: [Single Market/Regional/Global/Universal] - Target market reach and requirements?
- **Dynamic Content**: [Static/Template-based/AI-Generated/User-Generated] - Content generation and translation needs?
- **Specific Requirements**: [List concrete localization requirements to address during implementation]
- **Translation Strategy**: [How content will be translated and maintained across languages]
```

### Maintainability Pre-Assessment (mandatory for all ideas)
```markdown
## Maintainability Considerations
- **Architecture Impact**: [None/Minor/Moderate/Major/Foundational] - Effect on system architecture and design patterns?
- **Dependency Changes**: [None/Minor Updates/New Dependencies/Major Changes] - New libraries, services, or framework requirements?
- **Code Complexity**: [Low/Medium/High/Very High] - Implementation complexity and cognitive load?
- **Testing Requirements**: [Unit Only/Integration/UI/Performance/Security] - Testing scope, complexity, and automation needs?
- **Documentation Needs**: [Minimal/Standard/Extensive/Specialized] - Documentation requirements for team and users?
- **Long-term Support**: [Self-contained/Requires Monitoring/Ongoing Updates/Active Maintenance] - Maintenance burden and lifecycle?
- **Specific Requirements**: [List concrete maintainability requirements to address during implementation]
- **Quality Strategy**: [How code quality and maintainability will be ensured]
```

## Idea Documentation Template

### Context/Backlog/Ideas/${IDEA_ID}.md Structure
```markdown
# ${IDEA_TITLE}

**ID**: ${IDEA_ID}  
**Created**: ${CREATION_DATE}  
**Type**: [Feature/Enhancement/Performance/Refactor/Research/Infrastructure]  
**Effort**: [Small/Medium/Large/XL]  
**Status**: Idea  
**Project**: ${PROJECT_NAME}  
**Priority**: [Not Set - use /Backlog/prioritize-backlog]

## Description
${DESCRIPTION}

## User Value Proposition
- **Target User**: [Specific user type or persona this benefits]
- **Primary Benefit**: [Main capability or improvement delivered]
- **Problem Solved**: [Specific problem addressed or opportunity captured]
- **Success Criteria**: [Measurable outcomes that define success]
- **User Journey Impact**: [How this affects the overall user experience]

## Constitutional Assessment

### Accessibility Requirements
- **Impact Level**: [None/Minor/Major/Critical]
- **UI Components**: [List specific UI elements affected]
- **Interaction Patterns**: [New or modified interaction requirements]
- **Assistive Technology**: [VoiceOver, Switch Control, Voice Control considerations]
- **Testing Requirements**: [Accessibility testing and validation approach]
- **Implementation Notes**: [Specific accessibility implementation considerations]

### Privacy Requirements
- **Impact Level**: [None/Minor/Major/Critical]  
- **Data Handling**: [Types of data collected, processed, or stored]
- **User Consent**: [Consent mechanisms and user control requirements]
- **Privacy Manifest**: [Required updates to app privacy manifest]
- **Third-party Services**: [External services and their privacy implications]
- **Implementation Notes**: [Specific privacy implementation considerations]

### Localization Requirements
- **Impact Level**: [None/Minor/Major/Critical]
- **Content Scope**: [Amount and type of user-facing content]
- **Cultural Considerations**: [Region-specific requirements or sensitivities]
- **Technical Challenges**: [Layout, formatting, or input method considerations]
- **Market Requirements**: [Target markets and their specific needs]
- **Implementation Notes**: [Specific localization implementation considerations]

### Maintainability Requirements
- **Impact Level**: [None/Minor/Major/Critical]
- **Architecture Changes**: [System design and pattern modifications]
- **Dependencies**: [New libraries, frameworks, or services required]
- **Code Complexity**: [Complexity level and architectural considerations]
- **Testing Strategy**: [Testing approaches and automation requirements]
- **Documentation**: [Documentation and knowledge sharing needs]
- **Implementation Notes**: [Specific maintainability implementation considerations]

## Technical Considerations
- **Core Technologies**: [Primary technologies, frameworks, or APIs required]
- **Architecture Impact**: [How this affects current system design and patterns]
- **Integration Points**: [Existing systems, services, or components this interacts with]
- **Performance Implications**: [Expected impact on app performance, memory, or battery]
- **Platform Considerations**: [iOS, macOS, tvOS, watchOS specific requirements]
- **Risk Factors**: [Technical risks, unknowns, or potential blockers]

## Implementation Approach (Initial Draft)
- **Phase 1 - Foundation**: [Initial setup, core implementation, basic functionality]
- **Phase 2 - Integration**: [System integration, testing, polish]
- **Phase 3 - Optimization**: [Performance tuning, edge case handling, advanced features]
- **Validation Strategy**: [How to test and validate the implementation]
- **Rollout Plan**: [Deployment approach, feature flags, gradual rollout]

## Questions and Uncertainties
- **Technical Questions**: [Specific technical decisions or research needed]
- **User Experience Questions**: [UX/UI decisions requiring validation or research]
- **Business Questions**: [Product decisions, market validation, or stakeholder input needed]
- **Constitutional Questions**: [Areas requiring deeper constitutional principle analysis]
- **Research Tasks**: [Technical spikes, prototypes, or investigations needed]

## Related Items
- **Existing Features**: [Links to related current functionality]
- **Dependencies**: [Other backlog items this depends on or blocks]
- **Synergies**: [Items this works well with or enhances]
- **Conflicts**: [Items this might conflict with or duplicate]
- **Similar Ideas**: [Related ideas in backlog that might be combined or compared]

## Prioritization Context
- **User Impact**: [How many users affected and how significantly]
- **Business Value**: [Revenue, retention, acquisition, or strategic value]
- **Technical Debt**: [How this addresses or creates technical debt]
- **Competitive Advantage**: [Market differentiation or parity considerations]
- **Resource Requirements**: [Team members, time, external dependencies needed]
- **Risk vs Reward**: [Implementation risks compared to expected benefits]

## Next Steps
- [ ] **Clarification**: [Specific questions to resolve before proceeding]
- [ ] **Research**: [Technical research, competitive analysis, or user research needed]
- [ ] **Stakeholder Input**: [Product, design, or business stakeholder decisions required]
- [ ] **Technical Spike**: [Prototype or proof-of-concept work needed]
- [ ] **Priority Assessment**: [Add to prioritization backlog via /Backlog/prioritize-backlog]

---
*Captured with ContextKit /Backlog/add-idea on ${CREATION_DATE}*
```

## Backlog Management Integration

### Context/Backlog/Index.md Updates
Automatically adds entry to maintain centralized idea tracking:
```markdown
| ID | Title | Type | Effort | Status | Constitutional Impact | Created | Priority |
|----|-------|------|--------|--------|--------------------|---------|----------|
| ${IDEA_ID} | ${IDEA_TITLE} | ${IDEA_TYPE} | ${EFFORT_ESTIMATE} | Idea | ${CONSTITUTIONAL_IMPACT_SUMMARY} | ${CREATION_DATE} | Not Set |
```

### Context/Backlog/Prioritization.md Integration
Adds to unprioritized section for systematic ranking:
```markdown
## Unprioritized Ideas (use /Backlog/prioritize-backlog to rank)

### ${IDEA_ID}: ${IDEA_TITLE}
- **Type**: ${IDEA_TYPE} | **Effort**: ${EFFORT_ESTIMATE}
- **Value**: [Needs assessment - user impact, business value, strategic alignment]
- **Risk**: [Needs assessment - technical complexity, resource requirements, unknowns]
- **Constitutional**: ${CONSTITUTIONAL_IMPACT_SUMMARY}
- **Dependencies**: [List prerequisite items or blockers]
```

## Validation Gates
All gates must pass before command completion:
- [ ] **Input Validation**: Description clear, specific, and actionable?
- [ ] **Context Validation**: Valid ContextKit project with accessible Context.md?
- [ ] **Classification Complete**: Type and effort level appropriately assigned?
- [ ] **Constitutional Assessment**: All relevant constitutional principles assessed with specific requirements?
- [ ] **Value Proposition Clear**: User benefit and success criteria well-defined and measurable?
- [ ] **Technical Considerations**: Key technologies, integrations, and risks identified?
- [ ] **Documentation Complete**: All template sections filled with actionable content?
- [ ] **Backlog Integration**: Index and prioritization files properly updated?
- [ ] **Next Steps Defined**: Clear, specific actions for moving idea forward?

## Error Conditions
- **"Empty description"** → Must provide meaningful, specific idea description
- **"Description too vague"** → Description must include enough detail for evaluation and classification
- **"Context unavailable"** → Must be run in valid ContextKit project directory with Context.md
- **"Constitutional assessment incomplete"** → Must assess all relevant constitutional principles with specific requirements
- **"Duplicate idea detected"** → Similar idea already exists in backlog (suggest linking or merging)
- **"Invalid project state"** → Project context corrupted, missing, or incompatible with idea capture
- **"Directory creation failed"** → Unable to create required Context/Backlog/Ideas/ directory structure
- **"Template substitution failed"** → Unable to resolve required template variables or generate content
- **"Validation gate failure"** → One or more validation gates failed - specific guidance provided for resolution

## Integration with Development Workflow

### Idea-to-Implementation Pipeline
1. **Capture** → Use `/Backlog/add-idea` for initial capture with constitutional pre-assessment
2. **Research** → Conduct technical spikes, user research, or competitive analysis as identified in Next Steps
3. **Prioritization** → Use `/Backlog/prioritize-backlog` for systematic ranking against other items
4. **Specification** → Use `/Plan/create-spec` when ready for detailed implementation planning
5. **Implementation** → Follow standard ContextKit development workflow (/Plan → /Implement commands)

### Constitutional Principle Evolution Through Workflow
- **Ideas**: Pre-assessment identifies constitutional areas requiring attention
- **Specification**: Constitutional requirements become detailed implementation requirements
- **Technical Planning**: Constitutional compliance becomes explicit architectural decisions
- **Implementation**: Constitutional validation becomes quality gates and testing requirements
- **Release**: Constitutional compliance becomes verification criteria and documentation

### Quality Assurance Integration
- Ideas with "Major" or "Critical" constitutional impact automatically flagged for architectural review
- Constitutional assessment guides selection of appropriate subagents during implementation
- Quality gates ensure constitutional principles addressed before idea progression to specification phase