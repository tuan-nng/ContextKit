# Triage Bugs
<!-- Template Version: 0 | ContextKit: 0.0.0 | Updated: 2025-01-26 -->

> [!WARNING]
> **👩‍💻 FOR DEVELOPERS**: Do not edit the content above the developer customization section - changes will be overwritten during ContextKit updates.
>
> For project-specific customizations, use the designated section at the bottom of this file.
>
> Found a bug or improvement for everyone? Please report it: https://github.com/FlineDev/ContextKit/issues

## Description
Review and reprioritize bug backlog with impact assessment, constitutional compliance validation, and severity-based triage

## Parameters
- `severity` (optional): Focus on specific severity level (e.g., "critical", "high", "medium", "low")
- `horizon` (optional): Planning horizon for bug fixes (e.g., "hotfix", "sprint", "release") - defaults to "sprint"

## Execution Flow (main)
1. Load and validate bugs backlog state
   → Read Context/Backlog/Bugs-Inbox.md and Context/Backlog/Bugs-Backlog.md
   → If missing: ERROR "No bugs found - use /Backlog/add-bug first"
   → Validate bug entries and identify any incomplete impact assessments
   → Load existing triage context from previous prioritization sessions
2. Gather comprehensive context for bug prioritization
   → Read project Context.md for quality standards and user impact priorities
   → Analyze recent bug fix velocity and development capacity constraints
   → Review constitutional principle violations caused by bugs
   → Assess current release timeline and quality gate requirements
3. Analyze bug backlog items systematically
   → Load detailed content from Context/Backlog/Bugs/ files
   → Assess constitutional principle violations for each bug (accessibility, privacy, maintainability)
   → Calculate severity-impact matrices using consistent scoring methodology
   → Identify related bugs that could be fixed together for efficiency
4. Apply constitutional compliance triage rules
   → Escalate bugs violating constitutional principles to critical priority
   → Prioritize accessibility bugs affecting users with disabilities immediately
   → Highlight privacy bugs exposing user data or violating data protection
   → Flag localization bugs affecting international users and market access
5. Generate severity-based prioritization recommendations
   → Create priority tiers: Critical, High, Medium, Low, Deferred
   → Recommend promotion of inbox bugs ready for immediate fixing
   → Suggest bug clustering for efficient batch fixes
   → Identify bugs requiring additional investigation or reproduction steps
6. Update backlog organization with triage rationale
   → Move triaged bugs from Bugs-Inbox.md to Bugs-Backlog.md with updated severity
   → Reorder Bugs-Backlog.md based on new prioritization and impact assessment
   → Document triage rationale and severity escalation criteria used
   → Update impact scores and effort estimates based on current analysis
7. Generate actionable fix plan and recommendations
   → Suggest top 3-5 critical bugs for immediate hotfix consideration
   → Identify bugs suitable for next sprint based on severity and effort
   → Recommend bugs for batch fixing based on related components or causes
   → Provide clear rationale for all triage and prioritization decisions made

## Context Sources
Read these files to understand project configuration and quality standards dynamically:
- `Context.md` - Project quality standards, user impact priorities, constitutional principles
- `Context/Backlog/Bugs-Inbox.md` - New bugs awaiting triage and severity assessment
- `Context/Backlog/Bugs-Backlog.md` - Triaged bugs ready for development fixing
- Parent directory `Context.md` files - Workspace-specific quality standards
- `~/.ContextKit/Meta/Constitution.md` - Universal constitutional principles for bug triage

## Validation Gates
- [ ] Bug backlog files exist and are properly formatted?
- [ ] Project quality context loaded from Context.md?
- [ ] Constitutional principles applied to bug triage decisions?
- [ ] Severity-impact analysis completed for all bugs?
- [ ] Triage rationale documented for transparency?
- [ ] Clear fix plan identified for critical and high-priority bugs?
- [ ] Backlog organization updated to reflect new priorities?

## Error Conditions
- "No bugs found" → User must report bugs with /Backlog/add-bug first
- "Invalid backlog format" → Bug backlog files need repair or regeneration
- "Missing quality context" → Project Context.md must define quality standards
- "Constitutional violation" → Bugs violating core principles need immediate escalation

## Constitutional Principles Integration
All bug prioritization automatically considers:
- **Accessibility-first design**: Bugs blocking assistive technology receive critical priority
- **Privacy by design**: Bugs exposing user data or violating privacy receive critical priority
- **Localizability from day one**: Bugs affecting international users receive high priority
- **Code maintainability**: Bugs indicating technical debt or code quality issues prioritized
- **Platform-appropriate UX**: Bugs violating iOS/macOS design guidelines receive attention

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