# Command: /Implement/release-app

## Description
Execute comprehensive iOS/macOS app release workflow with constitutional compliance, App Store Connect integration, and automatic localization

## Parameters
- `version` (required): Semantic version for release (e.g., "1.2.0")
- `dry_run` (optional): Preview changes without executing (default: false)
- `target_platform` (optional): ios, macos, visionos - defaults to detecting from project

## Execution Flow (main)
1. Validate release prerequisites and development state
   → Check that development session is complete (/Implement/start-working completed)
   → Verify this is an iOS/macOS app project (*.xcodeproj present)
   → Ensure git working directory is clean with all changes committed
   → Confirm Xcode Cloud is configured for automatic builds
   → If not app project: ERROR "Use /Implement/release-package for Swift packages"
   → If uncommitted changes: ERROR "Commit all changes before release"
2. Analyze changes since last release for What's New content
   → Find latest git tag using semantic version sorting: `git tag --sort=-version:refname | head -1`
   → Extract commits between last tag and HEAD with full diffs: `git log --oneline LAST_TAG..HEAD`
   → Review each commit individually: `git show COMMIT_HASH` for complete change analysis
   → Focus on user-facing changes: new features, UI improvements, notable bug fixes
   → Exclude internal changes: technical debt, code refactoring, dependency updates
   → If no user-facing changes: ASK "Create maintenance release anyway?"
3. Generate comprehensive release documentation with App Store Connect text
   → Create AssistantContext/Projects/[ProjectName]/Releases/[Version].md
   → Include detailed analysis of user-facing changes with constitutional compliance review
   → Generate App Store Connect-ready What's New text in structured format
   → Mark accessibility improvements, privacy enhancements, localization updates
   → Apply Release.md guidelines for user-facing vs technical change categorization
   → If documentation generation fails: ERROR "Unable to analyze changes for release"
4. Execute constitutional compliance validation (blocking gates)
   → Execute accessibility subagent: VoiceOver labels, color contrast, keyboard navigation
   → Execute privacy subagent: Privacy manifest accuracy, data usage compliance, encryption
   → Execute localization subagent: String externalization, cultural appropriateness, formatters
   → Execute maintainability subagent: Code quality, error handling, documentation
   → If any blocking violations found: ERROR with specific remediation guidance
   → If warning violations found: DOCUMENT in release notes but allow release
5. Update project version following Release.md guidelines
   → Update MARKETING_VERSION in project.pbxproj for Debug and Release configurations
   → Keep CURRENT_PROJECT_VERSION at "1" (Xcode Cloud handles build numbers automatically)
   → Verify version consistency across all build configurations
   → Validate privacy manifest is current for any new data usage patterns
   → If version update fails: ERROR "Version update conflicts with project structure"
6. Execute git workflow and Xcode Cloud preparation
   → Commit version changes with "Bump version num" message following GitCommit.md
   → Create local git tag with semantic version: `git tag ${VERSION}`
   → Prepare for remote push (user handles push to trigger Xcode Cloud)
   → Validate git repository is ready for automated build process
   → If git operations fail: ERROR "Git workflow failed - resolve conflicts"
7. Prepare automatic localization workflow with TranslateKit
   → Detect supported languages in project String Catalog
   → Generate localized What's New text using TranslateKit integration
   → Format localized content for App Store Connect API submission
   → Validate translations for cultural appropriateness and technical accuracy
   → Create structured localized release notes in documentation
   → If localization fails: WARN "Manual translation required for international markets"
8. Validate App Store Connect readiness and submission requirements
   → Check app identifier and provisioning profiles are current
   → Verify privacy manifest completeness for App Store Review Guidelines
   → Confirm app submission requirements: screenshots, metadata, age ratings updated
   → Validate Human Interface Guidelines compliance for new features
   → Generate direct App Store Connect submission guidance
   → If validation fails: WARN "Address App Store Connect issues before submission"
9. Finalize release process and provide post-release guidance
   → Summarize all constitutional compliance validation results
   → Provide clear next steps for user: push commits/tags, monitor Xcode Cloud
   → Generate social media post templates following SocialMedia.md guidelines
   → Create App Store Connect submission checklist with localized content
   → Document release timeline and monitoring requirements
10. Return: SUCCESS (release prepared, Xcode Cloud ready, App Store Connect integration complete)

