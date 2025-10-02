# Release NPM Package
<!-- Template Version: 4 | ContextKit: 0.2.0 | Updated: 2025-10-02 -->

> [!WARNING]
> **👩‍💻 FOR DEVELOPERS**: Do not edit the content above the developer customization section - changes will be overwritten during ContextKit updates.
>
> For project-specific customizations, use the designated section at the bottom of this file.
>
> Found a bug or improvement for everyone? Please report it: https://github.com/FlineDev/ContextKit/issues

## Description
Execute NPM package release workflow with version management, release notes generation, and GitHub integration.

## Parameters
**Usage**: `@ctxk:impl:release-package [version]`
- `version` (optional): Specific version like "1.2.0" or "major"/"minor"/"patch" for semantic bumping

## Execution Flow (main)

### Phase 0: Check Customization

0. **Read the "👩‍💻 DEVELOPER CUSTOMIZATIONS" section**
   - Use `Grep` tool to find the start of the section
   - Read everything below that line contained in this document til the end of the file
   - Make sure to consider what was said there with high priority
   - If anything conflicts with the rest of the workflow, prioritize the "developer customizations"

### Phase 1: Prerequisites Validation

1. **Verify NPM Package Project**
   ```bash
   ls package.json || echo "❌ Not an NPM package project"
   ```
   - If package.json not found: ERROR "This command is for NPM packages. package.json is required."

2. **Check Git Repository Status**
   ```bash
   git status --porcelain
   ```
   - If uncommitted changes exist: ERROR "Uncommitted changes detected. Commit all changes before release."
   - If not in git repository: ERROR "Git repository required for package releases."

3. **Validate Package Builds and Tests**
   - Check if build script exists in package.json
   - Run build command from Context.md if available
   - Run test command: `npm test` or equivalent from Context.md
   - If build fails: ERROR "Package must build successfully before release."
   - If tests fail: ERROR "All tests must pass before release."

4. **Check NPM Authentication**
   ```bash
   npm whoami || echo "❌ Not logged in to NPM"
   ```
   - If not authenticated: ERROR "Run 'npm login' to authenticate with NPM registry."

5. **Check GitHub CLI Access (Optional)**
   ```bash
   gh auth status || echo "⚠️  GitHub CLI not authenticated (optional for release notes)"
   ```
   - If not authenticated: WARN "GitHub CLI authentication recommended for automated release notes."

### Phase 2: Version Management

5. **Extract Package Information**
   - Use `Read` tool to read package.json: `Read package.json`
   - Parse package name from `name` field
   - Parse current version from `version` field
   - Determine repository URL from git remote: `git remote get-url origin`

6. **Determine Current Version and Get User Input**
   - Current version from package.json
   - Latest git tag: `git tag --list --sort=-version:refname | head -1`
   - If versions don't match: WARN "package.json version differs from latest git tag"

7. **Comprehensive Change Analysis Since Last Release**
   **Step 7a: Commit Message Analysis**
   ```bash
   git log [LAST_TAG]..HEAD --oneline
   ```
   - Count commits since last release
   - Look for conventional commit patterns (feat:, fix:, BREAKING:)

   **Step 7b: File Change Analysis**
   ```bash
   git diff --name-status [LAST_TAG]..HEAD
   ```
   - Identify added (A), modified (M), deleted (D), renamed (R) files
   - Categorize files by type: Sources/, Tests/, package.json, README.md, etc.

   **Step 7c: Code Diff Analysis**
   ```bash
   git diff [LAST_TAG]..HEAD
   ```
   - Analyze actual code changes line by line
   - Focus on public API changes in Sources/ directory
   - Examine package.json for dependency changes
   - Check README.md and documentation updates

8. **User Input for Version Number**
   - Analyze changes from step 7 to suggest version bump type:
     - **MAJOR**: If breaking changes detected (public API removals, signature changes)
     - **MINOR**: If new features added (new public APIs, significant functionality)
     - **PATCH**: If only bug fixes, documentation, internal improvements, performance optimizations

   - Use User Input Format to ask for version selection
   - Show package name, repository, current version, commit count, and suggested bump type with reasoning
   - Accept specific version (e.g., "1.2.0") or bump type ("major"/"minor"/"patch")
   - Parse and validate version format
   - If bump type provided: calculate from current version

### Phase 3: Release Notes Generation

9. **Analyze Changes and Generate Release Notes**
   **Step 9a: Review Conversation Context**
   - Analyze current chat conversation for work performed and context
   - Understand the intent behind changes made during this development session
   - Cross-reference with git changes to ensure accuracy

   **Step 9b: Comprehensive Change Analysis**
   Use the comprehensive change analysis from step 7 to systematically review each change:

   **For each modified file, examine the actual code changes and categorize:**

   **INCLUDE in release notes:**
   ✅ New public APIs or features users can access
   ✅ Bug fixes that affect user experience
   ✅ Performance improvements users will notice
   ✅ Breaking changes requiring user action
   ✅ New dependencies or platform requirements
   ✅ Security improvements
   ✅ Improved error messages or error handling
   ✅ Documentation updates that help users

   **EXCLUDE from release notes:**
   ❌ Internal refactoring with no user impact
   ❌ Test-only changes (unless they indicate new features being tested)
   ❌ Code formatting or style changes
   ❌ Internal helper methods or private implementations
   ❌ Development tooling changes (unless affecting package consumers)
   ❌ Commit message fixes or typos in non-user-facing text

   **Step 9c: Generate Simple Release Notes List**
   - Create a simple list of bullet points (no file created)
   - Sort by Keep A Changelog order: Added, Changed, Deprecated, Removed, Fixed, Security
   - Within each type, sort by importance (most impactful first)
   - Start each point with the action word: "Added", "Fixed", "Changed", etc.
   - Write user-focused descriptions explaining the benefit
   - If no meaningful user-facing changes found: Ask "Create maintenance release anyway?"

