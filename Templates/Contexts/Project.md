# Project Context Template
<!-- Template Version: 1 | ContextKit: 0.0.0 | Updated: 2025-09-14 -->

## Description
Project-level Context.md template providing project-specific investigation, development commands, project structure analysis, and ContextKit workflow configuration.

════════════════════════════════════════════════════════════════════════════════
║ 🤖 EXECUTION FLOW - PROJECT CONTEXT GENERATION
════════════════════════════════════════════════════════════════════════════════
║
║ ## Execution Flow (main)
║
║ ### Phase 1: Project Discovery & Analysis
║
║ 1. **Detect Project Type & Identity**
║    - Use `Glob` tool to scan for project indicators:
║      - `Glob . Package.swift` (Swift package detection)
║      - `Glob . *.xcodeproj` (iOS/macOS app detection)
║      - `Glob . package.json` (JavaScript project detection)
║      - `Glob . requirements.txt pyproject.toml setup.py` (Python detection)
║      - `Glob . Cargo.toml` (Rust project detection)
║    - Determine primary project type and generate project name from directory
║    - For iOS/macOS apps: Ask user for App Store URL if app is published
║
║ 2. **Analyze Project Architecture**
║    - For Swift projects: Use `Read` on Package.swift or .xcodeproj to detect:
║      - Target platforms, dependencies, frameworks
║      - Build schemes and executable products
║    - For other project types: Analyze configuration files appropriately
║    - Map source directory structure using `Glob` tool
║
║ 3. **Detect Development Commands**
║    - Identify build system and generate build commands:
║      - Swift: `swift build`, `xcodebuild`, or detected scheme
║      - JavaScript: `npm run build`, `yarn build`
║      - Python: `python setup.py build`, `poetry build`
║    - Detect test commands and test target locations
║    - Find formatter tools: `.swift-format`, `.swiftformat`, `.prettierrc`, etc.
║
║ ### Phase 2: Workspace Integration & Standards
║
║ 4. **Apply Workspace Context** (if discovered by init.md)
║    - Inherit workspace coding standards and architectural preferences
║    - Apply workspace-specific constitutional principle overrides
║    - Document workspace inheritance relationship
║
║ 5. **Constitutional Principles Integration**
║    - Apply core constitutional principles:
║      • Accessibility-first design • Privacy by design
║      • Localizability from day one • Code maintainability
║      • Platform-appropriate UX
║    - Note any workspace-level principle adjustments
║
║ ### Phase 3: Content Generation & Completion
║
║ 6. **Generate Final Context.md Content**
║    - Use `Edit` tool to replace this template with project-specific content
║    - Populate all sections with detected information (no placeholder brackets)
║    - Include detected build/test/format commands
║    - Document project structure and key files
║    - Establish ContextKit workflow integration
║
║ 7. **Final Validation**
║    - Verify all project information is specific, not generic
║    - Confirm development commands are accurate and tested
║    - Ensure constitutional principles are properly applied
║    - Check that workspace inheritance is documented
║
║ 8. **COMPLETION**
║    - Use `Edit` tool to remove this entire boxed system instructions section
║    - Leave only the clean project context content for team use
║    - Final document focused on project development, not tooling explanations
║
║ ## Success Criteria
║ - Project type, architecture, and commands detected accurately
║ - All development commands populated with specific, tested commands
║ - Constitutional principles applied with workspace inheritance documented
║ - Project structure mapped with actual directories and key files
║ - System instructions completely removed from final Context.md
║ - Final document enables immediate project development workflow
║
════════════════════════════════════════════════════════════════════════════════

# Project Context: [AI Detects Project Name from Directory]

## ContextKit Configuration
- **Version**: [AI Reads Current ContextKit Version from Templates]
- **Setup Date**: [AI Generates Current Date]
- **Project Type**: [AI Detected Project Type: ios-app, swift-package, vapor-server, javascript-project, python-project, etc.]
- **Workspace**: [AI Discovered Workspace Name or "None (standalone project)"]
- **App Store URL**: [AI Asks User for App Store URL if iOS/macOS app and published, otherwise "Not published yet"]

## Project Architecture

**Tech Stack**:
- **Language**: [AI Detected Primary Language]
- **Frameworks**: [AI Detected Frameworks from Package.swift, package.json, etc.]
- **Package Manager**: [AI Detected: Swift PM, npm, yarn, pip, poetry, cargo, etc.]
- **Target Platforms**: [AI Detected Platform Support]

**Project Structure**:
[AI Maps Key Directories and Files using Glob tool]

**Dependencies**:
[AI Analyzes and Lists Important Dependencies from Configuration Files]

## Development Commands

