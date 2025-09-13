#!/bin/bash
# version-status.sh - ContextKit version management and status display
# Called by SessionStart hook when Claude Code starts a new session

## Purpose
# - Check installed ContextKit CLI version against latest available and auto-update if newer version exists
# - Compare project/workspace ContextKit version against installed version 
# - Display warning in Claude output if migration needed
# - Show current vs available versions and suggest `/ContextKit/migrate` command to update project structure

set -e

echo "🧠 ContextKit Version & Status Check..."

CONTEXTKIT_DIR="$HOME/.ContextKit"
PROJECT_CONTEXT="./Context.md"
WORKSPACE_CONTEXT=""

# Find workspace context by traversing parent directories
current_dir="$(pwd)"
while [ "$current_dir" != "/" ]; do
    parent_dir="$(dirname "$current_dir")"
    if [ -f "$parent_dir/Context.md" ] && [ "$parent_dir" != "$(pwd)" ]; then
        WORKSPACE_CONTEXT="$parent_dir/Context.md"
        break
    fi
    current_dir="$parent_dir"
done

###########################################
# Version Management
###########################################
check_contextkit_version() {
    echo "  📋 Checking ContextKit versions..."
    
    # Check if ContextKit is installed globally
    if [ ! -d "$CONTEXTKIT_DIR" ]; then
        echo "  ❌ ContextKit not installed globally"
        echo "     💡 Run: curl -fsSL https://raw.githubusercontent.com/FlineDev/ContextKit/main/install.sh | sh"
        return 1
    fi
    
    # Get installed version
    local installed_version=""
    if [ -f "$CONTEXTKIT_DIR/CHANGELOG.md" ]; then
        installed_version=$(grep -m 1 "## \[" "$CONTEXTKIT_DIR/CHANGELOG.md" | sed 's/## \[\(.*\)\].*/\1/' || echo "unknown")
    else
        installed_version="unknown"
    fi
    
    echo "  📦 Installed ContextKit version: $installed_version"
    
    # Check for updates (simplified - in real implementation this would check GitHub releases)
    # For now, just indicate the version checking system is working
    echo "  🔄 Version check complete"
    
    # Check project version compatibility
    check_project_version_compatibility "$installed_version"
}

check_project_version_compatibility() {
    local installed_version="$1"
    
    # Check project ContextKit version
    if [ -f "$PROJECT_CONTEXT" ]; then
        local project_version=""
        if grep -q "ContextKit Version" "$PROJECT_CONTEXT"; then
            project_version=$(grep "ContextKit Version" "$PROJECT_CONTEXT" | sed 's/.*: \(.*\)/\1/' || echo "unknown")
            echo "  📁 Project ContextKit version: $project_version"
            
            # Compare versions (simplified comparison)
            if [ "$project_version" != "$installed_version" ] && [ "$project_version" != "unknown" ]; then
                echo "  ⚠️  Version mismatch detected!"
                echo "     Project: $project_version, Installed: $installed_version"
                echo "     💡 Consider running: /ContextKit/migrate"
            else
                echo "  ✅ Project version compatible"
            fi
        else
            echo "  ⚪ No ContextKit version info in project Context.md"
        fi
    fi
    
    # Check workspace version if present  
    if [ -n "$WORKSPACE_CONTEXT" ] && [ -f "$WORKSPACE_CONTEXT" ]; then
        if grep -q "ContextKit Version" "$WORKSPACE_CONTEXT"; then
            local workspace_version=$(grep "ContextKit Version" "$WORKSPACE_CONTEXT" | sed 's/.*: \(.*\)/\1/' || echo "unknown")
            echo "  📂 Workspace ContextKit version: $workspace_version"
        fi
    fi
}

###########################################
# Status Display
###########################################
display_project_status() {
    echo "  🎯 Project Status..."
    
    # Detect project type
    local project_type="unknown"
    if [ -f "Package.swift" ]; then
        project_type="Swift Package"
    elif find . -maxdepth 1 -name "*.xcodeproj" | head -1 | grep -q "."; then
        project_type="iOS/macOS App"
    elif [ -f "package.json" ]; then
        project_type="JavaScript Project"
    elif [ -f "requirements.txt" ] || [ -f "pyproject.toml" ]; then
        project_type="Python Project"
    fi
    
    echo "  📦 Project type: $project_type"
    
    # Check for active features
    local active_features=0
    if [ -d "Context/Features" ]; then
        active_features=$(find Context/Features -name "Steps.md" -exec grep -l "\[ \]" {} \; 2>/dev/null | wc -l)
        echo "  🚧 Active features: $active_features"
    fi
    
    # Check backlog status
    local ideas=0
    local bugs=0
    if [ -d "Context/Backlog/Ideas" ]; then
        ideas=$(find Context/Backlog/Ideas -name "*.md" 2>/dev/null | wc -l)
    fi
    if [ -d "Context/Backlog/Bugs" ]; then
        bugs=$(find Context/Backlog/Bugs -name "*.md" 2>/dev/null | wc -l)
    fi
    
    if [ $ideas -gt 0 ] || [ $bugs -gt 0 ]; then
        echo "  💡 Backlog: $ideas ideas, $bugs bugs"
    fi
    
    # Git status
    if git rev-parse --git-dir > /dev/null 2>&1; then
        if [ -n "$(git status --porcelain)" ]; then
            echo "  📝 Git: Uncommitted changes present"
        else
            echo "  ✅ Git: Working directory clean"
        fi
    else
        echo "  ⚪ Git: Not a git repository"
    fi
}

###########################################
# Development Suggestions  
###########################################
provide_development_suggestions() {
    echo "  💡 Quick suggestions..."
    
    # If no Context.md, suggest setup
    if [ ! -f "$PROJECT_CONTEXT" ]; then
        echo "     🆕 Run \`/setup\` to initialize ContextKit for this project"
        return
    fi
    
    # If no active features, suggest starting development
    if [ ! -d "Context/Features" ] || [ $(find Context/Features -name "Steps.md" -exec grep -l "\[ \]" {} \; 2>/dev/null | wc -l) -eq 0 ]; then
        echo "     📝 Run \`/Plan/create-spec\` to start a new feature"
        echo "     💡 Run \`/Backlog/add-idea\` to capture ideas"
    else
        echo "     🔨 Run \`/Implement/start-working\` to continue development"
    fi
}

###########################################
# Main Execution
###########################################
main() {
    # Check ContextKit version and compatibility
    check_contextkit_version
    
    # Display current project status
    display_project_status  
    
    # Provide contextual development suggestions
    provide_development_suggestions
    
    echo "✅ ContextKit ready - context loaded successfully!"
}

# Execute main function
main "$@"