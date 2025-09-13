# SwiftUI Development Guidelines

**Version**: 1.0.0  
**Effective**: 2025-01-26  
**Purpose**: High-level SwiftUI planning reference for AI assistants during UI development

## Overview

These guidelines provide strategic direction for SwiftUI development in ContextKit-managed projects. They focus on **what UI patterns to choose** during planning phases rather than detailed implementation.

**Prerequisites**: Read [Swift.md](Swift.md) first for language fundamentals.  
**For detailed UI validation**, see specialized subagents: `check-accessibility`, `check-localization`, `check-modern-code`.

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
- ❌ **Avoid**: `@StateObject`/`@ObservableObject` for new development

---

## Modern SwiftUI Patterns

### View Organization Preferences
- ✅ **`@ViewBuilder` properties**: For non-reusable view components
- ✅ **Inline computed properties**: When components used only within one parent
- ✅ **Separate View structs**: Only for truly reusable components across contexts
- ❌ **Avoid**: Creating separate views for single-use components

### Modern API Adoption
- ✅ **`@Previewable @State`**: For interactive previews (Xcode 16+)
- ✅ **`.rect()` shorthand**: For final shape calls over `RoundedRectangle()`
- ✅ **Built-in formatters**: `Text(value, format: .percent)` over manual formatting
- ✅ **Navigation Stack**: Over legacy `NavigationView` for iOS 16+

### Button and Interaction Patterns
- ✅ **Trailing closure syntax**: `Button { action } label: { Text("Title") }`
- ✅ **Text selection**: Enable for error messages and important content
- ✅ **Accessibility labels**: For all interactive elements
- ❌ **Avoid**: `action:` parameter style for buttons

---

## Color and Appearance Strategy

### Color System Preferences
- ✅ **SwiftUI system colors**: `.gray.opacity(0.1)` over UIKit wrapped colors
- ✅ **Semantic colors**: `.primary`, `.secondary`, `.accentColor`
- ✅ **Adaptive materials**: `.regularMaterial`, `.systemBackground`
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

### Error Display Strategy
- ✅ **User-friendly messages**: Never show technical errors directly
- ✅ **Selectable error text**: Enable copying for support purposes
- ✅ **Alert patterns**: Use `.alert()` for errors with retry options
- ✅ **ContentUnavailableView**: For empty states and error conditions

### Loading and Progress
- ✅ **ProgressView**: For loading states with descriptive labels
- ✅ **Accessibility labels**: "Loading user profile..." vs generic "Loading"
- ✅ **Graceful degradation**: Handle network failures and timeouts
- ✅ **State management**: Clear loading/success/error state transitions

---

## Localization and Accessibility

### Localization Strategy
- ✅ **Semantic keys**: `"user.profile.welcome.title"` over literal text
- ✅ **Built-in formatters**: Automatic locale-appropriate formatting
- ✅ **String Catalog integration**: For translation management
- ❌ **Avoid**: Hardcoded user-facing strings

### Accessibility Requirements
- ✅ **VoiceOver labels**: Descriptive labels for all interactive elements
- ✅ **Dynamic Type**: Support user text size preferences
- ✅ **Keyboard navigation**: Ensure all functionality accessible
- ✅ **High contrast**: Consider accessibility in color and contrast choices

---

## Quality Assurance Integration

### Automated Validation
Quality validation handled by specialized subagents:
- **`check-accessibility`**: VoiceOver, Dynamic Type, keyboard navigation
- **`check-localization`**: String externalization, formatter usage
- **`check-modern-code`**: Modern SwiftUI API adoption
- **`check-code-debt`**: Component extraction, code organization

### Development Gates
- ✅ **Constitutional compliance**: Accessibility, privacy, localization
- ✅ **Platform appropriateness**: HIG adherence, system integration
- ✅ **Performance validation**: No expensive operations in view body
- ✅ **Component reusability**: Universal design across platforms

---

## Decision Framework

When choosing SwiftUI patterns, prioritize in this order:

1. **Constitutional compliance** - Accessibility, localization, platform standards
2. **Modern SwiftUI patterns** - Latest APIs and best practices
3. **Universal design** - Works across iOS, macOS, visionOS
4. **User experience** - Clear, intuitive, platform-appropriate
5. **Performance** - Efficient rendering and state management
6. **Development speed** - Simple, maintainable solutions

---

## Integration with Swift Guidelines

### Language Pattern Integration
- Follow Swift.md for general language preferences (`Date.now`, switch expressions)
- Apply SwiftUI-specific patterns on top of Swift fundamentals
- Use modern Swift features within SwiftUI contexts

### Error Handling Integration
- Use typed throws from Swift guidelines in SwiftUI async operations
- Apply ErrorKit patterns for user-friendly error display
- Integrate error chains with SwiftUI alert and error state patterns

---

**Remember**: These guidelines inform UI planning decisions. For detailed validation of SwiftUI implementation patterns, rely on the specialized subagents during the development phase.