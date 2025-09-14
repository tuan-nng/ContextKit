# Workspace Context Template

## Description
Workspace-level Context.md template providing workspace-specific configuration, client/company requirements, technology standards, and team workflow overrides for multi-project environments.

════════════════════════════════════════════════════════════════════════════════
║ 🤖 EXECUTION FLOW - WORKSPACE CONTEXT GENERATION
════════════════════════════════════════════════════════════════════════════════
║
║ ## Execution Flow (main)
║
║ ### Phase 1: Project Discovery & Analysis
║
║ 1. **Discover Contained Projects**
║    - Use `Glob` tool to list subdirectories: `Glob . */`
║    - For each subdirectory, check project characteristics:
║      - Use `Glob [dirname] Package.swift` (Swift package detection)
║      - Use `Glob [dirname] *.xcodeproj` (iOS app detection)
║      - Use `Glob [dirname] package.json` (JavaScript project detection)
║      - Use `Glob [dirname] requirements.txt pyproject.toml setup.py` (Python detection)
║    - Document found projects: name, type, language, framework
║
║ 2. **Analyze Project Setup Status**
║    - For each discovered project directory:
║      - Use `Glob [dirname] Context.md` to check for existing ContextKit setup
║      - Use `Glob [dirname] .claude/commands/ctxk` to check for ContextKit installation
║    - Categorize projects: ContextKit-enabled vs. not setup yet
║    - Count total projects and ContextKit setup status
║
║ 3. **Detect Technology Patterns**
║    - Identify primary language (most common across projects)
║    - For Swift projects: Use `Read` on Package.swift to detect dependencies
║    - Document common frameworks and architectural patterns
║    - Note consistent coding style preferences if detectable
║
║ ### Phase 2: Interactive Workspace Configuration
║
║ **User Question Format**: Use consistent format for all user questions:
║ ```
║ ═══════════════════════════════════════════════════
║ ║ ❓ USER INPUT REQUIRED
║ ═══════════════════════════════════════════════════
║ ║
║ ║ [Question text and options]
║ ║
║ ║ [Response instruction]
║ ```
║
║ 4. **Workspace Type Selection**
║    - Ask user: "What type of workspace is this?"
║      1. Personal/Indie Development
║      2. Client/Contract Work
║      3. Enterprise/Company
║      4. Open Source Project
║    - Based on selection, ask follow-up questions:
║      - Client/Enterprise: Ask for company name and contract identifier
║      - All types: Ask for brief workspace description
║
║ 5. **Coding Standards Configuration**
║    - Present detected patterns: "Current projects use: [detected indentation/architecture]"
║    - Ask user: "Override indentation preference? (default: 3 spaces)"
║      1. Keep current/default (3 spaces)
║      2. Use 2 spaces
║      3. Use 4 spaces
║      4. Use tabs
║    - For Swift projects: Ask about architecture preferences:
║      1. Package-first (constitutional default)
║      2. Monolithic app structure (constitutional override)
║      3. Hybrid approach
║
║ 6. **Development Principles Customization**
║    - Display development principles:
║      • Accessibility-first design
║      • Privacy by design
║      • Localizability from day one
║      • Code maintainability
║      • Platform-appropriate UX
║    - For Client/Enterprise workspaces: Ask "Any client requirements that override these principles?"
║    - If overrides requested: Ask for explicit justification for each principle override
║    - Document all overrides with detailed justifications
║
║ ### Phase 3: Context Generation & Completion
║
║ 7. **Generate Workspace Context Content**
║    - Use `Edit` tool to replace this entire template with workspace-specific content
║    - Include discovered projects list with setup status
║    - Document workspace type, client info, and configuration choices
║    - Record coding standards and architectural preferences
║    - List development principle overrides with justifications
║    - Establish clear inheritance rules for child projects
║
║ 8. **Final Validation**
║    - Verify all workspace sections are completed with specific information
║    - Ensure principle overrides have proper justification
║    - Confirm project inventory is accurate and complete
║    - Check that inheritance rules are clearly defined
║
║ 9. **COMPLETION**
║    - Use `Edit` tool to remove this entire boxed system instructions section
║    - Leave only the clean workspace context content for team use
║    - Display project-specific setup recommendations based on discovery results
║
║ ## Success Criteria
║ - All workspace information populated with specific, not placeholder, content
║ - Development principle overrides documented with explicit justification
║ - Project inventory complete with accurate setup status
║ - Inheritance rules clearly defined for child project setup
║ - System instructions completely removed from final Context.md
║ - Final document focused on workspace context, not tooling explanations
║
════════════════════════════════════════════════════════════════════════════════

# Workspace: [AI Detects Workspace Name]

## Workspace Identity

**Purpose**: [AI Generated Based on User Input and Project Analysis]

**Client/Company**: [User Input or N/A for indie work]

**Team Configuration**: [AI Detected: solo, small team, large team based on project patterns]

## Technology Standards

**Primary Technology Stack**:
- **Languages**: [AI Detected Common Languages]
- **Frameworks**: [AI Detected Preferred Frameworks]
- **Architecture**: [User Selected + AI Analysis]
- **Target Platforms**: [AI Detected Platforms]

**Development Tools**:
- **Package Managers**: [AI Detected Tools]
- **Build Systems**: [AI Detected Systems]
- **Version Control**: [AI Detected VCS patterns]

## Coding Standards

**Style Guidelines**:
- **Indentation**: [User Selected Override or Default 3 spaces]
- **Naming Conventions**: [AI Detected Patterns]
- **Code Formatting**: [Workspace-Specific Formatter Configs]

**Quality Requirements**:
- **Code Review**: [AI Detected Process or TBD]
- **Testing Standards**: [AI Detected Requirements]
- **Documentation**: [Workspace Documentation Requirements]

## Communication & Collaboration

**Voice & Tone**: [AI Detected Required Style: professional/casual/formal]

**Client Communication**: [Client Communication Requirements if applicable]

**Team Collaboration**: [Internal Communication Patterns]

**Development Attribution**: [Workspace Policy on AI-Assisted Development]

## Development Principles

**Core Principles**:
- ✅ Accessibility-first design (UI supports all assistive technologies)
- ✅ Privacy by design (minimal data collection, explicit consent)
- ✅ Localizability from day one (externalized strings, cultural adaptation)
- ✅ Code maintainability (readable, testable, documented code)
- ✅ Platform-appropriate UX (native conventions, platform guidelines)

**Workspace-Specific Adjustments**:
[AI Lists Any Development Principle Overrides with Detailed Justifications]

## Project Inventory

**Contained Projects**:
[AI Generated List with Format:]
- **[ProjectName]**: [project-type] ([language], [framework]) - [ContextKit-enabled/not setup yet]

**Development Setup Status**: [X] of [Total] projects have ContextKit enabled

**Project Standards**:
- All projects inherit workspace technology standards
- Projects inherit coding guidelines and style preferences
- Development principle adjustments apply across all projects
- Individual projects may override workspace settings with justification

## Inheritance & Configuration

**Configuration Hierarchy**: Global Defaults → **This Workspace** → Individual Projects

**Override Rules**: Project-specific settings take precedence over workspace settings

**Standards Enforcement**: Consistent coding style and quality standards across all workspace projects

---
*Generated by ContextKit. Workspace-specific manual edits are preserved during ContextKit updates.*