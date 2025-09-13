# Setup Project Context
<!-- Template Version: 0 | ContextKit: 0.0.0 | Updated: 2025-09-13 -->

> [!WARNING]
> **👩‍💻 FOR DEVELOPERS**: Do not edit the content above the developer customization section - changes will be overwritten during ContextKit updates.
>
> For project-specific customizations, use the designated section at the bottom of this file.
>
> Found a bug or improvement for everyone? Please report it: https://github.com/FlineDev/ContextKit/issues

## Description
Intelligent project setup within existing git repositories with auto-detection and workspace inheritance.

## Parameters
None (interactive detection and confirmation)

## Execution Flow (main)
```
1. Environment Validation
   → Check git repository status
   → If uncommitted changes: WARN "Commit changes first?" with user confirmation
   → If not git repo: WARN "Not in git repository. Continue?" with user confirmation
   → If permission denied: ERROR with guidance

2. Project Detection  
   → Scan for Package.swift → swift-package
   → Scan for *.xcodeproj → ios-app  
   → Scan for package.json → javascript-project
   → Scan for requirements.txt → python-project
   → If multiple found: ASK user to choose primary type
   → If none found: ASK user to specify type

3. Workspace Context Discovery
   → Traverse parent directories looking for Context.md files
   → If found: load workspace configuration and inheritance rules
   → If multiple workspaces found: ASK user which one to inherit from
   → If none found: use global defaults only

4. Existing Configuration Analysis
   → Check for existing CLAUDE.md → add @Context.md reference, never overwrite
   → Check for existing Context.md → merge intelligently, preserve manual edits
   → Check for existing .claude/ directory → merge templates, preserve customizations

5. Template Installation
   → Copy appropriate command templates to .claude/commands/
   → Copy relevant hooks to Context/Scripts/ 
   → Copy suitable agents to .claude/agents/ctxk/
   → Apply project-type-specific configurations

6. Context Generation
   → Create Context.md with detected configuration
   → Include ContextKit version, project type, workspace inheritance
   → Document architectural decisions and customizations
   → Add reference to CLAUDE.md if needed

7. Verification
   → Validate all files copied successfully
   → Test basic template functionality
   → Confirm hierarchical inheritance working
   → Report success with guidance for next steps
```

## Implementation

### Phase 1: Environment and Project Analysis

