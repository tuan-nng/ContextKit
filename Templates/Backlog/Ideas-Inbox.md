# Ideas Inbox: ${PROJECT_NAME}

**Project**: ${PROJECT_NAME}  
**Created**: ${SETUP_DATE}  
**Purpose**: New idea capture with evaluation framework  
**Usage**: Used by `/Backlog/add-idea` command for initial idea intake

## Quick Capture Guidelines

### For AI Processing
When adding ideas to this inbox:
1. **Capture immediately**: Don't evaluate during capture - just record the idea
2. **Include context**: Why now? What problem does this solve? Who benefits?
3. **Mark uncertainties**: Use [NEEDS RESEARCH: specific question] for unclear aspects
4. **Constitutional check**: Does this align with accessibility-first, privacy, localizability principles?

### Evaluation Framework
Each idea should eventually include:
- **User Value**: Clear benefit statement for target users
- **Effort Estimate**: T-shirt sizing (XS, S, M, L, XL) 
- **Constitutional Alignment**: How does this support core principles?
- **Success Metrics**: How will we measure success?

---

## Ideas Awaiting Evaluation

### Format: `## [IDEA-###] Idea Title`
**Status**: New  
**Added**: YYYY-MM-DD  
**Context**: Brief description of why this idea matters now  
**User Value**: Who benefits and how?  
**Effort**: [NEEDS EVALUATION]  
**Constitutional**: [NEEDS REVIEW]  
**Next Steps**: Research needed, validation required, etc.

---

*Ideas are automatically moved to Ideas-Backlog.md during `/Backlog/prioritize-ideas` after evaluation*

## Constitutional Compliance Checklist

Each idea must be evaluated against:
- [ ] **Accessibility-first**: Does this improve or maintain accessibility for all users?
- [ ] **Privacy by design**: Does this protect user privacy and minimize data collection?
- [ ] **Localizability**: Can this be adapted for international users and cultural contexts?
- [ ] **Maintainability**: Will this improve or maintain code quality and long-term sustainability?
- [ ] **Platform UX**: Does this follow iOS/macOS design guidelines and platform conventions?

## Idea Categories

**🎯 User Experience**: Features directly improving user interaction and satisfaction  
**🔧 Developer Experience**: Tools and workflows improving development efficiency  
**📊 Analytics & Insights**: Features providing users with valuable data and insights  
**🌐 Platform & Integration**: Connections with external services and platforms  
**♿ Accessibility & Inclusion**: Features specifically enhancing accessibility  
**🌍 Localization & Internationalization**: Features supporting global users  
**🔒 Privacy & Security**: Features protecting user privacy and data security  
**⚡ Performance & Optimization**: Features improving speed, efficiency, and resource usage

---

## Instructions for `/Backlog/add-idea`

This template is used by the `/Backlog/add-idea [description]` command to:
1. Generate unique idea ID (IDEA-001, IDEA-002, etc.)
2. Capture idea with timestamp and context
3. Apply evaluation framework structure
4. Add to this inbox for later prioritization
5. Trigger constitutional compliance review

The idea will remain here until `/Backlog/prioritize-ideas` is run to evaluate and potentially promote it to the active backlog.