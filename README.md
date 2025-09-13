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
- [🏗️ How it works](#-how-it-works)
- [📋 Commands overview](#-commands-overview)
- [🎯 Why Claude Code](#-why-claude-code)
- [🌍 Universal but opinionated](#-universal-but-opinionated)
- [🧪 Built from real experience](#-built-from-real-experience)

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
/ctxk:plan:1-spec "Add user authentication with Apple ID"

# Step 2: Plan the technical architecture
/ctxk:plan:2-tech

# Step 3: Break down into executable tasks
/ctxk:plan:3-steps

# Step 4: Start development with full context
/ctxk:impl:start-working
```

ContextKit creates structured feature directories, maintains context between sessions, and guides you through quality checkpoints that prevent common AI development pitfalls.

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
- Specialized subagents handle quality checks (accessibility, localization, modern code)
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

These agents activate automatically during development phases, ensuring consistent quality without manual oversight.

## 🔧 Project-Specific Customization

ContextKit commands and quality agents can be tailored to your project's needs through **developer customization sections** in each template file:

- **Project-specific examples**: Add architectural patterns that work with your codebase
- **Language/framework overrides**: Customize behavior for Python, React, or other tech stacks
- **Team workflow adjustments**: Modify processes for your development practices

Customizations are preserved during ContextKit updates, ensuring your project-specific improvements persist while core templates stay current.

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
- **Workspace setup**: `/ctxk:proj:init-workspace` for client/team standards

<details>
<summary><strong>📋 Complete Command Reference</strong></summary>

### Project Management
- `/ctxk:proj:init` - **Setup Project Context** - Auto-detect project type and configure ContextKit
- `/ctxk:proj:init-workspace` - **Configure Team Standards** - Workspace-level settings for different clients/companies
- `/ctxk:proj:migrate` - **Upgrade to Latest** - Update existing projects to newer ContextKit versions

### Systematic Feature Planning
- `/ctxk:plan:1-spec` - **Define Requirements** - Create business specifications with user stories
- `/ctxk:plan:2-tech` - **Design Architecture** - Technical planning with constitutional compliance
- `/ctxk:plan:3-steps` - **Create Task List** - Break down into numbered, trackable implementation tasks

### Quality-Driven Implementation
- `/ctxk:impl:start-working` - **Begin Development** - Context-aware development guidance
- `/ctxk:impl:commit-changes` - **Commit Changes** - Smart formatting and commit message generation
- `/ctxk:impl:release-app` - **Release to AppStore** - iOS/macOS release workflow with automation
- `/ctxk:impl:release-package` - **Publish Package** - Swift Package release and publishing

### Backlog & Issue Management
- `/ctxk:bckl:add-idea` - **Add Feature Idea** - Structured idea capture with evaluation framework
- `/ctxk:bckl:add-bug` - **Report Bug** - Impact assessment and reproduction steps
- `/ctxk:bckl:prioritize-ideas` - **Prioritize Ideas** - Strategic backlog organization
- `/ctxk:bckl:prioritize-bugs` - **Triage Bugs** - Severity-based bug prioritization

</details>

## 🎯 Why Claude Code

ContextKit is built exclusively for Claude Code because it's currently the most advanced and mature agentic development system available. While other tools exist (Gemini CLI, OpenAI Codex), Claude Code pioneered this space and offers unique features that make ContextKit possible:

- **Commands**: Custom `/ctxk:*` commands for structured workflows
- **Hooks**: Automatic code formatting and session management  
- **Subagents**: Specialized quality agents that work autonomously
- **Mature ecosystem**: Proven, stable platform for serious development work

Rather than abstracting across multiple tools, ContextKit leverages Claude Code's full feature set to deliver maximum productivity and reliability. But ContextKit could easily be forked and adjusted to the needs of other systems, given they also support commands, hooks, and subagents.

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

## Showcase

I created this framework for my own Indie app work (rate my apps to show your appreciation):

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