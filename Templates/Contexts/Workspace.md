# Workspace Context: ${WORKSPACE_NAME}

## ContextKit Configuration
- **Version**: ${CONTEXTKIT_VERSION}
- **Setup Date**: ${SETUP_DATE}
- **Workspace Type**: ${WORKSPACE_TYPE} (indie, client, enterprise)
- **Created By**: ${USER_NAME}

## Execution Flow (workspace-setup)
```
1. Detect workspace type and projects
   → Scan contained directories for project indicators
   → Identify technology stacks across projects
   → If no projects found: ASK user to specify workspace purpose
2. Analyze existing workspace Context.md (if present)
   → Load current settings and overrides
   → Preserve custom configurations
   → If conflicts detected: ASK user to resolve
3. Apply hierarchical inheritance
   → Load global constitutional principles
   → Apply workspace-specific overrides
   → If principle conflicts: ERROR "Must resolve constitutional conflicts"
4. Configure technology stack specializations
   → Swift/iOS: Apply iOS development patterns
   → Other stacks: Adapt templates and guidelines
   → Mixed stacks: Configure multi-language support
5. Setup team configuration
   → Configure communication guidelines
   → Set commit message standards
   → Apply client-specific requirements
6. Generate workspace overrides
   → Create workspace-specific template customizations
   → Configure quality gates and validation rules
   → If critical overrides missing: WARN with suggestions
7. Install workspace commands and hooks
   → Copy customized templates to projects
   → Configure workspace-wide automation
   → If installation fails: ERROR with specific guidance
8. Return: SUCCESS (workspace configured with hierarchical inheritance)
```

## Workspace Architecture
**Technology Stack**:
- **Primary Languages**: ${PRIMARY_LANGUAGES} (Swift, TypeScript, Python, etc.)
- **Frameworks**: ${WORKSPACE_FRAMEWORKS} (SwiftUI, React, Django, etc.) 
- **Platforms**: ${TARGET_PLATFORMS} (iOS, macOS, web, Linux, etc.)
- **Development Tools**: ${DEVELOPMENT_TOOLS} (Xcode, VS Code, etc.)

**Project Distribution**:
${PROJECT_LIST} (auto-detected from subdirectories)

## Constitutional Principles (Workspace Overrides)
```markdown
### Global Inheritance
${GLOBAL_CONSTITUTIONAL_PRINCIPLES} (inherited from ~/.ContextKit/ContextKit/Constitution.md)

### Workspace Customizations
${WORKSPACE_PRINCIPLE_OVERRIDES}

### Client Requirements Integration
${CLIENT_REQUIREMENT_OVERRIDES}
```

## Coding Standards (Workspace Level)
**Indentation**: ${WORKSPACE_INDENTATION} (inherits from global: 3 spaces)
**Naming Conventions**: ${WORKSPACE_NAMING} (inherits from global Swift patterns)
**Code Formatting**: ${WORKSPACE_FORMATTING}
**Error Handling**: ${WORKSPACE_ERROR_PATTERNS} (inherits from global ErrorKit patterns)

## Communication Guidelines
**Voice & Tone**: ${WORKSPACE_COMMUNICATION_STYLE}
- **Client Communication**: ${CLIENT_COMMUNICATION_RULES}
- **Team Communication**: ${TEAM_COMMUNICATION_RULES}
- **AI Attribution**: ${AI_ATTRIBUTION_POLICY}

**Commit Messages**: ${WORKSPACE_COMMIT_FORMAT}
**Documentation Style**: ${WORKSPACE_DOCS_STYLE}

## Development Workflow
**Planning Methodology**: ${PLANNING_APPROACH} (spec-kit based)
**Quality Assurance**: ${QA_REQUIREMENTS}
**Release Processes**: ${RELEASE_WORKFLOW}
**Testing Standards**: ${TESTING_REQUIREMENTS}

## Team Configuration
**Workspace Commands**: Customized for workspace needs
**Shared Hooks**: Applied across all workspace projects
**Quality Gates**: Workspace-specific validation rules

## Template Customizations
### Command Templates
- **Planning Commands**: `/Plan/*` adapted for ${WORKSPACE_TYPE} workflows
- **Implementation Commands**: `/Implement/*` with workspace-specific processes
- **Backlog Commands**: `/Backlog/*` configured for team collaboration

### Subagent Specializations
- **Accessibility**: ${ACCESSIBILITY_REQUIREMENTS} compliance
- **Localization**: ${LOCALIZATION_REQUIREMENTS} standards
- **Code Quality**: ${CODE_QUALITY_STANDARDS} enforcement
- **Security**: ${SECURITY_REQUIREMENTS} validation

