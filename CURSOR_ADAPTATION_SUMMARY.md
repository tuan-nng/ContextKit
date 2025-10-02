# ContextKit Cursor Adaptation Summary

## Overview

This document summarizes the changes needed to adapt ContextKit from Claude Code to Cursor. The main difference is that Cursor doesn't support custom hooks or agents, so we need to adapt the workflow to work with Cursor's composer and @ mention system.

## Completed Changes

### 1. Documentation ✅
- [x] README.md - Updated all references from `/ctxk:*` to `@ctxk:*`
- [x] README.md - Changed "Claude Code" to "Cursor" throughout
- [x] README.md - Updated configuration section (removed hooks, statusline)
- [x] README.md - Updated "Why Cursor" section explaining the adaptation

### 2. Installation Script ✅
- [x] install.sh - Changed from `~/.claude/commands/` to `~/.cursor/contextkit/`
- [x] install.sh - Updated messaging for Cursor workflow
- [x] install.sh - Changed next steps instructions

### 3. New Files ✅
- [x] Created `.cursorrules` template (replaces CLAUDE.md for project context)
- [x] Created CURSOR_MIGRATION.md (migration guide)
- [x] Created this summary document
- [x] Updated settings.json to be informational only

## Remaining Changes Needed

### 4. Command Templates (HIGH PRIORITY)
All command files in `Templates/Commands/` need these changes:

#### Common Changes for ALL Commands:
1. **Update header comment** (line 2):
   ```markdown
   <!-- Template Version: [N+1] | ContextKit: 0.1.0 | Updated: 2025-10-02 -->
   ```

2. **Replace path references**:
   - `.claude/` → `.cursor/`
   - `~/.claude/` → `~/.cursor/contextkit/`
   - `CLAUDE.md` → `.cursorrules`

3. **Remove Claude Code-specific features**:
   - Remove references to `/config` command
   - Remove statusline references
   - Remove hook installation steps
   - Remove agent invocation steps

4. **Update command references**:
   - `/ctxk:*` → `@ctxk:*` (in documentation text)
   - Keep workflow logic the same

5. **Update installation instructions**:
   - Remove `.claude/settings.json` manipulation
   - Remove status line setup
   - Remove hook configuration
   - Simplify to just copying command docs

#### Specific Files Requiring Updates:

**Templates/Commands/proj/init.md** (MOST CRITICAL):
- Remove Phase 7 (settings.json configuration)
- Remove Phase user questions about model/statusline/Claude plan
- Simplify to:
  1. Create `.cursor/rules/ctxk/` directory
  2. Copy command docs
  3. Create `Context/` structure
  4. Generate `.cursorrules` (instead of Context.md + CLAUDE.md)
  5. Copy Guidelines (not Agents)
- Update version from 10 to 11

**Templates/Commands/proj/migrate.md**:
- Update paths
- Remove settings.json migration
- Remove agent migration
- Focus on command docs and guidelines
- Update version

**Templates/Commands/proj/init-workspace.md**:
- Update paths
- Simplify workspace Context.md creation
- Update version

