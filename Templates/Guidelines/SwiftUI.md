# SwiftUI Development Guidelines
<!-- Template Version: 5 | ContextKit: 0.0.0 | Updated: 2025-09-16 -->

> [!WARNING]
> **👩‍💻 FOR DEVELOPERS**: Do not edit the content above the developer customization section - changes will be overwritten during ContextKit updates.
>
> For project-specific customizations, use the designated section at the bottom of this file.
>
> Found a bug or improvement for everyone? Please report it: https://github.com/FlineDev/ContextKit/issues


## Overview

These guidelines provide strategic direction for SwiftUI development in ContextKit-managed projects. They focus on **what UI patterns to choose** during planning phases rather than detailed implementation.

---

## UI Framework Strategy

### SwiftUI First Approach
- ✅ **SwiftUI over UIKit**: For all new development and modern UI patterns
- ✅ **Plain SwiftUI**: Avoid complex architecture patterns, keep apps simple
- ✅ **Native Components**: Use system components over custom implementations
- ❌ **Avoid**: UIKit except for specific platform requirements
- ❌ **Avoid**: Complex MVVM or architectural patterns

### State Management Strategy
- ✅ **`@Observable`**: For view state management (iOS 17+)
- ✅ **`@State`**: For local view state (toggles, text input, selection)
- ✅ **SwiftData**: For persistence with automatic UI updates
- ✅ **Environment**: For dependency injection and app-wide services
- ✅ **`@Entry`**: For custom environment values without boilerplate (Xcode 16+)
- ❌ **Avoid**: `@StateObject`/`@ObservableObject` for new development

---

## Modern SwiftUI Patterns

### View Organization Preferences
- ✅ **`@ViewBuilder` properties**: For non-reusable view components
- ✅ **In-type computed/functions properties**: When components used only within one parent
- ✅ **Separate View structs**: Only for truly reusable components across contexts
- ❌ **Avoid**: Creating separate views for single-use components

### Modern API Adoption
- ✅ **`#Preview`**: Use `#Preview` macro over `PreviewProvider` (Xcode 15+)
- ✅ **`@Previewable @State`**: For interactive previews (Xcode 16+)
- ✅ **`.rect()` shorthand**: For final shape calls over `RoundedRectangle()`
- ✅ **Built-in formatters**: `Text(value, format: .percent)` over manual formatting
- ✅ **Navigation Stack**: Over legacy `NavigationView` for iOS 16+

### Button and Interaction Patterns
- ✅ **Trailing closure syntax**: `Button { action } label: { CustomView() }`
- ✅ **Built-in initializers**: `Button("Save", systemImage: "checkmark") { }` over `Button { } label: { Label("Save", systemImage: "checkmark") }`
- ✅ **Text selection**: Enable for error messages and important content
- ✅ **Accessibility labels**: For all interactive elements
- ❌ **Avoid**: `action:` parameter style for buttons

---

## Color and Appearance Strategy

### Color System Preferences
- ✅ **SwiftUI system colors**: `.gray.opacity(0.1)` over UIKit wrapped colors
- ✅ **Semantic colors**: `.primary`, `.secondary`, `.accentColor`
- ✅ **Asset Catalog colors**: Add custom colors to Assets.xcassets, reference via generated symbols
- ✅ **Adaptive materials**: `.regularMaterial`, `.ultraThinMaterial`
- ❌ **Avoid**: `Color(.secondarySystemGroupedBackground)` and UIKit color wrapping

### Dark Mode and Accessibility
- ✅ **Automatic adaptation**: Use semantic colors that adapt to appearance
- ✅ **Dynamic Type support**: All text should scale with user preferences
- ✅ **High contrast**: Consider accessibility requirements in color choices
- ✅ **Platform conventions**: Follow HIG for color usage patterns

---

## Navigation Preferences