### Constitutional Gates (Workspace Level)
#### Technology Stack Gates
- [ ] Technology choices align with workspace standards?
- [ ] Cross-project consistency maintained?
- [ ] Development tool compatibility ensured?

#### Client Requirements Gates  
- [ ] Client coding standards applied?
- [ ] Communication protocols followed?
- [ ] Deliverable requirements met?
- [ ] Privacy and security requirements addressed?

#### Quality Assurance Gates
- [ ] Workspace testing standards applied?
- [ ] Documentation requirements satisfied?
- [ ] Review processes configured?
- [ ] Release procedures established?

## Variable Substitution
```bash
# Workspace-specific variables available to all projects
WORKSPACE_NAME="${WORKSPACE_NAME}"
WORKSPACE_TYPE="${WORKSPACE_TYPE}"
CLIENT_NAME="${CLIENT_NAME}"
COMMUNICATION_STYLE="${COMMUNICATION_STYLE}"
QUALITY_STANDARDS="${QUALITY_STANDARDS}"
DEVELOPMENT_STACK="${DEVELOPMENT_STACK}"
```

## Hierarchical Inheritance Pattern
```
Global Level (~/.ContextKit/)
    ↓ (inherits constitutional principles, guidelines, templates)
Workspace Level (${WORKSPACE_PATH}/Context.md)
    ↓ (applies workspace overrides and client requirements)
Project Level (${PROJECT_PATH}/Context.md)
    ↓ (applies project-specific customizations)
```

## Project Integration
**Auto-Setup**: New projects in this workspace automatically inherit:
- Workspace coding standards and constitutional overrides
- Communication guidelines and commit message formats  
- Quality gates and validation rules
- Team-specific commands, hooks, and subagents

**Inheritance Resolution**: Project > Workspace > Global precedence
**Conflict Handling**: Explicit resolution required for constitutional conflicts

## Workspace Validation Gates
*Checked before workspace setup completion*

### Completeness Gates
- [ ] All technology stacks identified and configured?
- [ ] Team communication guidelines established?
- [ ] Quality assurance requirements defined?
- [ ] Constitutional principle overrides documented?

### Consistency Gates
- [ ] Cross-project standards aligned?
- [ ] Tool configurations compatible?
- [ ] Development workflows consistent?
- [ ] Documentation approaches unified?

### Client Requirements Gates (if applicable)
- [ ] Client coding standards integrated?
- [ ] Communication protocols established?
- [ ] Security requirements addressed?
- [ ] Deliverable standards defined?

## Update and Migration
**Template Updates**: Workspace templates updated via `/ContextKit/migrate`
**Customization Preservation**: Local workspace modifications preserved
**Version Tracking**: Workspace tracks ContextKit version for migration
**Rollback Support**: Previous configurations backed up during updates

## For AI Generation
When creating workspace configuration:
1. **Detect workspace type**: Analyze project types and purposes
2. **Identify technology patterns**: Scan for consistent technology usage
3. **Mark ambiguities**: Use [NEEDS CLARIFICATION: specific workspace question]
4. **Apply inheritance**: Start with global principles, apply workspace overrides
5. **Validate consistency**: Ensure cross-project alignment
6. **Document conflicts**: Mark any constitutional principle conflicts for resolution

### Common Underspecified Areas
- Client communication requirements: [NEEDS CLARIFICATION: formal or casual tone?]
- Code review processes: [NEEDS CLARIFICATION: peer review required or AI-assisted only?]
- Release approval workflows: [NEEDS CLARIFICATION: who approves releases?]
- Quality thresholds: [NEEDS CLARIFICATION: test coverage requirements?]
- Documentation standards: [NEEDS CLARIFICATION: API docs, user docs, or both?]

## Template Variables Reference
```bash
# Available for substitution in workspace templates
${WORKSPACE_NAME}           # Directory name or specified workspace name
${WORKSPACE_TYPE}           # indie/client/enterprise
${WORKSPACE_PATH}           # Full path to workspace directory  
${CLIENT_NAME}              # Client name (if applicable)
${PRIMARY_LANGUAGES}        # Detected primary programming languages
${WORKSPACE_FRAMEWORKS}     # Detected frameworks across projects
${TARGET_PLATFORMS}         # Detected target platforms
${DEVELOPMENT_TOOLS}        # Detected development tools
${PROJECT_LIST}             # Auto-generated list of contained projects
${SETUP_DATE}               # Workspace setup timestamp
${USER_NAME}                # Developer name from git config
${CONTEXTKIT_VERSION}       # ContextKit version used for setup
```

---
*This workspace context provides hierarchical inheritance for all contained projects. Project-specific Context.md files will inherit and can override these workspace settings.*

*Managed by ContextKit. Workspace customizations preserved during updates.*