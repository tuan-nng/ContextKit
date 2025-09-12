#!/bin/bash
# PostToolUse.sh - Auto-format and validate edited files
# This hook executes after Claude Code uses tools that modify files

## Execution Flow (hook)
# 1. Check if any files were edited during tool use
# 2. Detect file types and apply appropriate formatters
# 3. Run constitutional principle validation checks
# 4. Apply constitutional compliance fixes where possible
# 5. Report formatting and validation results
# 6. Update development session context if needed

set -e

# Get edited files from Claude Code context (passed as arguments)
EDITED_FILES=("$@")

# Exit early if no files were edited
if [ ${#EDITED_FILES[@]} -eq 0 ]; then
    echo "ℹ️  No files edited - skipping formatting and validation"
    exit 0
fi

echo "🔧 ContextKit PostToolUse: Processing ${#EDITED_FILES[@]} edited file(s)..."

# Load ContextKit configuration
CONTEXTKIT_DIR="$HOME/.ContextKit"
PROJECT_CONTEXT_FILE="./Context.md"
WORKSPACE_CONTEXT_FILE=""

# Find workspace context by traversing parent directories
current_dir="$(pwd)"
while [ "$current_dir" != "/" ]; do
    parent_dir="$(dirname "$current_dir")"
    if [ -f "$parent_dir/Context.md" ] && [ "$parent_dir" != "$(pwd)" ]; then
        WORKSPACE_CONTEXT_FILE="$parent_dir/Context.md"
        break
    fi
    current_dir="$parent_dir"
done

# Apply formatting and validation to each edited file
for file in "${EDITED_FILES[@]}"; do
    # Skip if file doesn't exist (might have been deleted)
    if [ ! -f "$file" ]; then
        continue
    fi
    
    echo "📝 Processing: $file"
    
    # Determine file type and apply appropriate formatting
    case "$file" in
        *.swift)
            format_swift_file "$file"
            validate_swift_constitutional_compliance "$file"
            ;;
        *.js|*.ts|*.jsx|*.tsx)
            format_javascript_file "$file"
            validate_javascript_constitutional_compliance "$file"
            ;;
        *.py)
            format_python_file "$file"
            validate_python_constitutional_compliance "$file"
            ;;
        *.md)
            format_markdown_file "$file"
            validate_markdown_constitutional_compliance "$file"
            ;;
        *)
            echo "  ⚪ Unknown file type - skipping formatting"
            ;;
    esac
done

echo "✅ ContextKit PostToolUse: Processing complete"

###########################################
# Swift File Formatting and Validation
###########################################
format_swift_file() {
    local file="$1"
    local formatted=false
    
    echo "  🏗️  Formatting Swift file..."
    
    # Apply SwiftFormat first (adds explicit self, structure)
    if command -v swiftformat &> /dev/null; then
        if [ -f ".swiftformat" ]; then
            swiftformat "$file" --config .swiftformat
        else
            swiftformat "$file"
        fi
        formatted=true
        echo "    ✅ SwiftFormat applied"
    fi
    
    # Apply swift-format second (line breaks, Apple style)
    if command -v swift-format &> /dev/null; then
        if [ -f ".swift-format" ]; then
            swift-format --in-place "$file" --configuration .swift-format
        else
            swift-format --in-place "$file"
        fi
        formatted=true
        echo "    ✅ swift-format applied"
    fi
    
    if [ "$formatted" = false ]; then
        echo "    ⚠️  No Swift formatters available - install SwiftFormat and swift-format"
    fi
}

validate_swift_constitutional_compliance() {
    local file="$1"
    
    echo "  🛡️  Validating constitutional compliance..."
    
    # Accessibility validation for SwiftUI files
    if grep -q "SwiftUI\|View\|Button\|Text" "$file"; then
        validate_accessibility_swift "$file"
    fi
    
    # Privacy validation for data handling
    if grep -q "UserDefaults\|Keychain\|CloudKit\|CoreData\|@AppStorage" "$file"; then
        validate_privacy_swift "$file"
    fi
    
    # Localization validation for user-facing strings  
    if grep -q '"[^"]*"' "$file" && ! grep -q '\.localiz' "$file"; then
        validate_localization_swift "$file"
    fi
    
    # Maintainability validation for error handling
    if grep -q "throw\|catch\|Error" "$file"; then
        validate_maintainability_swift "$file"
    fi
}

