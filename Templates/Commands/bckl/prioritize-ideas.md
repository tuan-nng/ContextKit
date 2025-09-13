# Prioritize Ideas
<!-- Template Version: 0 | ContextKit: 0.0.0 | Updated: 2025-09-13 -->

> [!WARNING]
> **👩‍💻 FOR DEVELOPERS**: Do not edit the content above the developer customization section - changes will be overwritten during ContextKit updates.
>
> For project-specific customizations, use the designated section at the bottom of this file.
>
> Found a bug or improvement for everyone? Please report it: https://github.com/FlineDev/ContextKit/issues

## Description
Review and reprioritize idea backlog with smart promotion suggestions, constitutional compliance validation, and strategic planning alignment

## Parameters
- `focus` (optional): Specific focus area for prioritization (e.g., "accessibility", "performance", "user-experience")
- `horizon` (optional): Planning horizon (e.g., "sprint", "quarter", "release") - defaults to "quarter"

## Execution Flow (main)
1. Load and validate ideas backlog state
   → Read Context/Backlog/Ideas-Inbox.md and Context/Backlog/Ideas-Backlog.md
   → If missing: ERROR "No ideas found - use /Backlog/add-idea first"
   → Validate idea entries and identify any corrupt or incomplete items
   → Load existing prioritization context from previous sessions
2. Gather comprehensive context for idea prioritization
   → Read project Context.md for strategic goals and user priorities
   → Analyze recent development velocity and capacity constraints
   → Review constitutional principle compliance status and gaps
   → Assess current feature development pipeline and resource allocation
3. Analyze idea backlog items systematically
   → Load detailed content from Context/Backlog/Ideas/ files
   → Assess constitutional principle alignment for each idea (accessibility-first, privacy, localizability)
   → Calculate value-effort ratios using consistent scoring methodology
   → Identify synergies between related ideas and potential feature combinations
4. Apply constitutional compliance prioritization rules
   → Escalate ideas addressing constitutional violations to high priority
   → Prioritize accessibility-first features affecting underserved users
   → Highlight privacy-enhancing ideas requiring immediate consideration
   → Flag localization ideas affecting international market expansion
5. Generate strategic prioritization recommendations
   → Create priority tiers: Critical, High, Medium, Low, Deferred
   → Recommend promotion of inbox ideas ready for active development
   → Suggest idea combinations that create compound value
   → Identify ideas requiring further research or validation
6. Update backlog organization with rationale
   → Move promoted ideas from Ideas-Inbox.md to Ideas-Backlog.md with updated priority
   → Reorder Ideas-Backlog.md based on new prioritization decisions
   → Document prioritization rationale and decision criteria used
   → Update priority scores and effort estimates based on current analysis
7. Generate actionable next steps and recommendations
   → Suggest top 3-5 ideas for immediate consideration in next planning cycle
   → Identify ideas requiring additional research, validation, or stakeholder input
   → Recommend ideas for deferral or removal based on strategic alignment
   → Provide clear rationale for all prioritization decisions made

## Context Sources
Read these files to understand project configuration and strategic context dynamically:
- `Context.md` - Project strategic goals, user priorities, constitutional principles
- `Context/Backlog/Ideas-Inbox.md` - New ideas awaiting evaluation and prioritization
- `Context/Backlog/Ideas-Backlog.md` - Prioritized ideas ready for development planning
- Parent directory `Context.md` files - Workspace-specific strategic priorities
- `~/.ContextKit/Meta/Constitution.md` - Universal constitutional principles for prioritization

## Validation Gates
- [ ] Ideas backlog files exist and are properly formatted?
- [ ] Project strategic context loaded from Context.md?
- [ ] Constitutional principles applied to prioritization decisions?
- [ ] Value-effort analysis completed for all ideas?
- [ ] Prioritization rationale documented for transparency?
- [ ] Clear next steps identified for top-priority ideas?
- [ ] Backlog organization updated to reflect new priorities?

## Error Conditions
- "No ideas found" → User must add ideas with /Backlog/add-idea first
- "Invalid backlog format" → Ideas backlog files need repair or regeneration
- "Missing strategic context" → Project Context.md must define goals and priorities
- "Constitutional conflict" → Ideas must align with accessibility-first and privacy principles

## Constitutional Principles Integration
All idea prioritization automatically considers:
- **Accessibility-first design**: Ideas improving accessibility receive priority boost
- **Privacy by design**: Ideas enhancing user privacy and data protection prioritized
- **Localizability from day one**: Ideas supporting international users receive consideration
- **Code maintainability**: Ideas reducing technical debt and improving code quality valued
- **Platform-appropriate UX**: Ideas following iOS/macOS design guidelines preferred

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