# Begin Development with Context
<!-- Template Version: 1 | ContextKit: 0.0.0 | Updated: 2025-09-14 -->

> [!WARNING]
> **👩‍💻 FOR DEVELOPERS**: Do not edit the content above the developer customization section - changes will be overwritten during ContextKit updates.
>
> For project-specific customizations, use the designated section at the bottom of this file.
>
> Found a bug or improvement for everyone? Please report it: https://github.com/FlineDev/ContextKit/issues

## Description
Begin systematic development with context-aware setup, task analysis, and guided implementation initiation based on completed planning phases.

## User Input Format

```
═══════════════════════════════════════════════════
║ ❓ USER INPUT REQUIRED - [Topic]
═══════════════════════════════════════════════════
║
║ [Question and context]
║
║ [Response instruction]
```

## Execution Flow (main)

### Phase 1: Prerequisites & Feature Detection

1. **Check Project Setup**
   - Use `Glob` tool to verify Context.md exists: `Glob . Context.md`
   - If Context.md missing:
     ```
     ❌ ContextKit not initialized in this project!

     Run /ctxk:proj:init first to setup ContextKit in this project.
     This command requires project context for systematic development.
     ```
     → END (exit with error)

2. **Detect Current Feature from Git Branch**
   ```bash
   git branch --show-current || echo "⚠️ Not in git repository or no current branch"
   ```
   - If branch format is `feature/[kebab-case-name]`:
     - Convert kebab-case to PascalCase (e.g., `feature/custom-model-selection` → `CustomModelSelection`)
     - Set FEATURE_NAME variable for subsequent steps
   - If not on feature branch:
     ```
     ⚠️ Not on a feature branch!

     Current branch: [current_branch_name]

     Expected: feature/[feature-name] branch from /ctxk:plan:1-spec

     Switch to feature branch or create one with /ctxk:plan:1-spec
     Continue anyway? (y/N):
     ```
     - Wait for user confirmation
     - If "N" or no response: EXIT
     - If "y": Ask user to specify feature name manually

3. **Validate Feature Planning Completion**
   - Use `Glob` tool to find numbered feature directory: `Glob Context/Features/???-[FEATURE_NAME]`
   - Use `Read` tool to check each required file exists and has content:
     ```bash
     ls -la [numbered-feature-directory]/Spec.md && echo "✅ Spec.md exists"
     ls -la [numbered-feature-directory]/Tech.md && echo "✅ Tech.md exists"
     ls -la [numbered-feature-directory]/Steps.md && echo "✅ Steps.md exists"
     ```
   - Use `Read` tool to verify Steps.md contains task breakdown (not empty placeholder)
   - If any file missing or empty:
     ```
     ❌ Feature planning incomplete!

     Missing or empty files detected:
     [List missing files]

     Complete the planning phases first:
     1. /ctxk:plan:1-spec - Business requirements
     2. /ctxk:plan:2-tech - Technical architecture
     3. /ctxk:plan:3-steps - Implementation tasks

     Cannot proceed with development until planning is complete.
     ```
     → END (exit with error)

### Phase 2: Context Loading & Environment Setup

4. **Load Development Context**
   - Use `Read` tool to read project Context.md: `Read Context.md`
   - Extract project type, architecture patterns, and coding standards
   - Use `Bash` tool to check for workspace context:
     ```bash
     cd .. && find . -name "Context.md" -path "*/Context.md" | head -1 || echo "No workspace context found"
     ```
   - If workspace Context.md found: Use `Read` tool to load workspace-specific overrides

5. **Verify Development Environment**
   ```bash
   git status --porcelain || echo "⚠️ Git not available"
   ```
   - If uncommitted changes exist:
     ```
     ⚠️ Uncommitted changes detected!

     You have uncommitted work that might be overwritten during development.
     Commit or stash changes before starting new development work.

     Continue anyway? (y/N):
     ```
     - Wait for user confirmation
     - If "N": EXIT (recommend committing first)
     - If "y": Continue with warning


### Phase 3: Task Analysis & Selection

6. **Load Implementation Plan**
   - Use `Read` tool to read Steps.md: `Read [numbered-feature-directory]/Steps.md`
   - Parse task list for pending items (unchecked boxes)
   - Extract S001-S999 numbered tasks with [P] parallel markers
   - Identify dependencies and logical execution order

7. **Select Next Task**
   - If multiple pending tasks available:
     ```
     ═══════════════════════════════════════════════════
     ║ ❓ TASK SELECTION REQUIRED
     ═══════════════════════════════════════════════════
     ║
     ║ Multiple tasks available for implementation:
     ║ [List 3-5 next available tasks with S### numbers]
     ║
     ║ Which task would you like to work on?
     ║ Enter task number (e.g., S001) or 'auto' for first available:
     ```
     - Wait for user input
     - Validate task selection for context
   - If only one available: Auto-select and continue
   - If no pending tasks: Display completion status and next steps

8. **Load Task Context**
   - Extract task details: file paths, acceptance criteria, dependencies
   - Use `Read` tool to examine target files if they exist
   - Identify constitutional principles relevant to task type (UI, models, services, etc.)

### Phase 4: Development Initiation

9. **Display Development Guidance**
    - Show current task description and acceptance criteria
    - Display relevant file paths and expected changes
    - Reference appropriate guidelines based on project type:
      - iOS/macOS App projects → `Context/Guidelines/Swift.md` and `Context/Guidelines/SwiftUI.md`
      - Swift Package projects → `Context/Guidelines/Swift.md`

