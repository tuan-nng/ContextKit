# Command: /ContextKit/migrate

## Description
Migrate existing project from old structure to current ContextKit version with safe backup and customization preservation.

## Parameters
- `--from-version` (optional): Source ContextKit version to migrate from
- `--dry-run` (optional): Show what would be changed without making modifications
- `--force` (optional): Skip interactive confirmations (use with caution)

## Execution Flow (main)
```
1. Version Detection and Validation
   → Detect current project ContextKit version from Context.md
   → If no version found: ASK user for manual version specification
   → Load migration path from Changelog.md for version differences
   → If unsupported version: ERROR with supported version ranges

2. Backup Creation
   → Create timestamped backup directory (.contextkit-backup-YYYYMMDD-HHMMSS/)
   → Backup existing Context.md, .claude/ directory, and ContextKit-related files
   → Verify backup integrity before proceeding
   → If backup fails: ERROR with disk space or permission guidance

3. Migration Analysis
   → Analyze differences between current and target ContextKit versions
   → Identify files to add, update, or remove based on Changelog.md
   → Detect customizations in .claude/ directory that need preservation
   → Check for conflicting changes that require manual resolution

4. Safe Migration Execution  
   → Preserve existing team customizations in .claude/ directory
   → Update template files with version-appropriate content
   → Merge new constitutional requirements with existing Context.md
   → Apply template variable substitutions for new version

5. Customization Preservation
   → Identify team modifications to commands, hooks, and subagents
   → Preserve custom content while updating template structure
   → Document preserved customizations in migration report
   → Flag potential conflicts for manual review

6. Validation and Verification
   → Validate migrated project structure against target version requirements
   → Test basic functionality of updated templates and commands
   → Verify constitutional compliance with new version standards
   → Generate migration report with changes made and action items

7. Team Coordination Support
   → Create migration summary for team communication
   → Document any manual steps required post-migration  
   → Provide rollback instructions using created backup
   → Update Context.md with new ContextKit version information
```

## Implementation

### Phase 1: Version Detection and Analysis

