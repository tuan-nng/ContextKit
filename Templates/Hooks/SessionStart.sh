#!/bin/bash
# SessionStart.sh - Initialize development session with ContextKit context
# This hook executes when Claude Code starts in a project directory

## Execution Flow (hook)
# 1. Detect project type and ContextKit configuration
# 2. Load hierarchical context (Global → Workspace → Project)
# 3. Verify constitutional principle compliance status
# 4. Check for active development tasks and provide guidance
# 5. Validate development environment and dependencies
# 6. Initialize session context for other hooks and commands
# 7. Display contextual development guidance and next steps

set -e

echo "🧠 ContextKit SessionStart: Initializing development context..."

# Global configuration
CONTEXTKIT_DIR="$HOME/.ContextKit"
PROJECT_DIR="$(pwd)"
PROJECT_CONTEXT_FILE="./Context.md"
WORKSPACE_CONTEXT_FILE=""

###########################################
# Context Discovery and Loading
###########################################
discover_context_hierarchy() {
    echo "  🔍 Discovering context hierarchy..."
    
    # Find workspace context by traversing parent directories
    local current_dir="$PROJECT_DIR"
    while [ "$current_dir" != "/" ]; do
        local parent_dir="$(dirname "$current_dir")"
        if [ -f "$parent_dir/Context.md" ] && [ "$parent_dir" != "$PROJECT_DIR" ]; then
            WORKSPACE_CONTEXT_FILE="$parent_dir/Context.md"
            echo "    📁 Workspace context found: $WORKSPACE_CONTEXT_FILE"
            break
        fi
        current_dir="$parent_dir"
    done
    
    # Check for project context
    if [ -f "$PROJECT_CONTEXT_FILE" ]; then
        echo "    📋 Project context found: $PROJECT_CONTEXT_FILE"
    fi
    
    # Check for global ContextKit installation
    if [ -d "$CONTEXTKIT_DIR" ]; then
        echo "    🌐 Global ContextKit found: $CONTEXTKIT_DIR"
    else
        echo "    ⚠️  Global ContextKit not found - run installation script"
        return 1
    fi
}

###########################################
# Project Type Detection
###########################################
detect_project_type() {
    echo "  🎯 Detecting project type..."
    
    local project_type=""
    local platform_details=""
    
    # Swift Package detection
    if [ -f "Package.swift" ]; then
        project_type="swift-package"
        platform_details="Swift Package Manager"
        
        # Check for specific package types
        if grep -q "executable" Package.swift; then
            platform_details="$platform_details (Executable)"
        elif grep -q "library" Package.swift; then
            platform_details="$platform_details (Library)"
        fi
    fi
    
    # iOS/macOS App detection
    if find . -name "*.xcodeproj" -o -name "*.xcworkspace" | head -1 | grep -q "."; then
        if [ -n "$project_type" ]; then
            project_type="swift-mixed"
            platform_details="Swift Package + Xcode Project"
        else
            project_type="ios-macos-app"
            platform_details="iOS/macOS Application"
            
            # Detect specific platforms
            if find . -name "*.xcodeproj" -exec grep -l "IPHONEOS_DEPLOYMENT_TARGET" {} \; | head -1 | grep -q "."; then
                platform_details="iOS Application"
            elif find . -name "*.xcodeproj" -exec grep -l "MACOSX_DEPLOYMENT_TARGET" {} \; | head -1 | grep -q "."; then
                platform_details="macOS Application"
            fi
        fi
    fi
    
    # JavaScript/TypeScript project detection
    if [ -f "package.json" ]; then
        if [ -n "$project_type" ]; then
            project_type="mixed-project"
        else
            project_type="javascript-project"
            platform_details="JavaScript/TypeScript Project"
            
            # Detect framework
            if grep -q "react" package.json; then
                platform_details="React Application"
            elif grep -q "vue" package.json; then
                platform_details="Vue Application"
            elif grep -q "svelte" package.json; then
                platform_details="Svelte Application"
            fi
        fi
    fi
    
    # Python project detection
    if [ -f "requirements.txt" ] || [ -f "pyproject.toml" ] || [ -f "setup.py" ]; then
        if [ -n "$project_type" ]; then
            project_type="mixed-project"
        else
            project_type="python-project"
            platform_details="Python Project"
        fi
    fi
    
    # Default to universal if no specific type detected
    if [ -z "$project_type" ]; then
        project_type="universal"
        platform_details="Universal Project"
    fi
    
    echo "    📦 Project type: $platform_details"
    echo "$project_type"
}

