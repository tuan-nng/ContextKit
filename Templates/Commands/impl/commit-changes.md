# Commit Changes
<!-- Template Version: 7 | ContextKit: 0.0.0 | Updated: 2025-09-16 -->

> [!WARNING]
> **👩‍💻 FOR DEVELOPERS**: Do not edit the content above the developer customization section - changes will be overwritten during ContextKit updates.
>
> For project-specific customizations, use the designated section at the bottom of this file.
>
> Found a bug or improvement for everyone? Please report it: https://github.com/FlineDev/ContextKit/issues

## Description
Delegate to specialized commit-changes agent for intelligent git analysis, commit message generation, and commit execution with comprehensive validation.

## Execution Flow (main)

1. **Launch Commit Agent**
   - Use `Task` tool to launch `commit-changes` agent with no additional parameters
   - Agent handles all git analysis, formatting, message generation, and commit execution
   - Agent provides structured summary of committed changes

2. **Forward Agent Response Exactly**
   - **CRITICAL**: Display the agent's response exactly as received, without any modification or interpretation
   - **Do NOT**: Add your own summary, interpretation, or additional text
   - **Do NOT**: Reformat or restructure the agent's output
   - The agent already provides the complete structured response in the correct format:
     ```
     ✅ Successfully committed changes

     📝 Commit: [commit_hash]
     💬 Message: "[commit_message]"
     📂 Files: [number] files modified
     📊 Changes: +[lines_added] -[lines_deleted]

     🎯 Summary: [Brief explanation of what was accomplished and why]
     ```

## Error Conditions

- **Agent not available** → Ensure ContextKit agents are installed with `/ctxk:proj:init`
- **Git repository issues** → Agent will handle and report git-related errors
- **Permission problems** → Agent will diagnose and suggest solutions

## Integration Points

- **Quality Agents**: Works with other ContextKit agents for comprehensive development workflow
- **Project Setup**: Requires `/ctxk:proj:init` to install the commit-changes agent
- **Git Workflow**: Integrates with feature branch development and task completion

════════════════════════════════════════════════════════════════════════════════
👩‍💻 DEVELOPER CUSTOMIZATIONS - EDITABLE SECTION
════════════════════════════════════════════════════════════════════════════════

This section is preserved during ContextKit migrations and updates.
Add project-specific instructions, examples, and overrides below.

## Custom Agent Parameters
<!-- Add project-specific parameters to pass to the commit-changes agent -->

## Pre-Commit Hooks
<!-- Document any project-specific pre-commit requirements -->