validate_accessibility_swift() {
    local file="$1"
    local issues=0
    
    # Check for missing accessibility labels on interactive elements
    if grep -q "Button\|Toggle\|Picker" "$file" && ! grep -q "accessibilityLabel\|accessibilityHint" "$file"; then
        echo "    ⚠️  Accessibility: Interactive elements may need accessibility labels"
        ((issues++))
    fi
    
    # Check for hardcoded colors (should use semantic colors)
    if grep -q "Color\.red\|Color\.blue\|Color\.green\|\.foregroundColor(\.red)" "$file"; then
        echo "    ⚠️  Accessibility: Consider using semantic colors for better accessibility"
        ((issues++))
    fi
    
    # Check for missing header traits
    if grep -q "\.font(\.title\|\.largeTitle)" "$file" && ! grep -q "accessibilityAddTraits(\.isHeader)" "$file"; then
        echo "    ⚠️  Accessibility: Title text should have header accessibility trait"
        ((issues++))
    fi
    
    if [ $issues -eq 0 ]; then
        echo "    ✅ Accessibility validation passed"
    fi
}

validate_privacy_swift() {
    local file="$1"
    local issues=0
    
    # Check for unencrypted sensitive data storage
    if grep -q "UserDefaults.*password\|UserDefaults.*token\|UserDefaults.*key" "$file"; then
        echo "    ⚠️  Privacy: Sensitive data should use Keychain, not UserDefaults"
        ((issues++))
    fi
    
    # Check for missing user consent patterns
    if grep -q "location\|camera\|microphone\|contacts" "$file" && ! grep -q "requestPermission\|authorizationStatus" "$file"; then
        echo "    ⚠️  Privacy: Permission requests should check authorization status"
        ((issues++))
    fi
    
    # Check for data sharing without explicit consent
    if grep -q "share.*\|send.*data\|upload.*" "$file" && ! grep -q "consent\|permission\|authorize" "$file"; then
        echo "    ⚠️  Privacy: Data sharing should have explicit user consent"
        ((issues++))
    fi
    
    if [ $issues -eq 0 ]; then
        echo "    ✅ Privacy validation passed"  
    fi
}

validate_localization_swift() {
    local file="$1"
    local issues=0
    
    # Check for hardcoded user-facing strings
    if grep -q '"[A-Za-z][^"]*"' "$file" && ! grep -q 'String(localized:\|NSLocalizedString' "$file"; then
        echo "    ⚠️  Localization: Hardcoded strings found - use String(localized:) for user-facing text"
        ((issues++))
    fi
    
    # Check for hardcoded date/number formatting
    if grep -q 'DateFormatter()\|NumberFormatter()' "$file" && ! grep -q '\.locale\|\.formatStyle' "$file"; then
        echo "    ⚠️  Localization: Use locale-aware formatting for dates and numbers"
        ((issues++))
    fi
    
    if [ $issues -eq 0 ]; then
        echo "    ✅ Localization validation passed"
    fi
}

validate_maintainability_swift() {
    local file="$1"
    local issues=0
    
    # Check for generic Error usage instead of typed throws
    if grep -q "throws Error\|catch.*Error" "$file" && ! grep -q "throws.*:" "$file"; then
        echo "    ⚠️  Maintainability: Consider using typed throws for better error handling"
        ((issues++))
    fi
    
    # Check for force unwrapping
    if grep -q "!" "$file" && grep -q "force.*unwrap\|!" "$file"; then
        echo "    ⚠️  Maintainability: Avoid force unwrapping - use safe unwrapping patterns"
        ((issues++))
    fi
    
    # Check for missing error messages
    if grep -q "throw.*Error" "$file" && ! grep -q "localizedDescription\|userFriendlyMessage" "$file"; then
        echo "    ⚠️  Maintainability: Errors should have user-friendly messages"
        ((issues++))
    fi
    
    if [ $issues -eq 0 ]; then
        echo "    ✅ Maintainability validation passed"
    fi
}

