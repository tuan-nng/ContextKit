![ContextKit Logo](https://github.com/tuan-nng/ContextKit/blob/main/Logo.png?raw=true)

<p align="center">
    <strong>Stop fighting context limits. Stop micro-managing Cursor. Start building features systematically and make AI produce closer to production-ready code on first try.</strong>
</p>

---

<p align="center" style="color: #666;">
    <strong>Quick Navigation</strong><br>
    <a href="#-get-started">Get started</a> • <a href="#%EF%B8%8F-how-it-works">How it works</a> • <a href="#-commands-overview">Commands</a> • <a href="#-universal-but-opinionated">Universal platform support</a> • <a href="#%EF%B8%8F-comparison-with-other-ai-systems">Comparison</a>
</p>


## 🤔 Why ContextKit exists

**The real problem**: AI assistants are reactive, not proactive. You have to spoon-feed them every single step: "Now create the model", "Now add the service", "Don't forget tests", "Now wire up the UI". They wait for instructions instead of understanding the bigger picture and driving the process forward.

**The frustration**: You're managing the AI instead of collaborating with it. You spend your time figuring out what to ask for next, breaking down work into AI-digestible chunks, and constantly steering the conversation. It's like having a junior developer who needs step-by-step instructions for everything.

**The solution**: ContextKit gives AI the planning intelligence to understand your project, suggest the right technical approach, break down features systematically, and guide you through proven development phases. The AI becomes a proactive partner that knows what comes next and why.

**And you stay in control**: ContextKit enables AI autonomy at the right moments while keeping you in strategic control. You review and approve the spec, tech decisions, and implementation plan at key checkpoints. The AI then executes with specialized quality agents (accessibility, localization, code cleanup) working autonomously within your approved framework.

**The key insight**: By helping AI understand your intent clearly upfront, it can work longer and more effectively without constant corrections. You spend time on strategic decisions, not fixing misunderstood implementations.


## ⚡ Get started

### 1. Install ContextKit globally

```bash
curl -fsSL https://raw.githubusercontent.com/tuan-nng/ContextKit/main/install.sh | bash
```

### 2. Setup your project

Navigate to your project directory and open in Cursor:

```bash
cursor .
```

In Cursor's Composer (`Cmd/Ctrl+I`), reference the initialization template:

```
@~/.ContextKit/Templates/Commands/proj/init.md
```

The AI will follow the initialization workflow to:
- Auto-detect your project type and tech stack
- Create `.cursor/rules/` directory with ContextKit commands
- Set up systematic development structure
- Generate comprehensive project context

### 3. Build your first feature systematically

After initialization, use slash commands in Cursor's Composer:

```
/ctxk-plan-spec         # Step 1: Define what you're building (business requirements)
/ctxk-plan-research     # Step 2: Plan the technical architecture
/ctxk-plan-steps        # Step 3: Break down into executable tasks
/ctxk-impl-start        # Step 4: Start development with full context
```

ContextKit creates structured feature directories, maintains context between sessions, and guides you through quality checkpoints that prevent common AI development pitfalls.

> [!NOTE]
> **After initialization**, ContextKit commands are available as **slash commands** (e.g., `/ctxk-plan-spec`). Type `/` in Cursor's Composer to see all available commands with autocomplete.

> [!NOTE]
> **Early Development**: ContextKit is actively evolving with iterative improvements. While production-ready (I use it daily for all my projects), expect some rough edges as commands are refined. ContextKit updates itself globally when you start new sessions, and the migrate command makes updating your project files easy - keep sending feedback to help iron out issues faster.


## ⚙️ Optimized Configuration

ContextKit provides systematic development guidance for Cursor:

- **Context Management**: Structured feature documentation ensures context preservation across sessions
- **Progressive Planning**: Breaking down work into manageable phases helps manage Cursor's context limits
- **Documentation-First**: All planning phases create markdown files that can be referenced using `@` mentions in Cursor

> [!TIP]
> **Managing Context in Cursor**
>
> ContextKit's structured approach works naturally with Cursor's composer:
> - Reference planning documents with `@` mentions (e.g., `@Context/Features/UserAuth/Spec.md`)
> - Start fresh composers when needed and resume with `/ctxk-impl-start`
> - Use `@Codebase` for broad searches and `@Files` for specific references
> - ContextKit's systematic progress tracking makes context recovery seamless


## 🏗️ How it works

ContextKit implements a proven 4-phase methodology that prevents the chaos of unstructured AI development:

### Phase 1: Business Case (`/ctxk-plan-spec`)
Define **what** you're building and **why**, without technical details:
- User stories and acceptance criteria
- Success metrics and validation points
- Explicit uncertainty marking (no AI guessing)
- Scope boundaries (what's included, what's not)

### Phase 2: Technical Architecture (`/ctxk-plan-research`)
Plan **how** you'll build it, with constitutional compliance:
- Technology choices with rationale
- Frontend/backend patterns and architectural decisions
- Accessibility, security, and performance considerations
- Integration with existing project patterns

### Phase 3: Implementation Tasks (`/ctxk-plan-steps`)
Break down **execution** into trackable work:
- File-by-file implementation tasks with S001-S999 numbering
- Parallel execution markers ([P]) for concurrent development
- Dependency chains and validation checkpoints
- Test-driven development task ordering

### Phase 4: Development (`/ctxk-impl-start`)
Execute with supervised autonomy and specialized quality agents (requires feature branch + completed planning phases):
- AI implements within your approved technical framework
- Specialized agents handle quality checks (accessibility, localization, modern code)
- Automatic cleanup of AI artifacts (leftover comments, temporary code)
- You maintain strategic oversight while AI handles tactical execution


## 📋 Commands overview

### Project Management
- **Initialization** - Reference `@~/.ContextKit/Templates/Commands/proj/init.md` to set up project

### Systematic Feature Development
- **Planning workflow**: `/ctxk-plan-spec` → `/ctxk-plan-research` → `/ctxk-plan-steps`
- **Development**: `/ctxk-impl-start` with quality checks
- **Commit**: `/ctxk-impl-commit` with smart formatting
- **Release**: `/ctxk-impl-release` for npm packages

### Backlog & Team Management

**Note**: Backlog commands are relatively new and might get major refinements soon

- **Idea capture**: `/ctxk-bckl-add-idea` with evaluation framework
- **Bug reporting**: `/ctxk-bckl-add-bug` with impact assessment
- **Prioritization**: `/ctxk-bckl-prioritize-ideas` and `/ctxk-bckl-prioritize-bugs` with strategic organization
- **Completion**: `/ctxk-bckl-remove-idea` and `/ctxk-bckl-remove-bug` for cleaning backlog
- **Workspace setup**: Reference workspace init command for client/team standards

<details>
<summary><strong>📋 Complete Command Reference</strong></summary>

### Project Management
- **Initialize** - `@~/.ContextKit/Templates/Commands/proj/init.md` - Setup project context by auto-detecting type
- **Workspace** - `@~/.ContextKit/Templates/Commands/proj/init-workspace.md` - Configure team standards
- **Migrate** - `@~/.ContextKit/Templates/Commands/proj/migrate.md` - Upgrade to latest ContextKit

### Systematic Feature Planning (Slash Commands)
- `/ctxk-plan-spec` - Define requirements with business specifications and user stories
- `/ctxk-plan-research` - Design architecture with technical planning and constitutional compliance
- `/ctxk-plan-steps` - Create numbered, trackable implementation tasks

### Quality-Driven Implementation (Slash Commands)
- `/ctxk-impl-start` - Begin development with context-aware guidance
- `/ctxk-impl-commit` - Commit changes with smart formatting and message generation
- `/ctxk-impl-release` - Publish npm packages with release workflow

### Backlog & Issue Management (Slash Commands)
- `/ctxk-bckl-add-idea` - Add feature ideas with structured evaluation framework
- `/ctxk-bckl-add-bug` - Report bugs with impact assessment and reproduction steps
- `/ctxk-bckl-prioritize-ideas` - Prioritize ideas through strategic organization
- `/ctxk-bckl-prioritize-bugs` - Triage bugs with severity-based prioritization
- `/ctxk-bckl-remove-idea` - Remove completed or cancelled ideas from backlog
- `/ctxk-bckl-remove-bug` - Remove fixed or resolved bugs from backlog

</details>


## 🤖 Built-in Quality Guidelines

ContextKit includes specialized quality check guidelines that help ensure code quality at the right moments:

- **`build-project`** - Execute builds and report results without filling context with verbose output
- **`run-test-suite`** - Execute complete test suite with build validation and structured failure reporting
- **`run-specific-test`** - Execute specific test with build validation and focused failure analysis
- [IN PROGRESS] **`check-accessibility`** - VoiceOver labels, color contrast, keyboard navigation, inclusive design patterns
- [IN PROGRESS] **`check-localization`** - String Catalog validation, cultural adaptation, region formatters, pluralization
- [IN PROGRESS] **`check-error-handling`** - ErrorKit patterns, typed throws, user-friendly error messages
- [IN PROGRESS] **`check-modern-code`** - Replace outdated APIs (Date() → Date.now, TimeInterval → Duration, async/await patterns)
- [IN PROGRESS] **`check-code-debt`** - Remove AI artifacts, consolidate patterns, extract reusable components

- ... more to be added over time with updates!

These guidelines are available as documentation in `Context/Guidelines/` and can be referenced in Cursor using `@` mentions, **adapting to your detected tech stack** for consistent quality.


## 🔄 Seamless Updates

ContextKit automatically checks for newer versions when you initialize and displays update notifications if available – but **never interrupts your workflow**. When you're ready to update:

- Reference the migrate command: `@.cursor/rules/ctxk/proj/migrate.md` and ContextKit handles everything
- Your project customizations are preserved automatically
- Core templates update to the latest improvements
- New commands and guidelines are automatically added to your project
- Review all changes in Git before committing – full transparency
- You stay in full control of when updates happen


## 🔒 Files Safe to Customize

**These files are NEVER updated by the migrate command once created:**

### ✅ Complete User Control (modify freely)
- **Formatter Config Files** (`.prettierrc`, `.eslintrc`, etc.) - Your coding style preferences, never overwritten
- **Project Context** (`Context.md`) - Your project configuration, completely customizable
- **Feature Specifications** (`Context/Features/*/`) - Feature specs, research, tech plans, and steps are yours to edit

### ⚙️ Partial Control (customization sections preserved)
- **Commands & Guidelines** - Core logic updates, but your additions in "👩‍💻 DEVELOPER CUSTOMIZATIONS" sections are preserved
- **Reference Documentation** - Reference content updates, but your project-specific customizations are preserved

### 📝 Backlog File Management
- **Inbox Files** (`Ideas-Inbox.md`, `Bugs-Inbox.md`) - **✅ COMPLETELY USER-EDITABLE**: Edit manually, copy/paste between projects, add entries freely
- **Backlog Files** (`Ideas-Backlog.md`, `Bugs-Backlog.md`) - **❌ AI-MANAGED DATABASES**: Never edit directly! Use `/ctxk-bckl-prioritize-*` and `/ctxk-bckl-remove-*` commands

**Bottom Line**: Your formatter configs, project context, features, and backlog content are completely yours. ContextKit only updates core frameworks and logic while preserving all your customizations.


## 🎯 Why Cursor

ContextKit is adapted for Cursor to bring systematic development workflows to one of the most popular AI-powered code editors:

- **Composer Integration**: Natural `@` mention system for referencing commands and documentation
- **Context Management**: Smart context handling with file references and codebase search
- **Quality Tools**: Extensive built-in tools for code analysis and modification
- **Active Development**: Rapidly evolving platform with strong community support

ContextKit leverages Cursor's composer and context system to provide structured workflows without requiring custom hooks or agents. The systematic planning and documentation approach works naturally with Cursor's `@` mention system for referencing files and commands.


## 🌍 Universal but opinionated

ContextKit is **genuinely platform-agnostic** through intelligent project detection and adaptive workflows:

### 🔍 **Automatic Platform Detection**
When you run the initialization workflow, ContextKit analyzes your project and documents everything in `Context.md`:
- **Technology stack**: React/TypeScript, Vue/TypeScript, Node.js/Express, Next.js, etc.
- **Build system**: npm/pnpm/yarn scripts, Vite, webpack, etc.
- **Dependencies**: package.json, package-lock.json, pnpm-lock.yaml
- **Project structure**: Monorepo, multi-module, single-app architecture

This `Context.md` becomes the source of truth that **every ContextKit command reads** to understand your specific setup. It's also automatically included in your `.cursorrules` file (or creates one if missing) to ensure every new session starts with full project context.

### 📋 **Platform-Specific Guidelines & Configs**
- **Currently available**: `TypeScript.md`, `React.md` guidelines for web development
- **Community contributions welcome**: `Vue.md`, `Node.md`, `Python.md` guidelines + your platform's formatter configs
- **Project customization**: All commands/templates include a "👩‍💻 DEVELOPER CUSTOMIZATIONS" section for project-specific overrides (preserved during updates)

**The result**: ContextKit feels native to YOUR tech stack while maintaining systematic development methodology across all platforms.

## 🧪 Built from real experience

ContextKit isn't theoretical - it's built from hundreds of hours developing web applications with AI assistants, learning from failures, and systematically improving the process:

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

The result: **You build features with fewer iterations, less manual cleanup, and better alignment with your architecture.**

## ⚖️ Comparison with other AI systems

[Spec Kit](https://github.com/github/spec-kit) was actually the inspiration for the planning part of ContextKit and focuses more on team-based workflows and the idea is to make specification files "executable" with constitutional compliance gates which can slow down rapid prototyping. It's optimized for larger companies to let server farms run various implementations in parallel to then choose the best one, rather than improving single-developer workflows, which ContextKit focuses on.

[BMAD-METHOD](https://github.com/bmad-code-org/BMAD-METHOD) simulates complete team coordination with specialized roles handling different aspects (PM creates PRDs, Architect designs systems, QA does comprehensive review), making it powerful for complex projects but overwhelming for solo work. ContextKit focuses on individual productivity with easy-to-learn and adjust planning commands, guidelines, and more.

[Serena](https://github.com/oraios/serena) enhances AI workflows with semantic understanding and excels at refactoring existing code but won't help with planning or architecture decisions. ContextKit has some semantic understanding, too, but is more like an "overall" system that doesn't focus only on this one aspect. Serena could probably be used to enhance refactoring capabilities if combined with ContextKit.

## Contributing

ContextKit thrives as a **community effort** to make AI development better for everyone. Whether you're fixing bugs, adding platform support, or sharing improvements - your contributions help developers worldwide build better software with AI.

### 🤝 **Ways to Contribute**
- **Platform Guidelines**: Add `React.md`, `Kotlin.md`, `Python.md`, etc. for your favorite tech stacks
- **Formatter Configs**: Share your platform's code formatting configurations
- **Bug Reports**: Help us identify and fix issues in templates and workflows
- **Feature Improvements**: Enhance existing commands and agents based on real usage
- **Documentation**: Improve examples, clarify instructions, fix typos

### 📋 **Template Versioning**

For behavioral changes (not typos), update the line 2 header in each modified file:
- Increment **Template Version** number
- Update **Updated** date to current date

**Note**: Don't modify the ContextKit version numbers - I'll handle that during releases.

## Showcase

I created this to ship features faster in my own Indie apps (rate them to support my work!):

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
