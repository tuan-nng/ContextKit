# Report Bug

**Purpose**: Capture bug reports with impact assessment and reproduction steps following ContextKit's spec-kit methodology with constitutional principles and effort estimation.

## Template Variables

- `{{bug_title}}` - Short descriptive title for the bug
- `{{bug_description}}` - Detailed description from user input
- `{{reporter_name}}` - Name of person reporting the bug
- `{{timestamp}}` - ISO 8601 timestamp when bug was reported
- `{{project_name}}` - Current project name from Context.md
- `{{project_type}}` - Project type (ios-app, swift-package, vapor-server)

## Execution Flow (main)

1. **Parse Input Description**
   → If empty: ERROR "No bug description provided"
   → Extract key elements: symptoms, context, expected behavior
   
2. **Impact Assessment Gate**
   → Analyze user-facing impact and technical severity
   → If impact unclear: WARN "Impact assessment incomplete"
   → Mark critical path features with HIGH priority
   
3. **Reproduction Analysis**
   → For each unclear reproduction step:
   → Mark with [NEEDS CLARIFICATION: specific question]
   → If no reproduction steps: ERROR "Cannot determine reproduction steps"
   
4. **Constitutional Compliance Check**
   → Validate against accessibility, localization, privacy principles
   → Mark constitutional principle violations with CRITICAL priority
   
5. **Effort Estimation**
   → Calculate complexity based on affected systems
   → If estimation uncertain: Mark with [NEEDS ESTIMATION: technical assessment required]
   
6. **Validation Gates**
   → Run Bug Report Completeness checklist
   → If any critical gaps: ERROR "Bug report incomplete"
   → If uncertainties remain: WARN "Bug has unclear aspects"
   
7. **File Creation**
   → Generate bug file in Context/Backlog/Bugs/
   → Update Bugs-Inbox.md with new entry
   → Return: SUCCESS (bug captured and prioritized)

## Bug Report Template Structure

```markdown
# Bug Report: {{bug_title}}

**Reporter**: {{reporter_name}}  
**Date**: {{timestamp}}  
**Project**: {{project_name}} ({{project_type}})  
**Status**: New  

## Summary
{{bug_description}}

## Impact Assessment
### User Impact
- [ ] **Critical**: App crashes or data loss
- [ ] **High**: Core functionality broken
- [ ] **Medium**: Feature degraded but usable
- [ ] **Low**: Minor UI/UX issue

### Technical Severity
- [ ] **Critical**: Security/privacy vulnerability
- [ ] **High**: Performance degradation >20%
- [ ] **Medium**: Isolated feature issue
- [ ] **Low**: Cosmetic/polish issue

### Constitutional Compliance
- [ ] **Accessibility**: Violates accessibility standards
- [ ] **Localization**: Breaks i18n/l10n functionality  
- [ ] **Privacy**: Privacy principle violation
- [ ] **Performance**: Violates 60fps/launch time standards

## Reproduction Steps
1. [NEEDS CLARIFICATION: specific environment/device?]
2. [Step-by-step reproduction]
3. [Expected vs actual behavior]

### Environment
- **iOS Version**: [NEEDS CLARIFICATION: specific version?]
- **Device**: [NEEDS CLARIFICATION: specific model?]
- **App Version**: {{app_version}}
- **Configuration**: [NEEDS CLARIFICATION: specific settings?]

## Expected Behavior
[Clear description of what should happen]

## Actual Behavior
[Clear description of what actually happens]

## Error Messages/Logs
```
[Include any console output, crash logs, or error messages]
```

## Screenshots/Videos
- [ ] Screenshot of issue attached
- [ ] Screen recording if needed
- [ ] Console logs captured

## Effort Estimation
### Complexity Assessment
- [ ] **Simple** (1-2 hours): UI fix, text change
- [ ] **Medium** (0.5-2 days): Logic fix, single component
- [ ] **Complex** (3-7 days): Architecture change, multiple systems
- [ ] **Major** (1-2 weeks): Core system redesign

### Risk Factors
- [ ] Affects multiple platforms (iOS/macOS)
- [ ] Requires database migration
- [ ] Impacts existing user data
- [ ] Needs extensive testing
- [ ] [NEEDS ESTIMATION: technical assessment required]

## Investigation Notes
### Root Cause Analysis
- [ ] **UI Layer**: SwiftUI view or layout issue
- [ ] **Business Logic**: Service or model layer bug
- [ ] **Data Layer**: Core Data or persistence issue
- [ ] **Integration**: External API or service issue
- [ ] **Infrastructure**: Build, deployment, or configuration

### Dependencies
- [ ] Requires investigation of related systems
- [ ] May affect multiple features
- [ ] Depends on external library/service fixes
- [ ] Blocked by other bugs: [List blocking bug IDs]

## Solution Approach
### Immediate Actions
- [ ] Quick workaround available
- [ ] Hotfix required for production
- [ ] Can wait for next regular release

### Implementation Strategy
- [ ] **Package-First**: Create/modify Swift package
- [ ] **Direct Fix**: Modify app code directly
- [ ] **Configuration**: Settings or environment change
- [ ] **Third-Party**: Update dependency or external service

## Testing Requirements
### Validation Checklist
- [ ] Fix verified in development environment
- [ ] Regression testing completed
- [ ] Accessibility testing if UI-related
- [ ] Performance testing if performance-related
- [ ] Works across all supported iOS versions

### Test Cases to Add
- [ ] Unit tests for bug scenario
- [ ] UI tests for user-facing bugs
- [ ] Integration tests for system bugs
- [ ] Performance tests for performance bugs

## Release Considerations
### Priority Classification
- [ ] **P0**: Stop-ship, blocks release
- [ ] **P1**: Must fix before next release
- [ ] **P2**: Should fix in next few releases  
- [ ] **P3**: Fix when convenient

### Release Impact
- [ ] Requires immediate hotfix
- [ ] Can wait for scheduled release
- [ ] Needs App Store review
- [ ] Breaking change requiring version bump

## Related Issues
- **Similar Bugs**: [Link to related bug reports]
- **Related Features**: [Link to feature specs that might be affected]
- **Blocking Issues**: [List issues that must be resolved first]
- **Blocked Issues**: [List issues blocked by this bug]
```

