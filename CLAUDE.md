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
├── 🏛️  Meta/                         # GLOBAL FRAMEWORK FILES
│   └── Changelog.md                 # Version history (copied by install.sh to ~/.ContextKit/)
├── 📐 Guidelines/                    # GLOBAL CODING STANDARDS
│   ├── Swift.md                     # Swift patterns (copied by install.sh to ~/.ContextKit/)  
│   └── SwiftUI.md                   # SwiftUI patterns (copied by install.sh to ~/.ContextKit/)
└── 🎯 Templates/                     # TEMPLATE DISTRIBUTION CENTER
    ├── Commands/                    # → CLAUDE CODE COMMANDS (get copied during /setup)
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
    ├── Scripts/                     # → ALL SCRIPTS (hooks & standalone, get copied during /setup)
    │   ├── auto-format.sh           # Auto-format edited Swift files (PostToolUse hook)
    │   ├── version-status.sh        # Version checking and status display (SessionStart hook)
    │   └── custom-statusline.sh     # Complete statusline script with 5h-usage tracking and colored progress bars
    ├── Subagents/                   # → AI ASSISTANTS (get copied during /setup)
    │   ├── build-project.md         # Execute builds with constitutional compliance checking
    │   ├── check-accessibility.md   # Accessibility compliance validation (VoiceOver, contrast, etc.)
    │   ├── check-localization.md    # Localization readiness audit (String Catalog, cultural adaptation)
    │   ├── check-error-handling.md  # ErrorKit pattern validation and typed throws
    │   ├── check-modern-code.md     # API modernization (Date.now, Duration, async/await)
    │   └── check-code-debt.md       # Technical debt cleanup and code consolidation
    ├── Features/                    # → FEATURE TEMPLATES (used by /Plan/* commands)
    │   ├── Spec.md                  # Business requirements and user stories (spec-kit methodology)
    │   ├── Tech.md                  # Technical architecture and constitutional compliance
    │   └── Steps.md                 # Implementation task breakdown with parallel markers [P]
    ├── Contexts/                    # → CONTEXT TEMPLATES (used by /setup and /setup-workspace)
    │   ├── Project.md               # Project-level Context.md with ContextKit configuration
    │   └── Workspace.md             # Workspace-level Context.md with client/company overrides
    ├── Backlog/                     # → BACKLOG TEMPLATES (used by /add-idea and /add-bug)
    │   ├── Ideas-Inbox.md           # New idea capture template with evaluation framework
    │   ├── Ideas-Backlog.md         # Prioritized idea backlog template with strategic organization
    │   ├── Bugs-Inbox.md            # Bug report intake template with impact assessment
    │   └── Bugs-Backlog.md          # Triaged bug backlog template with severity-based organization
    ├── Formatters/                  # → CODE STYLE CONFIGS (get copied during /setup)
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
# 1. Create global ContextKit directory
mkdir -p ~/.ContextKit/

