# ContextKit Scripts - Cursor Compatibility Note

## ⚠️ Hooks Not Supported in Cursor

The scripts in this directory were designed for Claude Code's hook system, which is not available in Cursor. These scripts are kept for reference but are **not used** in the Cursor adaptation of ContextKit.

### Scripts in This Directory

#### AutoFormat.sh
**Original Purpose**: PostToolUse hook that automatically formats code files after edits.

**Cursor Alternative**: 
- Use Cursor's built-in formatting settings (Cmd/Ctrl + Shift + P → "Format Document")
- Configure format-on-save in Cursor settings
- Run formatters manually when needed: `npx prettier --write .` or `npm run format`

#### VersionStatus.sh
**Original Purpose**: SessionStart hook that checks for ContextKit updates and displays version status on chat initialization.

**Cursor Alternative**:
- Updates are handled through the `@ctxk:proj:migrate` command
- Run manually when you want to check for updates
- No automatic checking on session start

#### CustomStatusline.sh
**Original Purpose**: Custom statusline showing 5h-usage tracking and context usage with colored progress bars.

**Cursor Alternative**:
- Cursor has its own context management UI
- Token usage visible in Cursor's interface
- No custom statusline needed

### Using ContextKit in Cursor Without Hooks

ContextKit's core functionality in Cursor is based on:

1. **Commands as Documentation**: Commands in `.cursor/rules/ctxk/` serve as guidance documents
2. **@ Mentions**: Reference commands with `@ctxk:plan:1-spec` in Cursor's Composer
3. **Manual Workflows**: Run formatters, builds, and tests manually using documented commands from Context.md
4. **Quality Guidelines**: Reference `Context/Guidelines/` for code quality patterns

### For Developers Wanting Automation

If you want automation similar to hooks, you can:

1. **Use Cursor's Settings**: Configure auto-format and other built-in features
2. **Git Hooks**: Set up pre-commit hooks with these scripts
3. **Editor Actions**: Create keyboard shortcuts for common tasks
4. **Shell Aliases**: Create aliases for frequently used commands

Example git pre-commit hook:
```bash
#!/bin/bash
# .git/hooks/pre-commit

# Format TypeScript/JavaScript files
if command -v prettier &> /dev/null; then
    npx prettier --write .
fi

# Run linter
if command -v eslint &> /dev/null; then
    npm run lint --fix
fi
```

## Summary

These scripts are **informational only** for the Cursor adaptation. The ContextKit workflow for Cursor focuses on documentation-driven development with manual command execution rather than automated hooks.

