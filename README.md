<div align="center">
    <h1>🧠 ContextKit</h1>
    <h3><em>AI context engineering for intelligent development workflows</em></h3>
</div>

<p align="center">
    <strong>A hierarchical context management system that makes AI assistants smarter through structured templates, constitutional principles, and intelligent project setup.</strong>
</p>

---

## Table of Contents

- [🤔 What is Context Engineering?](#-what-is-context-engineering)
- [⚡ Get started](#-get-started) 
- [📚 Core philosophy](#-core-philosophy)
- [🌟 Key features](#-key-features)
- [🔧 Prerequisites](#-prerequisites)
- [📖 Learn more](#-learn-more)
- [🎯 How it works](#-how-it-works)
- [🔍 Template system](#-template-system)
- [📄 License](#-license)

## 🤔 What is Context Engineering?

Context Engineering **transforms how AI assistants understand your projects**. Instead of starting from scratch every time, ContextKit provides intelligent, hierarchical context that makes AI assistants immediately productive with your codebase, coding standards, and development workflows.

ContextKit extends GitHub's [spec-kit methodology](https://github.com/github/spec-kit) with universal applicability while providing Swift/iOS defaults, enabling systematic `/specify → /plan → /tasks` workflows enhanced with constitutional principles like accessibility-first design, privacy by design, and code maintainability.

## ⚡ Get started

### 1. Install ContextKit globally

```bash
curl -fsSL https://raw.githubusercontent.com/FlineDev/ContextKit/main/install.sh | sh
```

### 2. Setup your project

Navigate to your project directory and run:

1. Start Claude Code: `code` 
2. Run the setup command: `/setup`

ContextKit will intelligently detect your project type, workspace context, and create appropriate templates and configurations.

### 3. Start building with context

Use the installed commands for structured development:

- `/Plan/create-spec` - Create feature specifications
- `/Implement/start-working` - Begin development with context  
- `/Backlog/add-idea` - Capture and organize ideas

## 📚 Core philosophy

ContextKit is built on proven context engineering principles:

- **Hierarchical intelligence** where Global → Workspace → Project contexts inherit and override intelligently
- **Constitutional principles** embedded throughout all templates (accessibility, privacy, maintainability)
- **Template DNA** with executable workflows, validation gates, and error conditions
- **Non-destructive setup** that preserves existing configurations while enhancing them
- **Team collaboration** through committed `.claude/` artifacts shared automatically

## 🌟 Key features

### Intelligent Project Detection
- **Swift packages**: Detects Package.swift, applies package-specific templates
- **iOS/macOS apps**: Recognizes *.xcodeproj, includes platform-specific workflows  
- **Workspace inheritance**: Automatically inherits client/company standards from parent directories
- **Universal methodology**: Works with any technology stack through workspace/project overrides

### Constitutional Quality Gates
- **Accessibility-first**: Templates enforce VoiceOver labels, color contrast, keyboard navigation
- **Localizability**: Built-in localization readiness checks and TranslateKit integration
- **Privacy by design**: Privacy impact assessment embedded in all feature specifications
- **Code maintainability**: Technical debt cleanup and modern code patterns enforced

### Systematic Development Workflows  
- **Spec-kit integration**: Enhanced `/specify`, `/plan`, `/tasks` commands with iOS/macOS optimizations
- **Quality assurance**: Automated subagents for accessibility, localization, error handling
- **Release workflows**: App Store Connect integration, automatic localization, submission helpers
- **Hook automation**: Auto-formatting, version management, continuous validation

## 🔧 Prerequisites

- **macOS, Linux, or WSL2** (anywhere Claude Code runs)
- **Claude Code** - Primary AI coding assistant integration
- **Git** - For repository management and team collaboration
- **Standard Unix tools** - bash, curl, cp, mkdir, find (pre-installed on most systems)

## 📖 Learn more

- **[Installation Guide](docs/installation.md)** - Detailed setup and configuration
- **[Template System](docs/templates.md)** - Understanding the hierarchical template architecture
- **[Configuration](docs/configuration.md)** - Customizing ContextKit for your workflow
- **[Constitutional Principles](docs/constitution.md)** - Understanding the quality framework

## 🎯 How it works

### 1. Global Installation
ContextKit installs templates to `~/.ContextKit/` containing:
- Command templates for structured development workflows
- Hook templates for automation (auto-formatting, version management)
- Subagent templates for quality assurance (accessibility, localization, error handling)
- Constitutional framework with universal development principles

### 2. Intelligent Project Setup
When you run `/setup` in your project:
- **Auto-detects project type** from Package.swift, *.xcodeproj, package.json, etc.
- **Inherits workspace context** by traversing parent directories for Context.md files
- **Analyzes existing configurations** and merges intelligently with CLAUDE.md files
- **Copies appropriate templates** to `.claude/` for team sharing and customization

### 3. Hierarchical Context Management
```
Global (~/.ContextKit/)
├── Universal templates and constitutional principles
│
Workspace (client/company Context.md)  
├── Client coding standards, technology preferences
│
Project (.claude/ + Context.md)
└── Team-specific customizations and overrides
```

### 4. Enhanced Development Workflow
- **Feature planning**: `/Plan/create-spec` creates specifications with constitutional compliance
- **Technical design**: `/Plan/define-tech` applies architectural patterns and platform conventions
- **Implementation**: `/Implement/start-working` begins development with context-aware guidance
- **Quality assurance**: Automated subagents validate accessibility, localization, error handling
- **Release management**: `/Implement/release-app` handles App Store submissions with automation

## 🔍 Template system

ContextKit templates are **executable workflows** with built-in intelligence:

### Command Templates
- **Plan workflow**: Feature specification, technical planning, task breakdown
- **Implement workflow**: Development start, commit management, app/package releases  
- **Backlog workflow**: Idea capture, bug reporting, backlog prioritization

### Automation Templates
- **Hooks**: PostToolUse auto-formatting, SessionStart version management
- **Subagents**: Build execution, accessibility checks, localization audits, error handling reviews

### Context Templates  
- **Feature templates**: Spec-kit integration with iOS/macOS constitutional principles
- **Context templates**: Workspace and project configuration with hierarchical inheritance
- **Formatter configs**: Consistent code style with `.swift-format` and `.swiftformat`

All templates include:
- **Execution flows** with branching logic and error conditions
- **Validation gates** ensuring quality standards are met
- **Constitutional compliance** with accessibility, privacy, maintainability principles
- **Variable substitution** for project-specific customization

## 📄 License

This project is licensed under the terms of the MIT open source license. Please refer to the [LICENSE](./LICENSE) file for the full terms.