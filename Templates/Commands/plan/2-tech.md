# Design Architecture
<!-- Template Version: 0 | ContextKit: 0.0.0 | Updated: 2025-09-13 -->

> [!WARNING]
> **👩‍💻 FOR DEVELOPERS**: Do not edit the content above the developer customization section - changes will be overwritten during ContextKit updates.
>
> For project-specific customizations, use the designated section at the bottom of this file.
>
> Found a bug or improvement for everyone? Please report it: https://github.com/FlineDev/ContextKit/issues

## Description
Generate technical architecture plan by detecting current feature, validating prerequisites, copying technical template, and executing template workflow with constitutional compliance validation.

## User Input Format

```
═══════════════════════════════════════════════════
║ ❓ USER INPUT REQUIRED - [Topic]
═══════════════════════════════════════════════════
║
║ [Question and context]
║
║ [Response instruction]
```

## Execution Flow (main)

### Phase 1: Setup Validation & Prerequisites

1. **Check Project Setup**
   - Use `Glob` tool to verify Context.md exists: `Glob . Context.md`
   - If Context.md missing:
     ```
     ❌ ContextKit not initialized in this project!

     Run /ctxk:proj:init first to setup ContextKit in this project.
     This command requires project context to detect tech stack and apply
     appropriate development guidelines.
     ```
     → END (exit with error)

2. **Verify ContextKit Global Installation**
   ```bash
   ls -la ~/.ContextKit/Templates/Features/Tech.md || echo "❌ ContextKit not installed globally. Run: curl -fsSL https://raw.githubusercontent.com/FlineDev/ContextKit/main/install.sh | sh"
   ```

### Phase 2: Feature Detection & Validation

3. **Detect Current Feature**
   - Use `Bash` tool to check current git branch: `git branch --show-current`
   - If on feature/[name] branch: Extract feature name from branch
   - If not on feature branch: Ask user which feature to work on using consistent format
   - Verify feature directory exists: `Glob Context/Features/[FeatureName] .`

4. **Validate Prerequisites**
   - Use `Read` tool to check Spec.md exists: `Read Context/Features/[FeatureName]/Spec.md`
   - If Spec.md missing:
     ```
     ❌ Feature specification not found!

     Run /ctxk:plan:1-spec first to create the business requirements.
     Technical planning requires completed specification as input.
     ```
     → END (exit with error)
   - Check for [NEEDS CLARIFICATION] markers in specification
   - If clarifications exist: WARN user to resolve them first

### Phase 3: Template Setup & Execution

5. **Copy Technical Template**
   ```bash
   cp ~/.ContextKit/Templates/Features/Tech.md Context/Features/[FeatureName]/Tech.md
   echo "✅ Copied technical architecture template"
   ```

6. **Execute Technical Template**
   - Use `Read` tool to read the copied Tech.md: `Read Context/Features/[FeatureName]/Tech.md`
   - Follow the **system instructions** section (boxed area) step by step
   - The template contains technical architecture generation logic and constitutional compliance
   - Use tools (`Read`, `Edit`) as directed by the template instructions
   - **Template execution**: The copied Tech.md handles all context reading, guidelines loading, architecture decisions, and validation
   - **Progress tracking**: User can see checkboxes being completed in the copied file

7. **Display Success Message** (see Success Messages section)

## Error Conditions

- **"Context.md not found"** → User must run `/ctxk:proj:init` to initialize ContextKit
- **"ContextKit not installed globally"** → Run installation: `curl -fsSL https://raw.githubusercontent.com/FlineDev/ContextKit/main/install.sh | sh`
- **"Feature specification not found"** → Must run `/ctxk:plan:1-spec` first
- **"Technical template not found"** → Check global ContextKit installation integrity
- **"Specification has unresolved clarifications"** → Resolve [NEEDS CLARIFICATION] markers in Spec.md first
- **"Template execution failed"** → Verify Tech.md template contains system instructions section

## Validation Gates

- ContextKit globally installed and accessible?
- Project Context.md exists (ContextKit project setup complete)?
- Feature specification exists and is complete?
- No unresolved [NEEDS CLARIFICATION] markers in specification?
- Technical template copied to feature directory successfully?
- Template system instructions executed successfully?
- System instructions section removed from final Tech.md?
- User informed to review and commit technical plan before proceeding?

## Integration Points

- **Global ContextKit**: Uses Templates/Features/Tech.md template for technical architecture generation
- **Project Setup**: Requires Context.md created by /ctxk:proj:init for project detection and context
- **Template Execution**: Delegates all technical logic to copied Tech.md template (follows init-workspace pattern)
- **Development Workflow**: Creates foundation for /ctxk:plan:3-steps implementation planning phase
- **Team Collaboration**: Creates committed technical plan for team review and development guidance
- **Git Integration**: Works within existing feature branch for systematic development workflow
- **Workspace Integration**: Template inherits coding standards and constitutional overrides from workspace Context.md

## Success Messages

### Technical Plan Created Successfully
```
🎉 Technical architecture plan created successfully!

✅ Created: Context/Features/[Name]/Tech.md
✅ Applied Context/Guidelines/Swift.md and SwiftUI.md standards
✅ All mandatory sections completed with architectural decisions

[If NEEDS CLARIFICATION items exist in tech plan:]
⚠️  Technical clarifications needed for:
• [Template will list specific technical questions that need answers]

🔗 Next Steps:
1. Review Context/Features/[Name]/Tech.md to ensure technical decisions are sound
2. [If clarifications needed:] Edit the tech file to resolve marked technical questions
3. When satisfied with the technical plan: commit your changes with git
4. Run /ctxk:plan:3-steps to proceed with implementation task breakdown

💡 Technical architecture ready for your review and approval before task planning!
```

## Platform-Specific Technical Guidance

### Swift Package
- **Architecture**: Protocol-oriented design, value types, clear module boundaries
- **Dependencies**: Minimal external dependencies, prefer standard library
- **Testing**: Comprehensive unit tests, Linux compatibility testing
- **Documentation**: DocC documentation with examples

### iOS App  
- **Architecture**: SwiftUI + SwiftData, MVVM where appropriate
- **Platform Integration**: CloudKit, HealthKit, App Store guidelines
- **Platform Standards**: Per Context/Guidelines/SwiftUI.md compliance requirements
- **Testing**: Unit tests + UI tests with accessibility testing

### macOS App
- **Architecture**: SwiftUI with AppKit integration where needed
- **Platform Integration**: Sandboxing considerations, system services
- **Platform Standards**: Per Context/Guidelines/SwiftUI.md macOS requirements
- **Testing**: Unit tests + integration tests for system interactions

════════════════════════════════════════════════════════════════════════════════
👩‍💻 DEVELOPER CUSTOMIZATIONS - EDITABLE SECTION
════════════════════════════════════════════════════════════════════════════════

This section is preserved during ContextKit migrations and updates.
Add project-specific instructions, examples, and overrides below.

## Project-Specific Instructions

<!-- Add any project-specific guidance for technical architecture planning here -->

## Additional Examples

<!-- Add examples of architectural patterns that work well with your project -->

## Override Behaviors

<!-- Document any project-specific architectural requirement overrides here -->