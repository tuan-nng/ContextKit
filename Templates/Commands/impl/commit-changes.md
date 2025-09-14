# Commit Changes
<!-- Template Version: 1 | ContextKit: 0.0.0 | Updated: 2025-09-14 -->

> [!WARNING]
> **👩‍💻 FOR DEVELOPERS**: Do not edit the content above the developer customization section - changes will be overwritten during ContextKit updates.
>
> For project-specific customizations, use the designated section at the bottom of this file.
>
> Found a bug or improvement for everyone? Please report it: https://github.com/FlineDev/ContextKit/issues

## Description
Analyze current git changes, apply code formatting, generate intelligent commit messages with proper format validation, and commit changes.

## Execution Flow (main)

### Phase 1: Project Context Assessment

1. **Read Project Context**
   - Use `Read` tool to examine `Context.md` file
   - Understand project structure (single repo, multi-repo, workspace layout)
   - Identify active components and current work areas
   - Note any special commit conventions or repository organization
   - If Context.md missing: WARN "No Context.md found - proceeding with basic git analysis"

2. **Analyze Conversation Context**
   - Review current chat conversation for work that was performed
   - Identify files that were modified, created, or discussed
   - Understand the purpose and scope of recent changes
   - Focus commit scope on actual work performed in this session

### Phase 2: Git Status Assessment

3. **Check Repository Status**
   ```bash
   git status --porcelain
   ```
   - If no changes: ERROR "No changes to commit"
   - If not in git repository: ERROR "Not in a git repository"
   - If merge conflicts exist: ERROR "Resolve merge conflicts first"

4. **Analyze Current Changes Overview**
   ```bash
   git diff --name-only
   git diff --staged --name-only
   ```
   - Identify modified, added, and deleted files
   - Cross-reference with conversation context to understand change purpose
   - Detect file types and affected components
   - Identify which repositories are affected (for multi-repo projects)

### Phase 3: Detailed Change Analysis

5. **Launch Change Analysis Tasks** (parallel execution)
   - **Single Repository**: Use `Task` tool with general-purpose agent
     - Prompt: "Analyze the complete git diff output and provide a semantic summary of changes. Include: 1) What was changed (functions, classes, configs, etc.), 2) Why these changes were made (purpose/intent), 3) Technical scope (refactoring, new features, fixes, etc.), 4) Impact assessment. Focus on semantic meaning, not line-by-line details. Git diff: [FULL_DIFF_OUTPUT]"

   - **Multiple Repositories** (if Context.md shows multi-repo structure): Launch parallel tasks
     - For each affected repository: Launch separate `Task` with general-purpose agent
     - Repository-specific prompt: "Analyze git diff for [REPO_NAME] component and provide semantic summary focusing on this component's changes. Include purpose, technical scope, and component-specific impact. Git diff for [REPO_NAME]: [REPO_SPECIFIC_DIFF]"
     - Wait for all repository analysis tasks to complete before proceeding

   - **Consolidate Analysis Results**
     - Combine individual repository analyses (if multiple)
     - Create unified understanding of overall change impact
     - Identify primary change theme (bug fix, feature, refactor, etc.)

### Phase 4: Code Formatting (if applicable)

6. **Apply Code Formatting** (conditional)
   ```bash
   # Swift formatting (if configs exist)
   test -f .swiftformat && swiftformat . --config .swiftformat
   test -f .swift-format && swift-format --in-place --recursive Sources/
   ```
   - Apply additional formatters from Context.md if specified

### Phase 5: Build Verification

7. **Verify Code Builds** (using build-project agent)
   - Use `Task` tool to launch `build-project` agent
   - If build fails: present errors to user and ask whether to proceed

### Phase 6: Intelligent Commit Message Generation

8. **Generate Commit Message from Analysis**
   - Use detailed change analysis results from Phase 3
   - Combine semantic understanding with technical scope assessment
   - Consider project structure (single/multi-repo) and component affected
   - Follow pattern: `[Action] [what] [+ context if needed]`
   - Ensure 50 character limit, imperative mood, capitalized, no period
   - **CRITICAL**: Never add AI attribution, Co-Authored-By, or emoji

9. **Message Generation Logic**
   **Context-Driven Actions:**
   - **Bug fixes**: "Fix [specific issue]"
   - **Feature addition**: "Add [feature name]"
   - **Refactoring**: "Improve [area]" or "Refactor [component]"
   - **Configuration**: "Configure [tool/setting]"
   - **Documentation**: "Document [area]"
   - **Performance**: "Optimize [component]"
   - **Testing**: "Add tests for [feature]"
   - **Dependencies**: "Update dependencies" or "Add [package] dependency"
   - **Cleanup**: "Clean up [area]" or "Remove unused [items]"
   - **Migration**: "Migrate [from X to Y]"

   **File-Based Fallbacks:**
   - **New files**: "Add [description based on purpose]"
   - **Modified files**: "Update [component]"
   - **Deleted files**: "Remove [description]"

