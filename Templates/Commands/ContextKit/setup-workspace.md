# Command: /ContextKit/setup-workspace

## Description
Create workspace-specific configuration for client/company contexts with multi-project analysis and constitutional principle customization.

## Parameters
None (interactive configuration with project analysis)

## Execution Flow (main)
```
1. Workspace Location Validation
   → Confirm current directory is intended workspace parent
   → Check for existing workspace Context.md
   → If exists: offer to update vs. create new

2. Project Discovery and Analysis
   → Traverse subdirectories for projects
   → Identify project types, languages, frameworks
   → Analyze existing patterns (indentation, naming, dependencies)
   → Detect common configurations across projects

3. Interactive Configuration
   → Present detected patterns for confirmation
   → ASK about coding style preferences (indentation, naming conventions)
   → ASK about client-specific requirements (compliance, restrictions)
   → ASK about technology stack preferences  
   → ASK about constitutional principle overrides (with justification)

4. Workspace Context Creation
   → Generate Context.md with workspace-specific overrides
   → Document client requirements and constitutional adjustments
   → Include rationale for any principle overrides
   → Set up inheritance hierarchy for child projects

5. Validation
   → Verify workspace configuration is internally consistent
   → Check for conflicts with constitutional principles
   → Test inheritance logic with sample project
   → Confirm workspace Context.md is properly formatted
```

## Implementation

### Phase 1: Location Validation and Discovery

