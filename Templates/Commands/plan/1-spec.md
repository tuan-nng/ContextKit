# Define Requirements
<!-- Template Version: 0 | ContextKit: 0.0.0 | Updated: 2025-01-26 -->

> [!WARNING]
> **👩‍💻 FOR DEVELOPERS**: Do not edit the content above the developer customization section - changes will be overwritten during ContextKit updates.
>
> For project-specific customizations, use the designated section at the bottom of this file.
>
> Found a bug or improvement for everyone? Please report it: https://github.com/FlineDev/ContextKit/issues

## Description
Create structured feature specification following spec-kit patterns with iOS/macOS constitutional principles

## Parameters
- `description` (required): Feature description from user

## Execution Flow (main)
1. Parse description from user input
   → If empty: ERROR "Feature description required"
2. Read project Context.md to understand project type and settings
   → If Context.md missing: ERROR "Run /setup first to initialize ContextKit"
   → Extract project type, workspace inheritance, constitutional principles
3. Load workspace context from Context.md hierarchy
   → Use workspace reference from project Context.md
   → Inherit coding standards and constitutional principles
4. Generate feature name from description
   → Convert to PascalCase (e.g., "user auth" → "UserAuthentication")  
   → If ambiguous: ASK user to confirm
5. Create feature directory structure
   → Context/Features/[FeatureName]/
   → Generate Spec.md, Tech.md, Steps.md placeholders
6. Create git branch
   → feature/[kebab-case-name] (e.g., "feature/user-authentication")
   → If git not available: WARN but continue
7. Fill specification template
   → Apply constitutional principles (accessibility, privacy, localizability, maintainability)
   → Include platform-specific patterns (iOS/macOS/universal)
   → Mark uncertainties with [NEEDS CLARIFICATION]
8. Run validation gates
   → Check completeness, testability, constitutional compliance
   → If validation fails: ERROR with specific guidance
9. Return: SUCCESS (spec ready for review)

## Context Sources
Read these files to understand project configuration dynamically:
- `Context.md` - Project type, workspace inheritance, constitutional principles
- Parent directory `Context.md` files - Workspace-specific overrides and standards
- `~/.ContextKit/ContextKit/Constitution.md` - Universal constitutional principles

## Validation Gates
- [ ] Feature description provided and clear?
- [ ] Project type detected or specified?
- [ ] Constitutional principles applied based on project type?
- [ ] All [NEEDS CLARIFICATION] items documented?
- [ ] Git branch created (if git available)?
- [ ] Accessibility requirements addressed (for UI features)?
- [ ] Privacy impact assessed (for data features)?
- [ ] Localization considerations included (for user-facing features)?

## Error Conditions
- "Feature description required" → User must provide description
- "Project type unclear" → User must specify project type  
- "Constitutional conflict" → User must resolve principle conflicts
- "Validation failed" → Specification must meet quality gates

## Constitutional Principles Integration
All specifications automatically include:
- **Accessibility-first design**: VoiceOver labels, color contrast, keyboard navigation for UI features
- **Privacy by design**: Data handling assessment, user consent patterns for data features
- **Localizability from day one**: String externalization, cultural considerations for user-facing features
- **Code maintainability**: Clear architecture, testability, documentation requirements

════════════════════════════════════════════════════════════════════════════════
👩‍💻 DEVELOPER CUSTOMIZATIONS - EDITABLE SECTION
════════════════════════════════════════════════════════════════════════════════

This section is preserved during ContextKit migrations and updates.
Add project-specific instructions, examples, and overrides below.

## Project-Specific Instructions

<!-- Add any project-specific guidance for feature specification creation here -->

## Additional Examples

<!-- Add examples of feature descriptions that work well with your project architecture -->

## Override Behaviors

<!-- Document any project-specific requirement overrides or special handling here -->