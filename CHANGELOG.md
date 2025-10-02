# ContextKit Changelog
<!-- ContextKit: 0.2.0-cursor | Updated: 2025-10-02 -->

Maintains accurate changelog following [Keep a Changelog](https://keepachangelog.com/) format. 
Used by `/ctxk:proj:migrate` command to track file changes and preserve user customizations.

════════════════════════════════════════════════════════════════════════════════
║ 🤖 EXECUTION FLOW - CHANGELOG MAINTENANCE
════════════════════════════════════════════════════════════════════════════════
║ 
║ ## When to Add Entries
║ 
║ Add entries for ANY file changes in the ContextKit repository:
║ - New files created
║ - Existing files modified (content, structure, format changes)
║ - Files moved or renamed
║ - Files deleted
║ - Directory structure changes
║ 
║ ## Entry Format Rules
║ 
║ Always use full file paths from repository root:
║ - ✅ `Templates/Commands/proj/init.md` 
║ - ❌ `init.md` or `proj/init.md`
║ 
║ Include brief description of what changed and short commit SHA:
║ - ✅ `Templates/Scripts/AutoFormat.sh` - Added Swift 6 compatibility (a1b2c3d)
║ - ❌ `Templates/Scripts/AutoFormat.sh` - Updated
║ 
║ Commit SHA format:
║ - Use short 7-character SHA: (a1b2c3d)
║ - Get with: git rev-parse --short HEAD
║ - Enables /migrate command to examine exact git changes
║ 
║ ## Migration Markers
║ 
║ Use [M] prefix for changes that affect existing user projects:
║ - [M] Template files that users customize (commands, agents, hooks)
║ - [M] File moves/renames that require path updates
║ - [M] File deletions that need cleanup
║ - [M] Configuration changes that affect user settings
║ 
║ No marker for safe changes:
║ - Documentation updates (README.md, CLAUDE.md)
║ - New optional files users can adopt gradually
║ - Repository infrastructure that doesn't affect deployed projects
║ 
║ ## Changelog Sections
║ 
║ Use standard Keep a Changelog format:
║ - Added: New files and features
║ - Changed: Modifications to existing files
║ - Deprecated: Soon-to-be removed features (with timeline)
║ - Removed: Files and features removed in this version
║ - Fixed: Bug fixes
║ - Security: Security improvements
║ 
║ ## Release Process
║ 
║ When making a release:
║ 1. Update first line: **Current Version: X.X.X** to new version number
║ 2. Change [Unreleased] to [Version] - YYYY-MM-DD
║ 3. Remove empty sections from the released version
║ 4. Create new [Unreleased] section above it with all sections showing "N/A"
║ 
║ Example after release:
║ **Current Version: 1.0.0**
║ 
║ # ContextKit Changelog
║ [system instructions...]
║ 
║ ## [Unreleased]
║ ### Added
║ N/A
║ ### Changed  
║ N/A
║ [etc. - all sections with N/A]
║ 
║ ## [1.0.0] - 2025-01-15
║ ### Added
║ - `file.md` - Description (a1b2c3d)
║ ### Changed
║ - `[M] file.md` - Description (e4f5g6h)  
║ [Only sections with actual content]
════════════════════════════════════════════════════════════════════════════════

## [0.2.0-cursor] - 2025-10-02

### 🎉 Major: Cursor IDE & Web Development Focus

Complete adaptation of ContextKit from Claude Code to Cursor IDE with focus on web frontend/backend development. **Breaking change** - not backward compatible with Claude Code or mobile development.

### Added
- `.cursorrules` template for Cursor project context
- `@ mention` system - all commands now use `@ctxk:*`
- **TypeScript.md** - Comprehensive TypeScript quality guidelines
- **React.md** - React best practices and patterns  
- Scripts/README.md documenting hook limitations
- Comprehensive Cursor documentation (3 new docs)

### Changed
- [M] All 20 command templates: `/ctxk:*` → `@ctxk:*`
- [M] Directory structure: `.claude/` → `.cursor/`
- [M] impl/start-working.md (v15→v16): Agents → Guidelines
- [M] impl/commit-changes.md (v10→v11): Rewritten for direct git workflow
- [M] impl/release-package.md (v3→v4): Swift Package → NPM Package
- [M] proj/init.md (v10→v11): Removed hooks/agents, added .cursorrules
- [M] proj/migrate.md (v13→v14): Simplified without hooks/agents  
- [M] README.md: Updated for web development (React/TypeScript/Node.js examples)
- [M] All documentation updated to focus on web frontend/backend

### Removed
- **Mobile development support**: Swift.md, SwiftUI.md guidelines removed
- **release-app.md**: iOS/macOS app release command removed
- Hook system support (AutoFormat, VersionStatus, CustomStatusline)
- Agent system (build-project, commit-changes, run-test-*, check-*)
- Settings.json manipulation (Cursor uses built-in settings)
- App showcase section from README

### Migration
- Requires re-initialization for Cursor users
- Mobile developers: use original Claude Code version or fork for mobile
- Agents → Context/Guidelines/ + Context.md commands  
- Hooks → Cursor built-in features + manual workflows
- Planning methodology unchanged

## [Unreleased]

### Added
N/A

### Changed
N/A

### Deprecated
N/A

### Removed
N/A

### Fixed
N/A

### Security
N/A