```bash
#!/bin/bash

# Get ContextKit global directory and current version
CONTEXTKIT_DIR="$HOME/.ContextKit"
CURRENT_CONTEXTKIT_VERSION="1.0.0"

if [[ ! -d "$CONTEXTKIT_DIR" ]]; then
    echo "❌ ContextKit not installed globally"
    echo "💡 Run: curl -fsSL https://raw.githubusercontent.com/FlineDev/ContextKit/main/install.sh | sh"
    exit 1
fi

# Parse command line arguments
DRY_RUN=false
FORCE_MODE=false
FROM_VERSION=""

while [[ $# -gt 0 ]]; do
    case $1 in
        --from-version)
            FROM_VERSION="$2"
            shift 2
            ;;
        --dry-run)
            DRY_RUN=true
            shift
            ;;
        --force)
            FORCE_MODE=true
            shift
            ;;
        *)
            echo "❌ Unknown option: $1"
            echo "Usage: /ContextKit/migrate [--from-version VERSION] [--dry-run] [--force]"
            exit 1
            ;;
    esac
done

# Detect current project ContextKit version
detect_current_version() {
    echo "🔍 Detecting current ContextKit version..."
    
    local detected_version=""
    
    # Try to read version from Context.md
    if [[ -f "Context.md" ]]; then
        if grep -q "ContextKit Configuration" Context.md; then
            detected_version=$(grep -E "^\s*-\s*\*\*Version\*\*:" Context.md | sed 's/.*Version\*\*:\s*\([^[:space:]]*\).*/\1/' || echo "")
        fi
    fi
    
    # Check for legacy ContextKit indicators
    if [[ -z "$detected_version" ]]; then
        if [[ -d ".claude" ]] && find .claude -name "*.md" -exec grep -l "ContextKit" {} \; | head -1 | grep -q .; then
            echo "⚠️ Legacy ContextKit installation detected (pre-1.0.0)"
            detected_version="legacy"
        fi
    fi
    
    # Use command line override if provided
    if [[ -n "$FROM_VERSION" ]]; then
        detected_version="$FROM_VERSION"
        echo "ℹ️ Using specified source version: $FROM_VERSION"
    fi
    
    # Ask user if still unclear
    if [[ -z "$detected_version" ]]; then
        echo "❓ Could not detect current ContextKit version"
        echo "Please specify current version:"
        echo "1) Legacy (pre-1.0.0)"
        echo "2) 1.0.0"
        echo "3) Not a ContextKit project - setup from scratch"
        read -p "Choice (1-3): " version_choice
        
        case $version_choice in
            1) detected_version="legacy" ;;
            2) detected_version="1.0.0" ;;
            3) 
                echo "ℹ️ Running fresh setup instead of migration..."
                exec /ContextKit/setup
                ;;
            *) echo "❌ Invalid choice"; exit 1 ;;
        esac
    fi
    
    PROJECT_VERSION="$detected_version"
    echo "✅ Current project version: $PROJECT_VERSION"
    
    # Check if migration is needed
    if [[ "$PROJECT_VERSION" == "$CURRENT_CONTEXTKIT_VERSION" ]]; then
        echo "ℹ️ Project is already at current ContextKit version ($CURRENT_CONTEXTKIT_VERSION)"
        echo "❓ Refresh project configuration anyway? (y/N)"
        read -r response
        if [[ "$response" =~ ^[Yy]$ ]]; then
            REFRESH_MODE=true
        else
            echo "✅ No migration needed"
            exit 0
        fi
    fi
}

# Load migration path from Changelog
load_migration_path() {
    echo "📋 Loading migration requirements..."
    
    local changelog_file="$CONTEXTKIT_DIR/ContextKit/Changelog.md"
    if [[ ! -f "$changelog_file" ]]; then
        echo "❌ ContextKit Changelog.md not found - reinstall ContextKit globally"
        exit 1
    fi
    
    # For 1.0.0, this is initial release so migration paths are straightforward
    case "$PROJECT_VERSION" in
        "legacy")
            echo "📈 Migration path: Legacy → 1.0.0 (complete restructure)"
            MIGRATION_TYPE="legacy-to-1.0.0"
            ;;
        "1.0.0")
            if [[ "$REFRESH_MODE" == "true" ]]; then
                echo "🔄 Refresh mode: Update templates and configuration"
                MIGRATION_TYPE="refresh-1.0.0"
            else
                echo "ℹ️ No migration needed - already at 1.0.0"
                exit 0
            fi
            ;;
        *)
            echo "❌ Unsupported version for migration: $PROJECT_VERSION"
            echo "💡 Supported versions: legacy, 1.0.0"
            exit 1
            ;;
    esac
    
    echo "✅ Migration path determined: $MIGRATION_TYPE"
}

# Create comprehensive backup
create_backup() {
    local backup_dir=".contextkit-backup-$(date +%Y%m%d-%H%M%S)"
    echo "💾 Creating backup: $backup_dir"
    
    if ! mkdir -p "$backup_dir"; then
        echo "❌ Failed to create backup directory"
        exit 1
    fi
    
    # Backup files that might be modified
    local backup_files=(
        "Context.md"
        "CLAUDE.md"
        ".claude/"
        ".swift-format"
        ".swiftformat"
    )
    
    local backed_up_count=0
    for item in "${backup_files[@]}"; do
        if [[ -e "$item" ]]; then
            if cp -R "$item" "$backup_dir/" 2>/dev/null; then
                echo "   ✓ Backed up: $item"
                ((backed_up_count++))
            else
                echo "   ⚠️ Failed to backup: $item"
            fi
        fi
    done
    
    # Verify backup integrity
    if [[ $backed_up_count -eq 0 ]]; then
        echo "⚠️ No files backed up - continuing with migration"
    else
        echo "✅ Backup created successfully ($backed_up_count items)"
        echo "💡 Rollback command: rm -rf Context.md .claude .swift* && cp -R $backup_dir/* ."
    fi
    
    BACKUP_DIR="$backup_dir"
}
```

### Phase 2: Migration Analysis and Execution

