# Begin Development with Context
<!-- Template Version: 16 | ContextKit: 0.1.0 | Updated: 2025-10-02 -->

> [!WARNING]
> **👩‍💻 FOR DEVELOPERS**: Do not edit the content above the developer customization section - changes will be overwritten during ContextKit updates.
>
> For project-specific customizations, use the designated section at the bottom of this file.
>
> Found a bug or improvement for everyone? Please report it: https://github.com/tuan-nng/ContextKit/issues

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

### Phase 0: Check Customization

0. **Read the "👩‍💻 DEVELOPER CUSTOMIZATIONS" section**
   - Use `Grep` tool to find the start of the section
   - Read everything below that line contained in this document til the end of the file
   - Make sure to consider what was said there with high priority
   - If anything conflicts with the rest of the workflow, prioritize the "developer customizations"

### Phase 1: Prerequisites & Feature Detection

1. **Check Project Setup**
   - Use `Glob` tool to verify Context.md exists: `Glob . Context.md`
   - If Context.md missing:
     ```
     ❌ ContextKit not initialized in this project!

     Run @ctxk:proj:init first to setup ContextKit in this project.
     This command requires project context for systematic development.
     ```
     → END (exit with error)

2. **Detect Current Feature from Git Branch**
   ```bash
   git branch --show-current || echo "⚠️ Not in git repository or no current branch"
   ```
   - If branch format is `feature/[prefix]-[kebab-case-name]`:
     - Extract full name from branch (e.g., `feature/001-visionos26-modernization` → `001-visionos26-modernization`)
     - Set FEATURE_NAME variable for directory matching
   - If not on feature branch:
     ```
     ⚠️ Not on a feature branch!

     Current branch: [current_branch_name]

     Expected: feature/[prefix]-[feature-name] branch from @ctxk:plan:1-spec

     Switch to feature branch or create one with @ctxk:plan:1-spec
     Continue anyway? (y/N):
     ```
     - Wait for user confirmation
     - If "N" or no response: EXIT
     - If "y": Ask user to specify feature name manually

3. **Validate Feature Planning Completion**
   - Use `Bash` tool to find numbered feature directory with flexible matching:
     ```bash
     # Try exact full name match first
     FEATURE_DIR=$(ls -d Context/Features/*/ | grep -i "[FEATURE_NAME]" | head -1)
     # If no match, try number-based matching (extract prefix number)
     if [[ -z "$FEATURE_DIR" ]]; then
       PREFIX=$(echo "[FEATURE_NAME]" | cut -d'-' -f1)
       FEATURE_DIR=$(ls -d Context/Features/${PREFIX}-*/ 2>/dev/null | head -1)
     fi
     ```
   - Expected format: `Context/Features/###-FeatureName/` (e.g., `001-VisionOS26Modernization/`)
   - Handles variations between prefixed kebab-case branch names and numbered PascalCase directory names
   - Use `Read` tool to check each required file exists and has content:
     ```bash
     ls -la [numbered-feature-directory]/Spec.md && echo "✅ Spec.md exists"
     ls -la [numbered-feature-directory]/Research.md && echo "✅ Research.md exists"
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
     1. @ctxk:plan:1-spec - Business requirements (creates Spec.md)
     2. @ctxk:plan:2-research-tech - Technical research and architecture (creates Research.md and Tech.md)
     3. @ctxk:plan:3-steps - Implementation tasks (creates Steps.md)

     Cannot proceed with development until planning is complete.
     ```
     → END (exit with error)

### Phase 2: Context Loading & Environment Setup

4. **Load Development Context**
   - Use `Read` tool to read project Context.md: `Read Context.md`
   - **DEEP ANALYSIS REQUIRED**: Understand project type, architecture patterns, coding standards, and constitutional principles
   - Use `Bash` tool to check for workspace context:
     ```bash
     cd .. && find . -name "Context.md" -path "*/Context.md" | head -1 || echo "No workspace context found"
     ```
   - If workspace Context.md found: Use `Read` tool to load workspace-specific overrides
   - **CRITICAL**: This context forms the foundation for understanding how to execute all Steps.md tasks

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


### Phase 3: Steps.md-Driven Development Execution

