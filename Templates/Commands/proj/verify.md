# Health Check

## Description
Health check project structure, validate context loading, and suggest fixes or improvements for ContextKit configuration.

## Parameters  
- `--fix` (optional): Automatically fix detected issues where possible
- `--detailed` (optional): Show detailed analysis with recommendations
- `--constitutional` (optional): Focus on constitutional principle compliance

## Execution Flow (main)
```
1. Global Installation Verification
   → Check ~/.ContextKit/ structure and completeness
   → Validate global templates and constitutional framework
   → Verify ContextKit version consistency across system
   → If global issues found: ERROR with installation repair guidance

2. Project Structure Validation  
   → Verify Context.md exists and has correct ContextKit configuration format
   → Check .claude/ directory structure (commands, hooks, subagents)
   → Validate critical template files exist and have correct content structure
   → Confirm directory permissions and file accessibility

3. Context Hierarchy Verification
   → Test workspace context loading (if applicable)
   → Verify inheritance chain: Global → Workspace → Project
   → Check for configuration conflicts or inconsistencies
   → Validate template variable substitution working correctly

4. Constitutional Compliance Assessment
   → Analyze project against all six constitutional principles
   → Check accessibility patterns in code and templates
   → Verify privacy-by-design implementation readiness
   → Validate localization infrastructure and string externalization

5. Development Workflow Validation
   → Test command template functionality and execution flows
   → Verify hook automation (auto-format, version-status) configuration
   → Validate subagent accessibility and template structure
   → Check integration points between commands and quality assurance

6. Team Collaboration Verification
   → Confirm .claude/ directory is properly version-controlled
   → Check for team customizations that may conflict with updates
   → Validate Context.md completeness for team onboarding
   → Verify workspace inheritance for multi-project teams

7. Health Report Generation
   → Categorize findings by severity (Critical, Warning, Information)
   → Provide specific remediation steps for each issue
   → Generate constitutional compliance scorecard
   → Offer optimization recommendations for development workflow
```

## Implementation

### Phase 1: Global Installation Verification