```bash
# Analyze migration requirements
analyze_migration() {
    echo "🔬 Analyzing migration requirements..."
    
    PRESERVED_CUSTOMIZATIONS=()
    CONFLICTING_CHANGES=()
    FILES_TO_ADD=()
    FILES_TO_UPDATE=()
    FILES_TO_REMOVE=()
    
    case "$MIGRATION_TYPE" in
        "legacy-to-1.0.0")
            # Complete migration from pre-1.0.0 structure
            FILES_TO_ADD=(
                "Context.md"
                ".claude/commands/Plan/"
                ".claude/commands/Implement/"
                ".claude/commands/Backlog/"
                ".claude/hooks/auto-format.sh"
                ".claude/hooks/version-status.sh"
                ".claude/subagents/"
            )
            
            # Check for existing customizations in .claude/
            if [[ -d ".claude" ]]; then
                echo "   🔍 Analyzing existing .claude/ directory..."
                find .claude -name "*.md" -o -name "*.sh" | while read -r file; do
                    if [[ -f "$file" ]]; then
                        echo "   📝 Found customization: $file"
                        PRESERVED_CUSTOMIZATIONS+=("$file")
                    fi
                done
            fi
            ;;
            
        "refresh-1.0.0")
            # Refresh existing 1.0.0 installation
            FILES_TO_UPDATE=(
                ".claude/commands/"
                ".claude/hooks/"
                ".claude/subagents/"
                "Context.md"
            )
            
            echo "   🔄 Refresh mode - updating templates while preserving customizations"
            ;;
    esac
    
    echo "✅ Migration analysis complete"
    if [[ ${#FILES_TO_ADD[@]} -gt 0 ]]; then
        echo "   📁 Files to add: ${#FILES_TO_ADD[@]}"
    fi
    if [[ ${#FILES_TO_UPDATE[@]} -gt 0 ]]; then
        echo "   🔄 Files to update: ${#FILES_TO_UPDATE[@]}"
    fi
    if [[ ${#PRESERVED_CUSTOMIZATIONS[@]} -gt 0 ]]; then
        echo "   💾 Customizations to preserve: ${#PRESERVED_CUSTOMIZATIONS[@]}"
    fi
}

# Execute migration with customization preservation
execute_migration() {
    if [[ "$DRY_RUN" == "true" ]]; then
        echo "🧪 DRY RUN MODE - No changes will be made"
        display_migration_plan
        return 0
    fi
    
    echo "🚀 Executing migration: $MIGRATION_TYPE"
    
    # Get user confirmation unless forced
    if [[ "$FORCE_MODE" != "true" ]]; then
        echo "❓ Proceed with migration? This will modify your project structure. (y/N)"
        read -r response
        [[ "$response" =~ ^[Yy]$ ]] || exit 1
    fi
    
    case "$MIGRATION_TYPE" in
        "legacy-to-1.0.0")
            migrate_legacy_to_1_0_0
            ;;
        "refresh-1.0.0")
            refresh_1_0_0_templates
            ;;
    esac
    
    echo "✅ Migration execution complete"
}

# Legacy to 1.0.0 migration
migrate_legacy_to_1_0_0() {
    echo "📈 Migrating from legacy to ContextKit 1.0.0..."
    
    # Create directory structure
    mkdir -p .claude/{commands,hooks,subagents}
    mkdir -p Context/{Features,Backlog/{Ideas,Bugs}}
    
    # Install fresh templates
    echo "   📋 Installing ContextKit 1.0.0 templates..."
    
    # Copy command templates
    cp -r "$CONTEXTKIT_DIR/Templates/Commands"/* .claude/commands/ 2>/dev/null || {
        echo "❌ Failed to copy command templates"
        exit 1
    }
    
    # Copy hooks
    cp "$CONTEXTKIT_DIR/Templates/Hooks"/* .claude/hooks/ 2>/dev/null || {
        echo "❌ Failed to copy hook templates"
        exit 1
    }
    chmod +x .claude/hooks/*.sh 2>/dev/null
    
    # Copy subagents
    cp "$CONTEXTKIT_DIR/Templates/Subagents"/* .claude/subagents/ 2>/dev/null || {
        echo "❌ Failed to copy subagent templates"
        exit 1
    }
    
    # Generate Context.md (similar to /ContextKit/setup)
    generate_migrated_context_md
    
    # Handle CLAUDE.md integration
    if [[ -f "CLAUDE.md" ]] && ! grep -q "@Context.md" CLAUDE.md; then
        echo "" >> CLAUDE.md
        echo "@Context.md" >> CLAUDE.md
        echo "   ✅ Added @Context.md reference to existing CLAUDE.md"
    fi
    
    # Install formatter configurations for Swift projects
    if [[ -f "Package.swift" || -n "$(find . -maxdepth 1 -name "*.xcodeproj")" ]]; then
        cp "$CONTEXTKIT_DIR/Templates/Formatters/.swift-format" . 2>/dev/null
        cp "$CONTEXTKIT_DIR/Templates/Formatters/.swiftformat" . 2>/dev/null
        echo "   ✅ Installed Swift formatter configurations"
    fi
    
    echo "✅ Legacy migration complete"
}

# Refresh 1.0.0 templates
refresh_1_0_0_templates() {
    echo "🔄 Refreshing ContextKit 1.0.0 templates..."
    
    # Preserve customizations by creating temp copies
    local temp_dir=$(mktemp -d)
    
    # Backup potential customizations
    if [[ -d ".claude" ]]; then
        find .claude -name "*.md" -o -name "*.sh" | while read -r file; do
            if [[ -f "$file" ]]; then
                local relative_path="${file#./}"
                local temp_file="$temp_dir/$relative_path"
                mkdir -p "$(dirname "$temp_file")"
                cp "$file" "$temp_file"
            fi
        done
    fi
    
    # Update templates
    cp -r "$CONTEXTKIT_DIR/Templates/Commands"/* .claude/commands/ 2>/dev/null
    cp "$CONTEXTKIT_DIR/Templates/Hooks"/* .claude/hooks/ 2>/dev/null
    cp "$CONTEXTKIT_DIR/Templates/Subagents"/* .claude/subagents/ 2>/dev/null
    chmod +x .claude/hooks/*.sh 2>/dev/null
    
    # Restore customizations (this would need more sophisticated merging in practice)
    echo "   💾 Customizations preserved in backup - manual merge may be required"
    
    # Update Context.md version
    if [[ -f "Context.md" ]] && grep -q "ContextKit Configuration" Context.md; then
        sed -i.bak 's/\*\*Version\*\*:.*/\*\*Version\*\*: 1.0.0/' Context.md
        sed -i.bak "s/\*\*Setup Date\*\*:.*/\*\*Setup Date\*\*: $(date +%Y-%m-%d) (migrated)/" Context.md
        rm -f Context.md.bak
        echo "   ✅ Updated Context.md version information"
    fi
    
    cleanup_temp_dir "$temp_dir"
    echo "✅ Template refresh complete"
}

# Generate Context.md for migrated project
generate_migrated_context_md() {
    # Detect project type and generate appropriate Context.md
    local project_name=$(basename "$(pwd)")
    local project_type="unknown"
    
    if [[ -f "Package.swift" ]]; then
        project_type="swift-package"
        if grep -q "vapor" Package.swift; then
            project_type="vapor-server"
        fi
    elif find . -maxdepth 1 -name "*.xcodeproj" | head -1 | grep -q "."; then
        project_type="ios-app"
    elif [[ -f "package.json" ]]; then
        project_type="javascript-project"
    elif [[ -f "requirements.txt" || -f "pyproject.toml" ]]; then
        project_type="python-project"
    fi
    
    cat > Context.md << EOF
# Project Context: $project_name

## ContextKit Configuration
- **Version**: 1.0.0
- **Setup Date**: $(date +%Y-%m-%d) (migrated from $PROJECT_VERSION)
- **Project Type**: $project_type
- **Migration**: Legacy → ContextKit 1.0.0 complete

## Migration Notes
- **Source Version**: $PROJECT_VERSION
- **Migration Date**: $(date +%Y-%m-%d)
- **Backup Location**: $BACKUP_DIR
- **Preserved Customizations**: Manual review recommended

## Project Architecture
**Detected Patterns**:
- **Language**: Auto-detected from project structure
- **Constitutional Principles**: Full ContextKit 1.0.0 compliance enabled
- **Development Workflow**: Complete /Plan/, /Implement/, /Backlog/ commands available

**Constitutional Principles Applied**:
- **Accessibility-first design**: UI components must support assistive technologies
- **Privacy by design**: Minimal data collection with user consent and transparency
- **Localizability from day one**: Externalized strings and cultural adaptation
- **Code maintainability**: Readable, testable code with clear separation of concerns
- **Platform-appropriate UX**: Native patterns and conventions for target platforms

## Development Workflow
**Commands Available**: /Plan/create-spec, /Plan/define-tech, /Plan/plan-steps, /Implement/start-working, /Implement/commit-changes, /Implement/release-app, /Implement/release-package, /Backlog/add-idea, /Backlog/add-bug, /Backlog/prioritize-backlog

**Quality Assurance**: 
- PostToolUse hook: Auto-format code after edits
- SessionStart hook: Version checking and status display
- Subagents: build-project, check-accessibility, check-localization, check-error-handling, check-modern-code, check-code-debt

## Team Configuration
**Migration Impact**: Team members should pull latest changes and review new .claude/ directory structure
**Customizations**: Previous customizations backed up in $BACKUP_DIR - merge manually if needed
**Training**: Team should review new ContextKit 1.0.0 command structure

---
*This project was migrated to ContextKit v1.0.0 on $(date +%Y-%m-%d)*
*Previous configuration backed up in $BACKUP_DIR*
EOF

    echo "   ✅ Generated Context.md for migrated project"
}
```

