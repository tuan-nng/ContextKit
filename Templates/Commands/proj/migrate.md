# Upgrade to Latest
<!-- Template Version: 14 | ContextKit: 0.1.0 | Updated: 2025-10-02 -->

> [!WARNING]
> **👩‍💻 FOR DEVELOPERS**: Do not edit the content above the developer customization section - changes will be overwritten during ContextKit updates.
>
> For project-specific customizations, use the designated section at the bottom of this file.
>
> Found a bug or improvement for everyone? Please report it: https://github.com/FlineDev/ContextKit/issues

## Description
Update ContextKit templates to latest versions while preserving user customizations.

**Key Features:**
- **Parallel Version Checking**: Uses Task tool with subagents to check all template versions simultaneously for maximum speed
- **Smart Merge Logic**: Only processes files that actually need updates (newer template versions)
- **Efficient Content Detection**: Skips complex merges when user customization sections contain no meaningful content
- **Comprehensive Preservation**: Maintains all user content below "👩‍💻 DEVELOPER CUSTOMIZATIONS" sections

Updates both:
- **Global reference materials** in ~/.cursor/contextkit/
- **Local project templates** (plan/, impl/, bckl/, guidelines, etc.) in current project

All updates preserve user customizations in "👩‍💻 DEVELOPER CUSTOMIZATIONS" sections.

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

### Phase 0: Check Customization

0. **Read the "👩‍💻 DEVELOPER CUSTOMIZATIONS" section**
   - Use `Grep` tool to find the start of the section
   - Read everything below that line contained in this document til the end of the file
   - Make sure to consider what was said there with high priority
   - If anything conflicts with the rest of the workflow, prioritize the "developer customizations"

### Phase 1: Automated Global Update & Version Scanning

1. **Comprehensive ContextKit Update & Analysis**
   - Check for updates by comparing template versions
   - Scan both global reference location (~/.cursor/contextkit/) and local project
   - List files needing updates (OUTDATED) and new files (NEW)

2. **Early Exit Check: Already Up to Date**
   - If stderr output contains no OUTDATED or NEW lines:
     - Display message: "✅ **Migration Complete**: All ContextKit templates are already up to date. No changes needed."
     - **EXIT IMMEDIATELY** - do not proceed to Phase 2 or any further processing
     - This is a successful completion, not an error

3. **Automated File Updates** (only if updates found)
   - For each file needing updates:
     - Compare template versions between source and target
     - Preserve user customizations in "👩‍💻 DEVELOPER CUSTOMIZATIONS" sections
     - Update core template content above customization sections
   - **Updates both**: 
     - Global reference materials in ~/.cursor/contextkit/
     - Local project templates in .cursor/rules/ctxk/ and Context/
   - **Intelligence**: Detects boilerplate vs real customizations automatically

### Phase 2: Manual File Processing (Complex Cases Only) - SKIP IF NO UPDATES FOUND

#### Phase 2.1: File Merge Logic

1. **Update Command Templates**
   - For each file in .cursor/rules/ctxk/:
     - If new file: Copy directly to project location
     - If existing file:
       - Use Read tool to examine project file
       - Use Grep tool to find "👩‍💻 DEVELOPER CUSTOMIZATIONS" line number
       - If separator found:
         - Check if user has added actual content below separator
         - If meaningful user content exists: Use Edit tool to merge (template above + user content below)
         - If no meaningful user content: Replace entirely with new template
       - If separator missing: Replace entirely

2. **Update Guidelines**
   - For each file in Context/Guidelines/:
     - Follow same merge logic as command templates
     - Preserve user-added sections and customizations

3. **Update Backlog Templates**
   - Only update structure templates (Ideas-Inbox.md, Bugs-Inbox.md)
   - Never touch backlog data files (Ideas-Backlog.md, Bugs-Backlog.md)

4. **Update .cursorrules** (if needed)
   - Only update if template structure has changed
   - Preserve all user-added project-specific content

5. **Track results:**
   - NEW_FILES: List of files copied
   - UPDATED_FILES: List of files merged with version info
   - WARNINGS: List of files skipped or issues encountered

### Phase 3: Summary Report - SKIP IF EARLY EXIT IN PHASE 1

Display results organized by:
- Global reference materials updated (count and version changes)
- Local command templates updated (count and version changes)
- Guidelines updated (count and version changes)
- New files added (count and list)
- Warnings (count and descriptions)
- Overall status (complete with updates)
- Git review reminder: "Migration complete. Review changes with 'git status' and commit when ready."
- Cursor reminder: "Use @ mentions to reference updated commands in Cursor Composer"

**Note**: If Phase 1 early exit occurred (no updates needed), this phase is skipped entirely.

## Error Conditions

- **"Could not check for updates"** → No internet connection (continues with cached version)
- **"Missing customization section"** → User file corrupted, skipped with warning
- **"Template file not found"** → Template files not available

## Success Criteria

- [ ] Global ContextKit repository updated (or warning issued)
- [ ] Global reference materials updated in ~/.cursor/contextkit/
- [ ] All local project template files scanned for version differences
- [ ] Local workflow commands (plan/, impl/, bckl/) updated preserving customizations
- [ ] Guidelines and backlog templates updated
- [ ] .cursorrules updated if needed
- [ ] Summary report shows both global and local updates with warnings

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