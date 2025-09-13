# Swift Development Guidelines
<!-- Template Version: 0 | ContextKit: 0.0.0 | Updated: 2025-01-26 -->

> [!WARNING]
> **👩‍💻 FOR DEVELOPERS**: Do not edit the content above the developer customization section - changes will be overwritten during ContextKit updates.
>
> For project-specific customizations, use the designated section at the bottom of this file.
>
> Found a bug or improvement for everyone? Please report it: https://github.com/FlineDev/ContextKit/issues

## Overview

These guidelines provide strategic direction for Swift development in ContextKit-managed projects. They focus on **what to choose** during planning phases rather than detailed implementation patterns.

---

## Modern API Preferences

### Temporal APIs
- ✅ **Prefer**: `Date.now` over `Date()`
- ✅ **Prefer**: `Duration` over `TimeInterval`
- ✅ **Prefer**: `ContinuousClock.now` for timing measurements

### Language Features
- ✅ **Prefer**: Switch expressions over switch statements
- ✅ **Prefer**: `if` expressions for conditional assignment
- ✅ **Prefer**: `replacing()` over `replacingOccurrences(of:with:)`
- ✅ **Prefer**: Modern collection algorithms over imperative loops

### Concurrency
- ✅ **Prefer**: `async/await` over completion handlers
- ✅ **Prefer**: Structured concurrency (`TaskGroup`, `async let`)
- ❌ **Avoid**: Manual thread management
- ❌ **Avoid**: Nested completion handler callbacks

---

## Architecture Preferences

### UI Framework Choice
- ✅ **SwiftUI first**: For new development and modern UI patterns
- ✅ **MVVM patterns**: With `@Observable` view models
- ❌ **Avoid**: UIKit except for specific platform requirements
- ❌ **Avoid**: UIViewRepresentable unless absolutely necessary

### Error Handling Strategy
- ✅ **Typed throws**: Use `throws(SpecificError)` for better error handling
- ✅ **ErrorKit patterns**: For user-friendly error messages and chains
- ✅ **Early returns**: Use `guard` statements for preconditions
- ❌ **Avoid**: Generic `Error` types when specific errors are known

---

## Framework and Package Preferences

### Import Strategy
- ✅ **Primary**: Always import `FlineDevKit` first in new files
- ✅ **Selective**: Only import additional frameworks when FlineDevKit insufficient

### Networking
- ✅ **Prefer**: `RESTClient` from HandySwift for REST APIs
- ✅ **Prefer**: `IntelligenceKit` for AI service integration (OpenAI, etc.)
- ❌ **Avoid**: Custom URLSession implementations
- ❌ **Avoid**: Manual JSON parsing when structured solutions exist

### Utilities
- ✅ **Prefer**: `AsyncState<String>` for async operation tracking
- ✅ **Prefer**: `Debouncer` for input throttling
- ✅ **Prefer**: `GregorianDay/GregorianTime` for date/time-only storage

### Testing Strategy
- ✅ **Minimal testing**: Only for complex algorithms with many edge cases
- ❌ **Avoid**: UI testing (unnecessary complexity)
- ❌ **Avoid**: Testing simple CRUD operations

---

## Code Style Essentials

### Formatting Standards
- **3-space indentation** (enforced by formatters)
- **Trailing commas** in multi-line collections
- **No header comments** or file-level documentation
- **No MARK sections** - use separate files instead

### Self Usage
- ✅ **Always use `self.`** for property access
- ✅ **Consistent pattern**: Makes property references explicit

### Naming Conventions
- ✅ **Descriptive names**: Clarity over brevity
- ✅ **Collection literals**: `var items: [Type] = []` over `Array<Type>()`
- ❌ **Avoid**: Redundant type information in method names

---

## Project Organization Patterns

### Directory Structure
```
App/
├── Sources/
│   ├── Models/        # Data models and core types
│   ├── Views/         # SwiftUI components
│   ├── Extensions/    # Type extensions (*Ext.swift)
│   └── Global/        # Shared utilities and constants
└── Resources/
    ├── Assets.xcassets       # Images, colors, app icons
    ├── Info.plist           # App configuration
    ├── PrivacyInfo.xcprivacy # Privacy manifest
    └── App.entitlements     # Capabilities and permissions
Tests/
└── Sources/
    ├── Models/        # Unit tests for data models
    ├── Extensions/    # Test extensions and utilities
    └── Global/        # Shared test utilities and helpers
```

### File Organization
- **One primary type per file** for substantial types (>10 lines)
- **Extensions in Extensions/ folder** with `TypeNameExt.swift` pattern
- **Related small types together** when closely coupled

### Build Configuration
- **Standard scheme**: `App` for all projects
- **Build command**: `xcodebuild -scheme App build -quiet`
- **Formatter sequence**: SwiftFormat first, then swift-format

---

## Quality Assurance Integration

### Automated Formatting
- **Dual formatters**: SwiftFormat (self insertion) + swift-format (general formatting)
- **Execution order**: SwiftFormat first, swift-format last
- **Required timing**: Before commits, after milestones, after successful builds

### Code Quality Gates
Quality validation is handled by specialized subagents:
- **`check-modern-code`**: Validates modern API usage
- **`check-accessibility`**: Ensures accessibility compliance
- **`check-localization`**: Verifies string externalization
- **`check-error-handling`**: Confirms ErrorKit patterns
- **`check-code-debt`**: Removes AI artifacts and cleans up code

---

## Constitutional Principles

All Swift development must support:

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
- Generation of localization string comments for context (in String Catalog)
- Regional formatting for dates, numbers, currencies
- String Catalog integration (auto-added by Xcode upon builds)

### Platform Appropriate
- Follow Human Interface Guidelines
- Use system conventions and patterns
- Integrate properly with platform features
- Optimize for target platform screen size & UX

### Maintainability
- Prevent overly lengthy functions and split logically
- Prefer self-explaining code naming & structure over comments
- Comment only complex logic / calculations explaining the WHY
- Keep it simple wherever possible, avoiding boilerplate code

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