# Initialize Workspace Context
<!-- Template Version: 1 | ContextKit: 0.0.0 | Updated: 2025-09-14 -->

> [!WARNING]
> **👩‍💻 FOR DEVELOPERS**: Do not edit the content above the developer customization section - changes will be overwritten during ContextKit updates.
>
> For project-specific customizations, use the designated section at the bottom of this file.
>
> Found a bug or improvement for everyone? Please report it: https://github.com/FlineDev/ContextKit/issues

## Description
Initialize workspace-level context configuration. Copies workspace template and executes interactive setup for multi-project workspace standards.

## Execution Flow (main)

### Phase 1: Workspace Status Check

1. **Check Existing Workspace Setup**
   - Use `Glob` tool to find existing Context.md: `Glob . Context.md`
   - If `Context.md` exists:
     ```
     🎉 Workspace already initialized with ContextKit!

     ✅ Context.md contains workspace configuration and inheritance rules
     ✅ All projects in this workspace inherit workspace standards

     💡 No action needed. To modify workspace settings, edit Context.md directly
        or use /ctxk:proj:migrate to update to newer ContextKit version.

     🔗 Next Steps:
     • Navigate to a project directory within this workspace
     • Run /ctxk:proj:init to setup ContextKit in that project (inherits workspace config)
     • Or run /ctxk:impl:start-working in any ContextKit-enabled project to begin development
     ```
     → END (exit successfully)

2. **Verify ContextKit Global Installation**
   ```bash
   ls -la ~/.ContextKit/Templates/Contexts/Workspace.md || echo "❌ ContextKit not installed globally. Run: curl -fsSL https://raw.githubusercontent.com/FlineDev/ContextKit/main/install.sh | sh"
   ```

### Phase 2: Template Installation & Execution

3. **Copy Workspace Template**
   ```bash
   cp ~/.ContextKit/Templates/Contexts/Workspace.md Context.md
   echo "✅ Copied workspace context template"
   ```

4. **Execute Context.md Template Instructions**
   - Use `Read` tool to read the copied `Context.md` file
   - Follow the **system instructions** section (boxed area) step by step
   - The template requires DEEP analysis of ALL repositories in the workspace:
     - Recursive git repository discovery (including submodules and nested repos)
     - README analysis for project purpose detection
     - Build file analysis for tech stack detection (Package.swift, package.json, etc.)
     - Actual code style detection from formatter configs and source files
     - Complete dependency analysis across all projects
   - Use tools (`Bash`, `Glob`, `Read`, `Grep`, `Edit`) as directed by template
   - **At completion**: Use `Edit` tool to remove the system instructions section entirely

5. **Display Success Message**
   ```
   🎉 Workspace initialization complete!

   ✅ Context.md created with comprehensive repository analysis
   ✅ Hierarchical repository structure mapped with tech stacks and purposes
   ✅ Technology patterns and dependencies detected across all projects
   ✅ Project inheritance hierarchy established

   📊 Analysis Results:
   • [X] repositories discovered and analyzed
   • [Y] different technology stacks identified
   • [Z] common dependencies found across projects

   🔗 Next Steps:
   • Navigate to individual project directories to run /ctxk:proj:init
   • Each project will inherit these workspace standards
   • Or run /ctxk:impl:start-working in any ContextKit-enabled project

   💡 Commit Context.md to version control for team collaboration.

   🧠 ContextKit workspace ready with complete repository understanding!
   ```

## Error Conditions

- **"ContextKit not installed globally"** → Run installation: `curl -fsSL https://raw.githubusercontent.com/FlineDev/ContextKit/main/install.sh | sh`
- **"Workspace template not found"** → Check global ContextKit installation integrity
- **"Template copy failed"** → Check directory permissions and disk space
- **"Template execution failed"** → Verify Context.md template contains system instructions section

## Validation Gates

- ContextKit globally installed and accessible?
- Workspace not already initialized (no existing Context.md)?
- Workspace template successfully copied to Context.md?
- Complete repository discovery executed (all git repos found recursively)?
- Each repository analyzed for purpose, tech stack, and dependencies?
- Hierarchical repository structure generated with accurate relationships?
- Technology findings based on actual file analysis, not assumptions?
- Code style detection performed on actual source files and formatter configs?
- Template system instructions executed successfully?
- System instructions section removed from final Context.md?

## Integration Points

- **Global ContextKit**: Uses Templates/Contexts/Workspace.md template
- **Project Setup**: Provides workspace inheritance for /ctxk:proj:init command
- **Team Collaboration**: Creates committed Context.md for team consistency
- **Development Workflow**: Establishes workspace standards for all ContextKit commands

════════════════════════════════════════════════════════════════════════════════
👩‍💻 DEVELOPER CUSTOMIZATIONS - EDITABLE SECTION
════════════════════════════════════════════════════════════════════════════════

This section is preserved during ContextKit migrations and updates.
Add project-specific instructions, examples, and overrides below.

## Additional Setup Steps
<!-- Add extra workspace initialization like shared CI/CD configs or team agreements -->

## Skip or Override Steps
<!-- Document workflow modifications like using preset configurations -->

## Custom Template Locations
<!-- Define alternative workspace templates like company-specific standards -->