### Phase 7: Staging and Commit

10. **Stage Changes**
    ```bash
    git add .
    ```

11. **Execute Commit**
    ```bash
    git commit -m "[GENERATED_MESSAGE_HERE]"
    ```
    - **CRITICAL**: Single-line format only, no AI attribution

### Phase 8: Post-Commit Verification

12. **Verify Commit Success and Format**
    ```bash
    git log -1 --format="%s%n%b"
    ```
    - **CRITICAL**: Check single line with no body, no AI attribution
    - If violations found: Use `git commit --amend -m "[CLEAN_MESSAGE]"` to fix

13. **Report Status**
    - Show final commit hash and message
    - Display files committed
    - Summary of change analysis results used

## Code Formatting Pipeline
*Applied conditionally based on file types and config availability*

### Swift Formatting (if .swiftformat and .swift-format exist)
```bash
# 1. SwiftFormat first (structure and self. enforcement)
swiftformat . --config .swiftformat

# 2. swift-format second (Apple style and line breaks)
swift-format --in-place --recursive Sources/
```

### Other Language Support
- **JavaScript/TypeScript**: ESLint, Prettier (if configs exist)
- **Python**: Black, isort (if configs exist)
- **Other**: Check Context.md for project-specific formatters

## Commit Message Generation Rules

### Format Requirements
- **Length**: 50 characters maximum (extend to 72 only if absolutely necessary)
- **Style**: Imperative mood ("Add feature" not "Added feature")
- **Capitalization**: First word capitalized
- **Punctuation**: No period at end
- **Single Line**: Never use multi-line commits or body paragraphs
- **Content**: Focus on functionality, never mention formatting
- **AI Attribution**: **ABSOLUTELY FORBIDDEN** - no AI mentions, Claude references, or co-authorship anywhere

### Action Verbs
- **Add**: New functionality, files, or features
- **Fix**: Bug fixes and error corrections
- **Update**: Modifications to existing functionality
- **Remove**: Deletion of code, files, or features
- **Improve**: Performance, readability, or architectural enhancements
- **Rename**: File or function name changes
- **Merge**: Branch merging (typically automated)

### Example Messages
```bash
# Good examples
"Add user authentication with biometric support"
"Fix memory leak in image caching system"
"Update privacy manifest for location services"
"Remove deprecated networking layer"
"Improve error handling in data persistence"

# Bad examples (avoid)
"Added user authentication"           # Wrong tense
"fix memory leak"                     # Not capitalized
"Update formatting and add feature"   # Mentions formatting
"🤖 Add feature with Claude Code"     # AI attribution (FORBIDDEN)
"Add feature

Co-Authored-By: Claude"               # Multi-line with AI attribution (FORBIDDEN)
```

## Validation Gates

**Pre-Commit Validation:**
- [ ] Git repository in valid state (no conflicts)?
- [ ] Changes detected and analyzed?
- [ ] Code formatting applied successfully (if applicable)?
- [ ] Generated commit message follows proper format (50 chars, imperative, capitalized, no period)?
- [ ] No AI attribution, emoji, or multi-line format in commit message?

**Post-Commit Validation:**
- [ ] Commit created successfully?
- [ ] Commit message is single line with no body?
- [ ] No AI attribution, Claude mentions, or co-authorship in commit?
- [ ] All intended files included in commit?

## Error Conditions

- **"Not in git repository"** → Must be run from within a git repository
- **"No changes to commit"** → Stage changes first or modify files
- **"Merge conflicts detected"** → Resolve conflicts with `git status` and fix conflicted files
- **"Build failed after formatting"** → Fix compilation errors or skip build check
- **"Commit message too long"** → Shorten message to 50 characters (72 max)
- **"Invalid commit format"** → Follow imperative mood, capitalization, and single-line requirements
- **"Formatter config missing"** → Formatters skipped, continuing with commit
- **"Permission denied"** → Check repository write permissions

════════════════════════════════════════════════════════════════════════════════
👩‍💻 DEVELOPER CUSTOMIZATIONS - EDITABLE SECTION
════════════════════════════════════════════════════════════════════════════════

This section is preserved during ContextKit migrations and updates.
Add project-specific instructions, examples, and overrides below.

## Project-Specific Formatters
<!-- Add additional formatting commands (ESLint, Prettier, Black, etc.) -->

## Custom Commit Message Patterns
<!-- Add project-specific patterns (ticket references, conventions) -->

## Build Verification Overrides
<!-- Document custom build commands or skip conditions -->

## Staging Behavior Modifications
<!-- Document project-specific staging rules -->