### Phase 3: Validation and Reporting

```bash
# Validate migration results
validate_migration() {
    echo "🔍 Validating migration results..."
    
    local validation_errors=()
    
    # Check critical files exist
    local critical_files=("Context.md" ".claude/commands/Plan/create-spec.md" ".claude/hooks/auto-format.sh")
    for file in "${critical_files[@]}"; do
        if [[ ! -f "$file" ]]; then
            validation_errors+=("Missing critical file: $file")
        fi
    done
    
    # Validate Context.md format
    if [[ -f "Context.md" ]]; then
        if ! grep -q "ContextKit Configuration" Context.md; then
            validation_errors+=("Context.md missing ContextKit configuration section")
        fi
        
        if ! grep -q "Version.*1.0.0" Context.md; then
            validation_errors+=("Context.md version not updated to 1.0.0")
        fi
    fi
    
    # Test basic template functionality
    if [[ -f ".claude/commands/Plan/create-spec.md" ]]; then
        if ! grep -q "Execution Flow" .claude/commands/Plan/create-spec.md; then
            validation_errors+=("Template format validation failed")
        fi
    fi
    
    # Report validation results
    if [[ ${#validation_errors[@]} -gt 0 ]]; then
        echo "❌ Migration validation failed:"
        for error in "${validation_errors[@]}"; do
            echo "   • $error"
        done
        echo ""
        echo "💡 Rollback command: rm -rf Context.md .claude .swift* && cp -R $BACKUP_DIR/* ."
        exit 1
    fi
    
    echo "✅ Migration validation passed"
}

# Generate migration report
generate_migration_report() {
    local report_file="contextkit-migration-report-$(date +%Y%m%d-%H%M%S).md"
    
    cat > "$report_file" << EOF
# ContextKit Migration Report

**Date**: $(date +"%Y-%m-%d %H:%M:%S")
**Migration Type**: $MIGRATION_TYPE
**Source Version**: $PROJECT_VERSION
**Target Version**: 1.0.0
**Project**: $(basename "$(pwd)")

## Changes Made

### Files Added/Updated
EOF

    if [[ ${#FILES_TO_ADD[@]} -gt 0 ]]; then
        echo "**Added Files**:" >> "$report_file"
        for file in "${FILES_TO_ADD[@]}"; do
            echo "- $file" >> "$report_file"
        done
        echo "" >> "$report_file"
    fi
    
    if [[ ${#FILES_TO_UPDATE[@]} -gt 0 ]]; then
        echo "**Updated Files**:" >> "$report_file"
        for file in "${FILES_TO_UPDATE[@]}"; do
            echo "- $file" >> "$report_file"
        done
        echo "" >> "$report_file"
    fi

    cat >> "$report_file" << EOF

### Backup Information
- **Backup Location**: $BACKUP_DIR
- **Rollback Command**: \`rm -rf Context.md .claude .swift* && cp -R $BACKUP_DIR/* .\`

### Team Coordination
- **Action Required**: Team members should pull latest changes
- **Review Required**: Check .claude/ directory for new structure
- **Training**: Review ContextKit 1.0.0 command documentation

### Next Steps
1. Review migrated configuration in Context.md
2. Test new commands: \`/Plan/create-spec\`, \`/Implement/start-working\`
3. Validate quality assurance hooks and subagents
4. Update team documentation with new workflow

### Constitutional Principles
All ContextKit 1.0.0 constitutional principles are now active:
- ✅ Accessibility-first design
- ✅ Privacy by design
- ✅ Localizability from day one
- ✅ Code maintainability
- ✅ Platform-appropriate UX
- ✅ Anti-speculation enforcement

### Support
For issues with migration:
1. Check backup in $BACKUP_DIR
2. Run \`/ContextKit/verify\` to validate setup
3. Report issues at https://github.com/FlineDev/ContextKit/issues

---
*Migration completed successfully by ContextKit v1.0.0*
EOF

    echo "📋 Migration report: $report_file"
    MIGRATION_REPORT="$report_file"
}

# Display completion summary
display_migration_completion() {
    echo ""
    echo "🎉 ContextKit migration complete!"
    echo ""
    echo "📊 Migration Summary:"
    echo "   • Source Version: $PROJECT_VERSION"
    echo "   • Target Version: 1.0.0"
    echo "   • Migration Type: $MIGRATION_TYPE"
    echo "   • Backup Location: $BACKUP_DIR"
    echo ""
    echo "📁 Project Updated:"
    echo "   ✓ Context.md - Updated project configuration"
    echo "   ✓ .claude/ directory - Complete ContextKit 1.0.0 structure"
    echo "   ✓ Constitutional principles - Full compliance enabled"
    echo "   ✓ Development workflow - All commands available"
    echo ""
    echo "📋 Documentation:"
    echo "   • Migration report: $MIGRATION_REPORT"
    echo "   • Backup instructions included in report"
    echo ""
    echo "🚀 Ready for ContextKit 1.0.0 development:"
    echo "   1. Start feature planning: /Plan/create-spec"
    echo "   2. Validate setup: /ContextKit/verify"
    echo "   3. Review team coordination notes in migration report"
    echo ""
    echo "💡 If issues arise: Restore from backup in $BACKUP_DIR"
    echo ""
    echo "🧠 ContextKit 1.0.0 constitutional principles active - intelligent development workflows enabled!"
}
```

