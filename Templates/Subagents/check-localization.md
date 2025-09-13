---
meta: "Template Version: 0 | ContextKit: 0.0.0 | Updated: 2025-01-26"
name: check-localization
description: Comprehensive localization audit with String Catalog validation, cultural adaptation, and TranslateKit integration
tools: Read, Bash, Grep, Glob
---

> [!WARNING]
> **👩‍💻 FOR DEVELOPERS**: Do not edit the content above the developer customization section - changes will be overwritten during ContextKit updates.
>
> For project-specific customizations, use the designated section at the bottom of this file.
>
> Found a bug or improvement for everyone? Please report it: https://github.com/FlineDev/ContextKit/issues

# Subagent: check-localization

## Purpose
Perform comprehensive localization audit with execution flow pattern to ensure iOS/macOS applications meet international and accessibility standards from day one.

## Context Requirements
- Project files (SwiftUI views, UIKit controllers, Core Data models)
- Current feature specifications and technical plans
- Target platforms (iOS/macOS/tvOS/watchOS)
- String Catalog files (.xcstrings)
- Localization configuration files

## Execution Flow (subagent)

### Phase 1: Project Build and String Catalog Update
1. Execute project build to ensure compilation
   → If build fails: ERROR "Fix compilation errors before localization audit"
   → Build command: `swift build` (Package) or `xcodebuild` (App)
2. Update String Catalog with latest strings
   → Force Xcode to regenerate .xcstrings files
   → Scan for new LocalizedStringKey usage
   → If String Catalog missing: WARN "Create String Catalog for localization"
3. Analyze generated string catalog content
   → Extract all LocalizedStringKey entries
   → Identify auto-generated vs custom string keys
   → Map strings to source code locations

### Phase 2: String Catalog Analysis and Enhancement
4. Review contextual comments in String Catalog
   → Compare Xcode auto-generated comments with usage context
   → Identify insufficient or misleading comments
   → Generate improved contextual descriptions for translators
5. Validate semantic localization keys
   → Check for descriptive keys vs raw text keys
   → Ensure keys follow semantic naming conventions
   → Flag hardcoded strings that should use LocalizedStringKey
6. Analyze pluralization rules implementation
   → Verify .stringsdict files or equivalent for plural forms
   → Check language-specific plural rules (English, German, Russian, etc.)
   → Validate count-based string variations

### Phase 3: Model Data and UI Localization Validation
7. Scan Core Data models for localization needs
   → Identify user-facing string attributes
   → Check for proper localization of model display names
   → Validate entity and attribute descriptions for localization
8. Review SwiftUI/UIKit views for localization patterns
   → Verify all user-facing text uses LocalizedStringKey
   → Check accessibility labels and hints for localization
   → Validate dynamic content localization (dates, numbers, currencies)
9. Audit region-specific formatters
   → Date and time formatting with locale awareness
   → Number formatting with proper separators and decimal points
   → Currency formatting with appropriate symbols and positions
   → Measurement unit conversions and display

### Phase 4: Constitutional Localizability Compliance
10. Apply constitutional principle: "Localizability from day one"
    → Every user-facing string must be localizable
    → No hardcoded text in user interface elements
    → Proper semantic key naming for translator context
11. Validate platform-appropriate localization patterns
    → iOS: String Catalog integration with Xcode
    → macOS: NSLocalizedString with proper bundle handling
    → Cross-platform: SwiftUI LocalizedStringKey consistency
12. Check accessibility localization compliance
    → VoiceOver labels and hints properly localized
    → accessibility identifiers language-neutral
    → Dynamic type support across languages

### Phase 5: Advanced Localization Patterns
13. Analyze RTL (Right-to-Left) language support
    → UI layout adaptability for Arabic, Hebrew
    → Text alignment and reading direction
    → Icon and image mirroring requirements
14. Review locale-specific UI adaptations
    → Text expansion considerations (German, Finnish)
    → Font and typography adjustments
    → Cultural color and symbol appropriateness
15. Validate localization testing infrastructure
    → Pseudolocalization setup for layout testing
    → Locale switching capabilities in development
    → Translation memory integration possibilities

## Input Format
```
Project Type: ${PROJECT_TYPE}
Target Platforms: ${TARGET_PLATFORMS}
Primary Language: ${PRIMARY_LANGUAGE}
Code Files: ${ANALYZED_FILES}
String Catalog Files: ${XCSTRINGS_FILES}
Feature Context: ${FEATURE_DESCRIPTION}
Build Command: ${BUILD_COMMAND}
```

