# Initialize Project with ContextKit
<!-- Template Version: 1 | ContextKit: 0.0.0 | Updated: 2025-09-14 -->

> [!WARNING]
> **👩‍💻 FOR DEVELOPERS**: Do not edit the content above the developer customization section - changes will be overwritten during ContextKit updates.
>
> For project-specific customizations, use the designated section at the bottom of this file.
>
> Found a bug or improvement for everyone? Please report it: https://github.com/FlineDev/ContextKit/issues

## Description
Initialize current project with ContextKit development workflow system. Sets up systematic development environment with template distribution and context generation.

## Parameters
None (automatic setup with user confirmations when needed)

## Execution Flow (main)

### Phase 1: Project Status Assessment

1. **Check Git Repository Status**
   ```bash
   git status --porcelain
   ```
   - If uncommitted changes exist: WARN user and ask for confirmation to continue
   - If not a git repository: WARN user and ask for confirmation to continue

2. **Check Current Project Structure**
   - Use `Glob` tool to list project files: `Glob . *` to see all files and directories
   - Use `Glob . **/*.md` to find all markdown files in subdirectories

3. **Detect Existing ContextKit Installation**
   - Look for `Context.md` in project root
   - Check for `Context/` directory with subdirectories using `Glob Context *`
   - Check for `.claude/commands/ctxk/` directory using `Glob .claude/commands/ctxk *`
   - Check for `.claude/agents/ctxk/` directory using `Glob .claude/agents/ctxk *`
   - **If MOST exist**: ERROR "Project already initialized with ContextKit. Use `/ctxk:proj:migrate` for updates instead."

4. **Verify ContextKit Global Installation**
   ```bash
   ls -la ~/.ContextKit/Templates/ || echo "❌ ContextKit not installed globally. Run: curl -fsSL https://raw.githubusercontent.com/FlineDev/ContextKit/main/install.sh | sh"
   ```

### Phase 2: Template Installation

5. **Create Directory Structure**
   ```bash
   mkdir -p .claude/commands/ctxk .claude/agents/ctxk Context/Features Context/Backlog Context/Scripts
   ```

6. **Copy Command Templates**
   ```bash
   cp -r ~/.ContextKit/Templates/Commands/* .claude/commands/ctxk/
   echo "✅ Copied command templates (proj/, plan/, impl/, bckl/)"
   ```
   > **Note**: `/*` means copy ALL files and directories from Commands/, not execute with literal asterisk

7. **Copy Agent Templates**
   ```bash
   cp ~/.ContextKit/Templates/Agents/* .claude/agents/ctxk/
   echo "✅ Copied agent templates (build-project, check-accessibility, etc.)"
   ```
   > **Note**: `/*` means copy ALL .md files from Agents/ directory individually

8. **Copy Script Templates**
   ```bash
   cp ~/.ContextKit/Templates/Scripts/* Context/Scripts/
   chmod +x Context/Scripts/*.sh
   echo "✅ Copied script templates (AutoFormat.sh, VersionStatus.sh, etc.)"
   ```
   > **Note**: First `/*` copies all files, then `/*.sh` applies executable permissions to all .sh files

9. **Copy Backlog Templates**
   ```bash
   cp ~/.ContextKit/Templates/Backlog/* Context/Backlog/
   echo "✅ Copied backlog templates (Ideas-Inbox.md, Bugs-Backlog.md, etc.)"
   ```

10. **Copy Project Context Template**
    ```bash
    cp ~/.ContextKit/Templates/Contexts/Project.md Context.md
    echo "✅ Copied project context template"
    ```

11. **Check Existing Settings**
    - Use `Read` tool to check if `.claude/settings.json` exists
    - If doesn't exist: Copy complete template and skip to step 16
    ```bash
    cp ~/.ContextKit/Templates/settings.json .claude/settings.json
    echo "✅ Installed complete ContextKit settings"
    ```