## Template Variables
${PROJECT_NAME} - Detected project name from Xcode project or directory
${RELEASE_VERSION} - Semantic version provided by user (required parameter)
${LAST_RELEASE_TAG} - Most recent git tag using semantic version sorting
${CHANGES_ANALYSIS} - Generated analysis of user-facing changes since last release
${CONSTITUTIONAL_STATUS} - Results of accessibility, privacy, localization, maintainability validation
${LOCALIZATION_LANGUAGES} - Detected supported languages from String Catalog
${APP_STORE_TEXT} - Generated What's New text ready for App Store Connect
${LOCALIZED_APP_STORE_TEXT} - TranslateKit-generated localized What's New content
${TARGET_PLATFORMS} - Detected or specified target platforms (iOS/macOS/visionOS)
${XCODE_CLOUD_STATUS} - Xcode Cloud configuration and readiness status
${NEXT_STEPS} - Post-release guidance for user including push commands and monitoring

## App Store Connect Integration with Automatic Localization

### Release Documentation Structure with Localized Content
Following Release.md guidelines, create comprehensive release documentation in AssistantContext/Projects/[ProjectName]/Releases/[Version].md:

```markdown
# Release [Version]: [ProjectName]

## User-Facing Changes Analysis
[Detailed analysis of commits focusing on user-visible improvements]

## Constitutional Compliance Review
### ✅ Accessibility Improvements
- [List of VoiceOver, color contrast, keyboard navigation enhancements]

### ✅ Privacy Enhancements  
- [Privacy manifest updates, data protection improvements, user consent mechanisms]

### ✅ Localization Updates
- [String catalog updates, cultural adaptations, international market considerations]

### ✅ Platform UX Compliance
- [Human Interface Guidelines adherence, App Store Guidelines compliance]

==========================================
==========================================
# 📋 App Store Connect - What's New Text
==========================================
==========================================

– Added [feature with clear user benefit and accessibility impact]
– Improved [existing functionality with specific enhancement and localization support]
– Fixed [user-visible issues with privacy and performance impact]

==========================================
# 🌍 Localized App Store Connect Text
==========================================

## Spanish (es)
– Agregado [translated feature with cultural adaptation]
– Mejorado [translated improvement with regional considerations]
– Corregido [translated fix with localized technical terms]

## French (fr)
– Ajouté [translated feature with cultural adaptation]
– Amélioré [translated improvement with regional considerations]  
– Corrigé [translated fix with localized technical terms]

## German (de)
– Hinzugefügt [translated feature with cultural adaptation]
– Verbessert [translated improvement with regional considerations]
– Behoben [translated fix with localized technical terms]

[Additional languages generated based on String Catalog detection]

==========================================
# 🔗 App Store Connect Submission Checklist
==========================================

- [ ] Version ${RELEASE_VERSION} created in App Store Connect
- [ ] What's New text pasted for primary language (English)
- [ ] Localized What's New text pasted for: [detected languages]
- [ ] Privacy manifest changes reflected in App Privacy section
- [ ] Screenshots updated if UI changes present
- [ ] Age rating reviewed if content changes present
- [ ] Phased release configured (recommended: 7-day rollout)
- [ ] Build submitted for review after Xcode Cloud completes
```

### TranslateKit Integration for Automatic Localization
1. **Language Detection**: Scan project String Catalog (.xcstrings) files for supported localizations
2. **What's New Translation**: Generate localized App Store Connect text using TranslateKit
3. **Cultural Adaptation**: Adapt messaging for regional markets and cultural considerations
4. **Technical Accuracy**: Validate translations maintain technical precision and app context
5. **App Store Formatting**: Format localized text for direct copy-paste into App Store Connect

### Privacy Manifest Validation and App Store Compliance
- **NSPrivacyAccessedAPITypes**: Verify accuracy for any new API usage (location, contacts, photos, etc.)
- **NSPrivacyCollectedDataTypes**: Update for new data collection patterns with user benefit justification
- **NSPrivacyTrackingDomains**: Confirm third-party tracking domains are current and necessary
- **NSPrivacyAccessedAPITypeReasons**: Validate reasons align with actual app functionality and user expectations

### Xcode Cloud Integration and Build Automation
- **Tag-Triggered Builds**: Local git tag creation triggers automatic Xcode Cloud build when pushed
- **Build Number Management**: CURRENT_PROJECT_VERSION stays "1", Xcode Cloud auto-increments build numbers
- **Archive and Upload**: Automatic App Store Connect upload upon successful build completion
- **TestFlight Distribution**: Immediate TestFlight availability for internal testing and feedback

## Platform-Specific Release Requirements

### iOS App Release
- **Provisioning**: Valid App Store distribution certificate and provisioning profile
- **Privacy**: Accurate privacy manifest, permission usage strings in InfoPlist.strings
- **Accessibility**: VoiceOver labels, dynamic type support, semantic colors
- **Localization**: Externalized strings, culturally appropriate content, App Store metadata translations
- **Performance**: Launch time < 20 seconds, memory usage within guidelines
- **Guidelines**: Human Interface Guidelines compliance, App Review Guidelines adherence