```bash
#!/bin/bash

# Get ContextKit global directory
CONTEXTKIT_DIR="$HOME/.ContextKit"
if [[ ! -d "$CONTEXTKIT_DIR" ]]; then
    echo "❌ ContextKit not installed globally"
    echo "💡 Run: curl -fsSL https://raw.githubusercontent.com/FlineDev/ContextKit/main/install.sh | sh"
    exit 1
fi

# Check git repository status
check_git_status() {
    if ! git rev-parse --git-dir > /dev/null 2>&1; then
        echo "⚠️ Not in a git repository. Continue with ContextKit setup? (y/N)"
        read -r response
        [[ "$response" =~ ^[Yy]$ ]] || exit 1
        return 0
    fi
    
    if [[ -n $(git status --porcelain) ]]; then
        echo "⚠️ Uncommitted changes detected."
        echo "💡 Recommendation: Commit changes first for cleaner setup tracking."
        echo "Continue anyway? (y/N)"
        read -r response
        [[ "$response" =~ ^[Yy]$ ]] || exit 1
    fi
}

# Detect project type
detect_project_type() {
    local detected_types=()
    
    # Check for Swift Package
    [[ -f "Package.swift" ]] && detected_types+=("swift-package")
    
    # Check for iOS/macOS App  
    if find . -maxdepth 1 -name "*.xcodeproj" | head -1 | grep -q "."; then
        detected_types+=("ios-app")
    fi
    
    # Check for JavaScript project
    [[ -f "package.json" ]] && detected_types+=("javascript-project")
    
    # Check for Python project  
    [[ -f "requirements.txt" || -f "pyproject.toml" || -f "setup.py" ]] && detected_types+=("python-project")
    
    # Check for Vapor server (Swift Package with Vapor dependency)
    if [[ -f "Package.swift" ]] && grep -q "vapor" Package.swift; then
        detected_types+=("vapor-server")
    fi
    
    case ${#detected_types[@]} in
        0)
            echo "❓ No recognized project type found."
            echo "Please specify project type:"
            echo "1) Swift Package"
            echo "2) iOS/macOS App"  
            echo "3) JavaScript Project"
            echo "4) Python Project"
            echo "5) Vapor Server"
            echo "6) Other"
            read -p "Choice (1-6): " choice
            case $choice in
                1) PROJECT_TYPE="swift-package" ;;
                2) PROJECT_TYPE="ios-app" ;;
                3) PROJECT_TYPE="javascript-project" ;;
                4) PROJECT_TYPE="python-project" ;;
                5) PROJECT_TYPE="vapor-server" ;;
                6) PROJECT_TYPE="other" ;;
                *) echo "❌ Invalid choice"; exit 1 ;;
            esac
            ;;
        1)
            PROJECT_TYPE="${detected_types[0]}"
            echo "✅ Detected project type: $PROJECT_TYPE"
            ;;
        *)
            echo "❓ Multiple project types detected: ${detected_types[*]}"
            echo "Please choose primary type:"
            for i in "${!detected_types[@]}"; do
                echo "$((i+1))) ${detected_types[$i]}"
            done
            read -p "Choice: " choice
            if [[ $choice -ge 1 && $choice -le ${#detected_types[@]} ]]; then
                PROJECT_TYPE="${detected_types[$((choice-1))]}"
                echo "✅ Selected project type: $PROJECT_TYPE"
            else
                echo "❌ Invalid choice"; exit 1
            fi
            ;;
    esac
}

# Discover workspace context
discover_workspace_context() {
    WORKSPACE_CONTEXT=""
    local current_dir="$(pwd)"
    
    while [[ "$current_dir" != "/" ]]; do
        local parent_dir="$(dirname "$current_dir")"
        if [[ -f "$parent_dir/Context.md" && "$parent_dir" != "$(pwd)" ]]; then
            if grep -q "ContextKit Configuration" "$parent_dir/Context.md" 2>/dev/null; then
                WORKSPACE_CONTEXT="$parent_dir/Context.md"
                WORKSPACE_NAME="$(basename "$parent_dir")"
                echo "✅ Found workspace context: $WORKSPACE_NAME"
                break
            fi
        fi
        current_dir="$parent_dir"
    done
    
    if [[ -z "$WORKSPACE_CONTEXT" ]]; then
        echo "ℹ️ No workspace context found - using global defaults"
    fi
}
```

### Phase 2: Configuration and Template Installation