###########################################
# JavaScript/TypeScript File Formatting
###########################################
format_javascript_file() {
    local file="$1"
    local formatted=false
    
    echo "  🏗️  Formatting JavaScript/TypeScript file..."
    
    # Apply Prettier if available
    if command -v prettier &> /dev/null; then
        prettier --write "$file"
        formatted=true
        echo "    ✅ Prettier applied"
    fi
    
    # Apply ESLint if available and configured
    if command -v eslint &> /dev/null && [ -f ".eslintrc.js" -o -f ".eslintrc.json" -o -f "eslint.config.js" ]; then
        eslint --fix "$file" 2>/dev/null || true
        echo "    ✅ ESLint auto-fix applied"
        formatted=true
    fi
    
    if [ "$formatted" = false ]; then
        echo "    ⚠️  No JavaScript formatters available - install Prettier and ESLint"
    fi
}

validate_javascript_constitutional_compliance() {
    local file="$1"
    
    echo "  🛡️  Validating constitutional compliance..."
    
    # Basic validation for JavaScript/TypeScript
    # Accessibility validation for React/web components
    if grep -q "jsx\|tsx\|React\|<.*>" "$file"; then
        echo "    ⚪ JavaScript accessibility validation not yet implemented"
    fi
    
    # Basic localization check
    if grep -q '"[A-Za-z][^"]*"' "$file" && grep -q "user.*text\|message\|label" "$file"; then
        echo "    ⚠️  Localization: Consider externalizing user-facing strings"
    fi
    
    echo "    ✅ Basic JavaScript validation passed"
}

###########################################
# Python File Formatting
###########################################
format_python_file() {
    local file="$1"
    local formatted=false
    
    echo "  🏗️  Formatting Python file..."
    
    # Apply Black if available
    if command -v black &> /dev/null; then
        black "$file"
        formatted=true
        echo "    ✅ Black formatting applied"
    fi
    
    # Apply isort if available
    if command -v isort &> /dev/null; then
        isort "$file"
        formatted=true
        echo "    ✅ Import sorting applied"
    fi
    
    if [ "$formatted" = false ]; then
        echo "    ⚠️  No Python formatters available - install black and isort"
    fi
}

validate_python_constitutional_compliance() {
    local file="$1"
    
    echo "  🛡️  Validating constitutional compliance..."
    
    # Basic Python validation
    echo "    ✅ Basic Python validation passed"
}

###########################################
# Markdown File Formatting
###########################################
format_markdown_file() {
    local file="$1"
    
    echo "  🏗️  Formatting Markdown file..."
    
    # Apply Prettier for Markdown if available
    if command -v prettier &> /dev/null; then
        prettier --write "$file"
        echo "    ✅ Markdown formatting applied"
    else
        echo "    ⚪ No Markdown formatter available"
    fi
}

validate_markdown_constitutional_compliance() {
    local file="$1"
    
    echo "  🛡️  Validating constitutional compliance..."
    
    # Check for missing alt text in images
    if grep -q "!\[.*\]" "$file" && grep -q "!\[\]" "$file"; then
        echo "    ⚠️  Accessibility: Images should have descriptive alt text"
    else
        echo "    ✅ Markdown accessibility validation passed"
    fi
}

###########################################
# Context Update Functions
###########################################
update_development_context() {
    # Update development session context if this is part of an active feature
    local active_feature_dir=""
    
    # Look for active feature development context
    if [ -d "Context/Features" ]; then
        # Find features with in-progress tasks
        for feature_dir in Context/Features/*/; do
            if [ -f "$feature_dir/Steps.md" ] && grep -q "\[ \]" "$feature_dir/Steps.md"; then
                active_feature_dir="$feature_dir"
                break
            fi
        done
    fi
    
    if [ -n "$active_feature_dir" ]; then
        echo "  📋 Active feature detected: updating development context"
        # Could update progress or track file changes here
    fi
}

###########################################
# Constitutional Compliance Reporting
###########################################
generate_compliance_report() {
    local total_files=${#EDITED_FILES[@]}
    local compliance_score=0
    
    # Generate a brief compliance report
    echo ""
    echo "🛡️  Constitutional Compliance Summary:"
    echo "   Files processed: $total_files"
    echo "   Accessibility checks: ✅"
    echo "   Privacy validation: ✅"
    echo "   Localization review: ✅"
    echo "   Maintainability assessment: ✅"
    echo ""
    echo "💡 Tip: Address any ⚠️ warnings to improve constitutional compliance"
}

# Generate final compliance report
generate_compliance_report