# 2. Copy framework files
cp Meta/* ~/.ContextKit/Meta/
cp Guidelines/* ~/.ContextKit/Guidelines/  
cp Templates/* ~/.ContextKit/Templates/ -R

# 3. Install ONLY global commands to user's Claude Code
cp Templates/Commands/Global/* ~/.claude/commands/ContextKit/

# 4. Result: User now has global ContextKit installation + /ContextKit/* commands
```

**Global Commands Available After Install**:
- `/ContextKit/setup` - Initialize project with ContextKit  
- `/ContextKit/setup-workspace` - Configure workspace-level settings
- `/ContextKit/migrate` - Update existing project to newer ContextKit version
- `/ContextKit/verify` - Validate project ContextKit configuration

### Phase 2: Project Setup (`/ContextKit/setup`)

**When users run**: `/setup` (in their project directory)

**What `/ContextKit/setup` does**:
```bash
# 1. Detect project type (Swift, JS, Python, etc.)
# 2. Create project Context.md (using Templates/Contexts/Project.md)  
# 3. Create directory structure + .keep files:
mkdir -p Context/Features Context/Backlog/Ideas Context/Backlog/Bugs Context/Scripts
touch Context/Features/.keep Context/Backlog/Ideas/.keep Context/Backlog/Bugs/.keep Context/Scripts/.keep

# 5. Copy project-specific files:

# Commands → .claude/commands/
mkdir -p .claude/commands/Plan .claude/commands/Implement .claude/commands/Backlog  
cp ~/.ContextKit/Templates/Commands/Plan/* .claude/commands/Plan/
cp ~/.ContextKit/Templates/Commands/Implement/* .claude/commands/Implement/  
cp ~/.ContextKit/Templates/Commands/Backlog/* .claude/commands/Backlog/

# Scripts → Context/Scripts/ (hooks) + ~/.claude/ (statusline) + .claude/settings.json
cp ~/.ContextKit/Templates/Scripts/auto-format.sh Context/Scripts/
cp ~/.ContextKit/Templates/Scripts/version-status.sh Context/Scripts/  
cp ~/.ContextKit/Templates/Scripts/custom-statusline.sh ~/.claude/
merge ~/.ContextKit/Templates/settings.json → .claude/settings.json (with user prompts for permissions/model/statusline)

# Subagents → .claude/subagents/
mkdir -p .claude/subagents
cp ~/.ContextKit/Templates/Subagents/* .claude/subagents/

# Formatters → project root (for Swift projects)
cp ~/.ContextKit/Templates/Formatters/.swift* ./

# Result: Project now has full ContextKit development environment + proper directory structure
```

**Project Commands Available After Setup**:
- `/Plan/create-spec` - Create feature specification
- `/Plan/define-tech` - Create technical architecture plan
- `/Plan/plan-steps` - Break down implementation steps
- `/Implement/start-working` - Begin development with context
- `/Implement/commit-changes` - Commit with proper message formatting
- `/Implement/release-app` - iOS/macOS app release workflow
- `/Implement/release-package` - Swift package release workflow
- `/Backlog/add-idea` - Capture new ideas
- `/Backlog/add-bug` - Report bugs  
- `/Backlog/prioritize-ideas` - Organize ideas backlog
- `/Backlog/prioritize-bugs` - Triage bugs backlog

### Phase 3: Feature Development (Commands Use Templates)

**When users run**: `/Plan/create-spec "Add user authentication"`

**What the command does**:
```bash
# 1. Read project Context.md to understand project type
# 2. Generate feature name: "UserAuthentication"  
# 3. Create feature directory: Context/Features/UserAuthentication/
# 4. Copy & customize feature templates:
cp ~/.ContextKit/Templates/Features/Spec.md Context/Features/UserAuthentication/Spec.md
cp ~/.ContextKit/Templates/Features/Tech.md Context/Features/UserAuthentication/Tech.md
cp ~/.ContextKit/Templates/Features/Steps.md Context/Features/UserAuthentication/Steps.md

# 5. Substitute variables: ${FEATURE_NAME} → "UserAuthentication"
# 6. Create git branch: "feature/user-authentication" 
# 7. Result: Ready-to-use feature development structure
```

---

## 📋 Template Categories & Usage

### 🎯 **Templates/Commands/** - Claude Code Commands
**Purpose**: Command templates that get copied to user projects  
**Used By**: `/ContextKit/setup` → copies to `.claude/commands/`  
**Format**: Standard Claude Code command markdown files  
**Variables**: None (read Context.md dynamically)

**Structure**:
```
Templates/Commands/
├── Global/             # Global management commands
│   ├── setup.md         # Project initialization  
│   ├── setup-workspace.md # Workspace configuration
│   ├── migrate.md       # Version updates
│   └── verify.md        # Health checks
├── Plan/               # Feature planning workflow  
│   ├── create-spec.md   # Business requirements
│   ├── define-tech.md   # Technical architecture
│   └── plan-steps.md    # Implementation breakdown
├── Implement/          # Development workflow
│   ├── start-working.md # Context-aware development start
│   ├── commit-changes.md # Smart commit message generation  
│   ├── release-app.md   # iOS/macOS App Store releases
│   └── release-package.md # Swift Package releases
└── Backlog/            # Idea and issue management
    ├── add-idea.md      # Capture new ideas with evaluation
    ├── add-bug.md       # Bug report with impact assessment
    └── prioritize-backlog.md # Backlog organization
```

### 📜 **Templates/Scripts/** - All Scripts (Hooks & Standalone)
**Purpose**: All shell scripts - both automation hooks and standalone utility scripts  
**Used By**: `/ContextKit/setup` → copies hook scripts to `Context/Scripts/`, statusline to `~/.claude/`  
**Format**: Shell scripts for hook execution and external calls

**Files**:
- `auto-format.sh` - Auto-format edited Swift files (PostToolUse hook)
- `version-status.sh` - Version checking and status display (SessionStart hook)  
- `custom-statusline.sh` - Complete statusline script with 5h-usage tracking and colored progress bars

### ⚙️ **Templates/settings.json** - Claude Code Configuration
**Purpose**: Complete Claude Code settings template with all ContextKit defaults  
**Used By**: `/ContextKit/setup` → merges into `.claude/settings.json` with user preference prompts  
**Format**: JSON configuration file

**Contains**: Permissions, model defaults ("sonnet"), statusline configuration, and hook execution setup

### 🤖 **Templates/Subagents/** - AI Quality Assistants  
**Purpose**: Specialized AI assistants for quality assurance  
**Used By**: `/ContextKit/setup` → copies to `.claude/subagents/`  
**Format**: Markdown with YAML frontmatter (proper Claude Code subagent format)

**Subagents**:
- `build-project.md` - Execute builds with constitutional compliance checking
- `check-accessibility.md` - Accessibility compliance validation (VoiceOver, contrast, etc.)
- `check-localization.md` - Localization readiness audit (String Catalog, cultural adaptation)
- `check-error-handling.md` - ErrorKit pattern validation and typed throws
- `check-modern-code.md` - API modernization (Date.now, Duration, async/await)
- `check-code-debt.md` - Technical debt cleanup and code consolidation

### 📝 **Templates/Features/** - Feature Development Templates
**Purpose**: Templates for feature specification, technical planning, and task breakdown  
**Used By**: `/Plan/create-spec`, `/Plan/define-tech`, `/Plan/plan-steps` commands  
**Format**: Markdown with variable substitution  
**Variables**: `${FEATURE_NAME}`, `${SETUP_DATE}`, `${USER_DESCRIPTION}`

**Templates**:
- `Spec.md` - Business requirements and user stories (spec-kit methodology)
- `Tech.md` - Technical architecture and constitutional compliance  
- `Steps.md` - Implementation task breakdown with parallel markers [P]

### 🏗️ **Templates/Contexts/** - Configuration Templates
**Purpose**: Context.md templates for project and workspace setup  
**Used By**: `/ContextKit/setup`, `/ContextKit/setup-workspace`  
**Format**: Markdown with variable substitution  
**Variables**: `${PROJECT_NAME}`, `${PROJECT_TYPE}`, `${WORKSPACE_NAME}`, `${SETUP_DATE}`

**Templates**:
- `Project.md` - Project-level Context.md with ContextKit configuration
- `Workspace.md` - Workspace-level Context.md with client/company overrides

### 📋 **Templates/Backlog/** - Backlog Management Templates
**Purpose**: Idea and bug backlog templates with evaluation frameworks  
**Used By**: `/Backlog/add-idea`, `/Backlog/add-bug` → copy and customize for project backlog management  
**Format**: Markdown with variable substitution  
**Variables**: `${PROJECT_NAME}`, `${SETUP_DATE}`

**Templates**:
- `Ideas-Inbox.md` - New idea capture template with evaluation framework  
- `Ideas-Backlog.md` - Prioritized idea backlog template with strategic organization  
- `Bugs-Inbox.md` - Bug report intake template with impact assessment  
- `Bugs-Backlog.md` - Triaged bug backlog template with severity-based organization

### 📐 **Templates/Formatters/** - Code Style Configuration
**Purpose**: Formatter configuration files  
**Used By**: `/ContextKit/setup` → copies to project root (Swift projects only)  
**Format**: Configuration files

**Files**:
- `.swift-format` - Apple swift-format configuration  
- `.swiftformat` - SwiftFormat (Nick Lockwood) configuration

### 🚨 **IMPORTANT: Directory Structure Creation**

**❌ NOT STORED in ContextKit Repository**: The directory structure is created dynamically by the `/ContextKit/setup` command, not stored as templates.

**✅ What `/ContextKit/setup` Creates in User Projects**:
```bash
# The setup command creates these directories + .keep files in user projects:
mkdir -p Context/Features Context/Backlog/Ideas Context/Backlog/Bugs Context/Scripts
touch Context/Features/.keep Context/Backlog/Ideas/.keep Context/Backlog/Bugs/.keep Context/Scripts/.keep
```

**Purpose**: Ensure git can track empty directories that will be populated during development
- `Context/Features/.keep` - Where feature specs/tech/steps get created
- `Context/Backlog/Ideas/.keep` - Where idea capture files are stored  
- `Context/Backlog/Bugs/.keep` - Where bug tracking files are stored
- `Context/Scripts/.keep` - Where hook scripts get copied for team sharing

---

## 🎯 Development Workflow for ContextKit Maintainers

### When Working ON ContextKit Repository:

1. **Never execute templates directly** - They are source files, not executable commands
2. **Test changes** by running the installation flow in a test project
3. **Update template variables** carefully - they get substituted during usage
4. **Maintain consistency** between all command templates (execution flow patterns)
5. **Document changes** in ContextKit/Changelog.md

### Testing Your Changes:

```bash
# 1. Test global installation
./install.sh

# 2. Create test project  
mkdir test-project && cd test-project
git init

# 3. Test project setup
code  # Start Claude Code
/setup  # Run ContextKit setup

# 4. Test commands work  
/Plan/create-spec "test feature"
/Implement/start-working
```

### File Modification Guidelines:

- **Commands** (`Templates/Commands/`): Should read Context.md dynamically, no variable substitution
- **Feature Templates** (`Templates/Features/`): Use variables for one-time creation
- **Context Templates** (`Templates/Contexts/`): Use variables for setup-time customization  
- **Subagents** (`Templates/Subagents/`): Must have YAML frontmatter, no variables
- **Scripts** (`Templates/Scripts/`): Simple focused scripts, no complex logic

---

## 🔍 Debugging Template Issues

### Common Problems:

1. **"Command not found"** - Check if install.sh copied global commands properly
2. **"Template missing variables"** - Ensure variable substitution works in feature commands  
3. **"Hook not executing"** - Verify settings.json format and script permissions
4. **"Subagent fails"** - Check YAML frontmatter format and tool specifications

### Validation Checklist:

- [ ] install.sh copies all files to correct locations
- [ ] Global commands work after installation  
- [ ] Project setup creates proper directory structure
- [ ] Commands can read Context.md dynamically
- [ ] Feature templates substitute variables correctly
- [ ] Hooks execute with proper permissions
- [ ] Subagents have valid YAML frontmatter

---

## 💡 Remember: You're Building a Template Distribution System

The complexity comes from the meta-nature: you're building templates that generate development environments that help build other projects. Every file serves the larger goal of making AI-assisted development more intelligent and consistent across projects.

When in doubt, think: "How will this template help developers in THEIR projects?" not "How does this work in the ContextKit repository?"