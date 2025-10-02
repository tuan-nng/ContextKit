# Project Context - ContextKit Configuration

## Project Overview

[AI will populate this section during initialization with auto-detected project information]

**Project Name**: [Detected from directory or package.json/Package.swift]
**Description**: [From README.md or auto-generated]
**Type**: [Detected: Web App / Mobile App / Library / CLI Tool / etc.]

## Tech Stack

### Primary Technologies
- **Language**: [Detected: TypeScript, Swift, Python, etc.]
- **Framework**: [Detected: React, Vue, SwiftUI, etc.]
- **Build System**: [Detected: npm/pnpm/yarn, Xcode, Swift Package Manager, etc.]
- **Package Manager**: [Detected from lock files]

### Key Dependencies
[Auto-populated during initialization from package.json, Package.swift, requirements.txt, etc.]

## Project Structure

[Auto-populated with directory structure, components, and architecture from Phase 4 investigation]

## Build & Development Commands

### Build
```bash
[Auto-populated with validated build command from Phase 4]
```

### Test
```bash
[Auto-populated with validated test command from Phase 4]
```

### Formatting
[Auto-populated with detected formatter configuration]

## Context References

**Important**: Always read these context files to understand the full project setup:

- `@Context.md` - Detailed project configuration and development instructions
[If workspace discovered: - `@[relative-path]/Context.md` - Workspace standards and team conventions]

## ContextKit Configuration

### Version
- **ContextKit Version**: 0.1.0
- **Template Version**: 12
- **Initialized**: [Date]

### Available Commands

ContextKit commands are now available via `@` mentions in Cursor. The following commands are automatically loaded from `.cursor/rules/ctxk/`:

#### Project Management
- `@ctxk:proj:init` - Initialize ContextKit in new projects
- `@ctxk:proj:migrate` - Update to latest ContextKit version
- `@ctxk:proj:init-workspace` - Configure workspace standards

#### Feature Planning (3-Phase Workflow)
- `@ctxk:plan:1-spec` - Define business requirements and user stories
- `@ctxk:plan:2-research-tech` - Design technical architecture
- `@ctxk:plan:3-steps` - Create numbered implementation tasks

#### Implementation
- `@ctxk:impl:start-working` - Begin feature development with quality checks
- `@ctxk:impl:commit-changes` - Smart commit workflow with formatting
- `@ctxk:impl:release-package` - Publish npm packages (if applicable)

#### Backlog Management
- `@ctxk:bckl:add-idea` - Capture feature ideas with evaluation framework
- `@ctxk:bckl:add-bug` - Report bugs with impact assessment
- `@ctxk:bckl:prioritize-ideas` - Organize ideas strategically
- `@ctxk:bckl:prioritize-bugs` - Triage bugs by severity
- `@ctxk:bckl:remove-idea` - Remove completed/cancelled ideas
- `@ctxk:bckl:remove-bug` - Remove fixed bugs

### Quality Guidelines

Reference quality guidelines using `@` mentions:
[Auto-populated list based on detected tech stack, e.g.:]
- `@Context/Guidelines/TypeScript.md` - TypeScript coding standards
- `@Context/Guidelines/React.md` - React component patterns

## Constitutional Principles

### Code Quality Standards
1. **Accessibility-first design**: Keyboard navigation, screen readers, ARIA labels, color contrast
2. **Privacy by design**: Minimize data collection, clear user consent, secure data handling
3. **Localization from day one**: i18n support, cultural adaptation, proper formatting
4. **Simple over complex**: Choose straightforward solutions, avoid over-engineering
5. **Maintainability**: Clear naming, consistent patterns, comprehensive documentation

### Development Workflow
1. **Plan before implementing**: Complete 3-phase planning (spec → research-tech → steps)
2. **Test-driven development**: Write tests alongside implementation, not after
3. **Incremental progress**: Small, focused commits with clear messages
4. **Quality checkpoints**: Run quality guidelines before finalizing features
5. **Documentation**: Keep Context.md and feature docs updated continuously

### Security & Performance
1. **Input validation**: Validate and sanitize all user input
2. **Error handling**: Graceful degradation, user-friendly error messages
3. **Performance**: Optimize for speed, monitor bundle sizes, lazy loading
4. **Dependencies**: Regular updates, security audits, minimal footprint

## Feature Development

### Active Features
[List of features currently in development - from Context/Features/ directory]

### Feature Branch
[Current feature branch if in active development]

### Completed Features
[List of completed features for reference]

## Components & Architecture

[Auto-populated from Phase 4 investigation]

### Component Hierarchy
[Discovered repositories and their relationships]

### File Structure
[Key directories: source, tests, docs, config]

### Code Style
[Detected formatting patterns from actual source files]

## Team Conventions

[If workspace Context.md found: Inherited from workspace]
[Otherwise: Project-specific conventions]

## Notes for AI Assistant

### Context Loading Priority
1. **Always read `@Context.md` first** - Contains comprehensive project analysis
2. **Check workspace Context.md** - Team standards and constitutional principles [if applicable]
3. **Reference feature docs** - `@Context/Features/[FeatureName]/Spec.md`, `Tech.md`, `Steps.md`
4. **Use tech-specific guidelines** - `@Context/Guidelines/[Technology].md`

### Development Workflow
- **Systematic feature development**: Use 3-phase planning workflow (spec → research-tech → steps)
- **Quality-first**: Follow constitutional principles for all implementations
- **Incremental progress**: Break large tasks into small, testable chunks
- **Documentation**: Update Context.md when project structure or commands change

### Command Usage
- All ContextKit commands are loaded automatically from `.cursor/rules/ctxk/`
- Use `@ctxk:[category]:[command]` to reference any workflow command
- Commands contain detailed execution instructions - follow them step by step
- Validate completion criteria before marking phases complete

### Context Management
- Use `@` mentions to reference specific files and commands
- When context gets full, create new composer and use `@Context.md` to reload project understanding
- Feature docs in `Context/Features/` preserve state across sessions
- Progress tracking via S001-S999 task numbering enables precise resumption

---

**Auto-generated by ContextKit** - This file is automatically loaded by Cursor from `.cursor/rules/`