```bash
#!/bin/bash

# ContextKit configuration
CONTEXTKIT_DIR="$HOME/.ContextKit"
CURRENT_CONTEXTKIT_VERSION="1.0.0"

# Parse command line arguments
FIX_MODE=false
DETAILED_MODE=false
CONSTITUTIONAL_FOCUS=false

while [[ $# -gt 0 ]]; do
    case $1 in
        --fix)
            FIX_MODE=true
            shift
            ;;
        --detailed)
            DETAILED_MODE=true
            shift
            ;;
        --constitutional)
            CONSTITUTIONAL_FOCUS=true
            DETAILED_MODE=true  # Constitutional analysis requires detailed mode
            shift
            ;;
        *)
            echo "❌ Unknown option: $1"
            echo "Usage: /ContextKit/verify [--fix] [--detailed] [--constitutional]"
            exit 1
            ;;
    esac
done

# Initialize health tracking
CRITICAL_ISSUES=()
WARNINGS=()
INFORMATION=()
FIXES_APPLIED=()

# Verify global ContextKit installation
verify_global_installation() {
    echo "🔍 Verifying global ContextKit installation..."
    
    # Check ~/.ContextKit/ exists
    if [[ ! -d "$CONTEXTKIT_DIR" ]]; then
        CRITICAL_ISSUES+=("Global ContextKit not installed - missing ~/.ContextKit/ directory")
        return 1
    fi
    
    # Verify core structure
    local required_dirs=(
        "ContextKit"
        "Guidelines" 
        "Templates/Commands"
        "Templates/Hooks"
        "Templates/Subagents"
        "Templates/Features"
        "Templates/Contexts"
        "Templates/Formatters"
    )
    
    for dir in "${required_dirs[@]}"; do
        if [[ ! -d "$CONTEXTKIT_DIR/$dir" ]]; then
            CRITICAL_ISSUES+=("Missing global directory: ~/.ContextKit/$dir")
        fi
    done
    
    # Check constitutional framework
    local constitutional_files=(
        "ContextKit/Constitution.md"
        "CHANGELOG.md"
        "Guidelines/Swift.md"
        "Guidelines/SwiftUI.md"
    )
    
    for file in "${constitutional_files[@]}"; do
        if [[ ! -f "$CONTEXTKIT_DIR/$file" ]]; then
            CRITICAL_ISSUES+=("Missing constitutional file: ~/.ContextKit/$file")
        fi
    done
    
    # Verify template completeness
    local required_templates=(
        "Templates/Commands/Plan/create-spec.md"
        "Templates/Commands/Implement/start-working.md"
        "Templates/Commands/Backlog/add-idea.md"
        "Templates/Hooks/auto-format.sh"
        "Templates/Hooks/version-status.sh"
        "Templates/Subagents/build-project.md"
        "Templates/Features/Spec.md"
        "Templates/Contexts/Project.md"
        "Templates/Formatters/.swift-format"
    )
    
    local missing_templates=0
    for template in "${required_templates[@]}"; do
        if [[ ! -f "$CONTEXTKIT_DIR/$template" ]]; then
            CRITICAL_ISSUES+=("Missing template: ~/.ContextKit/$template")
            ((missing_templates++))
        fi
    done
    
    # Template content validation
    local test_template="$CONTEXTKIT_DIR/Templates/Features/Spec.md"
    if [[ -f "$test_template" ]] && ! grep -q "Execution Flow" "$test_template"; then
        CRITICAL_ISSUES+=("Invalid template format detected in global installation")
    fi
    
    # Version consistency check
    if [[ -f "$CONTEXTKIT_DIR/CHANGELOG.md" ]]; then
        local changelog_version=$(grep -m1 "## \[" "$CONTEXTKIT_DIR/CHANGELOG.md" | sed 's/.*\[\(.*\)\].*/\1/' 2>/dev/null)
        if [[ "$changelog_version" != "$CURRENT_CONTEXTKIT_VERSION" ]]; then
            WARNINGS+=("Version mismatch: Changelog shows $changelog_version, expected $CURRENT_CONTEXTKIT_VERSION")
        fi
    fi
    
    if [[ ${#CRITICAL_ISSUES[@]} -eq 0 ]]; then
        echo "✅ Global installation verified"
    else
        echo "❌ Global installation issues found: ${#CRITICAL_ISSUES[@]}"
        if [[ "$FIX_MODE" == "true" ]]; then
            echo "💡 Run global installation repair: curl -fsSL https://raw.githubusercontent.com/FlineDev/ContextKit/main/install.sh | sh"
        fi
    fi
}

# Validate project structure
validate_project_structure() {
    echo "🔍 Validating project structure..."
    
    # Check Context.md exists and format
    if [[ ! -f "Context.md" ]]; then
        CRITICAL_ISSUES+=("Missing Context.md - project not set up with ContextKit")
        return 1
    fi
    
    if ! grep -q "ContextKit Configuration" Context.md; then
        CRITICAL_ISSUES+=("Context.md missing ContextKit configuration section")
    fi
    
    # Extract project information
    local project_version=""
    local project_type=""
    if grep -q "Version.*:" Context.md; then
        project_version=$(grep "Version.*:" Context.md | sed 's/.*Version.*:\s*\([^[:space:]]*\).*/\1/' | head -1)
    fi
    if grep -q "Project Type.*:" Context.md; then
        project_type=$(grep "Project Type.*:" Context.md | sed 's/.*Project Type.*:\s*\([^[:space:]]*\).*/\1/' | head -1)
    fi
    
    echo "   📋 Project Version: ${project_version:-"not detected"}"
    echo "   📋 Project Type: ${project_type:-"not detected"}"
    
    # Version compatibility check
    if [[ -n "$project_version" && "$project_version" != "$CURRENT_CONTEXTKIT_VERSION" ]]; then
        WARNINGS+=("Project version ($project_version) differs from global ContextKit ($CURRENT_CONTEXTKIT_VERSION) - consider migration")
    fi
    
    # Check .claude/ directory structure
    if [[ ! -d ".claude" ]]; then
        CRITICAL_ISSUES+=("Missing .claude/ directory - run /ContextKit/setup")
        return 1
    fi
    
    local required_claude_dirs=(
        ".claude/commands"
        ".claude/hooks"  
        ".claude/subagents"
    )
    
    for dir in "${required_claude_dirs[@]}"; do
        if [[ ! -d "$dir" ]]; then
            CRITICAL_ISSUES+=("Missing directory: $dir")
        fi
    done
    
    # Validate critical command templates
    local critical_commands=(
        ".claude/commands/Plan/create-spec.md"
        ".claude/commands/Implement/start-working.md"
        ".claude/hooks/auto-format.sh"
        ".claude/subagents/build-project.md"
    )
    
    for command in "${critical_commands[@]}"; do
        if [[ ! -f "$command" ]]; then
            CRITICAL_ISSUES+=("Missing critical template: $command")
        elif ! grep -q "Execution Flow\|Description" "$command"; then
            WARNINGS+=("Malformed template detected: $command")
        fi
    done
    
    # Check Context/ directory structure
    if [[ ! -d "Context" ]]; then
        WARNINGS+=("Missing Context/ directory for features and backlog")
        if [[ "$FIX_MODE" == "true" ]]; then
            mkdir -p Context/{Features,Backlog/{Ideas,Bugs}}
            FIXES_APPLIED+=("Created Context/ directory structure")
        fi
    fi
    
    echo "✅ Project structure validation complete"
}

# Verify context hierarchy and inheritance
verify_context_hierarchy() {
    echo "🔗 Verifying context hierarchy..."
    
    local workspace_context=""
    local workspace_name=""
    
    # Search for workspace context
    local current_dir="$(pwd)"
    while [[ "$current_dir" != "/" ]]; do
        local parent_dir="$(dirname "$current_dir")"
        if [[ -f "$parent_dir/Context.md" && "$parent_dir" != "$(pwd)" ]]; then
            if grep -q "ContextKit Configuration" "$parent_dir/Context.md" 2>/dev/null; then
                workspace_context="$parent_dir/Context.md"
                workspace_name="$(basename "$parent_dir")"
                break
            fi
        fi
        current_dir="$parent_dir"
    done
    
    if [[ -n "$workspace_context" ]]; then
        echo "   ✅ Workspace context found: $workspace_name"
        echo "   📂 Location: $workspace_context"
        
        # Verify inheritance is documented in project Context.md
        if ! grep -q "Workspace.*$workspace_name" Context.md 2>/dev/null; then
            WARNINGS+=("Project Context.md doesn't reference workspace inheritance from $workspace_name")
        fi
        
        # Check workspace configuration validity
        if ! grep -q "Workspace Context:" "$workspace_context"; then
            WARNINGS+=("Workspace Context.md may not be properly formatted")
        fi
    else
        INFORMATION+=("No workspace context found - using global defaults")
    fi
    
    # Verify global inheritance chain
    echo "   🌐 Global ContextKit: ~/.ContextKit/ ✓"
    if [[ -n "$workspace_name" ]]; then
        echo "   🏢 Workspace Context: $workspace_name ✓"  
    fi
    echo "   📁 Project Context: $(basename "$(pwd)") ✓"
    
    echo "✅ Context hierarchy verified"
}
```

