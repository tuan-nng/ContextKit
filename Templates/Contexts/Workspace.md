# Workspace Context Template

**Template Type**: Context Configuration  
**Hierarchy Level**: Workspace (middle precedence)  
**Usage**: Workspace-level Context.md generation via `/ContextKit/setup-workspace`  
**Inheritance**: Global → Workspace (this file) → Project

## Description
Workspace-level Context.md template providing workspace-specific configuration, client/company requirements, technology standards, and team workflow overrides for multi-project environments.

════════════════════════════════════════════════════════════════════════════════
║ 🤖 EXECUTION FLOW - WORKSPACE CONTEXT GENERATION
════════════════════════════════════════════════════════════════════════════════
║
║ ## Execution Flow (main)
║ ```
║ 1. Detect workspace context from current directory
║    → Scan subdirectories for project indicators and types
║    → Analyze technology stack patterns across projects
║    → If no projects found: ASK user about workspace purpose
║ 2. Identify workspace type and purpose
║    → Indie development workspace (personal projects)
║    → Client workspace (contractor/agency work)
║    → Enterprise workspace (company projects)
║    → If unclear: ASK user to specify workspace type
║ 3. Analyze existing workspace configuration
║    → Load current Context.md if present
║    → Preserve custom workspace configurations
║    → If conflicts detected: ASK user to resolve
║ 4. Extract technology stack preferences
║    → Identify common frameworks and tools across projects
║    → Detect consistent architectural patterns
║    → Document workspace-specific technology choices
║ 5. Apply client/company requirements (if applicable)
║    → Coding style requirements (indentation, naming)
║    → Communication guidelines (formal vs casual)
║    → Quality standards and specific requirements
║    → Security and compliance constraints
║ 6. Configure workspace overrides
║    → Override global constitutional principles if needed
║    → Set workspace-specific coding standards
║    → Define team collaboration patterns
║    → Document client-specific constraints
║ 7. Generate practical workspace Context.md
║    → Include technology stack preferences
║    → Document coding and communication standards
║    → List quality requirements and overrides
║    → Provide inheritance guidance for projects
║ 8. Validate workspace configuration completeness
║    → All workspace standards documented
║    → Client requirements properly integrated
║    → No conflicting settings with global principles
║ 9. **FINAL STEP: Remove these system instructions**
║    → Delete the entire boxed section from generated Context.md
║    → Leave only the clean workspace context for team use
║ 10. Return: SUCCESS (workspace Context.md ready for project inheritance)
║ ```
║
║ ## Dynamic Content Generation
║ The AI will detect and populate all workspace information dynamically:
║ - **Workspace Detection**: Type, purpose, contained projects
║ - **Technology Analysis**: Common frameworks, tools, architectural patterns
║ - **Requirements Extraction**: Client/company constraints and preferences
║ - **Standards Configuration**: Coding style, communication, quality overrides
║ - **Inheritance Setup**: How projects inherit workspace settings
║
════════════════════════════════════════════════════════════════════════════════

# Workspace Context: [Detected Workspace Name]

## ContextKit Configuration
- **Version**: [Current ContextKit Version]
- **Setup Date**: [Current Date]
- **Workspace Type**: [Detected: indie, client, enterprise]
- **Contained Projects**: [Detected project count and types]

## Workspace Identity

**Purpose**: [AI detects workspace purpose - indie development, client work, company projects]

**Client/Company**: [AI detects client name or marks as N/A for indie]

**Team Size**: [AI detects team configuration - solo, small team, large team]

## Technology Standards

**Preferred Stack**:
- **Languages**: [AI detects common languages across projects]
- **Frameworks**: [AI detects preferred frameworks]
- **Tools**: [AI detects development tools in use]
- **Platforms**: [AI detects target platforms]

**Architectural Guidelines**:
[AI documents consistent architectural patterns across projects]

**Technology Constraints**:
[AI detects any client/company technology restrictions]

## Coding Guidelines

**Style Overrides** (from global defaults):
- **Indentation**: [AI detects workspace preference or inherits global 3-space]
- **Naming**: [AI detects workspace naming conventions]
- **Formatting**: [AI detects workspace-specific formatter configs]

**Quality Standards**:
[AI documents workspace-specific quality requirements and any relaxed standards]

**Code Review Process**:
[AI detects team code review patterns or marks as TBD]

## Communication Standards

**Voice & Tone**: [AI detects required communication style - professional, casual, formal]

**Client Communication**: [AI detects client interaction requirements]

**Team Collaboration**: [AI detects internal team communication patterns]

**AI Attribution**: [AI documents workspace policy on AI-assisted development]

**Commit Messages**: [AI detects workspace commit format preferences]

## Constitutional Principles

**Global Inheritance**: [AI lists inherited constitutional principles]

**Workspace Overrides**: [AI documents any workspace-specific principle modifications]

**Client Requirements**: [AI documents client-specific requirement integrations]

## Project Inheritance

New projects in this workspace automatically inherit:
- Technology stack preferences and constraints
- Coding guidelines and style overrides  
- Communication standards and client requirements
- Quality gates and validation rules
- Workspace-specific constitutional principle overrides

## ContextKit Workflow

**Available Commands**: All `/ctxk:*` commands work within workspace projects

**Workspace Management**:
- `/ctxk:proj:init-workspce` - Configure this workspace
- `/ctxk:proj:verify` - Validate workspace configuration
- `/ctxk:proj:migrate` - Update workspace to newer ContextKit version

## Team Collaboration

**Shared Standards**:
- Consistent coding style across all workspace projects
- Unified communication guidelines for client/company interaction
- Shared quality gates and validation rules

**Workspace Automation**:
- Common formatting rules applied to all projects
- Shared hooks and subagents for quality assurance
- Consistent constitutional compliance across projects

## Hierarchical Inheritance

This workspace inherits from and overrides:
1. **Global Level** (`~/.ContextKit/`): Universal ContextKit defaults
2. **Workspace Level** (this file): Client/company-specific overrides
3. **Project Level**: Individual project customizations

**Override Precedence**: Project > Workspace > Global

**Conflict Resolution**: Projects can override workspace settings with documented justification

---
*This file is managed by ContextKit. Workspace customizations preserved during updates.*