10. **Iterate on Release Notes with User Feedback**
    - Display generated release notes as simple bullet list
    - Use User Input Format to ask: "Use these release notes? (Y/n/r to revise - tell me what to change)"
    - **Y**: Continue with generated notes
    - **n**: Skip release notes (create release without notes)
    - **r**: Revise - ask user for specific improvement requests, then regenerate

    **If user chooses "r" (revise):**
    - Prompt: "How should I improve these release notes? Examples:"
      - "Make the API changes point more specific and include code example"
      - "Combine the performance improvements into one clearer point"
      - "Add more detail about the breaking changes and migration steps"
      - "Use more user-friendly language, less technical"
      - "Reorder by importance - put the new features first"
    - Take user feedback and regenerate improved version
    - Repeat Y/n/r cycle until user approves or skips

### Phase 4: Build Verification and Version Update

11. **Update Version in package.json**
    ```bash
    npm version [NEW_VERSION] --no-git-tag-version
    ```
    - Updates version field in package.json
    - Commit this change: `git commit -am "Bump version to [NEW_VERSION]"`

12. **Build Package for Distribution**
    ```bash
    npm run build
    ```
    - Run build script from package.json
    - Verify dist/ or build/ directory created
    - If build fails: ERROR "Fix build errors before release" → EXIT

### Phase 5: Publish and GitHub Release

13. **Create Git Tag and Push**
    ```bash
    git tag -a "v[NEW_VERSION]" -m "Release [NEW_VERSION]"
    git push origin main --tags
    ```
    - Push both commits and new tag

14. **Publish to NPM**
    ```bash
    npm publish
    ```
    - For scoped packages: `npm publish --access public`
    - If publish fails: ERROR "NPM publish failed. Check authentication and permissions."

15. **Create GitHub Release (if gh available)**
    ```bash
    gh release create "v[NEW_VERSION]" --title "[PACKAGE_NAME] [NEW_VERSION]" --notes "[FORMATTED_RELEASE_NOTES]"
    ```
    - If gh not available: SKIP and note to create manually

16. **Verify Release**
    ```bash
    npm view [PACKAGE_NAME] version
    ```
    - Confirm new version appears on NPM
    - Provide NPM package URL: `https://www.npmjs.com/package/[PACKAGE_NAME]`

### Phase 6: Success Confirmation

17. **Display Success Message** (see Success Message section below)

## Error Conditions

- **"package.json not found"** → This command is for NPM packages. Use `@ctxk:impl:release-app` for iOS/macOS apps
- **"Uncommitted changes"** → Commit all changes with `git add . && git commit -m "message"` before release
- **"Build failed"** → Fix compilation errors before attempting release
- **"Tests failed"** → All tests must pass before release. Fix failing tests first
- **"GitHub CLI not authenticated"** → Run `gh auth login` to authenticate with GitHub
- **"Git tag creation failed"** → Check if tag already exists or repository permissions
- **"GitHub release creation failed"** → Verify repository access and GitHub authentication

## Validation Gates

- [ ] NPM package project confirmed (package.json exists)?
- [ ] Git repository is clean (no uncommitted changes)?
- [ ] Package builds successfully in release configuration?
- [ ] All tests pass?
- [ ] GitHub CLI is authenticated and has repository access?
- [ ] User confirmed new version number?
- [ ] User reviewed and approved generated release notes?
- [ ] Git tag created and pushed successfully?
- [ ] GitHub release created with release notes?

## Success Message

```
🎉 NPM Package [PACKAGE_NAME] [NEW_VERSION] released successfully!

📦 Release Details:
   ✓ Version: [CURRENT_VERSION] → [NEW_VERSION]
   ✓ Git tag: v[NEW_VERSION] created and pushed
   ✓ GitHub release: Created with release notes

🔗 View Release:
   📋 [GITHUB_RELEASE_URL]
```

════════════════════════════════════════════════════════════════════════════════
👩‍💻 DEVELOPER CUSTOMIZATIONS - EDITABLE SECTION
════════════════════════════════════════════════════════════════════════════════

This section is preserved during ContextKit migrations and updates.
Add project-specific instructions, examples, and overrides below.

## Project-Specific Instructions

<!-- Add extra release steps like updating documentation sites, notifying dependent projects, custom versioning -->

## Additional Examples

<!-- Add examples of release workflows specific to your package types or dependencies -->

## Override Behaviors

<!-- Document any project-specific requirement overrides here -->