# Project Context Template

**Template Type**: Context Configuration  
**Hierarchy Level**: Project (lowest precedence)  
**Usage**: Project-specific Context.md generation via `/ContextKit/setup`  
**Inheritance**: Global → Workspace → Project (this file)

## Description
Project-level Context.md template providing project context, detected architecture patterns, constitutional principles, development workflow configuration, and team collaboration setup.

## Execution Flow (main)
```
1. Detect project context from current directory
   → Scan for Package.swift, *.xcodeproj, *.xcworkspace, etc.
   → If project type unclear: ERROR "Cannot determine project type"
2. Scan for workspace context in parent directories
   → Look for workspace Context.md files up to root
   → If workspace found: inherit workspace-specific overrides
3. Analyze project architecture patterns
   → Primary language, frameworks, target platforms
   → Development dependencies and package managers
   → Project structure and organization patterns
4. Apply constitutional principles from hierarchy
   → Global constitutional principles (always applied)
   → Workspace constitutional overrides (if workspace detected)
   → Mark any project-specific principle conflicts
5. Configure team collaboration setup
   → Copy commands, hooks, subagents to .claude/ directory
   → Generate project-specific customization placeholders
   → Create Context/ directory structure for features and backlog
6. Generate project Context.md with complete configuration
   → Include all detected patterns and inherited settings
   → Document hierarchical inheritance chain
   → Provide team customization guidance
7. Validate generated Context.md completeness
   → All mandatory sections filled with detected values
   → No template variables remain unresolved
   → Constitutional principles properly inherited and applied
8. Return: SUCCESS (project Context.md ready for use)
```

## Template Variables
- `${CONTEXTKIT_VERSION}` - Current ContextKit version from global installation
- `${SETUP_DATE}` - Date when project Context.md was generated
- `${PROJECT_NAME}` - Project directory name (auto-detected)
- `${PROJECT_TYPE}` - Detected project type (ios-app, swift-package, vapor-server, etc.)
- `${WORKSPACE_NAME}` - Inherited workspace name (if workspace detected)
- `${PRIMARY_LANGUAGE}` - Detected primary language (Swift, JavaScript, Python, etc.)
- `${DETECTED_FRAMEWORKS}` - Frameworks found (SwiftUI, UIKit, Vapor, React, etc.)
- `${PACKAGE_MANAGER}` - Package manager (SPM, npm, pip, Cargo, etc.)
- `${TARGET_PLATFORMS}` - Target platforms (iOS, macOS, Linux, web, etc.)
- `${INHERITED_PRINCIPLES}` - Constitutional principles from Global + Workspace
- `${ENABLED_SUBAGENTS}` - Quality assurance subagents enabled for this project type
- `${CODE_STYLE_OVERRIDES}` - Code style customizations (indentation, naming, etc.)
- `${NAMING_OVERRIDES}` - Naming convention customizations
- `${SPECIAL_REQUIREMENTS}` - Project-specific requirements and constraints

## Generated Template Content

