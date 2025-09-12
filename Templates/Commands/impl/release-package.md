# Publish Package

## Description
Handle Swift Package release workflow with GitHub integration, cross-platform validation, and constitutional compliance

## Parameters
- `release_type` (optional): major, minor, patch - defaults to detecting from changes
- `prerelease` (optional): alpha, beta, rc - for pre-release versions

## Execution Flow (main)
1. Validate Swift package release prerequisites
   → Verify this is a Swift package project (Package.swift present)
   → Check that all features are complete (no pending tasks in Context/Features/)
   → Ensure git working directory is clean with all changes committed
   → If not package project: ERROR "Use /Implement/release-app for iOS/macOS apps"
2. Run Swift package constitutional validation
   → Execute API design review: Clear naming, protocol-oriented design, minimal dependencies
   → Execute cross-platform compatibility: Linux, Windows (where applicable), macOS compatibility
   → Execute documentation completeness: DocC documentation, code examples, API coverage
   → Execute maintainability assessment: Clear architecture, comprehensive error handling
   → If any violations: ERROR with specific remediation guidance
3. Determine release version and scope
   → Analyze committed changes since last release (breaking changes → major, features → minor, fixes → patch)
   → Parse git history and conventional commits if used
   → If release_type provided: validate against change scope and breaking changes
   → If prerelease specified: append prerelease identifier to version
4. Update package metadata and documentation
   → Update version in Package.swift if manually specified
   → Update README.md with latest features and breaking changes
   → Regenerate API documentation with DocC
   → Update CHANGELOG.md with comprehensive release notes
5. Run comprehensive package validation
   → Swift package resolution and build across all platforms
   → Linux compatibility testing (if cross-platform package)
   → Execute complete test suite with coverage analysis
   → Validate public API surface and breaking change detection
   → Performance regression testing for performance-critical packages
6. Documentation and example validation
   → Ensure all public APIs have comprehensive documentation
   → Validate code examples in documentation compile and run
   → Check README.md installation and usage instructions are current
   → Verify DocC documentation builds without warnings
7. Create release artifacts
   → Generate GitHub release notes from CHANGELOG.md and git history
   → Create comprehensive Context/Releases/[Version].md documentation
   → Package any additional distribution artifacts (if needed)
   → Prepare announcement content for developer community
8. GitHub release and tagging
   → Create and push annotated git tag with release version
   → Create GitHub release with generated release notes
   → Upload any additional release artifacts to GitHub release
   → Update GitHub repository description and topics if needed
9. Package registry and distribution
   → Swift Package Index will automatically detect new releases
   → Update any package manager registries if applicable
   → Notify dependent projects of updates if breaking changes
   → Update package discovery and showcase materials
10. Finalize release process
    → Merge release branch to main if using git flow
    → Update development branch with post-release version
    → Create announcement for developer community
    → Update package ecosystem integrations
11. Return: SUCCESS (Swift package released with full validation and documentation)

## Template Variables
${PACKAGE_NAME} - Package name from Package.swift
${CURRENT_VERSION} - Current package version from git tags
${NEW_VERSION} - Calculated new version for release
${BREAKING_CHANGES} - List of breaking changes requiring major version bump
${NEW_FEATURES} - List of new features for minor version bump
${BUG_FIXES} - List of bug fixes for patch version bump
${CONSTITUTIONAL_STATUS} - Results of Swift package constitutional validation

## Swift Package Constitutional Validation

### API Design Excellence (Blocking)
```swift
// Required API design standards
struct PackageAPIChecklist {
   // Clarity and Consistency
   var clearNamingConventions: Bool
   var consistentParameterOrdering: Bool
   var protocolOrientedDesign: Bool
   
   // Swifty Patterns
   var appropriateUseOfOptionals: Bool
   var valueTypesWherePossible: Bool
   var typedThrowsForErrorHandling: Bool
   
   // Documentation
   var allPublicAPIsDocumented: Bool
   var codeExamplesInDocumentation: Bool
   var usageGuidanceProvided: Bool
}
```

### Cross-Platform Compatibility (Blocking)
```swift
// Required cross-platform standards
struct PackagePlatformChecklist {
   // Platform Support
   var macOSCompatibilityTested: Bool
   var iOSCompatibilityTested: Bool
   var linuxCompatibilityTested: Bool // if applicable
   
   // Foundation Usage
   var noUnavailableFoundationAPIs: Bool
   var platformSpecificCodeConditioned: Bool
   var consistentBehaviorAcrossPlatforms: Bool
   
   // Dependencies
   var minimalExternalDependencies: Bool
   var crossPlatformDependenciesOnly: Bool
   var versionConstraintsAppropriate: Bool
}
```

### Documentation Completeness (Blocking)
```swift
// Required documentation standards  
struct PackageDocumentationChecklist {
   // DocC Documentation
   var allPublicTypesDocumented: Bool
   var allPublicMethodsDocumented: Bool
   var codeExamplesForComplexAPIs: Bool
   
   // Repository Documentation
   var readmeUpToDateAndComplete: Bool
   var installationInstructionsClear: Bool
   var usageExamplesComprehensive: Bool
   
   // Change Documentation
   var changelogMaintained: Bool
   var breakingChangesHighlighted: Bool
   var migrationGuidanceProvided: Bool
}
```

