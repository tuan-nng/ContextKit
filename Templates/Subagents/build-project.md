# Subagent: build-project

## Purpose
Execute project build operations with comprehensive error reporting, constitutional compliance validation, and development workflow integration.

## Context Requirements  
- Project files and configuration (Package.swift, Xcode projects, package.json, etc.)
- Current development session context from ContextKit SessionStart
- Constitutional compliance requirements for project type
- Build configuration and environment setup

## Execution Flow (subagent)
1. Analyze project configuration and build requirements
   → Detect project type from Package.swift, *.xcodeproj, package.json, requirements.txt
   → Load build configuration from project files and workspace context
   → Identify target platforms and deployment requirements
   → If project type unclear: ERROR "Cannot determine build system"
2. Validate pre-build constitutional compliance
   → Check accessibility implementation completeness for UI projects
   → Verify privacy manifest accuracy for data-handling projects  
   → Validate localization readiness for user-facing projects
   → Assess maintainability standards for all projects
3. Execute project-specific build process
   → Swift Package: Run swift build with appropriate configuration
   → iOS/macOS App: Use xcodebuild with platform-specific settings
   → JavaScript Project: Run npm/yarn build with optimization
   → Python Project: Run setup.py build or equivalent
   → Multi-platform: Execute builds for all target platforms
4. Parse and analyze build output
   → Capture compilation errors, warnings, and performance metrics
   → Identify constitutional principle violations in build output
   → Categorize issues by severity and impact on development workflow
   → Extract actionable error messages and resolution guidance
5. Run post-build validation and testing
   → Execute unit tests and integration tests if available
   → Validate constitutional compliance in built artifacts
   → Check for runtime accessibility, privacy, localization issues
   → Assess build performance and optimization opportunities
6. Generate comprehensive build report
   → Categorize errors and warnings with constitutional impact assessment
   → Provide specific resolution guidance for each issue category
   → Include performance metrics and optimization suggestions
   → Document constitutional compliance status and required improvements
7. Integrate with development workflow context
   → Update active feature task status based on build results
   → Track constitutional compliance progress over time
   → Provide next steps guidance for continued development
   → Update session context with build status and recommendations
8. Return: STRUCTURED BUILD REPORT (success status, issues, guidance, next steps)

## Input Format
```
Project Type: ${PROJECT_TYPE}
Build Configuration: ${BUILD_CONFIG}
Target Platforms: ${TARGET_PLATFORMS}  
Constitutional Requirements: ${CONSTITUTIONAL_REQUIREMENTS}
Session Context: ${DEVELOPMENT_SESSION_CONTEXT}
```

## Build System Integration

### Swift Package Build Process
```bash
# Multi-platform Swift package build
swift build --configuration release
swift test --parallel

# Cross-platform validation for universal packages
if [[ "$SUPPORTS_LINUX" == "true" ]]; then
    # Linux compatibility validation through Docker
    docker run --rm -v "$PWD:/workspace" -w /workspace swift:5.9 swift test
fi

# Documentation build validation
swift package generate-documentation
```

### iOS/macOS App Build Process  
```bash
# iOS App build with constitutional validation
xcodebuild clean build \
    -scheme "$APP_SCHEME" \
    -destination "platform=iOS Simulator,name=iPhone 15 Pro" \
    -configuration Release \
    -derivedDataPath ./DerivedData

# Accessibility testing integration
xcodebuild test \
    -scheme "$APP_SCHEME" \
    -destination "platform=iOS Simulator,name=iPhone 15 Pro" \
    -testPlan "AccessibilityTests"

# Privacy manifest validation
plutil -lint PrivacyInfo.xcprivacy 2>/dev/null || echo "Privacy manifest validation failed"
```

### JavaScript Project Build Process
```bash
# Node.js project build with optimization
npm run build --production

# Accessibility linting for web projects
if command -v axe &> /dev/null; then
    axe --include="src/**/*.jsx,src/**/*.tsx" --exclude="node_modules/**"
fi

# Bundle analysis for performance
if [ -f "webpack.config.js" ]; then
    npx webpack-bundle-analyzer build/static/js/*.js
fi
```

## Constitutional Compliance Build Validation