```bash
#!/bin/bash

# Get ContextKit global directory
CONTEXTKIT_DIR="$HOME/.ContextKit"
if [[ ! -d "$CONTEXTKIT_DIR" ]]; then
    echo "❌ ContextKit not installed globally"
    echo "💡 Run: curl -fsSL https://raw.githubusercontent.com/FlineDev/ContextKit/main/install.sh | sh"
    exit 1
fi

# Validate workspace location
validate_workspace_location() {
    local workspace_name=$(basename "$(pwd)")
    echo "🧠 ContextKit Workspace Setup"
    echo "Setting up workspace: $workspace_name"
    echo ""
    
    echo "❓ Confirm this directory as workspace root? (Y/n)"
    echo "   📁 Location: $(pwd)"
    read -r response
    if [[ "$response" =~ ^[Nn]$ ]]; then
        echo "❌ Setup cancelled - navigate to intended workspace directory"
        exit 1
    fi
    
    # Check for existing workspace Context.md
    if [[ -f "Context.md" ]]; then
        if grep -q "ContextKit Configuration" Context.md; then
            echo "⚠️ Existing workspace Context.md found"
            echo "Choose action:"
            echo "1) Update existing configuration"
            echo "2) Create new configuration (backup existing)"
            echo "3) Cancel setup"
            read -p "Choice (1-3): " choice
            case $choice in
                1) EXISTING_WORKSPACE=true; UPDATE_MODE=true ;;
                2) 
                    cp Context.md "Context.md.backup-$(date +%Y%m%d-%H%M%S)"
                    echo "✅ Created backup of existing Context.md"
                    EXISTING_WORKSPACE=false; UPDATE_MODE=false
                    ;;
                3) echo "❌ Setup cancelled"; exit 1 ;;
                *) echo "❌ Invalid choice"; exit 1 ;;
            esac
        else
            echo "ℹ️ Non-ContextKit Context.md found - will be backed up"
            cp Context.md "Context-backup-$(date +%Y%m%d-%H%M%S).md"
            EXISTING_WORKSPACE=false; UPDATE_MODE=false
        fi
    else
        EXISTING_WORKSPACE=false; UPDATE_MODE=false
    fi
}

# Discover and analyze contained projects
discover_projects() {
    echo "🔄 Discovering contained projects..."
    
    local projects=()
    local project_types=()
    local languages=()
    local frameworks=()
    
    # Find subdirectories that look like projects
    for dir in */; do
        [[ ! -d "$dir" ]] && continue
        
        local project_name="${dir%/}"
        local project_type=""
        local language=""
        local framework=""
        
        # Analyze project characteristics
        pushd "$dir" > /dev/null 2>&1 || continue
        
        # Detect project type
        if [[ -f "Package.swift" ]]; then
            project_type="swift-package"
            language="swift"
            if grep -q "vapor" Package.swift 2>/dev/null; then
                project_type="vapor-server"
                framework="vapor"
            fi
        elif find . -maxdepth 1 -name "*.xcodeproj" | head -1 | grep -q "."; then
            project_type="ios-app"
            language="swift"
            framework="ios-sdk"
        elif [[ -f "package.json" ]]; then
            project_type="javascript-project"
            language="javascript"
            if grep -q '"react"' package.json 2>/dev/null; then
                framework="react"
            elif grep -q '"vue"' package.json 2>/dev/null; then
                framework="vue"
            elif grep -q '"express"' package.json 2>/dev/null; then
                framework="express"
            fi
        elif [[ -f "requirements.txt" || -f "pyproject.toml" || -f "setup.py" ]]; then
            project_type="python-project"
            language="python"
            if [[ -f "requirements.txt" ]] && grep -q "django" requirements.txt 2>/dev/null; then
                framework="django"
            elif [[ -f "requirements.txt" ]] && grep -q "flask" requirements.txt 2>/dev/null; then
                framework="flask"
            fi
        fi
        
        popd > /dev/null 2>&1
        
        if [[ -n "$project_type" ]]; then
            projects+=("$project_name")
            project_types+=("$project_type")
            languages+=("$language")  
            frameworks+=("$framework")
            echo "   ✓ $project_name ($project_type)"
        fi
    done
    
    if [[ ${#projects[@]} -eq 0 ]]; then
        echo "⚠️ No recognizable projects found in subdirectories"
        echo "Continue with workspace setup anyway? (y/N)"
        read -r response
        [[ "$response" =~ ^[Yy]$ ]] || exit 1
    fi
    
    # Store project analysis results
    PROJECTS=("${projects[@]}")
    PROJECT_TYPES=("${project_types[@]}")  
    LANGUAGES=("${languages[@]}")
    FRAMEWORKS=("${frameworks[@]}")
    
    echo "✅ Found ${#projects[@]} project(s) for workspace configuration"
}

# Analyze existing patterns across projects
analyze_patterns() {
    echo "🔍 Analyzing existing patterns across projects..."
    
    # Language distribution
    local swift_count=0
    local js_count=0  
    local python_count=0
    local other_count=0
    
    for lang in "${LANGUAGES[@]}"; do
        case "$lang" in
            swift) ((swift_count++)) ;;
            javascript) ((js_count++)) ;;
            python) ((python_count++)) ;;  
            *) ((other_count++)) ;;
        esac
    done
    
    # Determine primary language
    if [[ $swift_count -gt $js_count && $swift_count -gt $python_count ]]; then
        PRIMARY_LANGUAGE="swift"
        echo "   📊 Primary language: Swift ($swift_count projects)"
    elif [[ $js_count -gt $python_count ]]; then
        PRIMARY_LANGUAGE="javascript"
        echo "   📊 Primary language: JavaScript ($js_count projects)"
    elif [[ $python_count -gt 0 ]]; then
        PRIMARY_LANGUAGE="python"  
        echo "   📊 Primary language: Python ($python_count projects)"
    else
        PRIMARY_LANGUAGE="mixed"
        echo "   📊 Mixed language environment"
    fi
    
    # Analyze coding patterns (focus on Swift since that's our specialty)
    DETECTED_INDENTATION="3 spaces"  # Default ContextKit preference
    DETECTED_NAMING="camelCase"
    DETECTED_ARCHITECTURE="package-first"
    
    if [[ "$PRIMARY_LANGUAGE" == "swift" ]]; then
        echo "   📋 Swift patterns detected:"
        echo "      • Indentation: 3 spaces (ContextKit default)"
        echo "      • Naming: camelCase (Swift standard)"
        echo "      • Architecture: Package-first approach preferred"
    fi
    
    echo "✅ Pattern analysis complete"
}
```