## Version Determination Logic

### Semantic Versioning Analysis
```swift
enum VersionBumpType {
   case major    // Breaking changes to public API
   case minor    // New features, backward compatible
   case patch    // Bug fixes, backward compatible
   
   static func determineFromChanges(_ changes: [GitChange]) -> VersionBumpType {
      // Analyze git commits and changed files
      // Detect breaking changes in public API
      // Identify new features vs bug fixes
   }
}
```

### Breaking Change Detection
- **Public API Changes**: Removed or modified public methods, properties, types
- **Behavioral Changes**: Different behavior for same input (even if compatible)
- **Dependency Changes**: Major version bumps in public dependencies
- **Platform Support**: Dropping support for previously supported platforms

## Package Validation Pipeline

### Build and Test Validation
```bash
# Multi-platform build validation
swift build -c release
swift test --parallel

# Linux compatibility (if cross-platform)
docker run --rm -v "$PWD:/workspace" -w /workspace swift:5.9 swift test

# Documentation building
swift package generate-documentation
```

### API Surface Analysis
```bash
# Generate and compare API surface
swift api-diff --baseline=${PREVIOUS_VERSION} --new=${NEW_VERSION}

# Validate public API documentation coverage  
swift package describe-api --format json | jq '.coverage'
```

## Release Documentation Generation

### CHANGELOG.md Updates
```markdown
## [${NEW_VERSION}] - $(date +%Y-%m-%d)

### Added
- New feature descriptions with API examples

### Changed  
- Breaking changes with migration guidance
- Behavior changes with impact description

### Deprecated
- Deprecated APIs with replacement guidance

### Removed
- Removed APIs (breaking changes)

### Fixed
- Bug fix descriptions with affected scenarios

### Security
- Security improvements and vulnerability fixes
```

### GitHub Release Notes Template
```markdown
# ${PACKAGE_NAME} ${NEW_VERSION}

## Constitutional Compliance ✅
- [x] API Design: Clear naming, protocol-oriented, well-documented
- [x] Cross-Platform: macOS, iOS, Linux compatibility verified  
- [x] Documentation: Complete DocC docs, examples, migration guides
- [x] Maintainability: Clean architecture, comprehensive error handling

## What's New
- **Feature Name**: Description of user benefit and API usage example

## Breaking Changes ⚠️  
- **API Change**: Clear migration path from old to new API
- **Behavior Change**: Impact description and adaptation guidance

## Improvements
- **Performance**: Specific improvements with benchmarks if applicable
- **Documentation**: Enhanced examples, clearer API guidance
- **Error Handling**: Better error messages, more specific error types

## Installation
```swift
dependencies: [
    .package(url: "https://github.com/FlineDev/${PACKAGE_NAME}", from: "${NEW_VERSION}")
]
```

## Compatibility
- **Swift**: ${SWIFT_VERSION_SUPPORT}
- **Platforms**: ${SUPPORTED_PLATFORMS}
- **Dependencies**: ${DEPENDENCY_CHANGES}
```

## Package Distribution and Discovery

### Swift Package Index Integration
- Automatic detection of new releases through GitHub webhooks
- Package metadata and documentation automatically updated
- Compatibility and build status badges reflect current state
- Search and discovery improved with accurate metadata

### Community Announcement
```markdown
# ${PACKAGE_NAME} ${NEW_VERSION} Released

I'm excited to announce ${PACKAGE_NAME} ${NEW_VERSION}, bringing [key improvements].

## Key Features
- Brief description of most important improvements
- Constitutional compliance: accessibility, documentation, maintainability

## Getting Started
[Installation and basic usage example]

## What's Next
[Roadmap items and community feedback requests]

Built with constitutional principles: clear APIs, comprehensive docs, cross-platform support.

#SwiftPackage #iOS #macOS #Development
```

## Validation Gates
- [ ] Swift package project confirmed (Package.swift present)?
- [ ] All constitutional validation requirements met?
- [ ] Cross-platform compatibility verified?
- [ ] Documentation complete and accurate?
- [ ] Breaking changes identified and documented?
- [ ] GitHub release credentials configured?
- [ ] Package ecosystem integrations updated?

## Error Conditions
- "Not a Swift package" → Use /Implement/release-app for iOS/macOS apps
- "Constitutional violations" → Fix API design, documentation, or compatibility issues
- "Breaking changes undocumented" → Must provide clear migration guidance
- "Cross-platform failures" → Fix Linux/Windows compatibility issues
- "Documentation incomplete" → All public APIs must have comprehensive documentation
- "Test failures" → All tests must pass before release
- "GitHub release errors" → Fix repository access, tagging, or release creation issues

## Post-Release Monitoring

### Community Response Tracking
- Monitor GitHub issues for bug reports or feature requests
- Track Swift Package Index adoption and compatibility reports
- Respond to community feedback and integration challenges
- Plan future releases based on community needs

### Ecosystem Integration
- Update dependent projects with new version
- Coordinate with package managers and registries
- Maintain showcase applications and examples
- Support developer community adoption