### Accessibility Build Checks
```swift
// Swift accessibility build validation
struct AccessibilityBuildChecks {
    func validateSwiftUIAccessibility(_ buildOutput: String) -> [AccessibilityIssue] {
        var issues: [AccessibilityIssue] = []
        
        // Check for missing accessibility labels in build warnings
        if buildOutput.contains("accessibilityLabel") {
            issues.append(.missingLabels("Interactive elements without accessibility labels"))
        }
        
        // Check for color accessibility warnings
        if buildOutput.contains("contrast") || buildOutput.contains("color") {
            issues.append(.colorContrast("Potential color contrast issues detected"))
        }
        
        return issues
    }
}
```

### Privacy Build Checks  
```swift
// Privacy compliance build validation
struct PrivacyBuildChecks {
    func validatePrivacyCompliance(_ buildOutput: String, manifest: String?) -> [PrivacyIssue] {
        var issues: [PrivacyIssue] = []
        
        // Check for privacy manifest completeness
        guard let manifest = manifest else {
            issues.append(.missingManifest("Privacy manifest required for App Store"))
            return issues
        }
        
        // Check for data usage declarations
        if !manifest.contains("NSPrivacyCollectedDataTypes") {
            issues.append(.incompleteManifest("Data collection types not declared"))
        }
        
        return issues
    }
}
```

### Localization Build Checks
```swift
// Localization readiness build validation
struct LocalizationBuildChecks {
    func validateLocalizationReadiness(_ buildOutput: String) -> [LocalizationIssue] {
        var issues: [LocalizationIssue] = []
        
        // Check for hardcoded strings in build warnings
        if buildOutput.contains("Hardcoded string") {
            issues.append(.hardcodedStrings("User-facing strings not externalized"))
        }
        
        // Check for missing localization files
        if !buildOutput.contains("Localizable.strings") {
            issues.append(.missingLocalization("No localization files found"))
        }
        
        return issues
    }
}
```

## Build Report Output Format

### Success Report Structure
```markdown
# Build Report: SUCCESS ✅

**Project**: ${PROJECT_NAME}  
**Build Time**: $(date)  
**Configuration**: ${BUILD_CONFIGURATION}  
**Constitutional Compliance**: ${COMPLIANCE_STATUS}

## Build Summary
- **Status**: ✅ SUCCESS
- **Duration**: ${BUILD_DURATION}
- **Warnings**: ${WARNING_COUNT}
- **Platforms**: ${BUILT_PLATFORMS}

## Constitutional Compliance Status
- **Accessibility**: ✅ PASS - All UI elements have proper accessibility support
- **Privacy**: ✅ PASS - Privacy manifest complete and accurate
- **Localization**: ✅ PASS - All strings externalized, RTL support ready
- **Maintainability**: ✅ PASS - Clean architecture, proper error handling

## Performance Metrics
- **Build Time**: ${BUILD_TIME}
- **Binary Size**: ${BINARY_SIZE} (${SIZE_CHANGE} from previous)
- **Test Coverage**: ${TEST_COVERAGE}%
- **Documentation Coverage**: ${DOC_COVERAGE}%

## Quality Indicators
- **Warnings**: ${WARNINGS} (${WARNING_TREND})
- **Code Complexity**: ${COMPLEXITY_SCORE}
- **Technical Debt**: ${DEBT_SCORE}
- **Dependencies**: ${DEPENDENCY_COUNT} (${SECURITY_VULNERABILITIES} vulnerabilities)

## Next Steps
- **Development**: Continue with next task in active feature
- **Testing**: Run integration tests on target devices
- **Release**: Ready for release preparation when feature complete

## Recommendations
- Consider optimizing ${OPTIMIZATION_SUGGESTIONS}
- Update ${OUTDATED_DEPENDENCIES} dependencies
- Improve test coverage for ${LOW_COVERAGE_AREAS}
```

