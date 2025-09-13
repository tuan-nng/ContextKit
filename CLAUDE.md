# ContextKit Repository Development Guide

## 🚨 CRITICAL: Meta-Development Context

**You are working ON ContextKit, not WITH ContextKit!**

This repository contains **TEMPLATES and INSTALLATION SCRIPTS** that other developers will use. The files here are **NOT meant to be executed directly** in this repository - they are **source templates** that get copied to user systems during installation.

## 🧠 Understanding the Meta-Architecture

ContextKit is a "template distribution system" - this repository contains:
1. **Templates** - Files that get copied and customized during installation  
2. **Installation scripts** - Logic that copies templates to user systems
3. **Documentation** - Explains how the system works

**Key Mental Model**: Think of this repository as a "template factory" that produces customized development environments for other projects.

---

## 📂 Complete Repository Structure & Purpose

```
ContextKit/
├── 📄 install.sh                    # GLOBAL INSTALLER (users run: curl | sh)
├── 📖 README.md                     # Public documentation  
├── 📖 CLAUDE.md                     # This file - development guidance for AI assistants
├── 📖 LICENSE                       # MIT license
├── 📄 CHANGELOG.md                  # Version tracking and migration support
├── 📐 Guidelines/                    # GLOBAL CODING STANDARDS
│   ├── Swift.md                     # Swift patterns (copied by install.sh to ~/.ContextKit/)  
│   └── SwiftUI.md                   # SwiftUI patterns (copied by install.sh to ~/.ContextKit/)
└── 🎯 Templates/                     # TEMPLATE DISTRIBUTION CENTER
    ├── Commands/                    # → CLAUDE CODE COMMANDS (get copied during /ContextKit/setup)
    │   ├── Global/                  # Global ContextKit management commands
    │   │   ├── setup.md             # Project initialization
    │   │   ├── setup-workspace.md   # Workspace configuration
    │   │   ├── migrate.md           # Version updates
    │   │   └── verify.md            # Health checks
    │   ├── Plan/                    # Feature planning workflow
    │   │   ├── create-spec.md       # Business requirements
    │   │   ├── define-tech.md       # Technical architecture
    │   │   └── plan-steps.md        # Implementation breakdown
    │   ├── Implement/               # Development workflow
    │   │   ├── start-working.md     # Context-aware development start
    │   │   ├── commit-changes.md    # Smart commit message generation
    │   │   ├── release-app.md       # iOS/macOS App Store releases
    │   │   └── release-package.md   # Swift Package releases
    │   └── Backlog/                 # Idea and issue management
    │       ├── add-idea.md          # Capture new ideas with evaluation
    │       ├── add-bug.md           # Bug report with impact assessment
    │       ├── prioritize-ideas.md  # Organize ideas backlog
    │       └── prioritize-bugs.md   # Triage bugs backlog
    ├── Scripts/                     # → ALL SCRIPTS (hooks & standalone, get copied during /ContextKit/setup)
    │   ├── auto-format.sh           # Auto-format edited Swift files (PostToolUse hook)
    │   ├── version-status.sh        # Version checking and status display (SessionStart hook)
    │   └── custom-statusline.sh     # Complete statusline script with 5h-usage tracking and colored progress bars
    ├── Subagents/                   # → AI ASSISTANTS (get copied during /ContextKit/setup)
    │   ├── build-project.md         # Execute builds with constitutional compliance checking
    │   ├── check-accessibility.md   # Accessibility compliance validation (VoiceOver, contrast, etc.)
    │   ├── check-localization.md    # Localization readiness audit (String Catalog, cultural adaptation)
    │   ├── check-error-handling.md  # ErrorKit pattern validation and typed throws
    │   ├── check-modern-code.md     # API modernization (Date.now, Duration, async/await)
    │   └── check-code-debt.md       # Technical debt cleanup and code consolidation
    ├── Features/                    # → FEATURE TEMPLATES (used by /Plan/create-spec, etc.)
    │   ├── Spec.md                  # Business requirements and user stories (spec-kit methodology)
    │   ├── Tech.md                  # Technical architecture and constitutional compliance
    │   └── Steps.md                 # Implementation task breakdown with parallel markers [P]
    ├── Contexts/                    # → CONTEXT TEMPLATES (used by /ContextKit/setup and /ContextKit/setup-workspace)
    │   ├── Project.md               # Project-level Context.md with ContextKit configuration
    │   └── Workspace.md             # Workspace-level Context.md with client/company overrides
    ├── Backlog/                     # → BACKLOG TEMPLATES (used by /Backlog/add-idea and /Backlog/add-bug)
    │   ├── Ideas-Inbox.md           # New idea capture template with evaluation framework
    │   ├── Ideas-Backlog.md         # Prioritized idea backlog template with strategic organization
    │   ├── Bugs-Inbox.md            # Bug report intake template with impact assessment
    │   └── Bugs-Backlog.md          # Triaged bug backlog template with severity-based organization
    ├── Formatters/                  # → CODE STYLE CONFIGS (get copied during /ContextKit/setup)
    │   ├── .swift-format            # Apple swift-format configuration
    │   └── .swiftformat             # SwiftFormat (Nick Lockwood) configuration
    └── settings.json                # → CLAUDE CODE SETTINGS TEMPLATE
```