12. **Configure Model Setting**
    - Use `Read` tool to examine current model setting
    - If missing or different from "sonnet", ask user: "Current model: [current/none]. Set to 'sonnet'? Default Claude Code uses Opus which burns through the 5-hour limit quickly. ContextKit uses Sonnet to avoid hitting limits during complex planning phases while maintaining sufficient quality with proper guidance. (recommended)"
    - If user agrees or no current setting: Use `Edit` tool to set `"model": "sonnet"`

13. **Configure Status Line**
    - Check current statusLine configuration in settings.json
    - If missing or different from "./Context/Scripts/CustomStatusline.sh", ask user: "Current statusline: [current/none]. Set to ContextKit statusline? Provides real-time monitoring: '5h-Usage: 73% (1.4h left) | Chat: ▓▓▓▓▓▓░░░░ 64% (128k/200k)' with colored progress bars (Light Gray <50%, Yellow 50-80%, Red >80%) for context awareness. (recommended)"
    - If user agrees or no current setting: Use `Edit` tool to set complete statusLine configuration from template

14. **Merge Permissions**
    - If no existing permissions: Use `Edit` tool to set complete permissions from template
    - If existing permissions: Use `Edit` tool to intelligently merge arrays:
      - **Allow list**: Remove existing entries that are subsets of ContextKit permissions (e.g., remove "Bash" if ContextKit has "Bash"), add ContextKit entries, remove exact duplicates, sort alphabetically with each entry on own line
      - **Deny list**: Add ContextKit entries, remove only exact duplicates (keep all specific denials), sort alphabetically with each entry on own line

15. **Add ContextKit Hooks**
    - Add PostToolUse hook for AutoFormat: `./Context/Scripts/AutoFormat.sh`
    - Add SessionStart hook for VersionStatus: `./Context/Scripts/VersionStatus.sh`
    - If no existing hooks: Use `Edit` tool to set complete hooks configuration from template
    - If existing hooks: Preserve existing hooks, add ContextKit hooks alongside them

### Phase 3: Context Integration & Project Investigation

16. **Discover Workspace Context**
    - Use `Bash` tool to traverse parent directories: `cd .. && pwd` then check for Context.md
    - Continue checking parent directories until reaching root `/` or finding workspace Context.md
    - If workspace Context.md found: note the workspace name and inheritance rules
    - If multiple workspace contexts found in path: ask user which to inherit from

17. **Handle Existing CLAUDE.md**
    - If `CLAUDE.md` exists: append `@Context.md` reference if not already present using `Edit` tool
    - If no `CLAUDE.md`: create minimal one with `@Context.md` reference using `Write` tool
    - Include workspace context reference if discovered

18. **Copy Project-Specific Formatters** (should be done before Context.md investigation)
    - For Swift projects (swift-package, ios-app, vapor-server):
      ```bash
      cp ~/.ContextKit/Templates/Formatters/.swift-format .
      cp ~/.ContextKit/Templates/Formatters/.swiftformat .
      echo "✅ Copied Swift formatter configurations"
      ```

19. **Execute Context.md Template Instructions**
    - Use `Read` tool to read the copied `Context.md` file
    - Follow the **system instructions** section (boxed area) step by step
    - The template contains project detection logic (Package.swift → swift-package, etc.)
    - Systematically investigate project structure, dependencies, architecture
    - Generate proper Context.md content based on findings using `Edit` tool
    - **At completion**: Use `Edit` tool to remove the system instructions section entirely

### Phase 4: Verification & Completion

20. **Verify Installation**
    - Use `Read` tool to confirm `Context.md` exists and contains project-specific content
    - Use `Glob` tool to verify `.claude/commands/ctxk/plan/1-spec.md` exists
    - Use `Bash` tool to check `Context/Scripts/AutoFormat.sh` is executable: `ls -la Context/Scripts/AutoFormat.sh`
    - Use `Glob` tool to validate at least 3 agent files exist in `.claude/agents/ctxk/`: `Glob .claude/agents/ctxk *`
    - Use `Bash` tool to verify status line configured: `grep "CustomStatusline.sh" .claude/settings.json`
    - Use `Read` tool to confirm `.claude/settings.json` contains ContextKit configuration

21. **Display Completion**
    - Display success message using template below
    - Suggest next steps based on project state (new vs existing project)