###########################################
# Constitutional Compliance Status
###########################################
check_constitutional_compliance() {
    local project_type="$1"
    echo "  🛡️  Checking constitutional compliance status..."
    
    local compliance_score=0
    local total_checks=4
    
    # Accessibility compliance check
    check_accessibility_compliance "$project_type"
    if [ $? -eq 0 ]; then ((compliance_score++)); fi
    
    # Privacy compliance check  
    check_privacy_compliance "$project_type"
    if [ $? -eq 0 ]; then ((compliance_score++)); fi
    
    # Localization compliance check
    check_localization_compliance "$project_type"
    if [ $? -eq 0 ]; then ((compliance_score++)); fi
    
    # Maintainability compliance check
    check_maintainability_compliance "$project_type"
    if [ $? -eq 0 ]; then ((compliance_score++)); fi
    
    local percentage=$((compliance_score * 100 / total_checks))
    echo "    📊 Constitutional compliance: $compliance_score/$total_checks ($percentage%)"
    
    if [ $compliance_score -eq $total_checks ]; then
        echo "    ✅ All constitutional principles compliant"
    elif [ $compliance_score -ge 3 ]; then
        echo "    ⚠️  Minor constitutional compliance issues detected"
    else
        echo "    ❌ Major constitutional compliance issues require attention"
    fi
}

check_accessibility_compliance() {
    local project_type="$1"
    
    case "$project_type" in
        "swift-package"|"ios-macos-app"|"swift-mixed")
            # Check for SwiftUI accessibility patterns
            if find . -name "*.swift" -exec grep -l "accessibilityLabel\|accessibilityHint" {} \; | head -1 | grep -q "."; then
                echo "    ✅ Accessibility: SwiftUI accessibility labels found"
                return 0
            else
                echo "    ⚠️  Accessibility: No accessibility labels found in SwiftUI code"
                return 1
            fi
            ;;
        "javascript-project")
            # Check for web accessibility patterns
            if find . -name "*.jsx" -o -name "*.tsx" -exec grep -l "aria-\|alt=" {} \; | head -1 | grep -q "."; then
                echo "    ✅ Accessibility: ARIA attributes found"
                return 0
            else
                echo "    ⚠️  Accessibility: No ARIA attributes found"
                return 1
            fi
            ;;
        *)
            echo "    ⚪ Accessibility: Not applicable for this project type"
            return 0
            ;;
    esac
}

check_privacy_compliance() {
    local project_type="$1"
    
    case "$project_type" in
        "swift-package"|"ios-macos-app"|"swift-mixed")
            # Check for privacy manifest or privacy patterns
            if [ -f "PrivacyInfo.xcprivacy" ] || find . -name "*.swift" -exec grep -l "Keychain\|privacy\|consent" {} \; | head -1 | grep -q "."; then
                echo "    ✅ Privacy: Privacy patterns or manifest found"
                return 0
            else
                echo "    ⚠️  Privacy: No privacy manifest or patterns found"
                return 1
            fi
            ;;
        *)
            # Basic privacy check for other project types
            if find . -name "*.js" -o -name "*.ts" -o -name "*.py" -exec grep -l "privacy\|consent\|gdpr" {} \; | head -1 | grep -q "."; then
                echo "    ✅ Privacy: Privacy-related code found"
                return 0
            else
                echo "    ⚠️  Privacy: No privacy-related code found"
                return 1
            fi
            ;;
    esac
}

check_localization_compliance() {
    local project_type="$1"
    
    case "$project_type" in
        "swift-package"|"ios-macos-app"|"swift-mixed")
            # Check for Swift localization patterns
            if find . -name "*.swift" -exec grep -l "String(localized:\|NSLocalizedString" {} \; | head -1 | grep -q "." || [ -d "*.lproj" ]; then
                echo "    ✅ Localization: Swift localization patterns found"
                return 0
            else
                echo "    ⚠️  Localization: No localization patterns found"
                return 1
            fi
            ;;
        "javascript-project")
            # Check for JavaScript i18n patterns
            if find . -name "*.js" -o -name "*.ts" -exec grep -l "i18n\|translate\|locale" {} \; | head -1 | grep -q "."; then
                echo "    ✅ Localization: JavaScript i18n patterns found"
                return 0
            else
                echo "    ⚠️  Localization: No i18n patterns found"
                return 1
            fi
            ;;
        *)
            echo "    ⚪ Localization: Not applicable for this project type"
            return 0
            ;;
    esac
}