**Templates/Commands/plan/*.md** (3 files):
- Update command references
- Update paths for reading Context.md
- Update version on all files

**Templates/Commands/impl/*.md** (4 files):
- Update command references
- Remove agent invocations
- Replace with guideline references (e.g., "@Context/Guidelines/Swift.md")
- Update version on all files

**Templates/Commands/bckl/*.md** (6 files):
- Update command references
- Update paths
- Update version on all files

### 5. Agents → Guidelines Conversion (MEDIUM PRIORITY)

**Current Agents** (`Templates/Agents/*.md`):
- build-project.md
- run-test-suite.md
- run-specific-test.md  
- check-accessibility.md
- check-localization.md
- check-error-handling.md
- check-modern-code.md
- check-code-debt.md
- commit-changes.md

**Action**: Move to `Templates/Guidelines/` and convert format:
1. Remove YAML frontmatter
2. Convert from "agent instructions" to "quality guideline documentation"
3. Change from "execute and report" to "check for these issues"
4. Keep detection patterns but remove auto-fix instructions
5. Update version headers
6. Add to appropriate tech-stack guideline files OR keep as standalone

**Recommendation**: 
- Keep build/test agents as separate guideline docs (generally useful)
- Merge check-* agents into Swift.md/SwiftUI.md as sections
- Update commit-changes as a separate workflow guideline

### 6. Scripts Handling (LOW PRIORITY)

**Templates/Scripts/** contains:
- AutoFormat.sh (PostToolUse hook)
- VersionStatus.sh (SessionStart hook)
- CustomStatusline.sh (Statusline script)

**Action**:
- Mark as "Not supported in Cursor" in documentation
- Add note about Cursor's built-in formatting
- Could keep as reference for users who want to set up external automation
- Don't copy these during init
- Update any references in command templates

### 7. Context Templates (MEDIUM PRIORITY)

**Templates/Contexts/Project.md**:
- Review for any Claude Code-specific content
- Remove agent references
- Update to generate .cursorrules instead
- Update version header

**Templates/Contexts/Workspace.md**:
- Review for any Claude Code-specific content
- Update version header

**Templates/Contexts/.cursorrules** (NEW):
- Already created ✅
- Will be populated during init

### 8. Feature Templates (LOW PRIORITY)

**Templates/Features/*.md** (3 files):
- Quick scan for any Claude Code references
- Should be mostly platform-agnostic already
- Update version headers if changes made

### 9. Backlog Templates (LOW PRIORITY)

**Templates/Backlog/*.md** (4 files):
- Quick scan for any Claude Code references
- Should be platform-agnostic
- Update version headers if changes made

### 10. Formatter Templates (NO CHANGE)

**Templates/Formatters/**:
- Keep as-is (Swift-specific, not AI-system-specific)
- No version headers needed

### 11. Development Documentation (MEDIUM PRIORITY)

**CLAUDE.md** → **CURSOR.md**:
- Rename file
- Update all references to Cursor
- Update directory structure diagrams
- Update installation flow
- Update hook references to "not applicable"
- Update agent references to guidelines
- Update example workflows

**CHANGELOG.md**:
- Add entry for Cursor adaptation
- Note breaking changes from Claude Code version

## Testing Checklist

After making changes, test:

1. **Installation**:
   ```bash
   curl -fsSL https://raw.githubusercontent.com/[your-fork]/ContextKit/main/install.sh | bash
   ```

2. **Project Init**:
   - Create test project
   - Run `@ctxk:proj:init` in Cursor
   - Verify `.cursor/rules/ctxk/` created
   - Verify `.cursorrules` generated
   - Verify `Context/` structure created

3. **Planning Workflow**:
   - Run `@ctxk:plan:1-spec`
   - Run `@ctxk:plan:2-research-tech`
   - Run `@ctxk:plan:3-steps`
   - Verify feature docs created properly

4. **Implementation**:
   - Run `@ctxk:impl:start-working`
   - Verify context is properly loaded
   - Test guideline references work

5. **Migration**:
   - Run `@ctxk:proj:migrate`
   - Verify updates work correctly

## File Count Summary

- Commands to update: 16 files
- Agents to convert: 9 files → Guidelines
- Scripts to document: 3 files (mark as unsupported)
- Templates to review: 7 files
- Documentation to update: 2 files (CLAUDE.md → CURSOR.md, CHANGELOG.md)

**Total files needing attention: ~37 files**

## Priority Order

1. **CRITICAL** (do first):
   - Templates/Commands/proj/init.md
   - Templates/Commands/proj/migrate.md
   - CURSOR.md (development guide)

2. **HIGH** (do next):
   - All Templates/Commands/plan/*.md
   - All Templates/Commands/impl/*.md
   - Templates/Contexts/Project.md

3. **MEDIUM** (do after high):
   - Templates/Commands/bckl/*.md
   - Convert key agents to guidelines
   - Templates/Contexts/Workspace.md

4. **LOW** (polish):
   - Feature templates review
   - Backlog templates review
   - Remaining agent conversions
   - Scripts documentation

## Next Steps

1. Start with Templates/Commands/proj/init.md (most critical)
2. Then proj/migrate.md
3. Then update all plan/ commands
4. Then update all impl/ commands
5. Convert high-priority agents to guidelines
6. Update development documentation
7. Test complete workflow
8. Update CHANGELOG.md with version bump