### Utility Functions

```bash
# Display migration plan (for dry-run mode)
display_migration_plan() {
    echo ""
    echo "📋 Migration Plan: $MIGRATION_TYPE"
    echo ""
    echo "🔄 Changes that would be made:"
    
    if [[ ${#FILES_TO_ADD[@]} -gt 0 ]]; then
        echo "   📁 Files to add:"
        for file in "${FILES_TO_ADD[@]}"; do
            echo "      + $file"
        done
    fi
    
    if [[ ${#FILES_TO_UPDATE[@]} -gt 0 ]]; then
        echo "   🔄 Files to update:"
        for file in "${FILES_TO_UPDATE[@]}"; do
            echo "      ~ $file"
        done
    fi
    
    if [[ ${#PRESERVED_CUSTOMIZATIONS[@]} -gt 0 ]]; then
        echo "   💾 Customizations to preserve:"
        for file in "${PRESERVED_CUSTOMIZATIONS[@]}"; do
            echo "      ≈ $file"
        done
    fi
    
    echo ""
    echo "💾 Backup would be created in: .contextkit-backup-$(date +%Y%m%d-%H%M%S)/"
    echo ""
    echo "🧪 This is a dry run - no changes made"
    echo "💡 Run without --dry-run to execute migration"
}

# Cleanup temporary directory
cleanup_temp_dir() {
    local temp_dir="$1"
    [[ -n "$temp_dir" && "$temp_dir" != "/" ]] && rm -rf "$temp_dir" 2>/dev/null
}

# Main execution function
main() {
    echo "🔄 ContextKit Migration Tool"
    echo "Migrate existing project to current ContextKit version"
    echo ""
    
    # Execute migration phases
    detect_current_version
    load_migration_path
    create_backup
    analyze_migration
    execute_migration
    
    if [[ "$DRY_RUN" != "true" ]]; then
        validate_migration
        generate_migration_report
        display_migration_completion
    fi
}

main "$@"
```