### Phase 2: Constitutional Compliance Assessment

```bash
# Assess constitutional principle compliance
assess_constitutional_compliance() {
    echo "⚖️ Assessing constitutional principle compliance..."
    
    local compliance_score=0
    local total_principles=6
    
    # Article I: Accessibility-First Design
    echo "   📱 Article I: Accessibility-First Design"
    local accessibility_compliant=false
    
    if [[ -f ".claude/subagents/check-accessibility.md" ]]; then
        echo "      ✅ Accessibility validation subagent present"
        accessibility_compliant=true
        ((compliance_score++))
    else
        CRITICAL_ISSUES+=("Missing accessibility validation subagent")
    fi
    
    # Check for accessibility patterns in existing code
    if [[ "$DETAILED_MODE" == "true" ]]; then
        local swift_files_count=0
        local accessible_files_count=0
        
        if find . -name "*.swift" -type f | head -1 | grep -q .; then
            swift_files_count=$(find . -name "*.swift" -type f | wc -l)
            accessible_files_count=$(find . -name "*.swift" -exec grep -l "accessibilityLabel\|accessibilityHint\|accessibilityValue" {} \; 2>/dev/null | wc -l)
            
            echo "      📊 Swift files: $swift_files_count, with accessibility: $accessible_files_count"
            
            if [[ $swift_files_count -gt 5 && $accessible_files_count -eq 0 ]]; then
                WARNINGS+=("No accessibility labels found in Swift code - constitutional violation risk")
            fi
        fi
    fi
    
    # Article II: Privacy by Design  
    echo "   🔒 Article II: Privacy by Design"
    local privacy_compliant=false
    
    # Check for privacy manifest in iOS projects
    if [[ -f "Package.swift" || -n "$(find . -maxdepth 1 -name "*.xcodeproj")" ]]; then
        if [[ -f "PrivacyInfo.xcprivacy" ]]; then
            echo "      ✅ Privacy manifest present"
            privacy_compliant=true
            ((compliance_score++))
        else
            WARNINGS+=("iOS project missing PrivacyInfo.xcprivacy - may be required for App Store")
        fi
    else
        # Non-iOS projects get compliance for having privacy considerations
        privacy_compliant=true
        ((compliance_score++))
        echo "      ✅ Non-iOS project - privacy by design principle applicable"
    fi
    
    # Article III: Localizability from Day One
    echo "   🌐 Article III: Localizability from Day One"  
    local localization_compliant=false
    
    if [[ -f ".claude/subagents/check-localization.md" ]]; then
        echo "      ✅ Localization validation subagent present"
        localization_compliant=true
        ((compliance_score++))
    else
        CRITICAL_ISSUES+=("Missing localization validation subagent")
    fi
    
    # Check for hardcoded strings (Swift-specific)
    if [[ "$DETAILED_MODE" == "true" ]] && find . -name "*.swift" -type f | head -1 | grep -q "."; then
        local hardcoded_strings=$(find . -name "*.swift" -exec grep -n '"[^"]*"' {} \; 2>/dev/null | grep -v "accessibilityLabel\|NSLocalizedString" | wc -l)
        if [[ $hardcoded_strings -gt 10 ]]; then
            WARNINGS+=("Potential hardcoded strings detected ($hardcoded_strings instances) - localization risk")
        fi
    fi
    
    # Article IV: Code Maintainability
    echo "   🔧 Article IV: Code Maintainability"
    local maintainability_compliant=false
    
    # Check for Swift formatting configurations
    local formatting_files=0
    [[ -f ".swift-format" ]] && ((formatting_files++))
    [[ -f ".swiftformat" ]] && ((formatting_files++))
    
    if [[ $formatting_files -gt 0 ]]; then
        echo "      ✅ Code formatting configuration present ($formatting_files files)"
        maintainability_compliant=true
        ((compliance_score++))
    else
        WARNINGS+=("No code formatting configuration found - maintainability risk")
    fi
    
    # Check for modern error handling (ErrorKit)
    if [[ "$DETAILED_MODE" == "true" ]] && find . -name "*.swift" -type f | head -1 | grep -q "."; then
        if find . -name "*.swift" -exec grep -l "ErrorKit\|Throwable\|Catching" {} \; 2>/dev/null | head -1 | grep -q .; then
            echo "      ✅ Modern error handling patterns detected"
        else
            INFORMATION+=("Consider adopting ErrorKit for typed error handling")
        fi
    fi
    
    # Article V: Platform-Appropriate UX
    echo "   🎨 Article V: Platform-Appropriate UX"
    local platform_ux_compliant=false
    
    # iOS/macOS specific checks
    if [[ -f "Package.swift" || -n "$(find . -maxdepth 1 -name "*.xcodeproj")" ]]; then
        if [[ "$DETAILED_MODE" == "true" ]]; then
            # Check for SwiftUI usage (constitutional preference)
            if find . -name "*.swift" -exec grep -l "SwiftUI\|@State\|@Observable" {} \; 2>/dev/null | head -1 | grep -q .; then
                echo "      ✅ SwiftUI patterns detected (constitutional preference)"
                platform_ux_compliant=true
                ((compliance_score++))
            elif find . -name "*.swift" -exec grep -l "UIKit\|UIViewController" {} \; 2>/dev/null | head -1 | grep -q .; then
                WARNINGS+=("UIKit usage detected - SwiftUI preferred for new development")
                platform_ux_compliant=true  # Still compliant, just not preferred
                ((compliance_score++))
            fi
        else
            platform_ux_compliant=true
            ((compliance_score++))
        fi
    else
        # Non-iOS projects
        platform_ux_compliant=true
        ((compliance_score++))
        echo "      ✅ Non-iOS project - platform UX principle applicable"
    fi
    
    # Article VI: Anti-Speculation Enforcement
    echo "   🎯 Article VI: Anti-Speculation and Evidence-Based Development"
    local anti_speculation_compliant=false
    
    # Check for ContextKit planning templates
    if [[ -f ".claude/commands/Plan/create-spec.md" ]]; then
        if grep -q "\[NEEDS CLARIFICATION\]" .claude/commands/Plan/create-spec.md; then
            echo "      ✅ Anti-speculation patterns in planning templates"
            anti_speculation_compliant=true
            ((compliance_score++))
        fi
    fi
    
    # Calculate compliance percentage
    local compliance_percentage=$((compliance_score * 100 / total_principles))
    
    echo ""
    echo "📊 Constitutional Compliance Score: $compliance_score/$total_principles ($compliance_percentage%)"
    
    if [[ $compliance_percentage -ge 100 ]]; then
        echo "🏆 EXCELLENT: Full constitutional compliance achieved"
    elif [[ $compliance_percentage -ge 80 ]]; then
        echo "✅ GOOD: Strong constitutional compliance"
    elif [[ $compliance_percentage -ge 60 ]]; then
        echo "⚠️ MODERATE: Constitutional compliance needs improvement"
    else
        echo "❌ POOR: Critical constitutional compliance issues"
        CRITICAL_ISSUES+=("Constitutional compliance below acceptable threshold ($compliance_percentage%)")
    fi
}

# Validate development workflow  
validate_development_workflow() {
    echo "🔄 Validating development workflow..."
    
    # Test command availability and structure
    local workflow_commands=(
        ".claude/commands/Plan/create-spec.md"
        ".claude/commands/Plan/define-tech.md" 
        ".claude/commands/Plan/plan-steps.md"
        ".claude/commands/Implement/start-working.md"
        ".claude/commands/Implement/commit-changes.md"
        ".claude/commands/Backlog/add-idea.md"
    )
    
    local available_commands=0
    for command in "${workflow_commands[@]}"; do
        if [[ -f "$command" ]]; then
            ((available_commands++))
            
            # Test execution flow presence
            if ! grep -q "Execution Flow" "$command"; then
                WARNINGS+=("Command missing execution flow: $command")
            fi
        fi
    done
    
    echo "   📋 Available commands: $available_commands/${#workflow_commands[@]}"
    
    if [[ $available_commands -eq ${#workflow_commands[@]} ]]; then
        echo "   ✅ Complete development workflow available"
    else
        WARNINGS+=("Incomplete development workflow - missing $((${#workflow_commands[@]} - available_commands)) commands")
    fi
    
    # Test hook configuration
    local hooks_working=true
    if [[ -f ".claude/hooks/auto-format.sh" ]]; then
        if [[ -x ".claude/hooks/auto-format.sh" ]]; then
            echo "   ✅ Auto-format hook configured and executable"
        else
            WARNINGS+=("Auto-format hook not executable")
            if [[ "$FIX_MODE" == "true" ]]; then
                chmod +x .claude/hooks/auto-format.sh
                FIXES_APPLIED+=("Made auto-format.sh executable")
            fi
        fi
    else
        WARNINGS+=("Auto-format hook missing")
        hooks_working=false
    fi
    
    # Test subagent availability
    local quality_subagents=(
        ".claude/subagents/build-project.md"
        ".claude/subagents/check-accessibility.md"
        ".claude/subagents/check-localization.md"
    )
    
    local available_subagents=0
    for subagent in "${quality_subagents[@]}"; do
        [[ -f "$subagent" ]] && ((available_subagents++))
    done
    
    echo "   🤖 Available subagents: $available_subagents/${#quality_subagents[@]}"
    
    if [[ $available_subagents -eq ${#quality_subagents[@]} ]]; then
        echo "   ✅ Quality assurance subagents available"
    else
        WARNINGS+=("Missing quality assurance subagents")
    fi
}

# Verify team collaboration setup
verify_team_collaboration() {
    echo "👥 Verifying team collaboration setup..."
    
    # Check if in git repository
    if ! git rev-parse --git-dir > /dev/null 2>&1; then
        WARNINGS+=("Not in git repository - team collaboration limited")
        return
    fi
    
    # Check if .claude/ is tracked by git
    if git ls-files .claude/ | head -1 | grep -q .; then
        echo "   ✅ .claude/ directory is version controlled"
    else
        WARNINGS+=(".claude/ directory not tracked by git - team won't have access to ContextKit configuration")
        if [[ "$FIX_MODE" == "true" ]]; then
            git add .claude/
            FIXES_APPLIED+=("Added .claude/ directory to git tracking")
        fi
    fi
    
    # Check if Context.md is tracked
    if git ls-files Context.md | grep -q Context.md; then
        echo "   ✅ Context.md is version controlled"
    else
        WARNINGS+=("Context.md not tracked by git - team configuration not shared")
        if [[ "$FIX_MODE" == "true" ]]; then
            git add Context.md
            FIXES_APPLIED+=("Added Context.md to git tracking")
        fi
    fi
    
    # Check Context.md completeness for team onboarding  
    local required_sections=(
        "ContextKit Configuration"
        "Project Architecture"
        "Constitutional Principles"
        "Development Workflow"
    )
    
    local missing_sections=()
    for section in "${required_sections[@]}"; do
        if ! grep -q "$section" Context.md; then
            missing_sections+=("$section")
        fi
    done
    
    if [[ ${#missing_sections[@]} -gt 0 ]]; then
        WARNINGS+=("Context.md missing sections for team onboarding: ${missing_sections[*]}")
    else
        echo "   ✅ Context.md complete for team onboarding"
    fi
    
    # Check for uncommitted ContextKit files  
    if [[ -n "$(git status --porcelain 2>/dev/null | grep -E '\.(claude|Context)')" ]]; then
        INFORMATION+=("Uncommitted ContextKit changes detected - consider committing for team sync")
    fi
}
```