### Modern Navigation Patterns
- ✅ **NavigationStack**: For hierarchical navigation (iOS 16+)
- ✅ **NavigationSplitView**: For macOS and iPad split interfaces
- ✅ **Modal presentation**: `.sheet()` and `.fullScreenCover()` appropriately
- ❌ **Avoid**: Legacy `NavigationView` for new development

### Platform-Specific Navigation
- ✅ **iOS**: Stack-based navigation with clear hierarchy
- ✅ **macOS**: Split view with sidebar, content, and detail panes
- ✅ **Cross-platform**: Design for abundant horizontal space first

---

## Layout and Performance Strategy

### Layout Preferences
- ✅ **Frame alignment**: `.frame(maxHeight: .infinity, alignment: .bottom)`
- ✅ **Lazy loading**: `LazyVStack`/`LazyHStack` for large datasets
- ✅ **Composition**: Break complex views into focused components
- ❌ **Avoid**: `VStack + Spacer` when frame alignment is clearer

### Performance Considerations
- ✅ **Constants over functions**: `let cornerRadius: CGFloat = 12`
- ✅ **Multiplier constants**: For simple mathematical relationships
- ✅ **Extract expensive computations**: From view body calculations
- ❌ **Avoid**: Complex calculations directly in view builders

---

## Framework and Package Preferences