### Build & Run
```bash
# Build project
[AI Generated Build Command Based on Detected Project Type]

# Run project (if executable)
[AI Generated Run Command or "N/A - Library/Package Project"]

# Main scheme/target (Xcode projects)
[AI Detected Main Scheme from .xcodeproj or "N/A - Non-Xcode Project"]
```

### Testing
```bash
# Run all tests
[AI Generated Test Command Based on Project Type]

# Run specific test (example format)
[AI Generated Specific Test Command Format]
```

### Code Formatting
```bash
[AI Generated Formatting Commands Based on Detected Formatter Tools]
```

## Development Environment

**Requirements**:
[AI Detected Development Environment Requirements]

**Code Style**: [AI Inherited Coding Standards from Workspace or Global Defaults]

**Build Tools**: [AI Detected Required Build Tools and Versions]

## Constitutional Principles

[AI Applied Constitutional Principles with Workspace Inheritance]

**Core Principles Active**:
- ✅ Accessibility-first design (UI supports all assistive technologies)
- ✅ Privacy by design (minimal data collection, explicit consent)
- ✅ Localizability from day one (externalized strings, cultural adaptation)
- ✅ Code maintainability (readable, testable, documented code)
- ✅ Platform-appropriate UX (native conventions, platform guidelines)

**Workspace Adjustments**:
[AI Documents Any Workspace-Level Constitutional Principle Overrides]

## ContextKit Workflow

**Systematic Feature Development**:
- `/ctxk:plan:1-spec` - Create business requirements specification (prompts interactively)
- `/ctxk:plan:2-tech` - Define technical architecture and implementation approach
- `/ctxk:plan:3-steps` - Break down into executable implementation tasks

**Development Execution**:
- `/ctxk:impl:start-working` - Begin development with full project context
- `/ctxk:impl:commit-changes` - Auto-format code and commit with intelligent messages

**Backlog Management**:
- `/ctxk:bckl:add-idea [description]` - Capture ideas with evaluation framework
- `/ctxk:bckl:add-bug [description]` - Report bugs with impact assessment

**Project Management**:
- `/ctxk:proj:migrate` - Update to newer ContextKit version when available

## Team Configuration

**Development Automation**:
- **PostToolUse Hook**: Auto-formatting on file edits via Context/Scripts/AutoFormat.sh
- **SessionStart Hook**: Version status checks via Context/Scripts/VersionStatus.sh
- **Custom Status Line**: 5h-usage tracking with Context/Scripts/CustomStatusline.sh

**Quality Assurance Agents**:
- **build-project**: Execute builds with error reporting and constitutional compliance
- **check-accessibility**: Validate accessibility compliance (VoiceOver, contrast, navigation)
- **check-localization**: Audit localization readiness (String Catalog, formatters)
- **check-error-handling**: Validate ErrorKit patterns and typed throws
- **check-modern-code**: Modernize APIs (Date.now, Duration, async/await patterns)
- **check-code-debt**: Clean up technical debt and AI artifacts

**Customization Points**:
- **Commands**: Project-specific ContextKit commands in .claude/commands/ctxk/
- **Scripts**: Team automation scripts in Context/Scripts/ (version controlled)
- **Agents**: Custom quality agents in .claude/agents/ctxk/

## ContextKit AI Integration

**FOR AI ASSISTANTS**: This project uses ContextKit systematic development workflows.

### **Command Execution**
When executing ContextKit commands (`/ctxk:*`):
1. **Read command template** from `.claude/commands/ctxk/` for core logic
2. **Check customization section** at bottom of each command file for project-specific modifications
3. **Apply both** template logic and project customizations during execution

### **Developer Customizations**
Each ContextKit command and agent includes a **👩‍💻 DEVELOPER CUSTOMIZATIONS** section:
- **Additional Setup Steps**: Extra project-specific instructions
- **Skip or Override Steps**: Modifications to standard workflows
- **Custom Template Locations**: Alternative sources or project-specific templates

### **Persistent Preference Storage**
When users request workflow modifications:
- **Add instructions** to relevant command's customization section
- **Document changes** to ensure persistence across sessions
- **Preserve core logic** - only modify customization sections

## Configuration Hierarchy

**Inheritance Chain**: Global → Workspace → Project (this file)

**This Project Inherits From**:
1. **Global ContextKit** (`~/.ContextKit/`): Universal development standards
2. **Workspace Context** (`[AI References Discovered Workspace or "None"]`): Team/client standards
3. **Project Context** (this file): Project-specific configurations

**Override Precedence**: Project settings override workspace settings override global defaults

---
*Generated by ContextKit. Project-specific manual edits are preserved during ContextKit updates.*