### Phase 3: Health Report Generation

```bash
# Generate comprehensive health report
generate_health_report() {
    echo ""
    echo "📋 ContextKit Health Report"
    echo "Generated: $(date +"%Y-%m-%d %H:%M:%S")"
    echo "Project: $(basename "$(pwd)")"
    echo ""
    
    # Critical Issues
    if [[ ${#CRITICAL_ISSUES[@]} -gt 0 ]]; then
        echo "🚨 CRITICAL ISSUES (${#CRITICAL_ISSUES[@]})"
        for issue in "${CRITICAL_ISSUES[@]}"; do
            echo "   ❌ $issue"
        done
        echo ""
    fi
    
    # Warnings  
    if [[ ${#WARNINGS[@]} -gt 0 ]]; then
        echo "⚠️ WARNINGS (${#WARNINGS[@]})"
        for warning in "${WARNINGS[@]}"; do
            echo "   ⚠️ $warning"
        done
        echo ""
    fi
    
    # Information
    if [[ ${#INFORMATION[@]} -gt 0 ]]; then
        echo "ℹ️ INFORMATION (${#INFORMATION[@]})"
        for info in "${INFORMATION[@]}"; do
            echo "   ℹ️ $info"
        done
        echo ""
    fi
    
    # Fixes Applied (if any)
    if [[ ${#FIXES_APPLIED[@]} -gt 0 ]]; then
        echo "🔧 FIXES APPLIED (${#FIXES_APPLIED[@]})"
        for fix in "${FIXES_APPLIED[@]}"; do
            echo "   ✅ $fix"
        done
        echo ""
    fi
    
    # Overall health assessment
    local total_issues=$((${#CRITICAL_ISSUES[@]} + ${#WARNINGS[@]}))
    
    if [[ ${#CRITICAL_ISSUES[@]} -gt 0 ]]; then
        echo "🔴 HEALTH STATUS: CRITICAL - Immediate action required"
        echo ""
        echo "Next Steps:"
        echo "1. Fix critical issues listed above"
        echo "2. Re-run /ContextKit/verify to confirm fixes"
        echo "3. Consider running /ContextKit/setup or /ContextKit/migrate if needed"
    elif [[ ${#WARNINGS[@]} -gt 3 ]]; then
        echo "🟡 HEALTH STATUS: NEEDS ATTENTION - Multiple issues to resolve"
        echo ""
        echo "Recommendations:"
        echo "1. Address warnings systematically"  
        echo "2. Use --fix flag to auto-resolve simple issues"
        echo "3. Review constitutional compliance suggestions"
    elif [[ ${#WARNINGS[@]} -gt 0 ]]; then
        echo "🟢 HEALTH STATUS: GOOD - Minor improvements available"
        echo ""
        echo "Optimization Suggestions:"
        echo "1. Review warnings for quality improvements"
        echo "2. Consider constitutional principle enhancements"
    else
        echo "🟢 HEALTH STATUS: EXCELLENT - All systems operational"
        echo ""
        echo "✨ Your ContextKit setup is fully optimized!"
        echo "Continue with confident development using constitutional workflows."
    fi
    
    if [[ "$DETAILED_MODE" == "true" ]]; then
        echo ""
        echo "📊 Detailed Analysis:"
        echo "   • Global Installation: $(if [[ -d "$CONTEXTKIT_DIR" ]]; then echo "✅ Healthy"; else echo "❌ Issues"; fi)"
        echo "   • Project Structure: $(if [[ -f "Context.md" && -d ".claude" ]]; then echo "✅ Complete"; else echo "❌ Incomplete"; fi)"
        echo "   • Context Hierarchy: $(if grep -q "ContextKit Configuration" Context.md 2>/dev/null; then echo "✅ Valid"; else echo "❌ Invalid"; fi)"
        echo "   • Development Workflow: $(if [[ -f ".claude/commands/Plan/create-spec.md" ]]; then echo "✅ Available"; else echo "❌ Missing"; fi)"
        echo "   • Team Collaboration: $(if git ls-files Context.md 2>/dev/null | grep -q .; then echo "✅ Configured"; else echo "❌ Not Setup"; fi)"
    fi
}

# Provide remediation guidance  
provide_remediation_guidance() {
    if [[ ${#CRITICAL_ISSUES[@]} -gt 0 || ${#WARNINGS[@]} -gt 0 ]]; then
        echo ""
        echo "🔧 Remediation Guidance"
        echo ""
        
        # Global installation issues
        if printf '%s\n' "${CRITICAL_ISSUES[@]}" | grep -q "Global ContextKit"; then
            echo "🌐 Global Installation Issues:"
            echo "   💡 Run: curl -fsSL https://raw.githubusercontent.com/FlineDev/ContextKit/main/install.sh | sh"
            echo ""
        fi
        
        # Project setup issues
        if printf '%s\n' "${CRITICAL_ISSUES[@]}" | grep -q "Context.md\|.claude"; then
            echo "📁 Project Setup Issues:"
            echo "   💡 Run: /ContextKit/setup (new project setup)"
            echo "   💡 Run: /ContextKit/migrate (existing project)"
            echo ""
        fi
        
        # Constitutional compliance issues
        if [[ "$CONSTITUTIONAL_FOCUS" == "true" ]] && (printf '%s\n' "${CRITICAL_ISSUES[@]} ${WARNINGS[@]}" | grep -q "constitutional\|accessibility\|privacy\|localization"); then
            echo "⚖️ Constitutional Compliance Issues:"
            echo "   💡 Review constitutional principles in ~/.ContextKit/ContextKit/Constitution.md"
            echo "   💡 Run subagents: check-accessibility, check-localization"
            echo "   💡 Add Privacy manifest for iOS projects"
            echo ""
        fi
        
        # Team collaboration issues
        if printf '%s\n' "${WARNINGS[@]}" | grep -q "git\|version controlled"; then
            echo "👥 Team Collaboration Issues:"
            echo "   💡 Add ContextKit files to git: git add Context.md .claude/"
            echo "   💡 Commit for team sharing: git commit -m 'Add ContextKit configuration'"
            echo ""
        fi
    fi
}

# Main execution
main() {
    echo "🩺 ContextKit Health Check"
    echo "Comprehensive validation of ContextKit installation and configuration"
    echo ""
    
    # Execute verification phases
    verify_global_installation
    
    if [[ ${#CRITICAL_ISSUES[@]} -eq 0 ]]; then
        validate_project_structure
        verify_context_hierarchy
        assess_constitutional_compliance
        validate_development_workflow
        verify_team_collaboration
    fi
    
    # Generate reports
    generate_health_report
    provide_remediation_guidance
    
    # Exit code based on health status
    if [[ ${#CRITICAL_ISSUES[@]} -gt 0 ]]; then
        exit 1
    elif [[ ${#WARNINGS[@]} -gt 3 ]]; then
        exit 2
    else
        exit 0
    fi
}

main "$@"
```