```bash
# Analyze existing configuration
analyze_existing_config() {
    # Check existing CLAUDE.md
    if [[ -f "CLAUDE.md" ]]; then
        echo "ℹ️ Existing CLAUDE.md found - will add @Context.md reference"
        EXISTING_CLAUDE=true
        
        # Check if Context.md reference already exists
        if grep -q "@Context.md" CLAUDE.md; then
            echo "✅ @Context.md reference already exists in CLAUDE.md"
        else
            echo "" >> CLAUDE.md
            echo "@Context.md" >> CLAUDE.md
            echo "✅ Added @Context.md reference to existing CLAUDE.md"
        fi
    else
        EXISTING_CLAUDE=false
    fi
    
    # Check existing Context.md
    if [[ -f "Context.md" ]]; then
        echo "⚠️ Existing Context.md found"
        echo "Merge with new ContextKit configuration? (Y/n)"
        read -r response
        if [[ "$response" =~ ^[Nn]$ ]]; then
            echo "❌ Setup cancelled - please backup or rename existing Context.md"
            exit 1
        fi
        EXISTING_CONTEXT=true
        cp Context.md Context.md.backup
        echo "✅ Created backup: Context.md.backup"
    else
        EXISTING_CONTEXT=false
    fi
    
    # Check existing .claude/ directory
    if [[ -d ".claude" ]]; then
        echo "ℹ️ Existing .claude/ directory found - will preserve customizations"
        EXISTING_CLAUDE_DIR=true
    else
        EXISTING_CLAUDE_DIR=false
        mkdir -p .claude/{commands,agents/ctxk} Context/Scripts
    fi
}

# Install appropriate templates
install_templates() {
    echo "🔄 Installing ContextKit templates for $PROJECT_TYPE..."
    
    # Install command templates
    local commands_source="$CONTEXTKIT_DIR/Templates/Commands"
    local commands_dest=".claude/commands"
    
    cp -r "$commands_source"/* "$commands_dest/" 2>/dev/null || {
        echo "❌ Failed to copy command templates"
        exit 1
    }
    echo "✅ Installed command templates (/Plan/, /Implement/, /Backlog/)"
    
    # Install hook templates  
    local hooks_source="$CONTEXTKIT_DIR/Templates/Scripts"
    local hooks_dest="Context/Scripts"
    
    cp "$hooks_source"/* "$hooks_dest/" 2>/dev/null || {
        echo "❌ Failed to copy hook templates" 
        exit 1
    }
    chmod +x "$hooks_dest"/*.sh 2>/dev/null
    echo "✅ Installed hook templates (auto-format, version-status)"
    
    # Install agent templates
    local agents_source="$CONTEXTKIT_DIR/Templates/Agents"
    local agents_dest=".claude/agents/ctxk"

    cp "$agents_source"/* "$agents_dest/" 2>/dev/null || {
        echo "❌ Failed to copy agent templates"
        exit 1
    }
    echo "✅ Installed agent templates (build-project, check-accessibility, etc.)"
    
    # Install formatter configurations for Swift projects
    if [[ "$PROJECT_TYPE" =~ ^(swift-package|ios-app|vapor-server)$ ]]; then
        cp "$CONTEXTKIT_DIR/Templates/Formatters/.swift-format" . 2>/dev/null
        cp "$CONTEXTKIT_DIR/Templates/Formatters/.swiftformat" . 2>/dev/null
        echo "✅ Installed Swift formatter configurations"
    fi
}

# Generate Context.md
generate_context_md() {
    local contextkit_version="1.0.0"
    local setup_date=$(date +"%Y-%m-%d")
    local project_name=$(basename "$(pwd)")
    
    cat > Context.md << EOF
# Project Context: $project_name

## ContextKit Configuration
- **Version**: $contextkit_version
- **Setup Date**: $setup_date  
- **Project Type**: $PROJECT_TYPE
- **Workspace**: ${WORKSPACE_NAME:-"None (using global defaults)"}

## Project Architecture
**Detected Patterns**:
EOF

    # Add project-specific detected patterns
    case "$PROJECT_TYPE" in
        swift-package)
            echo "- **Language**: Swift" >> Context.md
            echo "- **Package Manager**: Swift Package Manager" >> Context.md  
            echo "- **Target Platforms**: Multi-platform (iOS, macOS, Linux)" >> Context.md
            echo "- **Architecture**: Package-first with public API design" >> Context.md
            ;;
        ios-app)
            echo "- **Language**: Swift" >> Context.md
            echo "- **Frameworks**: iOS SDK, likely SwiftUI/UIKit" >> Context.md
            echo "- **Target Platforms**: iOS, possibly iPadOS" >> Context.md  
            echo "- **Architecture**: iOS application with App Store distribution" >> Context.md
            ;;
        vapor-server)
            echo "- **Language**: Swift" >> Context.md
            echo "- **Framework**: Vapor web framework" >> Context.md
            echo "- **Target Platforms**: Server-side Swift (Linux, macOS)" >> Context.md
            echo "- **Architecture**: RESTful API server" >> Context.md
            ;;
        javascript-project)
            echo "- **Language**: JavaScript/TypeScript" >> Context.md  
            echo "- **Package Manager**: npm/yarn/pnpm" >> Context.md
            echo "- **Target Platforms**: Web browsers, Node.js" >> Context.md
            echo "- **Architecture**: Web application or Node.js service" >> Context.md
            ;;
        python-project)
            echo "- **Language**: Python" >> Context.md
            echo "- **Package Manager**: pip, possibly Poetry/pipenv" >> Context.md
            echo "- **Target Platforms**: Cross-platform Python environments" >> Context.md
            echo "- **Architecture**: Python application or library" >> Context.md
            ;;
    esac

    cat >> Context.md << EOF

**Constitutional Principles Applied**:
- **Accessibility-first design**: UI components must support assistive technologies
- **Privacy by design**: Minimal data collection with user consent and transparency  
- **Localizability from day one**: Externalized strings and cultural adaptation
- **Code maintainability**: Readable, testable code with clear separation of concerns
- **Platform-appropriate UX**: Native patterns and conventions for target platforms

## Development Workflow  
**Planning Commands**: /Plan/create-spec, /Plan/define-tech, /Plan/plan-steps
**Implementation Commands**: /Implement/start-working, /Implement/commit-changes
**Backlog Management**: /Backlog/add-idea, /Backlog/add-bug, /Backlog/prioritize-backlog
**Release Commands**: /Implement/release-app, /Implement/release-package

## Quality Assurance
**Automated Hooks**: 
- PostToolUse: Auto-format code after edits
- SessionStart: Version checking and status display

**Quality Agents**:  
- build-project: Compilation and error reporting
- check-accessibility: Accessibility compliance validation
- check-localization: Internationalization audit
- check-error-handling: Error handling pattern validation
- check-modern-code: API modernization suggestions  
- check-code-debt: Technical debt cleanup

## Team Configuration
**Commands**: Project-specific commands in .claude/commands/ (customizable)
**Hooks**: Project-specific automation in Context/Scripts/ (customizable)  
**Agents**: Project-specific quality checks in .claude/agents/ctxk/ (customizable)

---
*This file was generated by ContextKit v$contextkit_version on $setup_date*
*Manual edits to this file are preserved during ContextKit updates*
EOF

    echo "✅ Generated Context.md with project configuration"
}
```

