# Project Context Template

**Template Type**: Context Configuration  
**Hierarchy Level**: Project (lowest precedence)  
**Usage**: Project-specific Context.md generation via `/ContextKit/setup`  
**Inheritance**: Global → Workspace → Project (this file)

## Description
Project-level Context.md template providing project-specific execution information, development commands, project structure, and team workflow configuration for AI assistants and developers.

════════════════════════════════════════════════════════════════════════════════
║ 🤖 EXECUTION FLOW - PROJECT CONTEXT GENERATION
════════════════════════════════════════════════════════════════════════════════
║
║ ## Execution Flow (main)
║ ```
║ 1. Detect project context from current directory
║    → Scan for Package.swift, *.xcodeproj, *.xcworkspace, etc.
║    → If project type unclear: ERROR "Cannot determine project type - run in project root"
║ 2. Scan for workspace context in parent directories  
║    → Look for workspace Context.md files up to root
║    → If workspace found: inherit workspace-specific overrides
║ 3. Analyze project execution environment
║    → Identify build system (Xcode, SPM, Make, etc.)
║    → Detect schemes/targets and determine main executable
║    → Find test targets and execution methods
║    → Locate formatter configurations and tools
║ 4. Extract project structure information
║    → Map source directories and key files
║    → Identify dependencies and tech stack
║    → Document development environment requirements
║ 5. Apply constitutional principles from hierarchy
║    → Global constitutional principles (always applied)
║    → Workspace constitutional overrides (if workspace detected)
║    → Mark any project-specific principle conflicts
║ 6. Generate practical Context.md focused on project execution
║    → Include all build/test/format commands
║    → Document project structure and key files
║    → Provide development environment setup
║    → List available ContextKit workflow commands
║ 7. Create supporting ContextKit directory structure
║    → mkdir -p Context/Features Context/Backlog
║    → Copy relevant hooks and subagents to .claude/
║ 8. Validate generated Context.md completeness
║    → All execution commands filled with detected values
║    → Project structure documented with actual paths
║    → No template variables remain unresolved
║ 9. **FINAL STEP: Remove these system instructions**
║    → Delete the entire boxed section from generated Context.md
║    → Leave only the clean project context for team use
║ 10. Return: SUCCESS (project Context.md ready for development)
║ ```
║
║ ## Dynamic Content Generation
║ The AI will detect and populate all project information dynamically:
║ - **Project Detection**: Name, type, language, frameworks, package manager
║ - **Build Commands**: Detect build system and generate appropriate commands
║ - **Project Structure**: Map source directories and key files
║ - **Dependencies**: Analyze and list important dependencies
║ - **Constitutional Inheritance**: Apply principles from Global + Workspace levels
║
════════════════════════════════════════════════════════════════════════════════

# Project Context: [Detected Project Name]

## ContextKit Configuration
- **Version**: [Current ContextKit Version]
- **Setup Date**: [Current Date]
- **Project Type**: [Detected: ios-app, swift-package, vapor-server, etc.]
- **Workspace**: [Detected Workspace] (inherited from parent directory)

## Project Architecture

**Tech Stack**:
- **Language**: [Detected Language]
- **Frameworks**: [Detected Frameworks]
- **Package Manager**: [Detected Package Manager]
- **Target Platforms**: [Detected Platforms]

**Key Files**:
[AI detects important project files - Package.swift, *.xcodeproj, etc.]

**Source Structure**:
[AI maps source directories and organization]

**Dependencies**:
[AI analyzes project dependencies]

## Development Commands

### Build & Run
```bash
# Build project
[AI detects appropriate build command]

# Run project (if applicable)
[AI detects run command or marks as N/A]

# Main scheme/target
[AI detects main scheme/target for Xcode projects]
```

### Testing
```bash
# Run all tests
[AI detects test command]

# Run specific test (example)
# [Detected test command] --filter TestName
```

### Code Formatting
```bash
[AI detects formatting tools and generates commands]
```

## Development Environment

**Requirements**:
[AI detects development environment requirements]

**Code Style**: [AI inherits from workspace/global settings]

**Special Requirements**: [AI detects project-specific constraints]

## Constitutional Principles
[AI inherits and documents constitutional principles from hierarchy]

## ContextKit Workflow

**Feature Development**: Use `Context/Features/` directory
- `/ctxk:plan:1-spec [description]` - Create feature specification
- `/ctxk:plan:2-tech` - Technical architecture plan
- `/ctxk:plan:3-steps` - Implementation task breakdown

**Development Execution**:
- `/ctxk:impl:start-working` - Context-aware development start
- `/ctxk:impl:commit-changes` - Format code and commit with intelligent message

**Backlog Management**: Use `Context/Backlog/` directory  
- `/ctxk:bckl:add-idea [description]` - Capture and evaluate new ideas
- `/ctxk:bckl:add-bug [description]` - Report bugs with impact assessment

**Project Management**:
- `/ctxk:proj:verify` - Validate project ContextKit configuration
- `/ctxk:proj:migrate` - Update to newer ContextKit version

## Team Collaboration

**Automation**:
- Auto-formatting enabled on file edits (PostToolUse hook)
- Version status checks on session start (SessionStart hook)

**Quality Assurance**:
- Build validation, accessibility checks, localization audit
- Error handling validation, code modernization, technical debt cleanup
- All quality checks available as `/Task` subagents

**Customization**:
- Project-specific commands in `.claude/commands/`
- Team hooks in `.claude/hooks/`
- Quality subagents in `.claude/subagents/`

## ContextKit AI Integration

**FOR AI ASSISTANTS**: Project-specific ContextKit behavior and customization guidance:

### **ContextKit Command Execution**
When executing ContextKit commands (`/ctxk:*`), always:
1. **Read core command logic** from the template files in `.claude/commands/ctxk/`
2. **Check developer customization sections** at the bottom of each command file
3. **Combine both** core logic and project-specific customizations for execution

### **Developer Customization Sections**
Each ContextKit command and subagent file contains a **👩‍💻 DEVELOPER CUSTOMIZATIONS** section with:
- **Project-Specific Instructions**: Additional guidance specific to this project
- **Additional Examples**: Project-relevant examples and patterns
- **Override Behaviors**: Modifications to default ContextKit behavior

### **When Users Request Persistent Changes**
If users ask to "remember" preferences or modify ContextKit behavior:
1. **Add their instructions** to the appropriate file's developer customization section
2. **Explain** that you've added it to ensure persistence across sessions
3. **Do not** modify the core ContextKit template logic above the customization sections

### **Example User Requests**:
- "Always include performance considerations in technical specs" → Add to `/plan/2-tech.md` customization section
- "Skip localization checks for internal tools" → Add to relevant subagent customization section
- "Use our specific error handling patterns" → Add to `/impl/start-working.md` customization section

## Hierarchical Inheritance

This project inherits settings from:
1. **Global Level** (`~/.ContextKit/`): Universal ContextKit defaults
2. **Workspace Level** (`[Detected Workspace]/Context.md`): Workspace-specific overrides  
3. **Project Level** (this file): Project-specific customizations

**Override Precedence**: Project > Workspace > Global

---
*This file is managed by ContextKit. Manual edits preserved during updates.*