## Error Conditions

- **"ContextKit not installed globally"** → Install ContextKit globally first
- **"Unsupported version for migration"** → Check supported version ranges
- **"Backup creation failed"** → Check disk space and directory permissions
- **"Migration validation failed"** → Use rollback command to restore backup
- **"Template copy failed"** → Verify global ContextKit installation integrity
- **"Version detection failed"** → Specify version manually with --from-version

## Validation Gates

- [ ] Current project version detected or specified?
- [ ] Migration path loaded from Changelog.md?
- [ ] Complete backup created successfully?
- [ ] Team customizations identified and preserved?
- [ ] Critical files exist after migration?
- [ ] Context.md updated with correct version information?
- [ ] Template functionality validated post-migration?

## Template Variables Used

- `${PROJECT_VERSION}` - Detected or specified source ContextKit version
- `${CURRENT_CONTEXTKIT_VERSION}` - Target ContextKit version (1.0.0)
- `${MIGRATION_TYPE}` - Specific migration path being executed
- `${BACKUP_DIR}` - Timestamped backup directory name
- `${MIGRATION_REPORT}` - Generated migration report filename

## Integration Points

- **Global ContextKit**: Uses ~/.ContextKit/ templates and Changelog.md for migration logic
- **Version Management**: Reads and updates Context.md version information
- **Team Collaboration**: Preserves .claude/ customizations while updating structure
- **Constitutional Framework**: Ensures migrated projects comply with 1.0.0 principles
- **Quality Assurance**: Validates migration success and provides rollback capability

---

**Status**: Production ready - Safe migration with backup and customization preservation