6. **Load Complete Feature Context - DEEP UNDERSTANDING REQUIRED**
   - Use `Read` tool to read all planning files for complete understanding:
     ```
     Read [numbered-feature-directory]/Spec.md       # Business requirements and user stories
     Read [numbered-feature-directory]/Research.md   # Technical research findings and decisions
     Read [numbered-feature-directory]/Tech.md       # Technical architecture and decisions
     Read [numbered-feature-directory]/Steps.md      # PRIMARY TASK LIST - Implementation breakdown
     ```
   - **CRITICAL - DEEP ANALYSIS REQUIRED**:
     - **From Spec.md**: Fully understand feature purpose, ALL user stories, ALL acceptance criteria, user experience requirements
     - **From Research.md**: Completely understand technology research findings, API constraints, integration patterns, external dependencies
     - **From Tech.md**: Thoroughly understand architecture decisions, technology choices, ALL constraints, design patterns
     - **From Steps.md**: **THIS IS THE PRIMARY TASK LIST** - Parse ALL S001-S999 numbered tasks, [P] parallel markers, dependencies, file paths, acceptance criteria
   - **Parse Steps.md as Primary Task List**:
     - Identify ALL tasks with their exact S### numbers
     - Parse completion status (checked/unchecked boxes) for each task
     - Extract dependencies for each task
     - Note which tasks have [P] parallel markers
     - Extract file paths and specific requirements for each task

7. **Execute Steps.md Tasks Sequentially - NO SHORTCUTS ALLOWED**
   - **PRIMARY OBJECTIVE**: Follow Steps.md step-by-step as the definitive task list
   - Find the **first uncompleted task** in S001, S002, S003... sequence from Steps.md
   - **ABSOLUTE REQUIREMENT**: Do NOT skip tasks, do NOT choose "easier" tasks, do NOT take shortcuts
   - **ABSOLUTE REQUIREMENT**: Do NOT assume tasks are complete - follow the plan exactly
   - Check dependencies are satisfied:
     - Extract "Dependencies: S001, S002" from task description in Steps.md
     - Verify all dependency tasks are completed (checked boxes in Steps.md)
     - If dependencies not met: Display which specific tasks need completion first
   - **CRITICAL RULE**: Steps.md is the master plan - follow it religiously, never deviate
   - **NEVER SPEED UP**: Do NOT execute multiple steps at once - handle ONE task at a time
   - **NEVER ASSUME**: Do NOT assume tasks are simple or can be batched - follow each step individually
   - **NEVER AUTOMATE THE PROCESS**: Each step requires individual attention and execution
   - If no valid next task available: Display completion status and guide user to next phase
   - **Steps.md drives everything** - it's not just a reference, it's the execution plan

   **🚨 CRITICAL: TOKEN LIMITS ARE IRRELEVANT**
   - **NEVER optimize for token limits** - quality and thoroughness are paramount
   - **NEVER rush through steps** to fit within a session - take the time each step needs
   - **Session boundaries don't matter** - progress is tracked in Steps.md
   - **Just ignore token limit concerns** - continue working methodically
   - If context usage exceeds 80%: Pause and suggest user runs `/compact` before continuing
   - If session ends due to token limit: User can easily resume (Steps.md has all progress)
   - The entire workflow is designed to be resumable across multiple sessions
   - **Each step deserves proper attention** - never sacrifice quality for speed