## Output Format
```markdown
# Localization Audit Report

## Project Build Status
✅ Build successful - String Catalog updated
❌ Build failed - Fix compilation errors first
⚠️  Build warnings - Review for localization impact

## String Catalog Analysis

### Critical Issues (Must Fix)
- **Hardcoded strings found**:
  - LoginView.swift:42: "Enter your password" → Use LocalizedStringKey("login.password.placeholder")
  - SettingsView.swift:15: "Settings" → Use LocalizedStringKey("settings.title")

- **Missing contextual comments**:
  - Key "button.save" needs context: "Save button in document editor toolbar"
  - Key "error.network" needs context: "Network connectivity error message for users"

### String Catalog Enhancements
- **Improved contextual descriptions**: 15 entries updated with translator-friendly context
- **Semantic key recommendations**:
  - "Welcome!" → "welcome.greeting.exclamation"
  - "Delete" → "action.delete.confirmation"
  - "5 items" → Use pluralization rules with .stringsdict

### Pluralization Analysis
- **Missing plural forms**:
  - "itemCount" needs .stringsdict for proper "1 item" vs "N items"
  - "dayCount" missing zero/one/other variations for German localization

- **Correct implementations**:
  - "notification.count" properly handles plural forms
  - "download.progress" uses count-aware string formatting

## Model Data Localization

### Core Data Models
- **User entity**: Display name needs localization for profile views
- **Project entity**: Status enumeration should use localized descriptions
- **Category entity**: Name attribute requires localization support

### Recommendations
- Add localized display name computed properties
- Implement NSLocalizedString for enum cases
- Consider localized entity descriptions for accessibility

## UI Component Analysis

### SwiftUI Views Compliance
✅ **Properly localized**:
- NavigationView titles using LocalizedStringKey
- Button labels with semantic keys
- Alert messages with contextual descriptions

⚠️ **Needs attention**:
- DatePicker format strings should use locale-aware formatting
- NumberFormatter lacking proper locale configuration
- Accessibility labels missing for custom UI elements

### Regional Formatter Validation
✅ **Correctly implemented**:
- DateFormatter with .current locale
- NumberFormatter with grouping separators
- RelativeDateTimeFormatter for time-sensitive content

❌ **Issues found**:
- Currency display hardcoded to "$" symbol
- Date format strings not respecting user preferences
- Measurement units not localized (miles vs kilometers)

## Constitutional Compliance Check

### Localizability from Day One ✅
- [x] All user-facing strings use LocalizedStringKey
- [x] String Catalog properly configured
- [x] No hardcoded UI text found
- [x] Semantic naming conventions followed
- [x] Translator context provided

### Platform-Appropriate Patterns ✅
- [x] iOS: String Catalog integration complete
- [x] SwiftUI: LocalizedStringKey usage consistent
- [x] Accessibility: VoiceOver labels localized
- [x] Dynamic Type: Works across languages

## Advanced Localization Readiness

### RTL Language Support
- **Layout adaptability**: SwiftUI automatic RTL support enabled
- **Text alignment**: Proper leading/trailing alignment usage
- **Icon mirroring**: System icons automatically mirror, custom icons need review

### Locale-Specific Considerations
- **Text expansion**: German translations may need 30-50% more space
- **Typography**: Font weight adjustments needed for CJK languages
- **Cultural appropriateness**: Color choices suitable for international markets

## Testing Infrastructure

### Pseudolocalization Setup
- **Recommendation**: Enable pseudolocalization in build settings
- **Purpose**: Test UI layout with expanded text before translation
- **Implementation**: Add "pseudo" locale for development testing

### Validation Checklist
- [ ] Test with iOS Simulator in different languages
- [ ] Verify Dynamic Type scaling in localized content
- [ ] Check VoiceOver pronunciation in target languages
- [ ] Validate date/number formatting in different regions
- [ ] Review UI layout with longer text (German, Finnish)
- [ ] Test RTL layout with Arabic/Hebrew simulators

## Recommendations Summary

### Immediate Actions (High Priority)
1. Replace hardcoded strings with LocalizedStringKey usage
2. Add contextual comments to String Catalog entries
3. Implement pluralization rules with .stringsdict files
4. Fix currency and date formatter locale configuration

### Short-term Improvements (Medium Priority)
1. Add localized Core Data model display properties
2. Enhance accessibility label localization
3. Set up pseudolocalization for layout testing
4. Review UI layouts for text expansion scenarios

### Long-term Considerations (Low Priority)
1. Plan for RTL language support if targeting international markets
2. Consider cultural color and symbol preferences
3. Evaluate translation memory integration for consistency
4. Set up automated localization testing in CI/CD pipeline

## TranslateKit Integration Notes
*If TranslateKit is available in project*

- **AI Translation**: Ready for TranslateKit automated translation
- **Quality Assurance**: Leverage TranslateKit proofreading features
- **Batch Processing**: String Catalog format compatible with TranslateKit workflows
- **Contextual Enhancement**: Rich context information supports better AI translations
```

## Validation Gates

### Pre-execution Validation
- [ ] Project builds successfully?
- [ ] String Catalog files present or creatable?
- [ ] Code files accessible for analysis?
- [ ] Build tools available (Xcode/swift build)?

### Post-analysis Validation  
- [ ] All hardcoded strings identified?
- [ ] String Catalog improvements documented?
- [ ] Regional formatters properly reviewed?
- [ ] Constitutional compliance verified?
- [ ] Actionable recommendations provided?

### Quality Assurance Gates
- [ ] Report includes specific file locations and line numbers?
- [ ] Recommendations are implementable and clear?
- [ ] Platform-specific patterns addressed?
- [ ] Accessibility localization considered?
- [ ] Testing guidance provided?

## Constitutional Principles Integration

**Localizability from Day One**: Every aspect of the audit enforces the constitutional principle that applications must be designed for international audiences from initial development, not as an afterthought.

**Accessibility-First Design**: Localization audit includes comprehensive review of VoiceOver labels, accessibility hints, and dynamic type support across languages.

**Platform-Appropriate UX**: Ensures localization follows iOS Human Interface Guidelines and macOS design principles for international user experiences.

**Code Maintainability**: Promotes semantic localization key naming and proper architectural patterns that make ongoing localization maintenance sustainable.

## Error Conditions

- **"Build failed"** → Project must compile before localization analysis
- **"String Catalog missing"** → Create .xcstrings file or configure localization
- **"No localizable content found"** → Verify SwiftUI LocalizedStringKey usage
- **"Formatter locale issues"** → Fix regional formatting configuration
- **"Constitutional violation"** → Address hardcoded strings blocking localizability

## Success Criteria

**Quality Gates Passed**: All validation gates completed successfully
**Constitutional Compliance**: Localizability from day one principle fully implemented
**Actionable Output**: Specific, implementable recommendations with file locations
**Testing Ready**: Comprehensive checklist for localization validation provided
**Platform Optimized**: iOS/macOS specific patterns correctly applied

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