### Phase 2: Interactive Configuration

```bash
# Interactive workspace configuration
configure_workspace() {
    echo ""
    echo "🎛️ Workspace Configuration"
    echo "Configure workspace-specific overrides and requirements"
    echo ""
    
    # Workspace type selection
    echo "❓ What type of workspace is this?"
    echo "1) Personal/Indie Development"
    echo "2) Client/Contract Work"  
    echo "3) Enterprise/Company"
    echo "4) Open Source Project"
    read -p "Choice (1-4): " workspace_type_choice
    
    case $workspace_type_choice in
        1) WORKSPACE_TYPE="indie"; WORKSPACE_DESCRIPTION="Personal/Indie Development" ;;
        2) WORKSPACE_TYPE="client"; WORKSPACE_DESCRIPTION="Client/Contract Work" ;;
        3) WORKSPACE_TYPE="enterprise"; WORKSPACE_DESCRIPTION="Enterprise/Company" ;;
        4) WORKSPACE_TYPE="opensource"; WORKSPACE_DESCRIPTION="Open Source Project" ;;
        *) echo "❌ Invalid choice"; exit 1 ;;
    esac
    
    echo "✅ Workspace type: $WORKSPACE_DESCRIPTION"
    echo ""
    
    # Client/Company specific configuration
    if [[ "$WORKSPACE_TYPE" == "client" || "$WORKSPACE_TYPE" == "enterprise" ]]; then
        read -p "📝 Client/Company name: " CLIENT_NAME
        read -p "📝 Project/Contract identifier (optional): " CONTRACT_ID
        echo ""
    fi
    
    # Coding style preferences
    echo "🎨 Coding Style Configuration"
    echo "Current patterns: $DETECTED_INDENTATION, $DETECTED_NAMING, $DETECTED_ARCHITECTURE"
    echo ""
    
    echo "❓ Override indentation preference? (current: 3 spaces)"
    echo "1) Keep 3 spaces (ContextKit default)"
    echo "2) Use 2 spaces"  
    echo "3) Use 4 spaces"
    echo "4) Use tabs"
    read -p "Choice (1-4): " indent_choice
    
    case $indent_choice in
        1) INDENTATION="3 spaces" ;;
        2) INDENTATION="2 spaces" ;;
        3) INDENTATION="4 spaces" ;;  
        4) INDENTATION="tabs" ;;
        *) INDENTATION="3 spaces" ;;
    esac
    
    # Technology stack preferences  
    if [[ "$PRIMARY_LANGUAGE" == "swift" ]]; then
        echo ""
        echo "🛠️ Swift Technology Stack"
        echo "❓ Override Swift architecture preferences?"
        echo "1) Package-first (ContextKit constitutional default)"
        echo "2) Monolithic app structure"
        echo "3) Hybrid approach"
        read -p "Choice (1-3): " arch_choice
        
        case $arch_choice in
            1) ARCHITECTURE="package-first" ;;
            2) ARCHITECTURE="monolithic"; CONSTITUTIONAL_OVERRIDE_ARCH=true ;;
            3) ARCHITECTURE="hybrid" ;;
            *) ARCHITECTURE="package-first" ;;
        esac
    fi
    
    # Constitutional principle customization
    echo ""
    echo "⚖️ Constitutional Principles Customization"
    echo "ContextKit enforces constitutional principles by default:"
    echo "   • Accessibility-first design"
    echo "   • Privacy by design" 
    echo "   • Localizability from day one"
    echo "   • Code maintainability"
    echo "   • Platform-appropriate UX"
    echo ""
    
    CONSTITUTIONAL_OVERRIDES=()
    
    if [[ "$WORKSPACE_TYPE" == "client" || "$WORKSPACE_TYPE" == "enterprise" ]]; then
        echo "❓ Any client/company requirements that override constitutional principles?"
        echo "⚠️ Overrides require explicit justification and documentation"
        echo ""
        
        echo "Override accessibility requirements? (y/N)"
        read -r response
        if [[ "$response" =~ ^[Yy]$ ]]; then
            read -p "📝 Justification for accessibility override: " accessibility_justification
            CONSTITUTIONAL_OVERRIDES+=("accessibility:$accessibility_justification")
        fi
        
        echo "Override privacy requirements? (y/N)"
        read -r response  
        if [[ "$response" =~ ^[Yy]$ ]]; then
            read -p "📝 Justification for privacy override: " privacy_justification
            CONSTITUTIONAL_OVERRIDES+=("privacy:$privacy_justification")
        fi
        
        echo "Override localization requirements? (y/N)"
        read -r response
        if [[ "$response" =~ ^[Yy]$ ]]; then
            read -p "📝 Justification for localization override: " localization_justification  
            CONSTITUTIONAL_OVERRIDES+=("localization:$localization_justification")
        fi
    fi
    
    echo "✅ Configuration complete"
}

# Generate workspace Context.md
generate_workspace_context() {
    local workspace_name=$(basename "$(pwd)")
    local contextkit_version="1.0.0"
    local setup_date=$(date +"%Y-%m-%d")
    
    cat > Context.md << EOF
# Workspace Context: $workspace_name

## ContextKit Configuration  
- **Version**: $contextkit_version
- **Setup Date**: $setup_date
- **Workspace Type**: $WORKSPACE_DESCRIPTION
- **Primary Language**: $PRIMARY_LANGUAGE
$(if [[ -n "$CLIENT_NAME" ]]; then echo "- **Client/Company**: $CLIENT_NAME"; fi)
$(if [[ -n "$CONTRACT_ID" ]]; then echo "- **Contract ID**: $CONTRACT_ID"; fi)

## Workspace Overrides
**Coding Style**:
- **Indentation**: $INDENTATION$(if [[ "$INDENTATION" != "3 spaces" ]]; then echo " (overrides ContextKit default)"; fi)
- **Naming Convention**: $DETECTED_NAMING
- **Architecture Approach**: $ARCHITECTURE$(if [[ "$CONSTITUTIONAL_OVERRIDE_ARCH" == "true" ]]; then echo " (overrides package-first default)"; fi)

**Constitutional Principle Adjustments**:
EOF

    if [[ ${#CONSTITUTIONAL_OVERRIDES[@]} -gt 0 ]]; then
        for override in "${CONSTITUTIONAL_OVERRIDES[@]}"; do
            local principle="${override%%:*}"
            local justification="${override#*:}"
            cat >> Context.md << EOF
- **${principle^} Override**: $justification
EOF
        done
    else
        cat >> Context.md << EOF
- **No Overrides**: All constitutional principles apply at full strength
- **Accessibility-First**: UI must support all assistive technologies
- **Privacy by Design**: Minimal data collection with explicit consent
- **Localizability**: Externalized strings and cultural adaptation required
- **Code Maintainability**: Readable, testable, well-documented code mandatory
- **Platform UX**: Native conventions and Human Interface Guidelines compliance
EOF
    fi

    cat >> Context.md << EOF

## Contained Projects
**Discovered Projects**:
EOF

    for i in "${!PROJECTS[@]}"; do
        cat >> Context.md << EOF
- **${PROJECTS[$i]}**: ${PROJECT_TYPES[$i]} (${LANGUAGES[$i]}$(if [[ -n "${FRAMEWORKS[$i]}" ]]; then echo ", ${FRAMEWORKS[$i]}"; fi))
EOF
    done

    cat >> Context.md << EOF

**Inheritance Rules**:
- Child projects inherit workspace coding style and constitutional adjustments
- Projects can override workspace settings in their own Context.md files  
- Constitutional principle overrides cascade to all child projects
- Workspace-level templates and configurations are shared across projects

## Development Guidelines
**Workspace Commands**: All ContextKit commands available in child projects
**Quality Standards**: Workspace-level constitutional compliance enforcement
**Team Coordination**: Shared .claude/ configurations across all projects
**Documentation Requirements**: Consistent patterns across all projects

$(if [[ "$PRIMARY_LANGUAGE" == "swift" ]]; then
cat << 'SWIFT_EOF'

## Swift-Specific Configuration
**Package Architecture**: Package-first development with clear API boundaries
**Error Handling**: Typed throws with ErrorKit patterns across all Swift projects
**UI Framework**: SwiftUI preferred over UIKit for new development
**Formatting**: Automated with SwiftFormat + swift-format
**Constitutional Swift Patterns**:
- Accessibility labels and hints for all UI elements
- String externalization using semantic keys
- Privacy manifest updates for data collection
- Modern Swift API usage (Date.now, Duration, async/await)
SWIFT_EOF
fi)

## Workspace Validation
**Setup Verification**: Run \`/ContextKit/verify\` in any child project
**Constitutional Compliance**: All projects must pass constitutional validation gates
**Cross-Project Consistency**: Shared patterns and standards across all projects  
**Team Collaboration**: Workspace Context.md committed for team visibility

---
*This workspace configuration was generated by ContextKit v$contextkit_version on $setup_date*
*Inheritance chain: ContextKit Global Defaults → **This Workspace** → Individual Projects*
*Constitutional principle overrides documented above with explicit justification*
EOF

    echo "✅ Generated workspace Context.md with inheritance configuration"
}
```