8. **Execute Current Task from Steps.md - Follow the Plan Exactly**

   **CRITICAL**: The current task comes directly from Steps.md - execute exactly as specified, no shortcuts

   **For MANUAL REQUIRED Tasks** (marked with ⚠️ MANUAL REQUIRED in Steps.md):

   **CRITICAL**: Always use the standardized user input box format below - never use custom formatting:

   ```
   ═══════════════════════════════════════════════════
   ║ 👤 MANUAL TASK REQUIRED - [TaskNumber from Steps.md]
   ═══════════════════════════════════════════════════
   ║
   ║ 📋 TASK FROM STEPS.md: [Exact task description from Steps.md]
   ║ 📂 Files: [Exact file paths from Steps.md]
   ║ 🛠️ Manual steps required:
   ║ [Extract detailed manual instructions from Steps.md task notes]
   ║
   ║ 📝 FULL CONTEXT (from planning files):
   ║ • Feature purpose: [Complete understanding from Spec.md]
   ║ • Technical approach: [Complete understanding from Tech.md]
   ║ • Why this task: [Reason from Steps.md context]
   ║ • Current progress: [completed_tasks]/[total_tasks] tasks done in Steps.md
   ║
   ║ Please complete this manual task exactly as specified, then return here.
   ║
   ║ Options:
   ║ ✅ 'done' - I completed the manual task (will mark as ✅ in Steps.md)
   ║ ⏭️  'skip' - Skip this task for now (breaks planned sequence)
   ║ ❓ 'help' - Show more detailed instructions from Steps.md
   ║ 🔙 'back' - Return to task selection
   ║
   ║ Status:
   ```

   **For AUTOMATED Tasks** (no manual markers in Steps.md):

   **CRITICAL**: Execute exactly as specified in Steps.md - no shortcuts or assumptions:
   ```
   ═══════════════════════════════════════════════════
   ║ 🚀 AUTOMATED TASK - [TaskNumber from Steps.md]
   ═══════════════════════════════════════════════════
   ║
   ║ 📋 TASK FROM STEPS.md: [Exact task description from Steps.md]
   ║ 📂 Files to modify: [Exact file paths from Steps.md]
   ║ 🎯 Acceptance criteria: [Criteria from Steps.md]
   ║ 🔗 Dependencies: [Dependencies listed in Steps.md]
   ║
   ║ 📝 FULL CONTEXT FOR IMPLEMENTATION:
   ║ • Feature specification: [Complete understanding from Spec.md]
   ║ • Technical architecture: [Complete understanding from Tech.md]
   ║ • Research findings: [Complete understanding from Research.md]
   ║ • Current progress: [completed_tasks]/[total_tasks] tasks done in Steps.md
   ║
   ║ 🔧 IMPLEMENTATION APPROACH:
   ║ [How this will be implemented based on complete context understanding]
   ║
   ║ Ready to execute this Steps.md task? (Y/n):
   ```

   **IMPORTANT**:
   - Task details come DIRECTLY from Steps.md - never modify or interpret
   - Use complete context from Spec.md, Tech.md, Research.md for implementation
   - Do NOT skip steps or take shortcuts - follow Steps.md exactly
   - Wait for user confirmation before proceeding
   - If "n": Ask for clarification but emphasize Steps.md must be followed

### Phase 4: Task Execution with Steps.md as Central Progress Tracker

9. **Execute Task Implementation with Complete Context**
   - **For Manual Tasks**: User delegation complete, immediately mark as done in Steps.md
   - **For Automated Tasks**: Implement using complete context understanding:
     - **Use ALL context from planning files**: Apply complete understanding from Spec.md, Tech.md, Research.md
     - Extract detailed task information from Steps.md: file paths, acceptance criteria, dependencies
     - Use `Read` tool to examine target files if they exist
     - Use `Glob` tool to discover available guidelines: `Glob Context/Guidelines *.md`
     - For each found guideline file, use `Read` tool to load and apply content
     - Apply constitutional principles relevant to task type (UI, models, services, etc.)
     - **Execute exactly as planned in Steps.md** - no shortcuts, no assumptions
     - Ensure implementation meets all criteria specified in Steps.md

10. **Update Steps.md Progress Tracking - CENTRAL TO WORKFLOW**
    - **IMMEDIATELY after task completion**: Use `Edit` tool to mark completed task as checked in Steps.md:
      ```
      OLD: - [ ] **S001** [task description]
      NEW: - [x] **S001** [task description]
      ```
    - **Add completion timestamp**: Update task notes with completion time
    - **🚨 CRITICAL**: Steps.md is THE authoritative progress tracker
    - **Even if using TodoWrite**: Steps.md is the real source of truth, not the todo list
    - TodoWrite is just for temporary session tracking - Steps.md persists across all sessions
    - Verify the checkbox update was successful before proceeding
    - **This enables session continuity**: Any new session can resume by reading Steps.md

11. **Continue Sequential Execution - No Exit Until All Done**
    - **IMMEDIATELY after updating Steps.md**: Check for next sequential task
    - **Do NOT exit** - continue with next task in sequence according to Steps.md
    - Display progress update based on Steps.md status:
    ```
    ✅ Task [TaskNumber] completed and marked in Steps.md!

    📊 Progress: [completed_tasks+1]/[total_tasks] tasks done per Steps.md
    🔄 Loading next task from Steps.md...
    ```
    - Return to Phase 3, Step 7 to determine next task from Steps.md
    - **Only exit when**:
      - ALL Steps.md tasks completed (all checkboxes checked)
      - Dependency blocking prevents any task execution
      - User explicitly requests to stop
    - **The goal**: Complete the entire Steps.md task list systematically

