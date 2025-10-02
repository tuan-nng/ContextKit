# CLAUDE.md Deprecation Notice

**Status**: OUTDATED - Contains Claude Code instructions  
**Date**: October 2, 2025

## Issue

The file `CLAUDE.md` in the repository root contains **outdated instructions** for the old Claude Code IDE system:

- References to `.claude/` directories
- Commands like `mkdir -p ~/.claude/commands/ctxk/`
- Settings in `.claude/settings.json`
- Old agent system in `.claude/agents/ctxk/`

## Impact

If someone references or reads `CLAUDE.md`, they might try to:
1. Create `.claude/` directories (which don't work in Cursor)
2. Follow outdated installation paths
3. Use deprecated agent system

## Recommendations

### Option 1: Archive the File
```bash
git mv CLAUDE.md ARCHIVE_CLAUDE_CODE.md
```

Add a note at the top:
```markdown
# ARCHIVED: Claude Code Development Guide

**⚠️ This file is ARCHIVED and only kept for historical reference.**

ContextKit has migrated from Claude Code to Cursor.

For current documentation, see:
- README.md - User guide
- SLASH_COMMANDS.md - Command reference
- CURSOR_MIGRATION.md - Migration guide from Claude Code
```

### Option 2: Convert to Cursor Development Guide

Rename and rewrite:
```bash
git mv CLAUDE.md CURSOR_DEVELOPMENT.md
```

Update content for Cursor-specific development guidance:
- Remove `.claude/` references
- Update to `.cursor/commands/` and `.cursor/rules/`
- Update slash command system
- Remove agent-specific sections
- Keep meta-development context (still valuable)

### Option 3: Delete Completely

If the meta-development context is no longer needed:
```bash
git rm CLAUDE.md
```

## Other Files with Claude References

These files also contain `.claude` references but are less critical:

1. **CURSOR_ADAPTATION_COMPLETE.md** - Historical migration doc (keep as-is)
2. **CURSOR_ADAPTATION_SUMMARY.md** - Historical migration doc (keep as-is)
3. **CURSOR_MIGRATION.md** - Migration guide (mentions .claude for comparison - OK)
4. **CHANGELOG.md** - Historical changelog (keep as-is)
5. **Templates/Scripts/VersionStatus.sh** - Needs update to check `.cursor/` instead
6. **Templates/Contexts/Workspace.md** - Needs update for Cursor paths

## Recommended Action

**Archive CLAUDE.md** (Option 1) since it contains valuable meta-development context that might be useful for understanding the system's evolution, but make it clear it's outdated.

Update these active templates:
- [ ] Templates/Scripts/VersionStatus.sh - Check `.cursor/commands/` instead of `.claude/commands/`
- [ ] Templates/Contexts/Workspace.md - Reference `.cursor/` directories

## Implementation

```bash
# Archive CLAUDE.md
git mv CLAUDE.md ARCHIVE_CLAUDE_CODE.md

# Add deprecation notice at top of archived file
# (prepend warning to file)

# Update VersionStatus.sh for Cursor
# Update Workspace.md for Cursor

# Commit changes
git commit -m "chore: Archive Claude Code documentation and update scripts for Cursor

- Archive CLAUDE.md → ARCHIVE_CLAUDE_CODE.md
- Update VersionStatus.sh to check .cursor/ instead of .claude/
- Update Workspace.md references from .claude/ to .cursor/
- Add deprecation notices to archived files"
```

---

**Created**: October 2, 2025  
**Related**: Slash Commands Migration (commit ef988fe)