### Failure Report Structure  
```markdown
# Build Report: FAILURE ❌

**Project**: ${PROJECT_NAME}  
**Build Time**: $(date)  
**Configuration**: ${BUILD_CONFIGURATION}  
**Constitutional Compliance**: ${COMPLIANCE_STATUS}

## Build Summary
- **Status**: ❌ FAILURE
- **Duration**: ${BUILD_DURATION}
- **Errors**: ${ERROR_COUNT}
- **Warnings**: ${WARNING_COUNT}

## Critical Issues Requiring Immediate Attention

### Compilation Errors
${COMPILATION_ERRORS}
**Resolution Guidance**:
- ${ERROR_RESOLUTION_STEPS}

### Constitutional Violations
${CONSTITUTIONAL_VIOLATIONS}
**Impact**: These violations affect user accessibility, privacy, or experience
**Required Actions**:
- ${CONSTITUTIONAL_FIX_STEPS}

## Error Categories and Solutions

### Accessibility Errors
- **Missing Labels**: ${ACCESSIBILITY_LABEL_ERRORS}
  - **Fix**: Add `.accessibilityLabel()` to all interactive UI elements
  - **Example**: `Button("Save") { }.accessibilityLabel("Save document")`

### Privacy Errors  
- **Manifest Issues**: ${PRIVACY_MANIFEST_ERRORS}
  - **Fix**: Update PrivacyInfo.xcprivacy with accurate data usage declarations
  - **Documentation**: https://developer.apple.com/documentation/bundleresources/privacy_manifest_files

### Localization Errors
- **Hardcoded Strings**: ${LOCALIZATION_ERRORS}
  - **Fix**: Replace string literals with `String(localized: "key")`
  - **Pattern**: Use semantic keys like "button.save.label" not "Save"

### Maintainability Errors
- **Error Handling**: ${ERROR_HANDLING_ISSUES}
  - **Fix**: Use typed throws with clear error messages
  - **Pattern**: `throws UserError` not `throws Error`

## Debugging Steps
1. **${FIRST_ERROR_TYPE}**: ${DEBUGGING_GUIDANCE_1}
2. **${SECOND_ERROR_TYPE}**: ${DEBUGGING_GUIDANCE_2}
3. **Constitutional Issues**: Address accessibility, privacy, localization violations first

## Build Environment Issues
- **Dependencies**: ${DEPENDENCY_ISSUES}
- **Configuration**: ${CONFIG_ISSUES}
- **Tools**: ${TOOL_VERSION_ISSUES}

## Next Steps
1. **Fix Critical Errors**: Address compilation failures first
2. **Resolve Constitutional Violations**: Ensure compliance before continuing
3. **Re-run Build**: Use `/build-project` subagent after fixes applied
4. **Continue Development**: Resume feature work when build succeeds
```

## Integration with Development Workflow

### Active Feature Task Integration
```markdown
## Development Context Integration
- **Active Feature**: ${ACTIVE_FEATURE_NAME}
- **Current Task**: ${CURRENT_TASK_DESCRIPTION}
- **Task Impact**: ${BUILD_IMPACT_ON_CURRENT_TASK}

### Task Status Updates
- If build succeeds: Mark current task as ready for testing/review
- If build fails: Keep task in progress, provide resolution guidance
- If constitutional violations: Flag task for compliance review

### Next Development Steps
Based on build results and current development context:
- **Success**: Continue with next task or move to testing phase
- **Minor Issues**: Fix warnings while continuing development
- **Major Issues**: Pause development to resolve critical problems
- **Constitutional Issues**: Address compliance before any other work
```

## Error Handling and Recovery

### Build Error Categories
```swift
enum BuildError: String {
    case compilationFailure = "Code compilation failed"
    case testFailure = "Tests failed during build"
    case constitutionalViolation = "Constitutional compliance failed"
    case dependencyIssue = "Dependency resolution failed"
    case configurationError = "Build configuration invalid"
    case environmentIssue = "Build environment not properly configured"
}
```

### Recovery Guidance
- **Compilation Errors**: Provide specific fix guidance for each error type
- **Constitutional Violations**: Include examples and patterns for compliance
- **Dependency Issues**: Suggest resolution strategies and version updates
- **Configuration Problems**: Guide through proper setup and validation

## Performance Monitoring and Optimization

### Build Performance Tracking
- Monitor build time trends over development cycles
- Track binary size changes and optimization opportunities
- Assess test execution performance and coverage trends
- Identify slow dependencies and build bottlenecks

### Constitutional Compliance Metrics
- Track accessibility implementation completeness over time
- Monitor privacy compliance improvements and regression prevention
- Measure localization readiness and cultural adaptation progress
- Assess maintainability scores and technical debt reduction