### FlineDev Ecosystem for SwiftUI
FlineDev frameworks provide SwiftUI-specific tools (find all at https://github.com/FlineDev):

**Auto-imported via `FlineDevKit`:**
- **`HandySwiftUI`**: SwiftUI tools for async states, UI components, styles, and common patterns
- **`TranslateKitSDK`**: 2000+ pre-localized common UI strings via TK.Action, TK.Label, TK.Message, etc.
- **`FreemiumKit`**: In-app purchases with native paywalls and subscription management

### HandySwiftUI Utilities

**New Types:**
- ✅ **Prefer**: `AsyncState<Error>` for async operation tracking with loading/success/failure states
- ✅ **Prefer**: `Platform.value()` for platform-specific values (iOS vs macOS vs visionOS)
- ✅ **Prefer**: `VPicker`/`HPicker` for vertical/horizontal picker layouts with custom styling
- ✅ **Prefer**: `Emoji` for type-safe emoji handling and random emoji generation

**View Modifiers:**
- ✅ **Prefer**: `.onFirstAppear { }` for one-time setup actions vs repeated onAppear calls

**Styles:**
- ✅ **Prefer**: `.primary()` and `.secondary()` button styles for consistent UI (HandySwiftUI)
- ✅ **Prefer**: `.checkboxUniversal` toggle style for cross-platform checkbox behavior (HandySwiftUI)
- ✅ **Prefer**: `.vertical()` labeled content style for form layouts (HandySwiftUI)

### Common UI Strings
- ✅ **Prefer**: `Button(TK.Action.save) { }` for common actions (TranslateKitSDK)
- ✅ **Prefer**: `Text(TK.Label.settings)` for common labels (TranslateKitSDK)

---

## Xcode Project Management

### Target and Project Configuration
- ✅ **Manual target creation**: Guide developers to create new targets manually through Xcode UI
- ✅ **Simple modifications**: Allow automated changes to Info.plist entries and known entitlements
- ✅ **Build settings**: Allow automated updates to straightforward build configuration settings
- ❌ **Avoid**: Direct .xcodeproj file editing for complex structural changes (targets, schemes, groups)
- ❌ **Avoid**: Automated target dependency management through project file modification

### Manual User Action Protocol
When Xcode UI actions are required, use the standardized user instruction format:
```
═══════════════════════════════════════════════════
║ 🎯 MANUAL XCODE ACTION REQUIRED
═══════════════════════════════════════════════════
║
║ [Clear step-by-step instructions for Xcode UI]
║ [Specific menu paths and button clicks]
║
║ Reply "Done" when completed to continue.
```

**Planning Integration**: Include manual Xcode actions as explicit steps in `Steps.md` implementation planning with clear user action markers.

### AI Testing Capabilities & Limitations

**What AI can validate automatically:**
- ✅ **Build validation**: Compile code, resolve build errors, check dependencies
- ✅ **Unit/integration tests**: Execute automated test suites and analyze results
- ✅ **Static code analysis**: Use ContextKit agents for pattern validation, accessibility code checks
- ✅ **File modifications**: Update Info.plist, privacy manifests, String Catalogs
- ✅ **Code quality**: ErrorKit patterns, modern API usage, architectural compliance

**What requires manual user testing:**
- 🧪 **Running app interactions**: Any task involving launching and using the actual app
- 🧪 **User experience validation**: Navigation flows, visual design, interaction feedback
- 🧪 **Device-specific testing**: Restart behavior, network conditions, multi-device scenarios
- 🧪 **All accessibility verification**: VoiceOver navigation, Dynamic Type scaling, contrast testing, real accessibility usage
- 🧪 **Performance validation**: Animation smoothness, memory usage, battery impact under real usage
- 🧪 **Integration testing**: Third-party services, in-app purchases, platform-specific features

**Implementation in Steps.md:**
- **Phase 5**: Automated integration (AI executes builds, tests, agents)
- **Phase 6**: Manual user testing (structured instructions with standardized response format)
- **Phase 7**: Release preparation (mix of automated file updates and manual external processes)

---

## Component Architecture

### Reusability Strategy
- ✅ **Universal components**: Work across iOS, macOS, and visionOS
- ✅ **ViewModifier patterns**: For consistent styling across components
- ✅ **Environment injection**: For shared services and configuration
- ✅ **Generic design**: Components that adapt to different contexts

### Component Hierarchy
- ✅ **Atomic components**: Small, focused, single-purpose
- ✅ **Composite views**: Combine atomic components meaningfully
- ✅ **Screen-level views**: Coordinate multiple composite views
- ❌ **Avoid**: Monolithic views mixing multiple concerns

---

## Development Philosophy

### Value-First Development
- ✅ **Core value first**: Build the minimal workflow that solves user problems
- ✅ **Risk-first milestones**: Tackle hardest, most uncertain parts first
- ✅ **Alpha-ready mindset**: Focus on complete, testable workflows quickly
- ❌ **Avoid**: Building infrastructure before proving core value

### Platform Priority Strategy
- ✅ **Primary platforms**: macOS, visionOS, iPadOS (abundant horizontal space)
- ✅ **Secondary platforms**: iPhone (optimize larger screens first, then adapt)
- ✅ **Horizontal-first design**: Utilize space effectively, minimize vertical stacking
- ✅ **Multi-platform from day 1**: Build components to work everywhere

### Implementation Approach
- ✅ **Universal component strategy**: Reusable across multiple contexts
- ✅ **Single concern milestones**: Each milestone focuses on one primary challenge
- ✅ **Validation-driven complexity**: Simple first, layer complexity iteratively
- ❌ **Avoid**: Screen-specific or feature-specific components early

---

## Error Handling and User Feedback

### ErrorKit Integration
- ✅ **User-friendly messages**: Use `ErrorKit.userFriendlyMessage(for: error)` for both system and custom errors
- ✅ **String interpolation**: Use `"Save failed: \(error)"` - automatic ErrorKit enhancement
- ✅ **Throwable errors**: Custom error types should conform to `Throwable` protocol
- ✅ **Typed throws**: Use `throws(SpecificError)` with `Catching` protocol for error nesting

### User Feedback Collection
- ✅ **Feedback buttons**: Use `.mailComposer()` modifier with `ErrorKit.logAttachment()`
- ✅ **Automatic log collection**: Include system logs from last 10-30 minutes for context
- ✅ **Device context**: Include device model, iOS version, and app version in reports
- ✅ **Structured logging**: Use `Logger()` instead of `print()` for proper log collection

---

## Testing Strategy

### UI Testing Approach
- ✅ **Swift Testing**: Use Swift Testing framework (`@Test`, `#expect`) over XCTest for new unit tests
- ❌ **Avoid**: UI testing (unnecessary complexity and maintenance overhead)
- ❌ **Avoid**: Testing SwiftUI view hierarchies directly

### Focus Areas
- ✅ **Test ViewModels**: Business logic and state management
- ✅ **Test data transformations**: Model conversions and formatting logic
- ✅ **Test validation logic**: Input validation and error states

---

## Constitutional Principles

All SwiftUI development must support:

### Accessibility First
- Dynamic Type support in all UI text
- Semantic colors that adapt to system appearance
- VoiceOver labels and hints for interactive elements
- Keyboard navigation support

### Privacy by Design  
- Minimal data collection with explicit purpose
- Secure storage patterns (Keychain for sensitive data)
- Privacy manifest updates when needed
- No tracking and privacy-preserving analytics

### Localization Ready
- No hardcoded user-facing strings in model layer
- Use TranslateKitSDK for common UI strings: `TK.Action.save`, `TK.Label.settings`
- Generation of localization string comments for context (in String Catalog)
- Regional formatting for dates, numbers, currencies
- String Catalog integration (auto-added by Xcode upon builds)

### Platform Appropriate
- Follow Human Interface Guidelines
- Use system conventions and patterns
- Integrate properly with platform features
- Optimize for target platform screen size & UX

### Maintainability
- Prevent overly lengthy functions/views and split logically
- Prefer self-explaining code/components naming & structure over comments
- Comment only complex logic / calculations explaining the WHY
- Keep it simple wherever possible, avoiding boilerplate code

---

## Trusted Research Sources

### Apple Official Domains
- **developer.apple.com** - SwiftUI framework docs, tutorials, HIG, design resources, accessibility guidelines
- **SF Symbols, sample code, platform-specific guidelines, performance documentation**

### Community-Trusted Domains
- **wwdcnotes.com** - Community WWDC session summaries, especially SwiftUI-focused content
- **swiftui-lab.com** - Advanced SwiftUI techniques, performance insights, and deep technical analysis
- **hackingwithswift.com** - Practical SwiftUI tutorials, project-based learning, quick reference guides
- **avanderlee.com** - SwiftUI debugging, performance optimization, and practical development insights
- **swiftbysundell.com** - SwiftUI architecture patterns, best practices, and modern development approaches
- **swiftwithmajid.com** - SwiftUI development insights and comprehensive WWDC coverage
- **fatbobman.com** - SwiftUI and SwiftData technical analysis with detailed WWDC breakdowns
- **swiftwithvincent.com** - SwiftUI tutorials and developer-focused WWDC highlights
- **donnywals.com** - Practical SwiftUI guides and Apple platform development insights
- **kodeco.com** - Comprehensive SwiftUI tutorials and educational content
- **elkraneo.com** - SwiftUI development resources and WWDC session insights
- **natasharobot.com** - SwiftUI community perspectives and development experiences

### Indie Developer Perspectives
- **fline.dev** - Independent SwiftUI developer insights and real-world implementation experiences
- **Other established indie blogs** - Look for consistent SwiftUI content with practical examples

### Research Best Practices
- **Official First**: Start with developer.apple.com for authoritative guidance
- **Dual Search Strategy**: Use both WebSearch AND iosfeeds.com/archive search for SwiftUI community articles
- **iosfeeds.com Usage**: Search iosfeeds.com/archive?query=SwiftUI to find recent blog posts across the iOS community
- **Community Validation**: Cross-reference patterns across multiple trusted SwiftUI sources
- **Platform Considerations**: Check multiple sources for iOS/macOS/visionOS specific guidance
- **Domain-Limited Searches**: Use `site:wwdcnotes.com SwiftUI` for WWDC-specific content
- **WWDC Coverage**: Look for WWDC-specific SwiftUI coverage on active community blogs for latest API insights

---

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