10. **Initialize Task Execution**
    - Display constitutional reminders for current task type
    - Provide starting guidance based on project patterns
    - Begin implementation work

11. **Quality Assurance Integration with Targeted Context**
    - **After completing any step or significant changes**: Run systematic quality validation with targeted file analysis
    - **Context Passing**: Provide recently modified files and line ranges to focus agent analysis

    **Example Agent Calls**:
    ```
    Use Task tool with build-project:
    "Execute project build and report status."

    Use Task tool with check-modern-code:
    "Check for outdated patterns in recent code.

    FILES:
    - Sources/Services/AuthService.swift:23-89,145-201
    - Sources/Models/User.swift:45-78
    - Sources/Views/LoginView.swift

    Focus analysis on these specific areas only."

    Use Task tool with check-accessibility:
    "Check accessibility issues in recent UI changes.

    FILES:
    - Sources/Views/ProfileView.swift:34-156
    - Sources/Components/CustomButton.swift

    Focus analysis on these specific areas only."
    ```

    - **Execution Order** (run sequentially, stop and fix if any fail):
      1. `build-project` - Verify compilation (project-wide)
      2. `check-modern-code` - Modernize APIs (recent files only)
      3. `check-error-handling` - Validate error patterns (recent files only)
      4. `check-accessibility` - Check UI accessibility (recent UI files only)
      5. `check-localization` - Verify localization (recent UI files only)
      6. `check-code-debt` - Clean up artifacts (recent files only)

    - **Optional Testing Agents** (use when working on tests or before releases):
      - `run-specific-test` - When debugging a failing test or validating new test code
      - `run-test-suite` - Before package releases or after significant changes to verify full test coverage

    - **File Context Rules**:
      - Include entire function ranges for significant modifications (60%+ changed)
      - Provide full file paths for new or completely rewritten files
      - Merge nearby line ranges (e.g., 23-25,27-29 → 23-29)
      - Focus agents only on recently modified code, not entire codebase

    - **When to run**: After completing views, features, models with user-facing content, or any substantial code changes
    - **If agents fail**: Focus on fixing the specific issue before continuing, then re-run the failed agent to verify the fix

## Error Conditions

- **"Context.md not found"** → User must run `/ctxk:proj:init` to initialize ContextKit
- **"Not on feature branch"** → Create feature branch with `/ctxk:plan:1-spec` or switch to existing one
- **"Planning phases incomplete"** → Complete `/ctxk:plan:1-spec`, `/ctxk:plan:2-tech`, `/ctxk:plan:3-steps` sequence
- **"No feature directory found"** → Feature name detection failed, verify branch name format
- **"Steps.md empty"** → Run `/ctxk:plan:3-steps` to create implementation breakdown
- **"Build environment broken"** → Resolve dependency issues before starting development
- **"All tasks complete"** → No pending work, consider `/ctxk:impl:commit-changes` or new feature

## Validation Gates

**Prerequisites:**
- ContextKit project setup complete?
- Git repository with feature branch active?
- All planning phases completed (Spec.md, Tech.md, Steps.md)?
- Development environment verified and functional?

**Context Loading:**
- Project and workspace context loaded successfully?
- Constitutional principles identified for project type?
- Development patterns and standards accessible?

**Task Selection:**
- Implementation plan parsed successfully?
- Valid task selected with clear acceptance criteria?
- Task dependencies satisfied and ready for execution?

**Development Ready:**
- Quality assurance hooks enabled?
- Relevant guidelines referenced for task type?
- Development guidance displayed and ready to proceed?

## Integration Points

- **Planning Commands**: Requires completed `/ctxk:plan:1-spec`, `/ctxk:plan:2-tech`, `/ctxk:plan:3-steps` workflow
- **Project Setup**: Uses Context.md from `/ctxk:proj:init` for project type detection and standards
- **Quality Agents**: Integrates with `/run check-*` agents for autonomous quality validation
- **Workspace Context**: Inherits client-specific requirements from workspace-level Context.md files
- **Git Workflow**: Works within feature branch structure established by planning commands
- **Development Hooks**: Enables PostToolUse formatting and SessionStart version checking
- **Task Tracking**: Updates Steps.md progress tracking for systematic development workflow

## Success Messages

### Development Session Started
```
🚀 Development session started for [FeatureName]

📋 Current Task: [TaskNumber] [TaskDescription]
📂 Files to modify: [file_paths]
📖 Guidelines: Context/Guidelines/[RelevantGuideline].md

⚡ Quality validation runs automatically after substantial changes:
   build-project → check-modern-code → check-error-handling → check-accessibility → check-localization

💡 Ready to implement!
```

### All Tasks Complete
```
🎉 Feature [FeatureName] implementation complete!

🔗 Next steps:
   1. Quality validation will run automatically
   2. Test functionality manually
   3. Commit: /ctxk:impl:commit-changes
   4. Release: /ctxk:impl:release-app [version]
```

════════════════════════════════════════════════════════════════════════════════
👩‍💻 DEVELOPER CUSTOMIZATIONS - EDITABLE SECTION
════════════════════════════════════════════════════════════════════════════════

This section is preserved during ContextKit migrations and updates.
Add project-specific instructions, examples, and overrides below.

## Custom Task Selection Logic
<!-- Override automatic task selection with project-specific priority rules -->

## Additional Environment Checks
<!-- Add project-specific dependency or tool verification steps -->

## Custom Constitutional Reminders
<!-- Add project-specific architectural principles or coding standards -->