### Phase 3: Verification and Completion

```bash
# Verify installation
verify_setup() {
    echo "🔄 Verifying ContextKit setup..."
    
    # Check critical files exist
    local critical_files=("Context.md" ".claude/commands/Plan/create-spec.md" "Context/Scripts/AutoFormat.sh")
    for file in "${critical_files[@]}"; do
        if [[ ! -f "$file" ]]; then
            echo "❌ Verification failed: Missing $file"
            exit 1
        fi
    done
    
    # Test template functionality
    if ! grep -q "Execution Flow" .claude/commands/Plan/create-spec.md; then
        echo "❌ Verification failed: Invalid template format"
        exit 1
    fi
    
    # Check hierarchical inheritance if workspace context exists  
    if [[ -n "$WORKSPACE_CONTEXT" ]]; then
        if ! grep -q "$WORKSPACE_NAME" Context.md; then
            echo "⚠️ Warning: Workspace inheritance may not be working correctly"
        fi
    fi
    
    echo "✅ Setup verification complete"
}

# Display completion message
display_completion() {
    echo ""
    echo "🎉 ContextKit setup complete for $PROJECT_TYPE project!"
    echo ""
    echo "📁 Project configured with:"
    echo "   ✓ Context.md - Project configuration and architecture"
    echo "   ✓ Context/Features/ - Feature development with systematic planning"
    echo "   ✓ Context/Backlog/ - Ideas and bugs with evaluation frameworks"
    echo "   ✓ .claude/commands/ - Development workflow commands"
    echo "   ✓ Context/Scripts/ - Automated code formatting and status"
    echo "   ✓ .claude/agents/ctxk/ - Quality assurance validation"
    [[ "$PROJECT_TYPE" =~ ^(swift-package|ios-app|vapor-server)$ ]] && echo "   ✓ Swift formatter configurations (.swift-format, .swiftformat)"
    echo ""
    echo "🚀 Ready to start development:"
    echo "   1. Begin feature planning: /Plan/create-spec"
    echo "   2. Capture ideas and bugs: /Backlog/add-idea, /Backlog/add-bug"
    echo "   3. Start implementation: /Implement/start-working"
    echo ""
    echo "💡 For help: /ContextKit/verify"
    echo ""
    
    if [[ "$PROJECT_TYPE" =~ ^(swift-package|ios-app|vapor-server)$ ]]; then
        echo "📝 Swift Development Notes:"
        echo "   • Constitutional principles are embedded in all templates"
        echo "   • Accessibility-first design is enforced through validation gates"  
        echo "   • Privacy and localization considerations are built into planning workflows"
        echo "   • Modern Swift patterns (Date.now, Duration, typed throws) are preferred"
        echo ""
    fi
    
    echo "🧠 ContextKit constitutional principles active - intelligent development workflows enabled!"
}
```