---

## 🔄 Installation & Copy Flow

### Phase 1: Global Installation (`./install.sh`)

**When users run**: `curl -fsSL https://raw.githubusercontent.com/FlineDev/ContextKit/main/install.sh | sh`

**What happens**:
```bash
# 1. Clone or update ContextKit repository to ~/.ContextKit/
git clone --depth 1 https://github.com/FlineDev/ContextKit.git ~/.ContextKit/
# OR git pull origin main (if updating existing installation)

# 2. Install ALL commands to user's Claude Code as ctxk shorthand
mkdir -p ~/.claude/commands/ctxk/
cp -R ~/.ContextKit/Templates/Commands/* ~/.claude/commands/ctxk/

# 3. Result: User has ContextKit repository + ALL /ctxk:* commands available globally
```

**All Commands Available After Install**:
- `/ctxk:proj:init` - Initialize project with ContextKit  
- `/ctxk:proj:init-workspce` - Configure workspace-level settings
- `/ctxk:proj:migrate` - Update existing project to newer ContextKit version
- `/ctxk:proj:verify` - Validate project ContextKit configuration
- `/ctxk:plan:1-spec` - Create feature specification
- `/ctxk:plan:2-tech` - Create technical architecture plan
- `/ctxk:plan:3-steps` - Break down implementation steps
- `/ctxk:impl:start-working` - Begin development with context
- `/ctxk:impl:commit-changes` - Commit with proper message formatting
- `/ctxk:impl:release-app` - iOS/macOS app release workflow
- `/ctxk:impl:release-package` - Swift package release workflow
- `/ctxk:bckl:add-idea` - Capture new ideas
- `/ctxk:bckl:add-bug` - Report bugs  
- `/ctxk:bckl:prioritize-ideas` - Organize ideas backlog
- `/ctxk:bckl:prioritize-bugs` - Triage bugs backlog

### Phase 2: Project Setup (`/ctxk:proj:init`)

**When users run**: `/ctxk:proj:init` (in their project directory)

**What `/ctxk:proj:init` does** (this command template will be implemented to):
```bash
# 1. Detect project type (Swift, JS, Python, etc.)
# 2. Create project Context.md (using Templates/Contexts/Project.md as template)  
# 3. Create directory structure:
mkdir -p Context/Features Context/Backlog Context/Scripts

# 4. Copy project-specific files:
# Scripts → Context/Scripts/ (for team sharing) + ~/.claude/ (statusline)
cp ~/.ContextKit/Templates/Scripts/auto-format.sh Context/Scripts/
cp ~/.ContextKit/Templates/Scripts/version-status.sh Context/Scripts/  
cp ~/.ContextKit/Templates/Scripts/custom-statusline.sh ~/.claude/

# Subagents → .claude/subagents/
mkdir -p .claude/subagents
cp ~/.ContextKit/Templates/Subagents/* .claude/subagents/

# Settings → .claude/settings.json (merge with user prompts)
# merge ~/.ContextKit/Templates/settings.json → .claude/settings.json

# Formatters → project root (for Swift projects only)
cp ~/.ContextKit/Templates/Formatters/.swift* ./

# Result: Project configured for ContextKit development workflows
```

**Commands Already Available Globally** (no additional setup needed):
All `/ctxk:*` commands listed above are already installed and work in any directory

### Phase 3: Feature Development (Commands Use Templates)

**When users run**: `/ctxk:plan:1-spec "Add user authentication"`

