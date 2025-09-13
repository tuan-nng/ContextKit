# Upgrade to Latest
<!-- Template Version: 0 | ContextKit: 0.0.0 | Updated: 2025-01-26 -->

> [!WARNING]
> **👩‍💻 FOR DEVELOPERS**: Do not edit the content above the developer customization section - changes will be overwritten during ContextKit updates.
>
> For project-specific customizations, use the designated section at the bottom of this file.
>
> Found a bug or improvement for everyone? Please report it: https://github.com/FlineDev/ContextKit/issues

## Description
Update ContextKit templates to latest versions while preserving user customizations

## Parameters
None (fully automatic)

## Execution Flow (main)
```
1. Update Global ContextKit
   → Pull latest changes to ~/.ContextKit/ repository
   → If pull fails (no internet): WARN "Could not check for updates" and continue

2. Scan Project Template Files
   → Check version differences between project and ~/.ContextKit/ templates
   → Identify files needing updates and new files to add

3. Auto-Update Files
   → Update files with version differences preserving user customizations
   → Add new template files that don't exist in project
   → Skip files with missing/corrupted customization sections (with warning)

4. Summary Report
   → Display updated files and any warnings
   → Confirm migration complete
```

## Implementation

### Phase 1: Update Global ContextKit
```
1. Check if ~/.ContextKit/ directory exists
   → If missing: ERROR "Run global installation first"

2. Update global repository with git pull
   → cd ~/.ContextKit/ && git pull origin main --quiet
   → If pull fails: WARN "Could not check for updates (no internet)" and continue
```

### Phase 2: Scan Project Templates
```
1. Define file mappings for all template types:
   - Guidelines/*.md → .claude/guidelines/
   - Templates/Commands/**/*.md → .claude/commands/ctxk/
   - Templates/Subagents/*.md → .claude/subagents/
   - Templates/Scripts/*.sh → .claude/hooks/ (and ~/.claude/ for statusline)

2. For each mapping:
   → Check template version using `sed -n '2p' file | grep "Template Version"`
   → Compare with project file version (if exists)
   → Add to update list if versions differ or file missing
```

### Phase 3: Update Files Preserving Customizations
```
1. For each file needing update:
   → If new file: Copy directly to project location
   → If existing file with customizations:
     - Find "👩‍💻 DEVELOPER CUSTOMIZATIONS" line number in both files
     - Merge: template content above + user content below separator
     - If separator missing: SKIP with warning
   → If existing file without customizations (Scripts): Replace entirely

2. Track results:
   → NEW_FILES: List of files copied
   → UPDATED_FILES: List of files merged with version info
   → WARNINGS: List of files skipped or issues encountered
```

### Phase 4: Summary Report
```
Display results organized by:
→ New files added (count and list)
→ Files updated (count and version changes)
→ Warnings (count and descriptions)
→ Overall status (complete/no updates needed)
```

## Error Conditions

- **"ContextKit not installed globally"** → Run global installation first
- **"Could not check for updates"** → No internet connection (continues with cached version)
- **"Missing customization section"** → User file corrupted, skipped with warning
- **"Template file not found"** → Global ContextKit installation incomplete

## Success Criteria

- [ ] Global ContextKit repository updated (or warning issued)
- [ ] All template files scanned for version differences
- [ ] Files with version differences updated preserving customizations
- [ ] New template files copied to project
- [ ] Summary report shows updated/new files and warnings

---

**Status**: Production ready - Simple, reliable template synchronization with customization preservation

════════════════════════════════════════════════════════════════════════════════
👩‍💻 DEVELOPER CUSTOMIZATIONS - EDITABLE SECTION
════════════════════════════════════════════════════════════════════════════════

This section is preserved during ContextKit migrations and updates.
Add project-specific instructions, examples, and overrides below.

## Project-Specific Instructions

<!-- Add project-specific guidance here -->

## Additional Examples

<!-- Add examples specific to your project here -->

## Override Behaviors

<!-- Document any project-specific overrides here -->