check_maintainability_compliance() {
    local project_type="$1"
    
    # Check for error handling patterns
    local error_handling_found=false
    
    case "$project_type" in
        "swift-package"|"ios-macos-app"|"swift-mixed")
            if find . -name "*.swift" -exec grep -l "throws\|Error\|Result" {} \; | head -1 | grep -q "."; then
                error_handling_found=true
            fi
            ;;
        "javascript-project")
            if find . -name "*.js" -o -name "*.ts" -exec grep -l "try.*catch\|Error\|throw" {} \; | head -1 | grep -q "."; then
                error_handling_found=true
            fi
            ;;
        "python-project")
            if find . -name "*.py" -exec grep -l "try:\|except\|raise" {} \; | head -1 | grep -q "."; then
                error_handling_found=true
            fi
            ;;
    esac
    
    if [ "$error_handling_found" = true ]; then
        echo "    ✅ Maintainability: Error handling patterns found"
        return 0
    else
        echo "    ⚠️  Maintainability: No error handling patterns found"
        return 1
    fi
}

###########################################
# Active Development Task Detection
###########################################
detect_active_tasks() {
    echo "  📋 Checking for active development tasks..."
    
    local active_features=0
    local pending_tasks=0
    
    # Check for active features with pending tasks
    if [ -d "Context/Features" ]; then
        for feature_dir in Context/Features/*/; do
            if [ -f "$feature_dir/Steps.md" ]; then
                if grep -q "\[ \]" "$feature_dir/Steps.md"; then
                    local feature_name=$(basename "$feature_dir")
                    echo "    🚧 Active feature: $feature_name"
                    ((active_features++))
                    
                    # Count pending tasks
                    local feature_pending=$(grep -c "\[ \]" "$feature_dir/Steps.md" 2>/dev/null || echo "0")
                    ((pending_tasks += feature_pending))
                fi
            fi
        done
    fi
    
    if [ $active_features -eq 0 ]; then
        echo "    ℹ️  No active features found - use /Plan/create-spec to start development"
    else
        echo "    📊 Active features: $active_features, Pending tasks: $pending_tasks"
    fi
    
    # Check for backlog items
    check_backlog_status
}

check_backlog_status() {
    local idea_count=0
    local bug_count=0
    
    if [ -d "Context/Backlog/Ideas" ]; then
        idea_count=$(find Context/Backlog/Ideas -name "*.md" | wc -l)
    fi
    
    if [ -d "Context/Backlog/Bugs" ]; then
        bug_count=$(find Context/Backlog/Bugs -name "*.md" | wc -l)
    fi
    
    if [ $idea_count -gt 0 ] || [ $bug_count -gt 0 ]; then
        echo "    💡 Backlog: $idea_count ideas, $bug_count bugs"
    fi
}

###########################################
# Development Environment Validation
###########################################
validate_development_environment() {
    local project_type="$1"
    echo "  🔧 Validating development environment..."
    
    local env_issues=0
    
    # Git validation
    if ! git rev-parse --git-dir > /dev/null 2>&1; then
        echo "    ❌ Git: Not a git repository"
        ((env_issues++))
    else
        echo "    ✅ Git: Repository initialized"
        
        # Check for uncommitted changes
        if [ -n "$(git status --porcelain)" ]; then
            echo "    ⚠️  Git: Uncommitted changes present"
        fi
    fi
    
    # Project-specific environment validation
    case "$project_type" in
        "swift-package"|"ios-macos-app"|"swift-mixed")
            validate_swift_environment
            env_issues=$((env_issues + $?))
            ;;
        "javascript-project")
            validate_javascript_environment
            env_issues=$((env_issues + $?))
            ;;
        "python-project")
            validate_python_environment
            env_issues=$((env_issues + $?))
            ;;
    esac
    
    if [ $env_issues -eq 0 ]; then
        echo "    ✅ Development environment ready"
    else
        echo "    ⚠️  $env_issues environment issues detected"
    fi
    
    return $env_issues
}

validate_swift_environment() {
    local issues=0
    
    # Check for Swift compiler
    if command -v swift &> /dev/null; then
        echo "    ✅ Swift: Compiler available ($(swift --version | head -1))"
    else
        echo "    ❌ Swift: Compiler not found"
        ((issues++))
    fi
    
    # Check for formatting tools
    if command -v swiftformat &> /dev/null; then
        echo "    ✅ SwiftFormat: Available"
    else
        echo "    ⚠️  SwiftFormat: Not installed (recommended for formatting)"
    fi
    
    if command -v swift-format &> /dev/null; then
        echo "    ✅ swift-format: Available"
    else
        echo "    ⚠️  swift-format: Not installed (recommended for Apple-style formatting)"
    fi
    
    return $issues
}

validate_javascript_environment() {
    local issues=0
    
    # Check for Node.js
    if command -v node &> /dev/null; then
        echo "    ✅ Node.js: Available ($(node --version))"
    else
        echo "    ❌ Node.js: Not found"
        ((issues++))
    fi
    
    # Check for package manager
    if [ -f "package.json" ]; then
        if command -v npm &> /dev/null; then
            echo "    ✅ npm: Available"
        elif command -v yarn &> /dev/null; then
            echo "    ✅ Yarn: Available"
        else
            echo "    ❌ Package manager: npm or yarn not found"
            ((issues++))
        fi
    fi
    
    return $issues
}

validate_python_environment() {
    local issues=0
    
    # Check for Python
    if command -v python3 &> /dev/null; then
        echo "    ✅ Python: Available ($(python3 --version))"
    else
        echo "    ❌ Python: Not found"
        ((issues++))
    fi
    
    # Check for pip
    if command -v pip3 &> /dev/null; then
        echo "    ✅ pip: Available"
    else
        echo "    ⚠️  pip: Not found (recommended for package management)"
    fi
    
    return $issues
}

###########################################
# Session Context Initialization
###########################################
initialize_session_context() {
    local project_type="$1"
    echo "  📝 Initializing session context..."
    
    # Create session context file
    local session_context_file=".contextkit-session"
    
    cat > "$session_context_file" << EOF
# ContextKit Session Context
# Auto-generated by SessionStart.sh - $(date)

PROJECT_TYPE="$project_type"
PROJECT_DIR="$PROJECT_DIR"
WORKSPACE_CONTEXT="$WORKSPACE_CONTEXT_FILE"
PROJECT_CONTEXT="$PROJECT_CONTEXT_FILE"
SESSION_START="$(date -u +%Y-%m-%dT%H:%M:%SZ)"

# This file is used by other ContextKit hooks and commands
# to maintain session state and context awareness
EOF
    
    echo "    ✅ Session context initialized"
}

###########################################
# Development Guidance Generation
###########################################
provide_development_guidance() {
    local project_type="$1"
    echo ""
    echo "🎯 ContextKit Development Guidance:"
    echo ""
    
    # Check if this is a new project without context
    if [ ! -f "$PROJECT_CONTEXT_FILE" ]; then
        echo "   🆕 New project detected! Get started with:"
        echo "      1. Run \`/setup\` to initialize ContextKit for this project"
        echo "      2. Use \`/Plan/create-spec\` to define your first feature"
        echo "      3. Follow the systematic development workflow"
        echo ""
        return
    fi
    
    # Provide contextual guidance based on project state
    if [ -d "Context/Features" ] && find Context/Features -name "Steps.md" -exec grep -l "\[ \]" {} \; | head -1 | grep -q "."; then
        echo "   🚧 Active development detected!"
        echo "      • Use \`/Implement/start-working\` to continue with pending tasks"
        echo "      • Use \`/Implement/commit-changes\` when ready to commit progress"
        echo ""
    else
        echo "   💡 Ready for new development:"
        echo "      • Use \`/Plan/create-spec\` to define a new feature"
        echo "      • Use \`/Backlog/add-idea\` to capture ideas for later"
        echo "      • Use \`/Backlog/prioritize-backlog\` to organize your backlog"
        echo ""
    fi
    
    # Constitutional principle reminders
    echo "   🛡️  Constitutional Principles Reminders:"
    case "$project_type" in
        "swift-package"|"ios-macos-app"|"swift-mixed")
            echo "      • Accessibility: VoiceOver labels, semantic colors, dynamic type"
            echo "      • Privacy: Keychain for sensitive data, privacy manifest accuracy"
            echo "      • Localization: String(localized:) for user-facing text"
            echo "      • Maintainability: Typed throws, clear error messages"
            ;;
        "javascript-project")
            echo "      • Accessibility: ARIA labels, semantic HTML, keyboard navigation"
            echo "      • Privacy: User consent, data minimization, secure storage"
            echo "      • Localization: i18n libraries, externalized strings"
            echo "      • Maintainability: Error boundaries, clear error messages"
            ;;
        *)
            echo "      • Design for accessibility from day one"
            echo "      • Respect user privacy and data protection"
            echo "      • Support localization and cultural diversity"
            echo "      • Maintain clean, understandable code architecture"
            ;;
    esac
    echo ""
}

###########################################
# Main Execution Flow
###########################################
main() {
    # Discover and load context hierarchy
    if ! discover_context_hierarchy; then
        echo "❌ ContextKit not properly installed - run installation script first"
        exit 1
    fi
    
    # Detect project type
    local project_type=$(detect_project_type)
    
    # Check constitutional compliance status
    check_constitutional_compliance "$project_type"
    
    # Detect active development tasks
    detect_active_tasks
    
    # Validate development environment
    validate_development_environment "$project_type"
    
    # Initialize session context for other hooks/commands
    initialize_session_context "$project_type"
    
    # Provide contextual development guidance
    provide_development_guidance "$project_type"
    
    echo "✅ ContextKit SessionStart: Context loaded and ready for development!"
}

# Execute main function
main "$@"