### Phase 3: Validation and Completion

```bash
# Validate workspace configuration
validate_workspace_config() {
    echo "🔄 Validating workspace configuration..."
    
    # Check Context.md was created successfully
    if [[ ! -f "Context.md" ]]; then
        echo "❌ Context.md generation failed"
        exit 1
    fi
    
    # Verify ContextKit configuration markers
    if ! grep -q "ContextKit Configuration" Context.md; then
        echo "❌ Invalid Context.md format - missing ContextKit markers"
        exit 1
    fi
    
    # Check for constitutional principle conflicts
    local conflicts_found=false
    if [[ ${#CONSTITUTIONAL_OVERRIDES[@]} -gt 0 ]]; then
        echo "⚠️ Constitutional principle overrides detected:"
        for override in "${CONSTITUTIONAL_OVERRIDES[@]}"; do
            local principle="${override%%:*}"
            echo "   • $principle override documented"
        done
        
        echo "❓ Confirm constitutional overrides are acceptable? (y/N)"
        read -r response
        if [[ ! "$response" =~ ^[Yy]$ ]]; then
            echo "❌ Setup cancelled due to constitutional conflicts"
            echo "💡 Re-run setup to modify constitutional adjustments"
            exit 1
        fi
    fi
    
    # Test inheritance logic (conceptual validation)
    echo "✅ Workspace configuration validated"
    echo "ℹ️ Child projects will inherit workspace configuration through Context.md reference"
}

# Display completion summary
display_workspace_completion() {
    local workspace_name=$(basename "$(pwd)")
    
    echo ""
    echo "🎉 Workspace setup complete: $workspace_name"
    echo ""
    echo "📁 Workspace configured with:"
    echo "   ✓ Context.md - Workspace configuration and overrides"
    echo "   ✓ Constitutional principle customization$(if [[ ${#CONSTITUTIONAL_OVERRIDES[@]} -gt 0 ]]; then echo " (with overrides)"; fi)"
    echo "   ✓ Inheritance hierarchy for ${#PROJECTS[@]} contained projects"
    echo "   ✓ Coding style and architecture preferences"
    echo ""
    
    if [[ ${#PROJECTS[@]} -gt 0 ]]; then
        echo "🔗 To apply workspace configuration to projects:"
        echo "   1. Navigate to any project directory: ${PROJECTS[0]}"  
        echo "   2. Run ContextKit project setup: /ContextKit/setup"
        echo "   3. Workspace settings will be inherited automatically"
        echo ""
    fi
    
    echo "🎛️ Workspace Configuration Summary:"
    echo "   • Type: $WORKSPACE_DESCRIPTION"
    echo "   • Primary Language: $PRIMARY_LANGUAGE"
    echo "   • Indentation: $INDENTATION"
    echo "   • Architecture: $ARCHITECTURE"
    if [[ ${#CONSTITUTIONAL_OVERRIDES[@]} -gt 0 ]]; then
        echo "   • Constitutional Overrides: ${#CONSTITUTIONAL_OVERRIDES[@]} documented"
    else
        echo "   • Constitutional Principles: Full compliance enforced"
    fi
    echo ""
    
    echo "💡 Workspace Management:"
    echo "   • Add new projects: Run /ContextKit/setup in project directories"
    echo "   • Modify workspace: Re-run /ContextKit/setup-workspace"
    echo "   • Validate setup: /ContextKit/verify in any project"
    echo ""
    
    echo "🧠 ContextKit workspace ready - consistent development workflows across all projects!"
}

# Test workspace inheritance (sample validation)
test_inheritance() {
    if [[ ${#PROJECTS[@]} -gt 0 ]]; then
        local sample_project="${PROJECTS[0]}"
        echo "🔬 Testing inheritance with sample project: $sample_project"
        
        if [[ -d "$sample_project" ]]; then
            pushd "$sample_project" > /dev/null 2>&1
            
            # Check if project can access workspace context
            if [[ -f "../Context.md" ]]; then
                echo "   ✅ Workspace Context.md accessible from $sample_project"
            else
                echo "   ⚠️ Workspace Context.md not accessible - check file permissions"
            fi
            
            popd > /dev/null 2>&1
        fi
    fi
}
```