```markdown
# Project Context: ${PROJECT_NAME}

## ContextKit Configuration
- **Version**: ${CONTEXTKIT_VERSION}
- **Setup Date**: ${SETUP_DATE}
- **Project Type**: ${PROJECT_TYPE}
- **Workspace**: ${WORKSPACE_NAME} (inherited from parent directory)

## Project Architecture

**Detected Patterns**:
- **Language**: ${PRIMARY_LANGUAGE}
- **Frameworks**: ${DETECTED_FRAMEWORKS}
- **Package Manager**: ${PACKAGE_MANAGER}
- **Target Platforms**: ${TARGET_PLATFORMS}

**Constitutional Principles**:
${INHERITED_PRINCIPLES}

## Development Workflow

**Active Features**: See Context/Features/ directory for feature development  
**Backlog Management**: See Context/Backlog/ directory for ideas and bugs  
**Quality Assurance**: Enabled subagents - ${ENABLED_SUBAGENTS}

### Planning Commands
- `/Plan/create-spec [description]` - Create feature specification with constitutional compliance
- `/Plan/define-tech [feature-name]` - Generate technical implementation plan
- `/Plan/plan-steps [feature-name]` - Break down feature into executable tasks

### Implementation Commands  
- `/Implement/start-working` - Context analysis and next action suggestions
- `/Implement/commit-changes` - Format code and commit with intelligent message
- `/Implement/release-app [version]` - iOS/macOS app release workflow with App Store Connect
- `/Implement/release-package [version]` - Swift Package release with GitHub integration

### Backlog Commands
- `/Backlog/add-idea [description]` - Capture and evaluate new feature ideas  
- `/Backlog/add-bug [description]` - Report bugs with impact assessment
- `/Backlog/prioritize-backlog` - Review and reprioritize development queue

## Team Configuration

**Commands**: Project-specific commands in `.claude/commands/`
- Customizable by team for project-specific workflows
- Version controlled and shared automatically
- Updated via `/ContextKit/migrate` with merge protection

**Hooks**: Project-specific automation in `.claude/hooks/`
- `PostToolUse.sh` - Auto-format edited files (Swift, etc.)
- `SessionStart.sh` - Version status and context health checks
- Custom hooks can be added by team

**Subagents**: Project-specific quality checks in `.claude/subagents/`
- `build-project` - Compile and report build issues
- `check-accessibility` - UI accessibility compliance (iOS/macOS)
- `check-localization` - Localization audit and string catalog updates
- `check-error-handling` - ErrorKit pattern validation
- `check-modern-code` - API modernization and pattern updates
- `check-code-debt` - Technical debt cleanup and AI-generated code refinement

## Customizations

**Code Style**: ${CODE_STYLE_OVERRIDES}
**Naming Conventions**: ${NAMING_OVERRIDES}
**Special Requirements**: ${SPECIAL_REQUIREMENTS}

## Hierarchical Inheritance

This project inherits settings from:
1. **Global Level** (`~/.ContextKit/`): Universal ContextKit defaults
2. **Workspace Level** (`${WORKSPACE_NAME}/Context.md`): Workspace-specific overrides
3. **Project Level** (this file): Project-specific customizations

**Override Precedence**: Project > Workspace > Global

## Directory Structure

```
${PROJECT_NAME}/
├── Context.md                     # This file - project configuration
├── Context/                       # Project-specific context files
│   ├── Features/                  # Active feature development
│   │   └── [FeatureName]/        # Individual feature directories
│   │       ├── Spec.md           # Business requirements specification
│   │       ├── Tech.md           # Technical implementation plan  
│   │       └── Steps.md          # Detailed task breakdown
│   └── Backlog/                   # Project backlog management
│       ├── Ideas-Inbox.md        # New ideas awaiting evaluation
│       ├── Ideas-Backlog.md      # Prioritized feature ideas
│       ├── Bugs-Inbox.md         # New bugs awaiting triage
│       └── Bugs-Backlog.md       # Prioritized bug fixes
└── .claude/                       # Claude Code integration
    ├── commands/                  # Project-specific commands (customizable)
    │   ├── Plan/                 # Planning workflow commands
    │   ├── Implement/            # Implementation workflow commands  
    │   └── Backlog/              # Backlog management commands
    ├── hooks/                     # Project automation hooks
    │   ├── PostToolUse.sh        # Auto-formatting on file edits
    │   └── SessionStart.sh       # Status and version checks
    └── subagents/                # Quality assurance subagents
        ├── build-project.md      # Build execution and error reporting
        ├── check-accessibility.md # Accessibility compliance validation
        ├── check-localization.md # Localization audit and improvements
        ├── check-error-handling.md # Error handling pattern validation
        ├── check-modern-code.md  # Code modernization suggestions
        └── check-code-debt.md    # Technical debt cleanup recommendations
```

---
*This file is managed by ContextKit. Manual edits preserved during updates.*
*Generated from Templates/Contexts/Project.md template.*
```

## Project Type Detection Logic

### iOS/macOS App Projects
**Detection**: `*.xcodeproj` or `*.xcworkspace` present
**Frameworks**: SwiftUI, UIKit, AppKit detection from source files
**Constitutional Principles**: 
- Accessibility-first design (VoiceOver, Dynamic Type)
- Privacy by design (Privacy manifest compliance)  
- Localizability (String catalogs, region formatters)
- App Store guidelines compliance

