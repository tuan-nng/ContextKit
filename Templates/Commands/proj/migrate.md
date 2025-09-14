# Upgrade to Latest
<!-- Template Version: 1 | ContextKit: 0.0.0 | Updated: 2025-09-14 -->

> [!WARNING]
> **👩‍💻 FOR DEVELOPERS**: Do not edit the content above the developer customization section - changes will be overwritten during ContextKit updates.
>
> For project-specific customizations, use the designated section at the bottom of this file.
>
> Found a bug or improvement for everyone? Please report it: https://github.com/FlineDev/ContextKit/issues

## Description
Update ContextKit templates to latest versions while preserving user customizations

## Reference

**User Question Format**: When asking user questions, use this consistent format:
```
═══════════════════════════════════════════════════
║ ❓ [DESCRIPTIVE HEADER]
═══════════════════════════════════════════════════
║
║ [Question text and context]
║ [Options if applicable]
║
║ [Clear response instruction]
```

## Execution Flow (main)

### Phase 1: Update Global ContextKit

1. Check if ~/.ContextKit/ directory exists
   - Use Bash tool: ls -la ~/.ContextKit/
   - If missing: ERROR "Run global installation first"

2. Update global repository with git pull
   - Use Bash tool: cd ~/.ContextKit/ && git pull origin main --quiet
   - If pull fails: WARN "Could not check for updates (no internet)" and continue

### Phase 2: Scan Project Templates

1. Define file mappings for all template types:
   - Templates/Guidelines/*.md → Context/Guidelines/
   - Templates/Commands/**/*.md → .claude/commands/ctxk/
   - Templates/Agents/*.md → .claude/agents/ctxk/
   - Templates/Scripts/*.sh → Context/Scripts/ (team sharing, hooks via settings.json)
   - Templates/settings.json → .claude/settings.json (intelligent merge only)
   - Templates/Backlog/*.md → Context/Backlog/ (preserving user content via customization sections)

2. For each mapping:
   - Use Bash tool: sed -n '2p' file | grep "Template Version" to check template versions
   - Use Read tool to examine project files if they exist
   - Compare versions and add to update list if versions differ or file missing

### Phase 3: Update Files Preserving Customizations

#### Phase 3.1: Intelligent Settings.json Merge

1. Use Read tool to examine current .claude/settings.json
2. Use Read tool to read ~/.ContextKit/Templates/settings.json for latest template

3. StatusLine Configuration:
   - If user has statusLine setting with path containing "CustomStatusline.sh":
     - Check if path is correct (should be "./Context/Scripts/CustomStatusline.sh")
     - If path incorrect: Update path to correct location using Edit tool
     - If path correct: No change needed
   - If user has no statusLine setting or different script: Skip (user opted out)

4. Model Setting:
   - Skip entirely - never update user's model preference

5. Permissions Array Merge:
   - Read current allow/deny arrays from user settings
   - Read template allow/deny arrays from ContextKit template
   - For allow list: Smart merge avoiding duplicates, keep alphabetically sorted
   - For deny list: Smart merge avoiding duplicates, keep alphabetically sorted
   - Use Edit tool to update only if arrays changed

6. Hooks Configuration:
   - Identify ContextKit hooks: PostToolUse="./Context/Scripts/AutoFormat.sh", SessionStart="./Context/Scripts/VersionStatus.sh"
   - Keep all user-specific hooks unchanged
   - Add missing ContextKit hooks
   - Update existing ContextKit hooks if paths changed
   - Remove only ContextKit hooks that no longer exist in template
   - Use Edit tool to update only if hooks changed

7. Track settings.json changes:
   - Add to UPDATED_FILES if any changes made
   - Add to WARNINGS if merge had issues

### Phase 3.2: Other Files

1. For each file needing update:
   - If new file: Use Bash tool cp to copy directly to project location
   - If existing file with customizations:
     - Use Read tool to examine both template and project files
     - Use Grep tool to find "👩‍💻 DEVELOPER CUSTOMIZATIONS" line number in both files
     - Use Edit tool to merge: template content above + user content below separator
     - If separator missing: SKIP with warning
   - If existing file without customizations (Scripts): Use Bash tool cp to replace entirely
   - If settings.json: Use intelligent merge logic (see Phase 3.1)

2. Track results:
   - NEW_FILES: List of files copied
   - UPDATED_FILES: List of files merged with version info
   - WARNINGS: List of files skipped or issues encountered

### Phase 4: Summary Report

Display results organized by:
- New files added (count and list)
- Files updated (count and version changes)
- Settings.json merge results (if applicable)
- Warnings (count and descriptions)
- Overall status (complete/no updates needed)
- Git review reminder: "Migration complete. Review changes with 'git status' and commit when ready."

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
Add migration-specific customizations below.

## Custom Migration Steps
<!-- Add extra steps like CI/CD configs, custom agents, or company workflows -->

## Skip Migration Files
<!-- Document files to exclude like custom settings or company statuslines -->

## Custom Template Sources
<!-- Define alternative sources like company-specific templates or internal repositories -->