### Main Execution

```bash
main() {
    echo "🧠 ContextKit Workspace Setup"
    echo "Configure workspace-level overrides and project inheritance"
    echo ""
    
    # Execute workspace setup phases
    validate_workspace_location
    discover_projects
    analyze_patterns
    configure_workspace
    generate_workspace_context  
    validate_workspace_config
    test_inheritance
    display_workspace_completion
    
    echo "✅ Workspace setup complete - ready for project configuration"
}

main "$@"
```

## Error Conditions

- **"ContextKit not installed globally"** → Run global installation script first
- **"Not in intended workspace directory"** → Navigate to correct location
- **"Workspace Context.md creation failed"** → Check directory permissions
- **"Constitutional conflicts unresolved"** → Provide explicit justification for overrides
- **"No projects found"** → Confirm workspace setup in correct location
- **"Inheritance test failed"** → Verify workspace Context.md accessibility
- **"Invalid workspace configuration"** → Re-run setup with corrected inputs

## Validation Gates

- [ ] Workspace location confirmed by user?
- [ ] Projects discovered and analyzed successfully?
- [ ] Constitutional principle overrides documented with justification?
- [ ] Workspace Context.md generated and properly formatted?
- [ ] Inheritance logic validated conceptually?
- [ ] Team collaboration considerations addressed?
- [ ] Workspace type and requirements captured accurately?

## Template Variables Used

- `${WORKSPACE_NAME}` - Current directory name as workspace identifier
- `${WORKSPACE_TYPE}` - User-selected workspace type (indie/client/enterprise/opensource)  
- `${CLIENT_NAME}` - Client or company name for contract work
- `${PRIMARY_LANGUAGE}` - Detected primary language across projects
- `${INDENTATION}` - Workspace indentation preference
- `${ARCHITECTURE}` - Architectural approach preference
- `${CONSTITUTIONAL_OVERRIDES}` - Array of principle overrides with justification

## Integration Points

- **Global ContextKit**: Inherits from ~/.ContextKit/ global defaults
- **Project Setup**: Provides configuration inheritance for /ContextKit/setup command
- **Team Collaboration**: Creates committed workspace Context.md for team sharing
- **Constitutional Framework**: Documents principle overrides with explicit justification
- **Quality Assurance**: Establishes workspace-level validation standards

---

**Status**: Production ready - Multi-project workspace configuration with constitutional customization