## Constitutional Validation (iOS/Swift-Specific)

### Swift Package Gate
- [ ] Bug affects package boundary or API?
- [ ] Fix maintains clean package separation?
- [ ] No architectural violations introduced?

### Performance Gate (iOS Standards)
- [ ] Fix maintains 60fps UI performance?
- [ ] Memory usage impact assessed?
- [ ] App launch time impact considered?

### App Store Gate (Release Readiness)
- [ ] Fix doesn't violate App Store guidelines?
- [ ] Privacy manifest updated if data handling changes?
- [ ] Accessibility maintained or improved?

### Code Quality Gate
- [ ] Fix follows 3-space indentation standard?
- [ ] Uses ErrorKit for proper error handling?
- [ ] Follows established architectural patterns?

## Error Conditions

### Critical Errors (Block Execution)
- **ERROR "No bug description provided"**: User must provide basic bug information
- **ERROR "Cannot determine reproduction steps"**: Must have some path to reproduce
- **ERROR "Bug report incomplete"**: Critical sections missing or invalid

### Warning Conditions (Allow with Caution)
- **WARN "Impact assessment incomplete"**: Impact unclear but bug can be filed
- **WARN "Bug has unclear aspects"**: Some details missing but actionable

## Validation Checklist (Auto-executed)

### Bug Report Completeness
- [ ] Bug title is descriptive and searchable?
- [ ] Impact assessment completed for user and technical severity?
- [ ] Reproduction steps provided (even if incomplete)?
- [ ] Expected vs actual behavior clearly described?
- [ ] Environment information captured?

### Constitutional Compliance
- [ ] Accessibility impact assessed if UI-related?
- [ ] Localization impact assessed if text-related?
- [ ] Privacy impact assessed if data-related?
- [ ] Performance impact estimated if performance-related?

### Actionability Requirements
- [ ] Bug is specific enough to investigate?
- [ ] Effort estimation provides reasonable bounds?
- [ ] Solution approach identified or investigatable?
- [ ] Clear success criteria for verification?

## File Generation Rules

### Bug File Naming
- **Format**: `BUG-YYYY-MM-DD-{sequential-id}-{kebab-case-title}.md`
- **Example**: `BUG-2025-01-15-001-user-profile-crash.md`
- **Location**: `Context/Backlog/Bugs/BUG-YYYY-MM-DD-{sequential-id}-{kebab-case-title}.md`

### Inbox Integration
**Add to Context/Backlog/Bugs-Inbox.md**:
```markdown
## [{{timestamp}}] {{bug_title}}
- **Priority**: {{calculated_priority}}
- **Impact**: {{impact_level}}
- **Effort**: {{effort_estimate}}
- **Status**: New
- **File**: [BUG-{{file_id}}](./Bugs/{{bug_filename}})

{{bug_summary}}
```

## AI Generation Guidelines

When creating bug reports from user prompts:

1. **Mark all ambiguities**: Use [NEEDS CLARIFICATION: specific question]
2. **Don't speculate**: If user doesn't provide details, mark as unclear
3. **Assess realistically**: Don't downplay impact or inflate effort estimates

### Common Underspecified Areas
- Device and iOS version information
- Exact reproduction steps and timing
- Data state and user configuration  
- Performance benchmarks and targets
- Integration points and dependencies

### iOS-Specific Considerations
- **Device Compatibility**: Different behavior across iPhone/iPad
- **iOS Version Differences**: API availability and behavior changes  
- **App States**: Foreground/background, memory pressure, network conditions
- **Permissions**: Location, notifications, camera, etc.
- **Accessibility**: VoiceOver, Dynamic Type, Reduce Motion

## Integration Points

### With Other Commands
- **`/Plan/create-spec`**: Convert high-priority bugs to feature specs
- **`/Backlog/prioritize-backlog`**: Bulk triage and prioritization
- **`/Implement/start-working`**: Pick up bugs from work queue

### With Subagents
- **`check-accessibility`**: Validate accessibility-related bug fixes
- **`check-localization`**: Validate i18n-related bug fixes
- **`check-error-handling`**: Validate error handling improvements
- **`build-project`**: Verify fixes don't break compilation

### With Hooks
- **PostToolUse**: Auto-format any code files edited during bug fix
- **SessionStart**: Show critical bugs in status display

## Success Metrics

The add-bug template should achieve:
- **100% actionability**: Every generated bug report is investigatable
- **95% completeness**: Critical information captured in first pass
- **Accurate impact assessment**: Priority matches actual user/business impact
- **Constitutional compliance**: All fixes uphold architectural principles
- **Effort accuracy**: Estimates within 50% of actual implementation time

---

*This template follows ContextKit's spec-kit methodology with execution flows, validation gates, constitutional compliance, and systematic quality assurance for iOS/macOS development workflows.*