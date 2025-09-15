<div align="center">
    <h1>🧠 ContextKit</h1>
    <h3><em>Systematic AI development workflows that actually work</em></h3>
</div>

<p align="center">
    <strong>Stop fighting context limits. Stop losing work between sessions. Start building features systematically with AI assistants that understand your project, your patterns, and your standards.</strong>
</p>

---

## Table of Contents

- [🤔 Why ContextKit exists](#-why-contextkit-exists)
- [⚡ Get started](#-get-started)
- [🏛️ Core philosophy](#-core-philosophy)
- [⚙️ Optimized Configuration](#-optimized-configuration)
- [🏗️ How it works](#-how-it-works)
- [🤖 Built-in Quality Agents](#-built-in-quality-agents)
- [🔧 Project-Specific Customization](#-project-specific-customization)
- [📋 Commands overview](#-commands-overview)
- [🎯 Why Claude Code](#-why-claude-code)
- [🌍 Universal but opinionated](#-universal-but-opinionated)
- [🧪 Built from real experience](#-built-from-real-experience)
- [Contributing](#contributing)

## 🤔 Why ContextKit exists

**The real problem**: AI assistants are reactive, not proactive. You have to spoon-feed them every single step: "Now create the model", "Now add the service", "Don't forget tests", "Now wire up the UI". They wait for instructions instead of understanding the bigger picture and driving the process forward.

**The frustration**: You're managing the AI instead of collaborating with it. You spend your time figuring out what to ask for next, breaking down work into AI-digestible chunks, and constantly steering the conversation. It's like having a junior developer who needs step-by-step instructions for everything.

**The solution**: ContextKit gives AI the planning intelligence to understand your project, suggest the right technical approach, break down features systematically, and guide you through proven development phases. The AI becomes a proactive partner that knows what comes next and why.

**And you stay in control**: ContextKit enables AI autonomy at the right moments while keeping you in strategic control. You review and approve the spec, tech decisions, and implementation plan at key checkpoints. The AI then executes with specialized quality agents (accessibility, localization, code cleanup) working autonomously within your approved framework.

**The key insight**: By helping AI understand your intent clearly upfront, it can work longer and more effectively without constant corrections. You spend time on strategic decisions, not fixing misunderstood implementations.

## ⚡ Get started

### 1. Install ContextKit globally

```bash
curl -fsSL https://raw.githubusercontent.com/FlineDev/ContextKit/main/install.sh | sh
```

### 2. Setup your project

Navigate to your project directory and run:

```bash
# Start Claude Code
claude

# Initialize ContextKit (auto-detects your project type)
/ctxk:proj:init
```

### 3. Build your first feature systematically

```bash
# Step 1: Define what you're building (business requirements)
/ctxk:plan:1-spec

# Step 2: Plan the technical architecture
/ctxk:plan:2-tech

# Step 3: Break down into executable tasks
/ctxk:plan:3-steps

# Step 4: Start development with full context
/ctxk:impl:start-working
```

ContextKit creates structured feature directories, maintains context between sessions, and guides you through quality checkpoints that prevent common AI development pitfalls.

> [!NOTE]
> **Early Development**: ContextKit is actively evolving with iterative improvements. While production-ready (I use it daily for all my projects), expect some rough edges as commands and agents are refined. Updates are delivered automatically - keep sending feedback to help iron out issues faster.

## 🏛️ Core philosophy

ContextKit is built on non-negotiable development principles embedded throughout all templates and workflows:

### Quality Gates
- **Accessibility-first**: VoiceOver support, dynamic type, color contrast built into every UI component
- **Privacy by design**: Privacy impact assessment, minimal data collection, user consent patterns
- **Localizability from day one**: String Catalog integration, cultural adaptation, region formatters
- **Platform-appropriate UX**: iOS/macOS Human Interface Guidelines, native patterns, platform conventions
- **Code maintainability**: Modern Swift practices, clean architecture, typed error handling

### Development Standards
- **Constitutional compliance**: All templates enforce these principles through validation gates
- **Quality over speed**: Built-in checks prevent technical debt and accessibility issues
- **Systematic approach**: Structured phases with explicit validation prevent common AI mistakes
- **Context preservation**: Smart agents keep sessions focused without verbose build output

## ⚙️ Optimized Configuration

ContextKit configures Claude Code with optimized settings for systematic development:

- **Sonnet Model Default**: Sufficient quality with proper guidance while reducing 5h-limit risk during complex planning phases
- **Custom Statusline**: Real-time monitoring so you have full transparency about the limits:
  ```
  5h-Usage: 73% (1.4h left) | Chat: ▓▓▓▓▓▓░░░░ 64% (128k/200k)
  ```
  Progress bar colors: Light Gray (<50%), Yellow (50-80%), Red (>80%) for visual context awareness

> [!TIP]
> **Disable Auto-Compact for Better Control**
>
> Type `/config` in Claude and set "Auto-compact" to **false**. Auto-compact triggers at ~85% context usage, often interrupting you when nearly finished with a task and plenty of relevant context available.
>
> **Better workflow**: Start fresh chats when needed and resume with `/ctxk:impl:start-working` – ContextKit's structured approach makes this seamless. Manual `/compact` loses unpredictable amounts of context, while fresh starts preserve your systematic progress.

## 🏗️ How it works

ContextKit implements a proven 4-phase methodology that prevents the chaos of unstructured AI development:

### Phase 1: Business Case (`/ctxk:plan:1-spec`)
Define **what** you're building and **why**, without technical details:
- User stories and acceptance criteria
- Success metrics and validation points
- Explicit uncertainty marking (no AI guessing)
- Scope boundaries (what's included, what's not)

### Phase 2: Technical Architecture (`/ctxk:plan:2-tech`)
Plan **how** you'll build it, with constitutional compliance:
- Technology choices with rationale
- Swift/SwiftUI patterns and architectural decisions
- Accessibility, localization, and privacy considerations
- Integration with existing project patterns

### Phase 3: Implementation Tasks (`/ctxk:plan:3-steps`)
Break down **execution** into trackable work:
- File-by-file implementation tasks with S001-S999 numbering
- Parallel execution markers ([P]) for concurrent development
- Dependency chains and validation checkpoints
- Test-driven development task ordering

### Phase 4: Development (`/ctxk:impl:start-working`)
Execute with supervised autonomy and specialized quality agents:
- AI implements within your approved technical framework
- Specialized agents handle quality checks (accessibility, localization, modern code)
- Automatic cleanup of AI artifacts (leftover comments, temporary code)
- You maintain strategic oversight while AI handles tactical execution

## 🤖 Built-in Quality Agents

ContextKit includes specialized sub-agents that automatically ensure code quality at the right moments:

- **`check-accessibility`** - VoiceOver labels, color contrast, keyboard navigation, inclusive design patterns
- **`check-localization`** - String Catalog validation, cultural adaptation, region formatters, pluralization
- **`check-error-handling`** - ErrorKit patterns, typed throws, user-friendly error messages
- **`check-modern-code`** - Replace outdated APIs (Date() → Date.now, TimeInterval → Duration, async/await patterns)
- **`check-code-debt`** - Remove AI artifacts, consolidate patterns, extract reusable components
- **`build-project`** - Execute builds and report results without filling context with verbose output
- **`run-test-suite`** - Execute complete test suite with build validation and structured failure reporting
- **`run-specific-test`** - Execute specific test with build validation and focused failure analysis
- ... more to be added over time with updates!

These agents activate automatically during development phases, ensuring consistent quality without manual oversight.

## 🔧 Project-Specific Customization

ContextKit commands and quality agents can be tailored to your project's needs through **developer customization sections** in each template file:

- **Project-specific examples**: Add architectural patterns that work with your codebase
- **Language/framework overrides**: Customize behavior for Python, React, or other tech stacks
- **Team workflow adjustments**: Modify processes for your development practices

Customizations are preserved during ContextKit updates, ensuring your project-specific improvements persist while core templates stay current.

### 🔄 Seamless Updates

ContextKit automatically checks for newer versions when you start a new session and displays update notifications if available – but **never interrupts your workflow**. When you're ready to update:

- Simply type `/ctxk:proj:migrate` and ContextKit handles everything
- Your project customizations are preserved automatically
- Core templates update to the latest improvements
- New commands and agents are automatically added to your project
- Review all changes in Git before committing – full transparency
- You stay in full control of when updates happen

## 🔒 Files Safe to Customize

**These files are NEVER updated by `/ctxk:proj:migrate` once created:**

### ✅ Complete User Control (modify freely)
- **Formatter Config Files** (`.swift-format`, `.swiftformat`) - Your coding style preferences, never overwritten
- **Project Context** (`Context.md`) - Your project configuration, completely customizable
- **Feature Specifications** (`Context/Features/*/`) - Feature specs, tech plans, and steps are yours to edit
- **Workspace Context** (`[Workspace]/Context.md`) - Your workspace overrides, never touched

### ⚙️ Partial Control (customization sections preserved)
- **Commands & Agents** - Core logic updates, but your additions in "👩‍💻 DEVELOPER CUSTOMIZATIONS" sections are preserved
- **Guidelines** - Reference content updates, but your project-specific customizations are preserved

### 📝 Backlog File Management
- **Inbox Files** (`Ideas-Inbox.md`, `Bugs-Inbox.md`) - **✅ COMPLETELY USER-EDITABLE**: Edit manually, copy/paste between projects, add entries freely
- **Backlog Files** (`Ideas-Backlog.md`, `Bugs-Backlog.md`) - **❌ AI-MANAGED DATABASES**: Never edit directly! Request changes through `/ctxk:impl:start-working` sessions

**Bottom Line**: Your formatter configs, project context, features, and backlog content are completely yours. ContextKit only updates core frameworks and logic while preserving all your customizations.

## 📋 Commands overview

### Project Management
- **`/ctxk:proj:init`** - One-command project initialization with auto-detection

### Systematic Feature Development
- **Planning workflow**: `/ctxk:plan:1-spec` → `/ctxk:plan:2-tech` → `/ctxk:plan:3-steps`
- **Development**: `/ctxk:impl:start-working` with autonomous quality checks
- **Release**: `/ctxk:impl:release-app` for iOS/macOS, `/ctxk:impl:release-package` for Swift packages

### Backlog & Team Management
- **Idea capture**: `/ctxk:bckl:add-idea` with evaluation framework
- **Bug reporting**: `/ctxk:bckl:add-bug` with impact assessment
- **Prioritization**: `/ctxk:bckl:prioritize-ideas` and `/ctxk:bckl:prioritize-bugs` with binary search evaluation
- **Completion**: `/ctxk:bckl:remove-idea` and `/ctxk:bckl:remove-bug` for cleaning backlog
- **Workspace setup**: `/ctxk:proj:init-workspace` for client/team standards

<details>
<summary><strong>📋 Complete Command Reference</strong></summary>

### Project Management
- `/ctxk:proj:init` - Setup project context by auto-detecting type and configuring ContextKit
- `/ctxk:proj:init-workspace` - Configure team standards for different clients/companies
- `/ctxk:proj:migrate` - Upgrade to latest ContextKit versions

### Systematic Feature Planning
- `/ctxk:plan:1-spec` - Define requirements with business specifications and user stories (prompts interactively)
- `/ctxk:plan:2-tech` - Design architecture with technical planning and constitutional compliance
- `/ctxk:plan:3-steps` - Create numbered, trackable implementation tasks

### Quality-Driven Implementation
- `/ctxk:impl:start-working` - Begin development with context-aware guidance
- `/ctxk:impl:commit-changes` - Commit changes with smart formatting and message generation
- `/ctxk:impl:release-app` - Release to AppStore with iOS/macOS workflow automation
- `/ctxk:impl:release-package` - Publish Swift packages with release workflow

### Backlog & Issue Management
- `/ctxk:bckl:add-idea` - Add feature ideas with structured evaluation framework
- `/ctxk:bckl:add-bug` - Report bugs with impact assessment and reproduction steps
- `/ctxk:bckl:prioritize-ideas` - Prioritize ideas through strategic organization
- `/ctxk:bckl:prioritize-bugs` - Triage bugs with severity-based prioritization
- `/ctxk:bckl:remove-idea` - Remove completed or cancelled ideas from backlog
- `/ctxk:bckl:remove-bug` - Remove fixed or resolved bugs from backlog

</details>

## 🎯 Why Claude Code

ContextKit is built exclusively for Claude Code because it's currently the most advanced and mature agentic development system available. While other tools exist (Gemini CLI, OpenAI Codex), Claude Code pioneered this space and offers unique features that make ContextKit possible:

- **Commands**: Custom `/ctxk:*` commands for structured workflows
- **Hooks**: Automatic code formatting and session management  
- **Agents**: Specialized quality agents that work autonomously
- **Mature ecosystem**: Proven, stable platform for serious development work

Rather than abstracting across multiple tools, ContextKit leverages Claude Code's full feature set to deliver maximum productivity and reliability. But ContextKit could easily be forked and adjusted to the needs of other systems, given they also support commands, hooks, and agents.

## 🌍 Universal but opinionated

ContextKit follows **convention over configuration** with smart defaults for Swift/iOS development, but adapts to any technology stack through its hierarchical system:

### Swift/iOS Projects (Default Experience)
- Constitutional principles: 3-space indentation, ErrorKit patterns, accessibility-first design
- Quality gates: Accessibility compliance, localization readiness, App Store guidelines
- Release workflows: Xcode Cloud integration, App Store Connect automation
- Code formatting: swift-format + SwiftFormat with consistent style

### Other Technologies (Workspace Overrides)
- **Python/Django**: Override global guidelines with Python-specific patterns
- **React/TypeScript**: Add TypeScript guidelines, ESLint/Prettier configs
- **Client Projects**: Workspace-level overrides for different coding standards
- **Universal Core**: Planning methodology and quality framework work everywhere

The **hierarchical context system** (Global → Workspace → Project) lets you maintain consistency across all projects while adapting to client requirements or technology differences.

## 🧪 Built from real experience

ContextKit isn't theoretical - it's built from hundreds of hours developing iOS apps with AI assistants, learning from failures, and systematically improving the process:

### What I Learned
- **Hand-holding kills productivity**: Constantly figuring out what to ask the AI next wastes more time than coding manually
- **AI lacks planning intelligence**: Without structured phases, you get random code without strategic thinking
- **Context understanding is key**: AI needs to grasp your full project, not just the current task
- **Systematic beats reactive**: Preventing problems through planning is faster than fixing them later

### What I Built
- **Executable workflows**: Templates with explicit logic, validation gates, error conditions
- **Context preservation**: Features survive chat context limits through structured documentation
- **Quality enforcement**: Constitutional principles embedded in every template and command
- **Progress tracking**: S001-S999 task numbering enables precise communication and resumption

### Why It Works
ContextKit transforms AI from a powerful but unpredictable tool into a systematic development partner that **consistently** produces high-quality, maintainable code following your patterns and standards.

The result: **You build features faster, with fewer bugs, that follow your architecture, and work correctly the first time.**

## Contributing

### Template Versioning

For behavioral changes (not typos), update the line 2 header in each modified file:
- Increment **Template Version** number
- Update **Updated** date to current date

For releases, update **ContextKit** version in all template files.

### Custom Development Standards

ContextKit is opinionated about coding style (3-space indentation, explicit `self.`) and framework choices (FlineDevKit ecosystem with ErrorKit, HandySwift, etc.). If the developer customization sections aren't enough for your needs, fork this repository, modify the guidelines and templates, and update the migrate command in `Templates/Commands/proj/migrate.md` to point to your custom repo URL.

## Showcase

I created this framework for my own Indie app work (rate my apps to support my work):

<table>
  <tr>
    <th>App Icon</th>
    <th>App Name & Description</th>
    <th>Supported Platforms</th>
  </tr>
  <tr>
    <td>
      <a href="https://apps.apple.com/app/apple-store/id6476773066?pt=549314&ct=github.com&mt=8">
        <img src="https://raw.githubusercontent.com/FlineDev/HandySwiftUI/main/Images/Apps/TranslateKit.webp" width="64" />
      </a>
    </td>
    <td>
      <a href="https://apps.apple.com/app/apple-store/id6476773066?pt=549314&ct=github.com&mt=8">
        <strong>TranslateKit: App Localization</strong>
      </a>
      <br />
      AI-powered app localization with unmatched accuracy. Fast & easy: AI & proofreading, 125+ languages, market insights. Budget-friendly, free to try.
    </td>
    <td>Mac</td>
  </tr>
  <tr>
    <td>
      <a href="https://apps.apple.com/app/apple-store/id6502914189?pt=549314&ct=github.com&mt=8">
        <img src="https://raw.githubusercontent.com/FlineDev/HandySwiftUI/main/Images/Apps/FreemiumKit.webp" width="64" />
      </a>
    </td>
    <td>
      <a href="https://apps.apple.com/app/apple-store/id6502914189?pt=549314&ct=github.com&mt=8">
        <strong>FreemiumKit: In-App Purchases for Indies</strong>
      </a>
      <br />
      Simple In-App Purchases and Subscriptions: Automation, Paywalls, A/B Testing, Live Notifications, PPP, and more.
    </td>
    <td>iPhone, iPad, Mac, Vision</td>
  </tr>
  <tr>
    <td>
      <a href="https://apps.apple.com/app/apple-store/id6587583340?pt=549314&ct=github.com&mt=8">
        <img src="https://raw.githubusercontent.com/FlineDev/HandySwiftUI/main/Images/Apps/PleydiaOrganizer.webp" width="64" />
      </a>
    </td>
    <td>
      <a href="https://apps.apple.com/app/apple-store/id6587583340?pt=549314&ct=github.com&mt=8">
        <strong>Pleydia Organizer: Movie & Series Renamer</strong>
      </a>
      <br />
      Simple, fast, and smart media management for your Movie, TV Show and Anime collection.
    </td>
    <td>Mac</td>
  </tr>
  <tr>
    <td>
      <a href="https://apps.apple.com/app/apple-store/id6480134993?pt=549314&ct=github.com&mt=8">
        <img src="https://raw.githubusercontent.com/FlineDev/HandySwiftUI/main/Images/Apps/FreelanceKit.webp" width="64" />
      </a>
    </td>
    <td>
      <a href="https://apps.apple.com/app/apple-store/id6480134993?pt=549314&ct=github.com&mt=8">
        <strong>FreelanceKit: Project Time Tracking</strong>
      </a>
      <br />
      Simple & affordable time tracking with a native experience for all devices. iCloud sync & CSV export included.
    </td>
    <td>iPhone, iPad, Mac, Vision</td>
  </tr>
  <tr>
    <td>
      <a href="https://apps.apple.com/app/apple-store/id6472669260?pt=549314&ct=github.com&mt=8">
        <img src="https://raw.githubusercontent.com/FlineDev/HandySwiftUI/main/Images/Apps/CrossCraft.webp" width="64" />
      </a>
    </td>
    <td>
      <a href="https://apps.apple.com/app/apple-store/id6472669260?pt=549314&ct=github.com&mt=8">
        <strong>CrossCraft: Custom Crosswords</strong>
      </a>
      <br />
      Create themed & personalized crosswords. Solve them yourself or share them to challenge others.
    </td>
    <td>iPhone, iPad, Mac, Vision</td>
  </tr>
  <tr>
    <td>
      <a href="https://apps.apple.com/app/apple-store/id6477829138?pt=549314&ct=github.com&mt=8">
        <img src="https://raw.githubusercontent.com/FlineDev/HandySwiftUI/main/Images/Apps/FocusBeats.webp" width="64" />
      </a>
    </td>
    <td>
      <a href="https://apps.apple.com/app/apple-store/id6477829138?pt=549314&ct=github.com&mt=8">
        <strong>FocusBeats: Pomodoro + Music</strong>
      </a>
      <br />
      Deep Focus with proven Pomodoro method & select Apple Music playlists & themes. Automatically pauses music during breaks.
    </td>
    <td>iPhone, iPad, Mac, Vision</td>
  </tr>
  <tr>
    <td>
      <a href="https://apps.apple.com/app/apple-store/id6478062053?pt=549314&ct=github.com&mt=8">
        <img src="https://raw.githubusercontent.com/FlineDev/HandySwiftUI/main/Images/Apps/Posters.webp" width="64" />
      </a>
    </td>
    <td>
      <a href="https://apps.apple.com/app/apple-store/id6478062053?pt=549314&ct=github.com&mt=8">
        <strong>Posters: Discover Movies at Home</strong>
      </a>
      <br />
      Auto-updating & interactive posters for your home with trailers, showtimes, and links to streaming services.
    </td>
    <td>Vision</td>
  </tr>
</table>