12. **Quality Guidelines Reference**
    - **QUALITY GUIDELINES FOR IMPLEMENTATION**: Reference these throughout development as specified in Steps.md
      - **Build validation** - Use Context.md documented build commands whenever Steps.md mentions "build" or "compile"
      - **Commit workflow** - Use `@ctxk:impl:commit-changes` at ALL milestone markers in Steps.md (🏁 MILESTONE)
      - **Test execution** - Use Context.md documented test commands when Steps.md specifies test execution

    **Quality Guidelines Usage Examples**:
    ```
    # When Steps.md task says "build" or at Phase 5 validation tasks:
    # Execute build command from Context.md (e.g., "swift build" or "xcodebuild...")
    [run documented build command]

    # At every 🏁 MILESTONE marker in Steps.md:
    @ctxk:impl:commit-changes
    (Command analyzes changes and creates smart commit message)

    # When Steps.md specifies test execution:
    # Execute test command from Context.md (e.g., "swift test" or "npm test")
    [run documented test command]

    # For specific test targeting:
    # Use grep to find test and run it specifically
    [run documented test command with filter]
    ```

    - **When to build**:
      - After implementing significant functionality (service layer, UI components)
      - Before milestone commits to ensure code compiles
      - When Steps.md tasks explicitly mention "build validation"
      - After resolving dependency or integration issues

    - **When to commit (use @ctxk:impl:commit-changes)**:
      - At EVERY 🏁 MILESTONE marker in Steps.md
      - After completing a logical phase of work (data layer, UI layer, etc.)
      - When directed by Steps.md milestone instructions
      - Command handles git analysis, formatting, and commit message generation

    - **When to run tests**:
      - When Steps.md Phase 5 tasks specify test execution
      - After implementing new test files
      - Before milestone commits when tests exist
      - When debugging failing tests

    - **Code Quality Guidelines** (reference during implementation):
      - Check Context/Guidelines/ for tech-stack-specific best practices
      - For Swift: @Context/Guidelines/Swift.md, @Context/Guidelines/SwiftUI.md
      - Review before finalizing features for consistent patterns

    - **If build/test fails**: Focus on fixing the specific issue before continuing, then re-run to verify the fix

## Error Conditions

- **"Context.md not found"** → User must run `@ctxk:proj:init` to initialize ContextKit
- **"Not on feature branch"** → Create feature branch with `@ctxk:plan:1-spec` or switch to existing one
- **"Planning phases incomplete"** → Complete `@ctxk:plan:1-spec` (creates Spec.md), `@ctxk:plan:2-research-tech` (creates Research.md + Tech.md), `@ctxk:plan:3-steps` (creates Steps.md) sequence
- **"No feature directory found"** → Feature name detection failed, verify branch name format
- **"Steps.md empty"** → Run `@ctxk:plan:3-steps` to create implementation breakdown
- **"Build environment broken"** → Resolve dependency issues before starting development
- **"All tasks complete"** → No pending work, consider `@ctxk:impl:commit-changes` or new feature

## Validation Gates

**Prerequisites:**
- ContextKit project setup complete?
- Git repository with feature branch active?
- All planning phases completed (Spec.md, Research.md, Tech.md, Steps.md)?
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
- User confirmation received for selected task and approach?

## Integration Points

- **Planning Commands**: Requires completed `@ctxk:plan:1-spec` (Spec.md), `@ctxk:plan:2-research-tech` (Research.md + Tech.md), `@ctxk:plan:3-steps` (Steps.md) workflow
- **Project Setup**: Uses Context.md from `@ctxk:proj:init` for project type detection and standards
- **Quality Guidelines**: References Context/Guidelines/ for tech-stack-specific patterns and Context.md for build/test commands
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
📖 Guidelines: [List of available guidelines from Context/Guidelines/]

📋 Quality Guidelines for Implementation:
   • Use Context.md build commands for validation
   • Use @ctxk:impl:commit-changes for smart commits at milestones
   • Use Context.md test commands for test execution
   • Reference Context/Guidelines/ for code quality patterns

💡 Ready to implement! Follow Steps.md systematically.
```

### All Tasks Complete
```
🎉 Feature [FeatureName] implementation complete!

🔗 Next steps:
   1. Quality validation will run automatically
   2. Test functionality manually
   3. Commit: @ctxk:impl:commit-changes
   4. Release: @ctxk:impl:release-app [version]
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