**What the command does**:
```bash
# 1. Read project Context.md to understand project type
# 2. Generate feature name: "UserAuthentication"  
# 3. Create feature directory: Context/Features/UserAuthentication/
# 4. Copy & customize feature templates:
cp ~/.ContextKit/Templates/Features/Spec.md Context/Features/UserAuthentication/Spec.md
cp ~/.ContextKit/Templates/Features/Tech.md Context/Features/UserAuthentication/Tech.md
cp ~/.ContextKit/Templates/Features/Steps.md Context/Features/UserAuthentication/Steps.md

# 5. The templates are NOT variable-substituted - they contain dynamic logic
# 6. Create git branch: "feature/user-authentication" 
# 7. Result: Ready-to-use feature development structure with active templates
```

---

## 📋 Template Categories & Implementation Details

### 🎯 **Templates/Commands/** - Claude Code Commands
**Purpose**: Command templates that get installed globally during `install.sh`  
**Copy Destination**: `~/.claude/commands/ctxk/` (ALL commands available globally after install.sh)  
**Format**: Standard Claude Code command markdown files with execution logic  
**Variables**: **NONE** - Commands read `Context.md` dynamically when executed

**Directory Structure in Templates/Commands/**:
- `proj/` - Project management (init, init-workspce, migrate, verify)
- `plan/` - Feature planning (1-spec, 2-tech, 3-steps) 
- `impl/` - Implementation (start-working, commit-changes, release-app, release-package)
- `bckl/` - Backlog management (add-idea, add-bug, prioritize-ideas, prioritize-bugs)

**AI Implementation Focus**:
- Include execution flows with explicit branching logic
- Add constitutional compliance validation gates
- Implement project type detection (swift-package, ios-app, etc.)
- Provide clear error conditions with actionable guidance

### 📜 **Templates/Scripts/** - All Scripts (Hooks & Standalone)
**Purpose**: Shell scripts for automation hooks and utilities  
**Copy Destinations**: 
- `auto-format.sh`, `version-status.sh` → `Context/Scripts/` (team sharing)
- `custom-statusline.sh` → `~/.claude/` (personal statusline)
**Format**: Cross-platform shell scripts

**Files & AI Implementation Notes**:
- `auto-format.sh` - PostToolUse hook: detect Swift files, run SwiftFormat + swift-format
- `version-status.sh` - SessionStart hook: check ContextKit versions, display migration warnings  
- `custom-statusline.sh` - Standalone: 5h usage tracking with colored progress bars

### ⚙️ **Templates/settings.json** - Claude Code Configuration
**Purpose**: Complete Claude Code settings template with ContextKit defaults  
**Copy Destination**: Merged into `.claude/settings.json` with user preference prompts  
**Format**: JSON configuration file
**Variables**: **NONE** - Static configuration

**Contains**: Model defaults ("claude-3-5-sonnet-20241022"), statusline configuration, hook execution setup, ContextKit permissions

### 🤖 **Templates/Subagents/** - AI Quality Assistants  
**Purpose**: Specialized AI assistants for autonomous quality checks  
**Copy Destination**: `.claude/subagents/`  
**Format**: Markdown with YAML frontmatter (proper Claude Code subagent format)
**Variables**: **NONE** - Dynamic context reading

**Subagents & AI Implementation Focus**:
- `build-project.md` - Execute builds, filter developer comments, report errors/warnings
- `check-accessibility.md` - VoiceOver labels, color contrast, dynamic type validation
- `check-localization.md` - String Catalog analysis, cultural adaptation, region formatters
- `check-error-handling.md` - ErrorKit patterns, typed throws, user-friendly error messages
- `check-modern-code.md` - Replace Date() → Date.now, TimeInterval → Duration, async/await
- `check-code-debt.md` - Remove AI artifacts, consolidate patterns, extract components

### 📝 **Templates/Features/** - Feature Development Templates
**Purpose**: Templates copied during feature planning commands  
**Copy Destination**: `Context/Features/[FeatureName]/` during `/Plan/create-spec`  
**Format**: Markdown with spec-kit execution flows  
**Variables**: **NONE** - Templates contain dynamic logic, no static substitution

**Templates & AI Implementation Focus**:
- `Spec.md` - Business requirements with forced uncertainty marking `[NEEDS CLARIFICATION: X]`
- `Tech.md` - Technical architecture with constitutional compliance gates  
- `Steps.md` - Implementation breakdown with parallel markers `[P]` and S001-S999 numbering

### 🏗️ **Templates/Contexts/** - Configuration Templates
**Purpose**: Context.md templates for project and workspace configuration  
**Copy Destination**: Project root (`Context.md`) and workspace directories  
**Format**: Markdown configuration with project detection logic  
**Variables**: **NONE** - Templates detect and populate information dynamically

**Templates & AI Implementation Focus**:
- `Project.md` - Auto-detect project type, architecture, workspace inheritance
- `Workspace.md` - Client/company overrides, coding style adjustments, constitutional principle modifications

### 📋 **Templates/Backlog/** - Backlog Management Templates
**Purpose**: Idea and bug backlog templates with structured evaluation  
**Copy Destination**: `Context/Backlog/` during initial setup as starting templates  
**Format**: Markdown with evaluation frameworks and prioritization systems  
**Variables**: **NONE** - Static template structure

**Templates & AI Implementation Focus**:
- `Ideas-Inbox.md` - Capture template with evaluation criteria, effort estimation
- `Ideas-Backlog.md` - Prioritized backlog with strategic organization patterns  
- `Bugs-Inbox.md` - Bug report template with impact assessment, reproduction steps  
- `Bugs-Backlog.md` - Triaged backlog with severity classification, effort estimation

### 📐 **Templates/Formatters/** - Code Style Configuration
**Purpose**: Formatter configuration files for consistent code style  
**Copy Destination**: Project root (Swift projects only)  
**Format**: Configuration files for formatting tools
**Variables**: **NONE** - Static configuration

**Files**:
- `.swift-format` - Apple swift-format configuration (3-space indentation, constitutional style)  
- `.swiftformat` - SwiftFormat configuration (Nick Lockwood tool)

---

## 🛠️ AI Development Guidelines

### Spec-Kit Integration Patterns

Every command template must implement **executable workflows with built-in quality gates**:

```markdown
## Execution Flow (main)
1. Parse user input and validate
   → If empty/invalid: ERROR "Specific guidance on fixing"
2. Load Context.md and detect project type
   → If missing: ERROR "Run /ContextKit/setup first"
3. Apply constitutional principles
   → Check: accessibility, privacy, localizability, maintainability
4. Mark uncertainties explicitly
   → Use: [NEEDS CLARIFICATION: specific question]
5. Validate against quality gates
   → If fails: Document in Complexity Tracking, require justification
6. Execute phase-specific logic
7. Return: SUCCESS (ready for next phase) or ERROR with guidance
```

### Constitutional Compliance Gates

Embed these validation checkpoints in every template where applicable:

```markdown
## Constitutional Validation
- [ ] Accessibility-first design validated?
- [ ] Privacy by design considerations documented?
- [ ] Localizability from day one confirmed?
- [ ] Platform-appropriate UX patterns followed?
- [ ] Code maintainability standards met?
- [ ] Simple solutions chosen over complex ones?
```

### Template Creation Rules

1. **Commands** (`Templates/Commands/`): 
   - Read `Context.md` dynamically when executed
   - Include project type detection logic
   - NO variable substitution - pure execution logic

2. **Features** (`Templates/Features/`): 
   - Contain spec-kit execution flows
   - NO variable substitution - dynamic content generation
   - Include forced uncertainty marking patterns

3. **Contexts** (`Templates/Contexts/`): 
   - Auto-detect project information
   - NO variable substitution - intelligent template logic
   - Include hierarchical inheritance patterns

4. **Subagents** (`Templates/Subagents/`): 
   - YAML frontmatter with tool specifications
   - Focused scope (single quality concern)
   - Clear success/failure reporting

5. **Scripts** (`Templates/Scripts/`): 
   - Cross-platform shell script compatibility
   - Simple, focused functionality
   - Error handling with user-friendly messages

---

## 🧪 Development Workflow for ContextKit Maintainers

### Testing Your Template Changes

```bash
# 1. Test global installation
cd /Volumes/Projects/Developer/Indie/Packages/ContextKit
./install.sh

# 2. Create test project  
mkdir ~/test-contextkit-project && cd ~/test-contextkit-project
git init

# 3. Test project setup
claude  # Start Claude Code
/ctxk:proj:init  # Initialize with ContextKit

# 4. Test workflow commands function properly
/ctxk:plan:1-spec "test authentication feature"
/ctxk:plan:2-tech
/ctxk:plan:3-steps
/ctxk:impl:start-working
```

### Common Development Pitfalls

1. **Creating executable commands instead of templates** 
   - Templates contain instruction flows for OTHER AI assistants
   - They guide future AI usage, not direct execution

2. **Adding variable substitution where none needed**
   - Commands and most templates work dynamically
   - Only use variables for static content that gets set once

3. **Missing constitutional compliance gates**
   - Every template needs quality validation checkpoints
   - Make gates blocking requirements, not suggestions

4. **Forgetting cross-platform compatibility**
   - Scripts must work on macOS, Linux, and WSL2
   - Test installation across different environments

### File Validation Checklist

Before committing template changes:

- [ ] Template contains execution flow with error conditions
- [ ] Constitutional validation gates included where applicable
- [ ] Project type detection logic implemented (for commands)
- [ ] Clear success/error states defined
- [ ] Cross-platform compatibility verified (for scripts)
- [ ] YAML frontmatter correct (for subagents)
- [ ] No unnecessary variable substitution added
- [ ] Testing workflow completed successfully

---

## 💡 Remember: Meta-Development Mindset

You're building a system that creates development environments for other projects. Every template you create will guide AI assistants working on completely different codebases and project types.

Focus on:
- **Systematic thinking patterns** that work across project types
- **Clear validation gates** that prevent common AI mistakes  
- **Constitutional principles** embedded in every workflow
- **Spec-kit methodology** that ensures consistent quality

When in doubt, ask: "How will this template help an AI assistant build better software in a Swift/iOS project they've never seen before?"

---

## 📋 File Categories: AI-Only vs Mixed Content

### 🤖 **Pure AI Instructions** (Not for human consumption)
These files contain ONLY execution logic for AI assistants:

- **`Templates/Commands/**/*.md`** - Pure AI command logic (no human-readable content)
- **`Templates/Subagents/**/*.md`** - Pure AI subagent instructions with YAML frontmatter

**Format**: Standard markdown with execution flows, no separation needed.

### 👥 **Mixed Content** (AI instructions + Human-readable content)
These files combine AI execution logic with actual content that humans use:

**Separation Pattern**: All use the same visual separator:
```
════════════════════════════════════════════════════════════════════════════════
║ 🤖 SYSTEM INSTRUCTIONS - [PURPOSE]
════════════════════════════════════════════════════════════════════════════════
║ AI execution logic goes here...
║ Indented with ║ prefix
║ 
════════════════════════════════════════════════════════════════════════════════
```

**Files using this pattern**:

- **`Templates/Features/*.md`** - Feature templates with AI generation logic
  - Contains: Template structure + AI instructions for dynamic content generation
  - AI section: "🤖 EXECUTION FLOW - FEATURE SPECIFICATION GENERATION"

- **`Templates/Contexts/*.md`** - Context.md generation templates
  - Contains: Template structure + AI logic for project detection/inheritance
  - AI section: "🤖 EXECUTION FLOW - PROJECT CONTEXT GENERATION"

- **`Templates/Backlog/*.md`** - Backlog management templates
  - Contains: Actual backlog structure + AI instructions for idea processing
  - AI section: "🤖 EXECUTION FLOW - IDEA CAPTURE PROCESSING"

### 📖 **Pure Human Content** (No AI instructions)
These files are for human consumption only:

- **`Guidelines/*.md`** - Development guidelines and coding standards (see Guidelines vs Subagents section below)
- **`README.md`** - Public documentation
- **`CHANGELOG.md`** - Version history
- **`CLAUDE.md`** - This file (AI development guidance)

### ⚙️ **Configuration Files** (No AI instructions)
- **`Templates/settings.json`** - Claude Code configuration
- **`Templates/Formatters/.*`** - Code formatting configurations
- **`Templates/Scripts/*.sh`** - Shell scripts for hooks and automation

### 🔧 **Key Implementation Notes**

1. **Dynamic Content Generation**: 
   - Claude Code commands use `$ARGUMENTS`, `$1`, `$2`, etc. for user input
   - Templates contain AI instructions that generate content dynamically from command arguments
   - No variable substitution needed - AI fills in content based on detection and analysis
2. **Visual Separation**: The box-drawn separator clearly distinguishes AI logic from human content
3. **AI Section Naming**: Always prefixed with "🤖" and describes the specific AI purpose
4. **Indentation Pattern**: AI instructions indented with `║` character for clear visual separation

### 📝 **Content Review Guidelines**

**For Pure AI Files**: Focus on execution flow logic, validation gates, and error conditions
**For Mixed Content Files**: 
- Review AI instructions in the boxed section for logic and completeness
- Review human content section for accuracy and usefulness
- Ensure dynamic content generation logic produces appropriate output
**For Pure Human Files**: Standard content review for accuracy and clarity

---

## 🧭 Guidelines vs Subagents: Role Separation

### **Guidelines/*.md - Strategic Planning Reference**

**Purpose**: High-level guidance for AI assistants during **planning and architecture phases**

**Usage Phases**:
- `/Plan/define-tech` - Architecture and framework decisions
- `/Plan/create-spec` - Technology stack selection
- Command planning and API selection phases

**Content Focus**:
- ✅ **API Preferences**: `Date.now` over `Date()`, `Duration` over `TimeInterval`
- ✅ **Framework Choices**: SwiftUI over UIKit, RESTClient over custom networking
- ✅ **Package Strategy**: Import FlineDevKit first, package-first development
- ✅ **Architecture Patterns**: MVVM, typed throws, dependency injection
- ✅ **Strategic Rules**: Constitutional principles, decision framework

**Content Style**: 
- Preference lists with ✅/❌ indicators
- Strategic "what to choose" guidance
- Framework and package recommendations
- Constitutional principle integration

**Example Entry**:
```markdown
### Networking
- ✅ **Prefer**: `RESTClient` from HandySwift for REST APIs
- ✅ **Prefer**: `IntelligenceKit` for AI service integration
- ❌ **Avoid**: Custom URLSession implementations
```

### **Templates/Subagents/*.md - Quality Validation Specialists**

**Purpose**: Detailed issue detection in **existing code during development phases**

**Usage Phases**:
- `/Implement/commit-changes` - Pre-commit quality validation
- Quality gate enforcement during development
- Code review and cleanup phases

**Content Focus**:
- 🔍 **Specific Issues**: Find `Date()` usage, detect legacy patterns
- 🔍 **Common AI Mistakes**: Remove artifacts, fix generated code problems
- 🔍 **Pattern Detection**: Search patterns, regex rules, file analysis
- 🔍 **Detailed Reports**: Line numbers, specific fixes, actionable feedback

**Content Style**:
- YAML frontmatter with tool specifications
- Detailed search patterns and detection logic
- Specific error identification and reporting
- Automated fix suggestions

**Example Entry**:
```markdown
# check-modern-code.md

```yaml
tools: ["Read", "Grep"]
scope: "Swift source files"
```

## Detection Patterns
- Search for: `Date()`, `replacingOccurrences`, `TimeInterval`
- Look for: Traditional switch statements vs switch expressions

## Report Format
"Found 3 modernization issues:
- Line 45: Use Date.now instead of Date()
- Line 67: Use Duration instead of TimeInterval"
```

### **Clear Workflow Separation**

```
Planning Phase               Development Phase
├── Guidelines/*.md         ├── Templates/Subagents/*.md
│   ├── "What should I      │   ├── "What's wrong with
│   │   choose?"            │   │   what I wrote?"
│   ├── Strategic decisions │   ├── Issue detection
│   ├── API preferences     │   ├── Code validation  
│   └── Architecture rules  │   └── Quality gates
│                           │
▼                           ▼
/Plan/define-tech           /Implement/commit-changes
/Plan/create-spec           Quality validation
Framework selection         Code review
```

### **Key Benefits of This Separation**

1. **No Duplication**: Guidelines stay high-level, subagents get detailed
2. **Clear Responsibilities**: Planning vs validation are distinct phases
3. **Efficient Context**: AI gets right level of detail for each phase
4. **Maintainability**: Guidelines change with strategy, subagents with common issues
5. **Scalability**: Add new subagents without bloating guidelines

### **Implementation Guidelines for Maintainers**

**When writing Guidelines**:
- Focus on strategic choices and preferences
- Use ✅/❌ format for quick reference
- Reference subagents for detailed validation
- Keep examples minimal and preference-focused

**When writing Subagents**:
- Focus on specific, detectable issues
- Include YAML frontmatter with required tools
- Provide detailed search patterns and detection logic
- Generate actionable reports with line numbers