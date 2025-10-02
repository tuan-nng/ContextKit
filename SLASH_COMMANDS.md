# ContextKit Slash Commands Implementation

**Date**: October 2, 2025  
**Status**: ✅ Complete  
**Template Version**: 13

## Overview

ContextKit now uses **Cursor's native slash commands** system instead of `@` mentions for better discoverability and native IDE integration. This follows the approach used by [GitHub's Spec Kit](https://github.com/github/spec-kit) and leverages Cursor's official `.cursor/commands/` directory.

## What Are Slash Commands?

According to [Cursor's documentation](https://cursor.com/docs/agent/chat/commands), slash commands are:
- Custom commands defined in `.cursor/commands/` directory
- Invoked with `/` prefix (e.g., `/ctxk-plan-spec`)
- Appear in autocomplete when you type `/` in Composer
- Provide structured prompts to the AI
- Per-project (shared via version control)

## Command Structure

### Before (@ Mentions)
```
Old syntax (confusing):
@ctxk:proj:init          # Didn't work globally
@ctxk:plan:1-spec        # Only after project setup
@ctxk:impl:start-working # Inconsistent naming
```

### After (Slash Commands)
```
New syntax (clean and discoverable):
/ctxk-plan-spec          # Planning: Spec
/ctxk-plan-research      # Planning: Research Tech
/ctxk-plan-steps         # Planning: Steps
/ctxk-impl-start         # Implementation: Start
/ctxk-impl-commit        # Implementation: Commit
/ctxk-impl-release       # Implementation: Release
/ctxk-bckl-add-idea      # Backlog: Add Idea
/ctxk-bckl-add-bug       # Backlog: Add Bug
...and 4 more backlog commands
```

## Directory Structure

After initialization, your project will have:

```
project-root/
├── .cursor/
│   ├── commands/                    # Slash commands (12 total)
│   │   ├── ctxk-plan-spec.md       # /ctxk-plan-spec
│   │   ├── ctxk-plan-research.md   # /ctxk-plan-research
│   │   ├── ctxk-plan-steps.md      # /ctxk-plan-steps
│   │   ├── ctxk-impl-start.md      # /ctxk-impl-start
│   │   ├── ctxk-impl-commit.md     # /ctxk-impl-commit
│   │   ├── ctxk-impl-release.md    # /ctxk-impl-release
│   │   ├── ctxk-bckl-add-idea.md   # /ctxk-bckl-add-idea
│   │   ├── ctxk-bckl-add-bug.md    # /ctxk-bckl-add-bug
│   │   ├── ctxk-bckl-prioritize-ideas.md
│   │   ├── ctxk-bckl-prioritize-bugs.md
│   │   ├── ctxk-bckl-remove-idea.md
│   │   └── ctxk-bckl-remove-bug.md
│   └── rules/
│       ├── project-context.md       # Auto-loaded project context
│       └── ctxk/
│           └── proj/                # Reference-only (not slash commands)
│               ├── migrate.md
│               └── init-workspace.md
├── Context/
│   ├── Features/
│   ├── Backlog/
│   └── Guidelines/
└── Context.md
```

## Complete Command List

### Planning Workflow (3 commands)
| Slash Command | Description | Old Syntax |
|--------------|-------------|------------|
| `/ctxk-plan-spec` | Define business requirements and user stories | `@ctxk:plan:1-spec` |
| `/ctxk-plan-research` | Design technical architecture | `@ctxk:plan:2-research-tech` |
| `/ctxk-plan-steps` | Break down into numbered tasks (S001-S999) | `@ctxk:plan:3-steps` |

### Implementation Workflow (3 commands)
| Slash Command | Description | Old Syntax |
|--------------|-------------|------------|
| `/ctxk-impl-start` | Begin feature development with quality checks | `@ctxk:impl:start-working` |
| `/ctxk-impl-commit` | Smart commit with formatting and message generation | `@ctxk:impl:commit-changes` |
| `/ctxk-impl-release` | Publish npm package with release workflow | `@ctxk:impl:release-package` |

### Backlog Management (6 commands)
| Slash Command | Description | Old Syntax |
|--------------|-------------|------------|
| `/ctxk-bckl-add-idea` | Add feature idea with evaluation framework | `@ctxk:bckl:add-idea` |
| `/ctxk-bckl-add-bug` | Report bug with impact assessment | `@ctxk:bckl:add-bug` |
| `/ctxk-bckl-prioritize-ideas` | Organize ideas strategically | `@ctxk:bckl:prioritize-ideas` |
| `/ctxk-bckl-prioritize-bugs` | Triage bugs by severity | `@ctxk:bckl:prioritize-bugs` |
| `/ctxk-bckl-remove-idea` | Remove completed/cancelled idea | `@ctxk:bckl:remove-idea` |
| `/ctxk-bckl-remove-bug` | Remove fixed bug | `@ctxk:bckl:remove-bug` |

### Project Setup (Not slash commands)
These remain as file references since they're needed before slash commands exist:
- `@~/.ContextKit/Templates/Commands/proj/init.md` - Initialize project
- `@~/.ContextKit/Templates/Commands/proj/init-workspace.md` - Setup workspace
- Reference `.cursor/rules/ctxk/proj/migrate.md` after setup

## How to Use

### Initial Setup

1. **Install ContextKit globally** (one-time):
   ```bash
   curl -fsSL https://raw.githubusercontent.com/tuan-nng/ContextKit/main/install.sh | bash
   ```

2. **Initialize your project** (in Cursor Composer):
   ```
   @~/.ContextKit/Templates/Commands/proj/init.md
   ```

3. **Slash commands are now available!** Type `/` to see them:
   ```
   /ctxk-plan-spec
   /ctxk-plan-research
   /ctxk-plan-steps
   ...
   ```

### Daily Workflow

1. **Start a new feature**:
   ```
   /ctxk-plan-spec         # Define requirements
   /ctxk-plan-research     # Design architecture
   /ctxk-plan-steps        # Break down tasks
   /ctxk-impl-start        # Begin development
   ```

2. **Manage backlog**:
   ```
   /ctxk-bckl-add-idea     # Capture new ideas
   /ctxk-bckl-add-bug      # Report bugs
   /ctxk-bckl-prioritize-ideas  # Organize work
   ```

3. **Commit work**:
   ```
   /ctxk-impl-commit       # Smart commit workflow
   ```

## Benefits of Slash Commands

### ✅ Discoverability
- Type `/` in Composer to see all available commands
- Autocomplete suggests commands as you type
- No need to remember exact syntax

### ✅ Native Integration
- Uses Cursor's official commands API
- Shows up in command palette
- Better IDE integration

### ✅ Consistent Naming
- Clear hierarchy: `ctxk-category-action`
- Easy to remember patterns
- No confusion with `:` separators

### ✅ Team Collaboration
- Commands are in `.cursor/commands/` directory
- Committed to version control
- Entire team uses same workflows

### ✅ No Path Confusion
- No `@~/.ContextKit/...` for every command
- Only needed once during initialization
- Slash commands are project-local

## Migration from @ Mentions

If you have an existing ContextKit project using the old `@` mention syntax:

### Manual Migration

1. **Create slash commands directory**:
   ```bash
   mkdir -p .cursor/commands
   ```

2. **Copy and rename commands**:
   ```bash
   # Planning
   cp ~/.ContextKit/Templates/Commands/plan/1-spec.md .cursor/commands/ctxk-plan-spec.md
   cp ~/.ContextKit/Templates/Commands/plan/2-research-tech.md .cursor/commands/ctxk-plan-research.md
   cp ~/.ContextKit/Templates/Commands/plan/3-steps.md .cursor/commands/ctxk-plan-steps.md
   
   # Implementation
   cp ~/.ContextKit/Templates/Commands/impl/start-working.md .cursor/commands/ctxk-impl-start.md
   cp ~/.ContextKit/Templates/Commands/impl/commit-changes.md .cursor/commands/ctxk-impl-commit.md
   cp ~/.ContextKit/Templates/Commands/impl/release-package.md .cursor/commands/ctxk-impl-release.md
   
   # Backlog (6 commands)
   cp ~/.ContextKit/Templates/Commands/bckl/*.md .cursor/commands/
   # Rename each from bckl/*.md to ctxk-bckl-*.md format
   ```

3. **Optional: Clean up old structure**:
   ```bash
   # Remove old .cursor/rules/ctxk/ if you prefer
   # (Keep .cursor/rules/project-context.md)
   rm -rf .cursor/rules/ctxk/plan
   rm -rf .cursor/rules/ctxk/impl
   rm -rf .cursor/rules/ctxk/bckl
   ```

### Automated Migration (Coming Soon)

A future version of `/ctxk-proj-migrate` will handle this automatically.

## Technical Implementation

### How Init Creates Commands

The `init.md` workflow (v13) now includes:

```bash
# Step 8: Create Slash Commands from Templates
cp ~/.ContextKit/Templates/Commands/plan/1-spec.md .cursor/commands/ctxk-plan-spec.md
cp ~/.ContextKit/Templates/Commands/plan/2-research-tech.md .cursor/commands/ctxk-plan-research.md
# ... etc for all 12 commands
```

### Command File Format

Each slash command is a markdown file with:
- Workflow instructions
- Execution steps
- Validation gates
- Error conditions
- Developer customization sections

Example structure:
```markdown
# Feature Specification
<!-- Template Version: X | ContextKit: 0.1.0 | Updated: YYYY-MM-DD -->

## Description
[What this command does]

## Execution Flow (main)
[Step-by-step instructions for AI to follow]

## Validation Gates
[Checks before proceeding]

## Developer Customizations
[Project-specific overrides]
```

## Cursor Documentation References

- [Slash Commands](https://cursor.com/docs/agent/chat/commands) - Official Cursor documentation
- [Commands Directory](https://cursor.com/docs/agent/chat/commands) - `.cursor/commands/` structure
- [Rules Directory](https://cursor.com/docs/context/rules) - `.cursor/rules/` for project context

## Comparison with Spec Kit

[GitHub's Spec Kit](https://github.com/github/spec-kit) uses a similar approach:
- Commands in `.cursor/commands/`
- Invoked with `/` prefix
- Native Cursor integration
- Committed to version control

ContextKit follows this proven pattern for maximum compatibility and user familiarity.

## Future Enhancements

### Planned Improvements
- [ ] Migrate command to auto-convert old projects
- [ ] Command aliases (shorter names)
- [ ] Command categories in Cursor UI
- [ ] Interactive command builder
- [ ] Command templates for custom workflows

### Community Contributions
Want to add more commands? Follow this pattern:
1. Create `.md` file in `.cursor/commands/`
2. Name it `ctxk-category-action.md`
3. Include workflow instructions
4. Test with Cursor's `/` command
5. Submit PR to ContextKit

## Support

If you have questions or issues with slash commands:
- Check [Cursor documentation](https://cursor.com/docs/agent/chat/commands)
- Review this guide
- Open issue: [ContextKit Issues](https://github.com/tuan-nng/ContextKit/issues)

---

**Updated**: October 2, 2025  
**ContextKit Version**: 0.1.0  
**Template Version**: 13