## Success Message Template

```
🎉 ContextKit initialization complete!

📁 Project configured with:
   ✓ Context.md - Project configuration and development context
   ✓ Context/Features/ - Systematic feature development
   ✓ Context/Backlog/ - Ideas and bugs with evaluation frameworks
   ✓ Context/Scripts/ - Code formatting and status automation
   ✓ .claude/commands/ctxk/ - Development workflow commands
   ✓ .claude/agents/ctxk/ - Quality assurance specialists
   ✓ .claude/settings.json - ContextKit permissions, hooks, and model configuration
   ✓ Status line configured - 5h-usage tracking with colored progress bars
   [For Swift projects: ✓ Formatter configurations (.swift-format, .swiftformat)]

🚀 Ready to start systematic development:

💡 **Tip**: Disable Auto-Compact for better control! Type `/config` and set "Auto-compact" to **false**.
   Auto-compact triggers at ~85% context, often interrupting when you're nearly finished.
   Better workflow: Start fresh chats when needed and resume with /ctxk:impl:start-working.

[NEW PROJECT DETECTED]:
   🎯 Begin with: /ctxk:plan:1-spec "[AppName] - [brief app concept description]"

[EXISTING PROJECT DETECTED]:
   🎯 Begin with: /ctxk:plan:1-spec "[suggested feature based on project analysis]"

💡 Available commands: /ctxk:plan:*, /ctxk:impl:*, /ctxk:bckl:*
```

## Error Conditions

- **"ContextKit not installed globally"** → Run global installation first: `curl -fsSL https://raw.githubusercontent.com/FlineDev/ContextKit/main/install.sh | sh`
- **"Project already initialized"** → Use `/ctxk:proj:migrate` for updates instead
- **"Not in git repository"** → Warn user, ask for confirmation to continue
- **"Uncommitted changes detected"** → Recommend committing first, allow override
- **"Permission denied"** → Check directory permissions and ownership
- **"Project type unclear"** → Interactive selection required from user
- **"Template copy failed"** → Check global ContextKit installation integrity
- **"Context.md generation failed"** → Verify template files exist and are readable
- **"Verification failed"** → Check if all required directories and files were created

## Validation Gates

**Pre-Setup Validation:**
- ContextKit globally installed and accessible?
- Project not already initialized with ContextKit?
- Git repository status acceptable or user confirmed?

**Template Installation Validation:**
- All template directories created successfully?
- Command templates copied to .claude/commands/ctxk/?
- Agent templates copied to .claude/agents/ctxk/?
- Script templates copied to Context/Scripts/?
- Backlog templates copied to Context/Backlog/?
- Status line configured to use local CustomStatusline.sh script?
- Claude Code settings.json configured with ContextKit preferences?

**Context Integration Validation:**
- Workspace context discovered and integrated?
- CLAUDE.md properly references Context.md?
- Project Context.md generated with project-specific content?
- Project-specific formatters copied (if applicable)?

**Final Verification:**
- All critical files exist and contain expected content?
- Status line and settings properly configured for ContextKit workflow?

## Integration Points

- **Global ContextKit**: Reads from ~/.ContextKit/ template infrastructure
- **Workspace Inheritance**: Discovers and loads configuration from parent directory Context.md files
- **Team Collaboration**: Creates committable .claude/ directory for team sharing
- **Development Workflow**: Integrates with `/ctxk:plan:*`, `/ctxk:impl:*`, and `/ctxk:bckl:*` commands
- **Quality Assurance**: Connects hooks and agents to development process


════════════════════════════════════════════════════════════════════════════════
👩‍💻 DEVELOPER CUSTOMIZATIONS - EDITABLE SECTION
════════════════════════════════════════════════════════════════════════════════

This section is preserved during ContextKit updates.
Add project-specific setup customizations below.

## Additional Setup Steps
<!-- Add extra steps like Docker configs, additional formatters, or CI/CD files -->

## Skip or Override Steps
<!-- Document workflow modifications like skipping workspace discovery or using custom locations -->

## Custom Template Locations
<!-- Define alternative sources like company-specific templates or team workflows -->