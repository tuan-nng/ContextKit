# Bugs Inbox: ${PROJECT_NAME}

**Project**: ${PROJECT_NAME}  
**Created**: ${SETUP_DATE}  
**Purpose**: Bug report intake with impact assessment  
**Usage**: Used by `/Backlog/add-bug` command for initial bug capture

## Quick Capture Guidelines

### For AI Processing
When adding bugs to this inbox:
1. **Capture immediately**: Don't triage during reporting - just record the issue
2. **Include reproduction**: Steps to reproduce, environment, expected vs actual behavior
3. **Mark uncertainties**: Use [NEEDS INVESTIGATION: specific area] for unclear aspects
4. **Constitutional check**: Does this violate accessibility, privacy, or other core principles?

### Impact Assessment Framework
Each bug should eventually include:
- **Severity**: Critical, High, Medium, Low based on impact and frequency
- **Constitutional Impact**: Does this violate core accessibility, privacy, or maintainability principles?
- **Affected Users**: Who is impacted and how severely?
- **Effort Estimate**: T-shirt sizing (XS, S, M, L, XL) for fix complexity

---

## Bugs Awaiting Triage

### Format: `## [BUG-###] Bug Title`
**Status**: New  
**Reported**: YYYY-MM-DD  
**Environment**: iOS version, device, app version, reproduction conditions  
**Severity**: [NEEDS ASSESSMENT]  
**Reproduction Steps**: 
1. Step one
2. Step two
3. Step three

**Expected Behavior**: What should happen  
**Actual Behavior**: What actually happens  
**Constitutional Impact**: [NEEDS REVIEW]  
**Affected Users**: [NEEDS ANALYSIS]  
**Screenshots/Logs**: [If applicable]

---

*Bugs are automatically moved to Bugs-Backlog.md during `/Backlog/prioritize-bugs` after triage*

## Constitutional Compliance Assessment

Each bug must be evaluated against constitutional violations:
- [ ] **Accessibility Impact**: Does this prevent users with disabilities from using the app?
- [ ] **Privacy Impact**: Does this expose user data or violate privacy expectations?
- [ ] **Localization Impact**: Does this affect international users or cultural adaptation?
- [ ] **Maintainability Impact**: Does this indicate poor code quality or technical debt?
- [ ] **Platform UX Impact**: Does this violate iOS/macOS design guidelines or conventions?

## Bug Categories

**💥 Crash/Data Loss**: App crashes, data corruption, critical functionality failure  
**♿ Accessibility**: VoiceOver issues, color contrast, keyboard navigation, dynamic type  
**🔒 Privacy/Security**: Data leaks, unauthorized access, privacy manifest violations  
**🌍 Localization**: Text overflow, cultural issues, RTL layout problems, translation errors  
**🎨 Visual/UI**: Layout issues, visual bugs, design inconsistencies, dark mode problems  
**⚡ Performance**: Slow loading, high memory usage, battery drain, unresponsive UI  
**🔧 Functional**: Feature not working as designed, incorrect behavior, edge case failures  
**🌐 Integration**: External service issues, API problems, sync failures

## Severity Levels

**🔴 Critical**: 
- App crashes or becomes unusable
- Data loss or corruption
- Security vulnerabilities
- Constitutional principle violations (accessibility blocking, privacy exposure)

**🟡 High**:
- Major feature not working
- Significant user workflow disruption
- Performance issues affecting usability
- Accessibility barriers for common tasks

**🔵 Medium**:
- Minor feature issues
- Cosmetic problems affecting user experience
- Edge case failures with workarounds
- Localization issues in non-primary markets

**⚪ Low**:
- Cosmetic issues with minimal impact
- Rare edge cases
- Nice-to-fix improvements
- Minor optimization opportunities

---

## Instructions for `/Backlog/add-bug`

This template is used by the `/Backlog/add-bug [description]` command to:
1. Generate unique bug ID (BUG-001, BUG-002, etc.)
2. Capture bug report with timestamp and environment details
3. Apply impact assessment framework structure
4. Add to this inbox for later triage
5. Trigger constitutional compliance assessment

The bug will remain here until `/Backlog/prioritize-bugs` is run to triage and potentially promote it to the active backlog.

## Reproduction Template

**Steps to Reproduce**:
1. Open the app
2. Navigate to [specific screen/feature]
3. Perform [specific action]
4. Observe [specific result]

**Environment**:
- **Device**: iPhone 15 Pro / iPad Air / MacBook Pro M3
- **OS Version**: iOS 17.0 / iPadOS 17.0 / macOS 14.0
- **App Version**: 1.0.0 (Build 1)
- **Network**: WiFi / Cellular / Offline
- **Other**: VoiceOver enabled, Dark Mode, Large Text, etc.