## Error Conditions

- **"Global ContextKit not installed"** → Run installation script first
- **"Missing Context.md"** → Project not setup with ContextKit, run /ContextKit/setup
- **"Constitutional compliance below threshold"** → Review and implement constitutional principles
- **"Critical template files missing"** → Run /ContextKit/migrate or /ContextKit/setup to restore
- **"Context hierarchy broken"** → Check workspace Context.md format and accessibility
- **"Team collaboration not configured"** → Add ContextKit files to version control

## Validation Gates

- [ ] Global ContextKit installation complete and healthy?
- [ ] Project Context.md exists with correct ContextKit configuration?
- [ ] .claude/ directory structure complete with all templates?
- [ ] Constitutional principles compliance at acceptable level?
- [ ] Development workflow commands functional and accessible?
- [ ] Context hierarchy working correctly (Global → Workspace → Project)?
- [ ] Team collaboration configured for version control sharing?

## Health Report Categories

**🚨 CRITICAL ISSUES**: Must be resolved immediately for ContextKit functionality
**⚠️ WARNINGS**: Should be addressed for optimal development experience  
**ℹ️ INFORMATION**: Optional improvements and optimization opportunities
**🔧 FIXES APPLIED**: Issues automatically resolved by --fix mode

## Integration Points

- **Global Installation**: Validates ~/.ContextKit/ structure and completeness
- **Constitutional Framework**: Assesses compliance with all six constitutional principles
- **Development Workflow**: Tests command templates, hooks, and subagents functionality
- **Team Collaboration**: Verifies version control integration and team sharing setup
- **Quality Assurance**: Validates integration between commands, hooks, and subagents

---

**Status**: Production ready - Comprehensive health checking with constitutional compliance assessment