### Swift Package Projects
**Detection**: `Package.swift` present
**Package Type**: Library vs executable detection from Package.swift
**Constitutional Principles**:
- API documentation with DocC
- Linux compatibility verification
- Semantic versioning adherence
- Clean public API boundaries

### Vapor Server Projects  
**Detection**: `Package.swift` with Vapor dependency
**Server Type**: API, web app, or microservice detection
**Constitutional Principles**:
- Security by design (authentication, HTTPS)
- Performance benchmarks and monitoring
- Database migration strategies  
- Docker deployment readiness

### Cross-Platform Projects
**Detection**: Multiple platform indicators present
**Platform Matrix**: iOS, macOS, Linux, web support analysis
**Constitutional Principles**: 
- Platform-appropriate UX patterns
- Consistent behavior across platforms
- Platform-specific optimization opportunities

## Constitutional Principles Integration

### Universal Principles (Applied to All Projects)
- **Simplicity First**: Prefer simple solutions over complex architectures
- **Code Maintainability**: Clean code practices and comprehensive documentation
- **Quality Assurance**: Systematic testing and validation at every phase
- **Privacy by Design**: Data minimization and user consent patterns
- **Performance Consciousness**: Optimization opportunities and resource usage monitoring

### iOS/macOS Specific Principles  
- **Accessibility First**: VoiceOver, Dynamic Type, Switch Control support
- **Localizability from Day One**: String catalogs, region-appropriate formatting
- **Platform UX Compliance**: Human Interface Guidelines adherence
- **App Store Readiness**: Privacy manifests, content rating, review guidelines

### Development Methodology Principles
- **Constitutional Compliance Gates**: Every feature validated against principles
- **Forced Uncertainty Marking**: Ambiguities explicitly documented vs guessed
- **Progressive Complexity**: Phase-based disclosure (Spec → Tech → Steps → Implementation)
- **Anti-Speculation Enforcement**: No "future-proofing" or "might be useful" features

## Validation Gates

### Project Detection Gates
- [ ] Project type successfully detected from directory structure?
- [ ] Primary language and frameworks identified accurately?
- [ ] Package manager and dependency system recognized?
- [ ] Target platforms determined from project configuration?

### Inheritance Gates
- [ ] Global ContextKit configuration loaded successfully?
- [ ] Workspace context detected and inherited (if present)?
- [ ] Constitutional principles properly cascaded through hierarchy?
- [ ] No conflicting settings between hierarchy levels?

### Team Configuration Gates  
- [ ] All command templates copied to .claude/commands/ successfully?
- [ ] Hook automation installed in .claude/hooks/ correctly?
- [ ] Subagent quality checks configured in .claude/subagents/ properly?
- [ ] Context/ directory structure created with appropriate templates?

### Constitutional Compliance Gates
- [ ] All applicable constitutional principles embedded in templates?
- [ ] Project-specific principle conflicts identified and documented?
- [ ] Quality assurance subagents aligned with constitutional requirements?
- [ ] Team customization guidance includes constitutional compliance notes?

## Error Conditions & Guidance

### Project Detection Errors
- **"Cannot determine project type"** → Check for Package.swift, *.xcodeproj, or run in correct directory
- **"Multiple project types detected"** → Specify project type explicitly or run setup in specific subdirectory
- **"Workspace context conflicts"** → Resolve workspace-level constitutional principle conflicts before project setup

### Configuration Errors
- **"Constitutional principle conflict"** → Document rationale for overriding global/workspace principles
- **"Template variable unresolved"** → Verify all detection logic completed successfully
- **"Command installation failed"** → Check .claude/ directory permissions and git repository status

### Team Collaboration Errors
- **"Uncommitted changes detected"** → Commit or stash changes before running setup to avoid conflicts
- **"Not in git repository"** → Initialize git repository for team command sharing, or confirm non-git workflow

---

**Implementation Note**: This template demonstrates the executable workflow pattern from spec-kit methodology, adapted for ContextKit's hierarchical context system and constitutional principle enforcement.