### macOS App Release  
- **Sandboxing**: Proper entitlements, minimal privilege escalation
- **Notarization**: Valid Developer ID certificate, notarization for distribution outside Mac App Store
- **Accessibility**: Full keyboard navigation, VoiceOver support, system appearance adaptation
- **System Integration**: Proper use of system services, document type associations
- **Guidelines**: macOS Human Interface Guidelines, App Review Guidelines

### visionOS App Release
- **Spatial Computing**: Appropriate use of immersive spaces, window management
- **Accessibility**: Spatial accessibility features, alternative interaction methods
- **Performance**: Sustained performance in immersive experiences, thermal considerations
- **Guidelines**: visionOS Human Interface Guidelines, immersive experience best practices

## Constitutional Compliance Validation

### Accessibility Requirements (Blocking)
```swift
// Required accessibility implementations
struct ReleaseAccessibilityChecklist {
   // VoiceOver Support
   var allInteractiveElementsLabeled: Bool
   var meaningfulAccessibilityHints: Bool
   var properAccessibilityTraits: Bool
   
   // Visual Accessibility  
   var sufficientColorContrast: Bool
   var semanticColorsUsed: Bool
   var dynamicTypeSupport: Bool
   
   // Motor Accessibility
   var keyboardNavigationComplete: Bool
   var switchControlCompatible: Bool
   var voiceControlSupport: Bool
}
```

### Privacy Compliance Requirements (Blocking)
```swift
// Required privacy implementations
struct ReleasePrivacyChecklist {
   // Privacy Manifest
   var privacyManifestAccurate: Bool
   var dataUsageDeclarationsCurrent: Bool
   var thirdPartySDKsListed: Bool
   
   // User Consent
   var explicitConsentForDataCollection: Bool
   var granularPrivacyControls: Bool
   var dataDeletionCapability: Bool
   
   // Data Security
   var sensitiveDataEncrypted: Bool
   var keychainForCredentials: Bool
   var networkSecurityImplemented: Bool
}
```

### Localization Requirements (Blocking)
```swift  
// Required localization implementations
struct ReleaseLocalizationChecklist {
   // String Externalization
   var allUserStringsExternalized: Bool
   var semanticLocalizationKeys: Bool
   var contextualStringComments: Bool
   
   // Cultural Adaptation
   var numberFormattingLocalized: Bool
   var dateTimeFormattingLocalized: Bool
   var currencyFormattingLocalized: Bool
   
   // Layout Adaptation
   var rightToLeftLanguageSupport: Bool
   var variableTextLengthHandling: Bool
   var culturallyAppropriateContent: Bool
}
```

## App Store Connect Integration

### Build Upload Process
```bash
# Using xcodebuild for automated upload
xcodebuild archive -scheme ${APP_NAME} -configuration Release -archivePath ${ARCHIVE_PATH}
xcodebuild -exportArchive -archivePath ${ARCHIVE_PATH} -exportPath ${EXPORT_PATH} -exportOptionsPlist ${EXPORT_OPTIONS}
xcrun altool --upload-app --file ${IPA_PATH} --apiKey ${APPSTORE_API_KEY} --apiIssuer ${APPSTORE_ISSUER_ID}
```

### Release Notes Generation
- **User-Facing**: Clear, benefit-focused descriptions of new features and improvements
- **Technical**: Constitutional compliance verification, performance improvements
- **Localized**: Release notes translated for all supported markets
- **Versioned**: Comprehensive history in Context/Releases/[Version].md

## Performance and Quality Validation

### Pre-Release Testing Checklist
- [ ] Unit test suite passes (100% for critical paths)
- [ ] Integration tests pass (all app flows working)
- [ ] UI tests pass (including accessibility testing)
- [ ] Performance tests meet targets (launch time, memory usage)
- [ ] Localization testing (UI adapts to all supported languages)
- [ ] Device compatibility testing (all supported devices and OS versions)

### App Store Review Preparation
- [ ] Human Interface Guidelines compliance verified
- [ ] App Review Guidelines compliance verified
- [ ] Privacy policy updated and accessible
- [ ] Age rating appropriate for app content
- [ ] App metadata accurate and compelling
- [ ] Screenshots current and representative

## Release Documentation Template

### Context/Releases/[Version].md Structure
```markdown
# Release [Version] - [App Name]

## Constitutional Compliance ✅
- [x] Accessibility: VoiceOver complete, color contrast verified
- [x] Privacy: Privacy manifest updated, user consent implemented  
- [x] Localization: Strings externalized, cultural review complete
- [x] App Store: Guidelines compliance verified

## New Features
- Feature 1: User benefit and technical implementation
- Feature 2: Accessibility improvements and user impact

## Improvements  
- Performance: Launch time improved by X%, memory usage optimized
- Accessibility: Enhanced VoiceOver experience, better color contrast
- Localization: Added support for [languages], improved RTL experience

## Bug Fixes
- Fixed: Specific issue description and user impact
- Resolved: Accessibility issue affecting screen reader users

## Technical Details
- iOS Version Support: [minimum] - [maximum]
- New Dependencies: [if any]
- Breaking Changes: [if any]
- Migration Required: [if any]

## App Store Connect
- Submission ID: [ID]
- Phased Release: [Enabled/Disabled]
- Expected Review Time: [estimate]
- Release Date: [planned]
```

