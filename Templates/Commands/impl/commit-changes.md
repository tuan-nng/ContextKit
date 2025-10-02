# Commit Changes
<!-- Template Version: 11 | ContextKit: 0.1.0 | Updated: 2025-10-02 -->

> [!WARNING]
> **👩‍💻 FOR DEVELOPERS**: Do not edit the content above the developer customization section - changes will be overwritten during ContextKit updates.
>
> For project-specific customizations, use the designated section at the bottom of this file.
>
> Found a bug or improvement for everyone? Please report it: https://github.com/FlineDev/ContextKit/issues

## Description
Intelligent git analysis, commit message generation, and commit execution with comprehensive validation. Analyzes changed files and generates conventional commit messages following project standards.

## Execution Flow (main)

0. **Read the "👩‍💻 DEVELOPER CUSTOMIZATIONS" section**
   - Use `Grep` tool to find the start of the section
   - Read everything below that line contained in this document til the end of the file
   - Make sure to consider what was said there with high priority
   - If anything conflicts with the rest of the workflow, prioritize the "developer customizations"

1. **Analyze Git Status**
   ```bash
   git status --porcelain
   git diff --cached --stat
   git diff --stat
   ```
   - Identify all changed files (staged and unstaged)
   - Categorize changes by type (added, modified, deleted)
   - Analyze change scope (which components/features affected)

2. **Determine Commit Type**
   - Based on changed files and Context.md, determine conventional commit type:
     - `feat:` - New features or capabilities
     - `fix:` - Bug fixes
     - `refactor:` - Code restructuring without behavior change
     - `docs:` - Documentation updates
     - `test:` - Test additions or modifications
     - `chore:` - Build process, dependencies, tooling
     - `style:` - Code formatting (no logic changes)
     - `perf:` - Performance improvements

3. **Generate Commit Message**
   - Use conventional commit format: `type(scope): description`
   - Example: `feat(auth): add OAuth2 login flow`
   - Include relevant details from git diff
   - Keep description concise but informative
   - Follow project's commit message conventions from Context.md if specified

4. **Execute Commit**
   ```bash
   git add -A
   git commit -m "[generated message]"
   ```
   - Stage all changes
   - Commit with generated message
   - Display commit hash and summary

5. **Display Commit Summary**
   ```
   ✅ Successfully committed changes

   📝 Commit: [commit_hash]
   💬 Message: "[commit_message]"
   📂 Files: [number] files modified
   📊 Changes: +[lines_added] -[lines_deleted]
   ```

## Error Conditions

- **ContextKit not initialized** → Ensure project is set up with `@ctxk:proj:init`
- **No changes to commit** → Working directory is clean
- **Git repository issues** → Handle and report git-related errors
- **Permission problems** → Check git configuration and file permissions

## Integration Points

- **Systematic Development**: Called at milestone markers in Steps.md via `@ctxk:impl:start-working`
- **Project Setup**: Requires `@ctxk:proj:init` for project context
- **Commit Standards**: Follows conventional commit format and project conventions
- **Git Workflow**: Integrates with feature branch development and task completion

════════════════════════════════════════════════════════════════════════════════
👩‍💻 DEVELOPER CUSTOMIZATIONS - EDITABLE SECTION
════════════════════════════════════════════════════════════════════════════════

This section is preserved during ContextKit migrations and updates.
Add project-specific instructions, examples, and overrides below.

## Custom Commit Format
<!-- Add project-specific commit message format requirements -->

## Pre-Commit Hooks
<!-- Document any project-specific pre-commit requirements -->