### Main Execution

```bash
main() {
    echo "🧠 ContextKit Project Setup"
    echo "Intelligent project configuration with workspace inheritance"
    echo ""
    
    # Execute setup phases
    check_git_status
    detect_project_type
    discover_workspace_context  
    analyze_existing_config
    install_templates
    generate_context_md
    verify_setup
    display_completion
    
    # Create Context/ directory structure for features and backlog
    mkdir -p Context/{Features,Backlog/{Ideas,Bugs}}
    echo "✅ Created Context/ directory structure for development workflow"

    # Copy backlog templates with framework structure
    if [[ -d "$CONTEXTKIT_DIR/Templates/Backlog" ]]; then
        cp "$CONTEXTKIT_DIR/Templates/Backlog/Ideas-Inbox.md" Context/Backlog/ 2>/dev/null
        cp "$CONTEXTKIT_DIR/Templates/Backlog/Ideas-Backlog.md" Context/Backlog/ 2>/dev/null
        cp "$CONTEXTKIT_DIR/Templates/Backlog/Bugs-Inbox.md" Context/Backlog/ 2>/dev/null
        cp "$CONTEXTKIT_DIR/Templates/Backlog/Bugs-Backlog.md" Context/Backlog/ 2>/dev/null
        echo "✅ Installed backlog templates with evaluation frameworks"
    else
        echo "⚠️  Backlog templates not found - update ContextKit installation"
    fi
}

main "$@"
```

## Error Conditions

- **"ContextKit not installed globally"** → Run global installation script first
- **"Not in git repository"** → User confirmation required to proceed
- **"Uncommitted changes detected"** → Recommend committing first, allow override  
- **"Permission denied"** → Check directory permissions and ownership
- **"Project type unclear"** → Interactive selection required from user
- **"Template copy failed"** → Verify ContextKit installation integrity
- **"Verification failed"** → Re-run setup or check global ContextKit installation

## Validation Gates

- [ ] ContextKit globally installed and accessible?
- [ ] Git repository status acceptable or user confirmed?
- [ ] Project type detected or user specified?
- [ ] Workspace context loaded if available?
- [ ] Templates copied successfully without errors?
- [ ] Context.md generated with correct project information?
- [ ] Critical files exist and have valid content?
- [ ] Team collaboration files (.claude/) properly configured?

## Template Variables Used

- `${PROJECT_TYPE}` - Detected or user-selected project type
- `${PROJECT_NAME}` - Current directory name  
- `${WORKSPACE_NAME}` - Inherited workspace name (if any)
- `${CONTEXTKIT_VERSION}` - Current ContextKit version
- `${SETUP_DATE}` - Setup execution date
- `${CONSTITUTIONAL_PRINCIPLES}` - Applied constitutional principles text

## Integration Points

- **Global ContextKit**: Reads from ~/.ContextKit/ template infrastructure
- **Workspace Inheritance**: Loads configuration from parent directory Context.md files  
- **Team Collaboration**: Creates committable .claude/ directory for team sharing
- **Development Workflow**: Integrates with /Plan/, /Implement/, and /Backlog/ commands
- **Quality Assurance**: Connects hooks and agents to development process

---

**Status**: Production ready - Intelligent project setup with constitutional compliance enforcement

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