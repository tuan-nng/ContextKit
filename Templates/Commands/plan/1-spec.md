# Create Feature Specification
<!-- Template Version: 3 | ContextKit: 0.0.0 | Updated: 2025-09-14 -->

> [!WARNING]
> **👩‍💻 FOR DEVELOPERS**: Do not edit the content above the developer customization section - changes will be overwritten during ContextKit updates.
>
> For project-specific customizations, use the designated section at the bottom of this file.
>
> Found a bug or improvement for everyone? Please report it: https://github.com/FlineDev/ContextKit/issues

## Description
Initialize feature specification by validating setup, confirming feature naming, copying specification template, and executing template workflow with progress tracking.

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
     appropriate constitutional principles.
     ```
     → END (exit with error)

2. **Verify ContextKit Global Installation**
   ```bash
   ls -la ~/.ContextKit/Templates/Features/Spec.md || echo "❌ ContextKit not installed globally. Run: curl -fsSL https://raw.githubusercontent.com/FlineDev/ContextKit/main/install.sh | sh"
   ```

### Phase 2: Interactive Feature Definition & Naming

3. **Check Git Status**
   ```bash
   git status --porcelain || echo "⚠️ Git not available - continuing without version control"
   ```
   - If uncommitted changes exist:
     ```
     ⚠️  Uncommitted changes detected!

     You have uncommitted changes in your working directory.
     It's recommended to commit these changes before creating a new feature branch.

     Run: git add . && git commit -m "Your commit message"

     Continue anyway? (y/N):
     ```
     - Wait for user confirmation
     - If "N" or no response: EXIT (recommend committing first)
     - If "y": Continue with warning logged

4. **Get Feature or App Description from User**
   - Ask user for feature/app description using consistent format (see User Input Format section)
   - Wait for user input
   - Store description for naming and generation
   - Continue with description-based processing

5. **Generate Names**
   - Parse user description for key concepts
   - Create PascalCase name (e.g., "user authentication" → "UserAuthentication", "recipe app" → "RecipeApp")
   - Create kebab-case branch name (e.g., "feature/user-authentication", "feature/recipe-app")
   - Focus on user value, not implementation details

6. **Interactive Name Confirmation**
   - Ask user for name confirmation using consistent format (see User Input Format section)
   - Wait for user confirmation or alternative description
   - If alternative provided: regenerate names and ask again
   - Continue only after user approval

### Phase 3: Template Setup & Execution

7. **Create Feature Workspace**
   ```bash
   mkdir -p Context/Features/[ConfirmedFeatureName]
   echo "✅ Created feature directory"
   ```

6. **Copy Feature Template**
   ```bash
   cp ~/.ContextKit/Templates/Features/Spec.md Context/Features/[FeatureName]/Spec.md
   touch Context/Features/[FeatureName]/Tech.md
   touch Context/Features/[FeatureName]/Steps.md
   echo "✅ Copied specification template with placeholders for next phases"
   ```

7. **Create Git Branch**
   ```bash
   git checkout -b feature/[kebab-case-name] || echo "⚠️ Git branch creation failed - continuing without branch"
   echo "✅ Created git branch: feature/[kebab-case-name]"
   ```

10. **Execute Specification Template**
    - Use `Read` tool to read the copied Spec.md: `Read Context/Features/[FeatureName]/Spec.md`
    - Follow the **system instructions** section (boxed area) step by step
    - The template contains specification generation logic and progress tracking
    - Use tools (`Read`, `Edit`) as directed by the template instructions
    - **Template execution**: The copied Spec.md handles all context reading, guidelines loading, constitutional validation, and content generation
    - **Progress tracking**: User can see checkboxes being completed in the copied file

11. **Display Success Message** (see Success Messages section)

## Error Conditions

- **"Context.md not found"** → User must run `/ctxk:proj:init` to initialize ContextKit
- **"ContextKit not installed globally"** → Run installation: `curl -fsSL https://raw.githubusercontent.com/FlineDev/ContextKit/main/install.sh | sh`
- **"Feature template not found"** → Check global ContextKit installation integrity
- **"Directory creation failed"** → Check permissions and disk space
- **"Template copy failed"** → Check file permissions and ContextKit installation
- **"Template execution failed"** → Verify Spec.md template contains system instructions section

## Validation Gates

- ContextKit globally installed and accessible?
- Project Context.md exists (ContextKit project setup complete)?
- User confirmation obtained for feature naming?
- Feature workspace directory created successfully?
- Specification template copied to feature directory?
- Template system instructions executed successfully?
- System instructions section removed from final Spec.md?
- User informed to review and commit specification before proceeding?

## Integration Points

- **Global ContextKit**: Uses Templates/Features/Spec.md template for specification generation
- **Project Setup**: Requires Context.md created by /ctxk:proj:init for project detection and context
- **Template Execution**: Delegates all specification logic to copied Spec.md template (follows init-workspace pattern)
- **Development Workflow**: Creates foundation for /ctxk:plan:2-tech technical planning phase
- **Team Collaboration**: Creates committed specification for team review and stakeholder validation
- **Git Integration**: Establishes feature branch for systematic development workflow
- **Workspace Integration**: Template inherits coding standards and constitutional overrides from workspace Context.md

## Success Messages

### Specification Created Successfully
```
🎉 Specification created successfully!

✅ Created: Context/Features/[Name]/Spec.md
✅ Git branch: feature/[branch-name]
✅ Applied constitutional principles from project guidelines
✅ All mandatory sections completed with project-specific content

[If NEEDS CLARIFICATION items exist in spec:]
⚠️  Clarification needed for:
• [Template will list specific questions that need user answers]

🔗 Next Steps:
1. Review Context/Features/[Name]/Spec.md to ensure it matches your intent
2. [If clarifications needed:] Edit the spec file to answer marked questions
3. When satisfied with the spec: commit your changes with git
4. Run /ctxk:plan:2-tech to proceed with technical architecture planning

💡 Specification ready for your review and approval before technical planning!
```

════════════════════════════════════════════════════════════════════════════════
👩‍💻 DEVELOPER CUSTOMIZATIONS - EDITABLE SECTION
════════════════════════════════════════════════════════════════════════════════

This section is preserved during ContextKit migrations and updates.
Add project-specific instructions, examples, and overrides below.

## Custom Feature Examples
<!-- Add examples of feature/app descriptions that work well with your project type -->

## Naming Overrides
<!-- Document project-specific naming conventions or automatic name generation rules -->

## Validation Rules
<!-- Add extra specification validation steps or quality gates specific to your project -->