## Validation Gates
- [ ] Development session complete and all changes committed?
- [ ] Git repository clean with no uncommitted changes?
- [ ] User-facing changes identified and documented with Release.md guidelines?
- [ ] Constitutional compliance validated (accessibility, privacy, localization, maintainability)?
- [ ] Project version updated correctly in all build configurations (MARKETING_VERSION only)?
- [ ] Privacy manifest current for App Store Review Guidelines compliance?
- [ ] Xcode Cloud configured and ready for tag-triggered builds?
- [ ] TranslateKit localization workflow prepared for international markets?
- [ ] App Store Connect submission checklist generated with localized content?
- [ ] Release documentation created with structured App Store Connect text ready?
- [ ] Post-release workflow guidance provided (git push, monitoring, social media)?

## Error Conditions
- "Development incomplete" → Must complete /Implement/start-working workflow first
- "Not an app project" → Use /Implement/release-package for Swift packages
- "Uncommitted changes" → Must commit all changes before release using /Implement/commit-changes
- "No user-facing changes" → Consider if maintenance release is necessary for bug fixes only
- "Constitutional violations" → Must address blocking accessibility, privacy, localization issues
- "Version conflicts" → Must resolve git tag conflicts or App Store Connect version numbering
- "Xcode Cloud misconfigured" → Must setup Xcode Cloud workflow for automatic builds
- "Privacy manifest incomplete" → Must update NSPrivacyInfo.plist for App Store compliance
- "Localization errors" → Must resolve TranslateKit translation issues or String Catalog problems
- "Git workflow failures" → Must resolve merge conflicts, branch issues, or tagging problems

## Constitutional Compliance Enforcement

### Blocking Release Conditions (Must Fix Before Release)
- **Missing Accessibility Labels**: Interactive UI elements without VoiceOver labels
- **Hardcoded User Strings**: User-facing text not externalized for localization
- **Privacy Manifest Inaccuracy**: NSPrivacyInfo.plist doesn't reflect actual data usage
- **App Store Guidelines Violations**: Features that violate current App Store Review Guidelines
- **Critical Security Vulnerabilities**: Unencrypted sensitive data or insecure network calls

### Warning Conditions (Document but Allow Release)
- **Suboptimal Accessibility**: Implementations that work but could be improved
- **Minor Privacy Concerns**: Non-critical privacy improvements for future consideration
- **Performance Regressions**: Measurable but non-critical performance impacts
- **Localization Quality Issues**: Translations that are functional but could be refined
- **Technical Debt Accumulation**: Code quality concerns that don't affect functionality

### Post-Release Workflow Integration

#### Immediate Next Steps (User Actions Required)
1. **Push to Remote Repository**: 
   ```bash
   git push && git push --tags
   ```
   This triggers Xcode Cloud build automatically

2. **Monitor Xcode Cloud Dashboard**: Watch build progress and resolve any build failures

3. **App Store Connect Submission**: Submit for review once build processes to App Store Connect

4. **Social Media Announcement**: Create release posts following SocialMedia.md guidelines

#### Social Media Integration Template
Generate social media post templates in AssistantContext/Content/SocialMedia/YYYY-MM-DD-[ProjectName]-Release-[Version].md:
- **App-focused post**: Highlighting features from app perspective
- **Personal developer post**: Sharing development journey and insights
- **Platform optimization**: Bluesky format (300 chars) with expansion for other platforms
- **Authentic voice**: Following Communication.md principles with natural language

#### Release Monitoring and Support Strategy
- **App Store Connect Review Status**: Track submission through review process
- **TestFlight Beta Feedback**: Collect and triage feedback from beta users
- **App Store Review Issues**: Prepare responses for potential review feedback
- **Post-Release Bug Tracking**: Plan hotfix workflow for critical issues discovered after release
- **Analytics Monitoring**: Track adoption rates and user engagement with new features

### Quality Gate Success Criteria
- **100% Constitutional Compliance**: All blocking conditions resolved
- **Complete Documentation**: Release notes with clear App Store Connect text
- **Successful Privacy Validation**: Privacy manifest accurate for App Store Review
- **Verified Localization Readiness**: International market support confirmed
- **Clear Post-Release Plan**: Monitoring, support, and feedback collection strategy documented