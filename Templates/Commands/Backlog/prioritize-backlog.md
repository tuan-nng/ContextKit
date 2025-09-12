# Command: /Backlog/prioritize-backlog

## Description
Review and reprioritize unified backlog of ideas, bugs, and features with smart promotion suggestions and constitutional compliance validation

## Parameters
- `focus` (optional): Specific focus area for prioritization (e.g., "accessibility", "performance", "user-experience")
- `horizon` (optional): Planning horizon (e.g., "sprint", "quarter", "release") - defaults to "quarter"

## Execution Flow (main)
1. Load and validate backlog state
   → Read Context/Backlog/Index.md for current backlog inventory
   → If missing: ERROR "No backlog found - use /Backlog/add-idea or /Backlog/add-bug first"
   → Validate backlog integrity and identify any corrupt or missing entries
   → Load existing prioritization context from Context/Backlog/Prioritization.md
2. Gather comprehensive context for prioritization decisions
   → Load project goals and user priorities from Context.md and project documentation
   → Analyze recent development velocity and capacity constraints
   → Review constitutional principle compliance status and violation patterns
   → Assess current feature development pipeline and resource allocation
3. Analyze backlog items systematically
   → Load detailed content from Context/Backlog/Ideas/ and Context/Backlog/Bugs/
   → Assess constitutional principle alignment for each item
   → Calculate value-effort ratios using consistent scoring methodology
   → Identify dependencies, conflicts, and synergies between items
4. Apply constitutional compliance prioritization rules
   → Escalate items addressing constitutional violations to high priority
   → Prioritize accessibility improvements affecting underserved users
   → Flag privacy compliance issues requiring immediate attention
   → Highlight localization gaps affecting international market expansion
5. Generate intelligent prioritization recommendations
   → Create priority tiers (Critical, High, Medium, Low, Future)
   → Suggest promotion candidates based on value alignment and effort analysis
   → Identify quick wins and strategic initiatives for balanced portfolio
   → Recommend constitutional principle compliance initiatives
6. Present prioritization matrix for review
   → Display current prioritization with rationale for each priority level
   → Show constitutional compliance status and violation remediation timeline
   → Present smart promotion suggestions with supporting evidence
   → Highlight dependencies and resource allocation implications
7. Update backlog organization and tracking
   → Apply confirmed prioritization decisions to Context/Backlog/Prioritization.md
   → Update Context/Backlog/Index.md with new priority levels and constitutional flags
   → Generate Context/Backlog/PrioritizationHistory.md entry with decision rationale
   → Create actionable next steps and milestone planning recommendations
8. Generate constitutional compliance dashboard
   → Create compliance status overview with metrics and trends
   → Identify compliance gaps requiring prioritization attention
   → Suggest compliance improvement roadmap aligned with business priorities
   → Track compliance debt and remediation progress over time
9. Return: SUCCESS (backlog prioritized with constitutional alignment and smart recommendations)

## Template Variables
${BACKLOG_SIZE} - Total number of backlog items (ideas + bugs + features)
${CONSTITUTIONAL_VIOLATIONS} - Count of items flagging constitutional principle violations
${PROMOTION_CANDIDATES} - Items recommended for priority promotion
${PRIORITIZATION_HORIZON} - Selected planning horizon (sprint/quarter/release)
${PROJECT_CONTEXT} - Current project goals, user priorities, and strategic direction
${COMPLIANCE_STATUS} - Overall constitutional principle compliance assessment

## Prioritization Framework

### Priority Tiers System
```swift
enum PriorityTier {
   case critical    // Constitutional violations, critical bugs, blocking issues
   case high        // Strategic features, high-impact improvements, accessibility gaps
   case medium      // Valuable features, moderate improvements, nice-to-have fixes
   case low         // Minor enhancements, cosmetic improvements, edge cases
   case future      // Ideas for later consideration, research topics, speculation
}

struct PriorityAssessment {
   let userValue: Int        // 1-10 scale: Impact on user experience and satisfaction
   let businessValue: Int    // 1-10 scale: Strategic business importance and market impact
   let technicalEffort: Int  // 1-10 scale: Development complexity and resource requirements
   let constitutionalFlag: Bool // Addresses constitutional principle violations
   let riskLevel: Int        // 1-10 scale: Implementation risk and potential negative impact
}
```

### Constitutional Prioritization Rules
```swift
func calculateConstitutionalPriority(item: BacklogItem) -> PriorityTier {
   // Constitutional violations automatically elevate to Critical or High
   if item.violatesAccessibilityPrinciples { return .critical }
   if item.compromisesPrivacy { return .critical }
   if item.blocksLocalization { return .high }
   if item.degradesMaintainability { return .high }
   
   // Apply standard priority calculation for non-constitutional items
   return calculateStandardPriority(item)
}
```

## Value-Effort Analysis Matrix

### User Value Assessment Criteria
```markdown
## User Value Scoring (1-10 scale)
- **10 - Game Changing**: Transforms user experience, creates new capabilities
- **8-9 - High Impact**: Significantly improves core workflows, solves major pain points
- **6-7 - Moderate Impact**: Enhances existing features, improves usability
- **4-5 - Low Impact**: Minor improvements, convenience features
- **1-3 - Minimal Impact**: Cosmetic changes, edge case improvements
```

### Business Value Assessment Criteria
```markdown
## Business Value Scoring (1-10 scale)
- **10 - Strategic**: Critical for business success, competitive advantage
- **8-9 - Important**: Drives key business metrics, enables growth
- **6-7 - Beneficial**: Supports business goals, improves market position
- **4-5 - Nice to Have**: Marginal business benefit, limited market impact
- **1-3 - Questionable**: Unclear business value, primarily developer-driven
```

### Technical Effort Assessment Criteria
```markdown
## Technical Effort Scoring (1-10 scale)
- **10 - Architectural**: Major system changes, high complexity, long timeline
- **8-9 - Complex**: Significant development work, cross-system integration
- **6-7 - Moderate**: Standard feature development, well-understood patterns
- **4-5 - Simple**: Straightforward implementation, minimal risk
- **1-3 - Trivial**: Quick fixes, configuration changes, minor updates
```

## Smart Promotion Suggestions System

### Promotion Candidate Identification
```swift
func identifyPromotionCandidates(backlog: [BacklogItem]) -> [PromotionSuggestion] {
   return backlog.compactMap { item in
      // Constitutional violations get automatic promotion suggestions
      if item.hasConstitutionalFlags {
         return PromotionSuggestion(
            item: item,
            currentTier: item.priority,
            suggestedTier: .critical,
            reason: "Constitutional principle violation requires immediate attention",
            evidence: item.constitutionalAssessment
         )
      }
      
      // High value, low effort items are quick win candidates
      if item.userValue >= 7 && item.technicalEffort <= 4 {
         return PromotionSuggestion(
            item: item,
            currentTier: item.priority,
            suggestedTier: calculatePromotedTier(item.priority),
            reason: "High value, low effort - quick win opportunity",
            evidence: "Value: \(item.userValue)/10, Effort: \(item.technicalEffort)/10"
         )
      }
      
      // Strategic alignment candidates
      if item.businessValue >= 8 && alignsWithProjectGoals(item) {
         return PromotionSuggestion(
            item: item,
            currentTier: item.priority,
            suggestedTier: calculatePromotedTier(item.priority),
            reason: "Strong strategic alignment with project goals",
            evidence: item.strategicAlignment
         )
      }
      
      return nil
   }
}
```

### Dependency Analysis and Sequencing
```swift
func analyzeDependencies(backlog: [BacklogItem]) -> DependencyGraph {
   // Build dependency graph to identify blocking relationships
   // Suggest promotion of blocking items to enable dependent work
   // Flag circular dependencies and conflicting requirements
   // Recommend parallel execution opportunities
}
```

## Constitutional Compliance Dashboard

### Compliance Status Template
```markdown
## Constitutional Compliance Status

### Accessibility Compliance
- **Current Status**: [Compliant/Gaps Identified/Violations Present]
- **Open Violations**: ${ACCESSIBILITY_VIOLATIONS} items
- **High Priority**: [List critical accessibility items]
- **Compliance Score**: [Percentage of accessibility requirements met]
- **Next Actions**: [Prioritized accessibility improvements]

### Privacy Compliance  
- **Current Status**: [Compliant/Gaps Identified/Violations Present]
- **Open Violations**: ${PRIVACY_VIOLATIONS} items
- **High Priority**: [List critical privacy items]
- **Compliance Score**: [Percentage of privacy requirements met]
- **Next Actions**: [Prioritized privacy improvements]

### Localization Readiness
- **Current Status**: [Ready/Gaps Identified/Blockers Present]
- **Open Gaps**: ${LOCALIZATION_GAPS} items
- **High Priority**: [List critical localization items]
- **Readiness Score**: [Percentage of localization requirements met]
- **Next Actions**: [Prioritized localization work]

### Maintainability Health
- **Current Status**: [Healthy/Debt Identified/Critical Issues Present]
- **Technical Debt**: ${MAINTAINABILITY_DEBT} items
- **High Priority**: [List critical maintainability items]
- **Health Score**: [Code maintainability assessment]
- **Next Actions**: [Prioritized maintainability improvements]
```

## Prioritization Decision Templates

### Context/Backlog/Prioritization.md Structure
```markdown
# Backlog Prioritization

**Last Updated**: $(date)  
**Prioritization Horizon**: ${PRIORITIZATION_HORIZON}  
**Total Items**: ${BACKLOG_SIZE}  
**Constitutional Violations**: ${CONSTITUTIONAL_VIOLATIONS}

## Priority Tiers

### Critical (Immediate Action Required)
*Constitutional violations, critical bugs, blocking issues*

| ID | Title | Type | Constitutional Flag | User Impact | Timeline |
|----|-------|------|-------------------|-------------|----------|
| ${ITEM_ID} | ${TITLE} | ${TYPE} | ${FLAG} | ${IMPACT} | ${TIMELINE} |

### High Priority (Next Sprint/Iteration)
*Strategic features, high-impact improvements, accessibility gaps*

| ID | Title | Type | Value Score | Effort Score | Rationale |
|----|-------|------|-------------|--------------|----------- |
| ${ITEM_ID} | ${TITLE} | ${TYPE} | ${VALUE}/10 | ${EFFORT}/10 | ${RATIONALE} |

### Medium Priority (This Quarter)
*Valuable features, moderate improvements, nice-to-have fixes*

| ID | Title | Type | Value Score | Effort Score | Dependencies |
|----|-------|------|-------------|--------------|-------------- |
| ${ITEM_ID} | ${TITLE} | ${TYPE} | ${VALUE}/10 | ${EFFORT}/10 | ${DEPENDENCIES} |

### Low Priority (Future Consideration)
*Minor enhancements, cosmetic improvements, edge cases*

| ID | Title | Type | Value Score | Effort Score | Notes |
|----|-------|------|-------------|--------------|-------|
| ${ITEM_ID} | ${TITLE} | ${TYPE} | ${VALUE}/10 | ${EFFORT}/10 | ${NOTES} |

### Future Ideas (Parking Lot)
*Ideas for later consideration, research topics, speculation*

| ID | Title | Type | Reason for Deferral | Revisit Date |
|----|-------|------|-------------------|-------------- |
| ${ITEM_ID} | ${TITLE} | ${TYPE} | ${REASON} | ${REVISIT_DATE} |

## Smart Promotion Suggestions

### Recommended Promotions
- **${ITEM_ID}**: ${TITLE} 
  - **Current**: ${CURRENT_TIER} → **Suggested**: ${SUGGESTED_TIER}
  - **Reason**: ${PROMOTION_REASON}
  - **Evidence**: ${SUPPORTING_EVIDENCE}

### Constitutional Compliance Promotions
- **${ITEM_ID}**: ${TITLE}
  - **Violation**: ${CONSTITUTIONAL_VIOLATION}
  - **Impact**: ${USER_IMPACT}
  - **Recommended Action**: ${REMEDIATION_ACTION}

## Dependencies and Sequencing

### Blocking Relationships
- **${BLOCKER_ID}** blocks **${BLOCKED_ID}**: ${DEPENDENCY_REASON}

### Synergy Opportunities
- **${ITEM_A_ID}** + **${ITEM_B_ID}**: ${SYNERGY_DESCRIPTION}

### Parallel Execution Candidates
- **${GROUP_NAME}**: [${ITEM_1}, ${ITEM_2}, ${ITEM_3}] - Can be worked on simultaneously

## Resource Allocation Recommendations

### Immediate Capacity (Next Sprint)
- **Critical Items**: ${CRITICAL_COUNT} items requiring ${CRITICAL_EFFORT} effort
- **High Priority**: ${HIGH_COUNT} items available for ${AVAILABLE_CAPACITY} capacity
- **Recommended Selection**: [${RECOMMENDED_ITEMS}]

### Strategic Investments (This Quarter)
- **Accessibility**: ${ACCESSIBILITY_INVESTMENT} - ${ACCESSIBILITY_RATIONALE}
- **Performance**: ${PERFORMANCE_INVESTMENT} - ${PERFORMANCE_RATIONALE}
- **User Experience**: ${UX_INVESTMENT} - ${UX_RATIONALE}

## Decision Rationale

### Prioritization Principles Applied
1. **Constitutional Compliance First**: All constitutional violations elevated to critical/high
2. **User Value Maximization**: High user impact items prioritized within effort constraints
3. **Strategic Alignment**: Business-critical features prioritized for competitive advantage
4. **Risk Management**: High-risk items balanced with quick wins for sustainable progress

### Assumptions and Constraints
- **Development Capacity**: ${TEAM_CAPACITY} developers, ${SPRINT_CAPACITY} story points per sprint
- **Release Timeline**: ${RELEASE_TIMELINE} with feature freeze on ${FREEZE_DATE}
- **Platform Constraints**: ${PLATFORM_CONSTRAINTS}
- **External Dependencies**: ${EXTERNAL_DEPENDENCIES}
```

---
*Generated by ContextKit /Backlog/prioritize-backlog*
```

### Context/Backlog/PrioritizationHistory.md Integration
```markdown
## Prioritization Session: $(date)

### Changes Made
- **Promoted to Critical**: [${PROMOTED_ITEMS}] - Constitutional violations identified
- **Promoted to High**: [${PROMOTED_ITEMS}] - High value/low effort quick wins
- **Demoted**: [${DEMOTED_ITEMS}] - Reduced priority due to resource constraints
- **Deferred**: [${DEFERRED_ITEMS}] - Moved to future consideration

### Constitutional Compliance Actions
- **Accessibility**: ${ACCESSIBILITY_ACTIONS}
- **Privacy**: ${PRIVACY_ACTIONS}  
- **Localization**: ${LOCALIZATION_ACTIONS}
- **Maintainability**: ${MAINTAINABILITY_ACTIONS}

### Decision Context
- **Planning Horizon**: ${HORIZON}
- **Capacity Constraints**: ${CONSTRAINTS}
- **Strategic Focus**: ${FOCUS_AREAS}
- **Risk Tolerance**: ${RISK_LEVEL}
```

### Context/Backlog/RoadmapSuggestions.md Implementation Planning
```markdown
# Implementation Roadmap Suggestions

## Immediate Actions (Next 2 Weeks)
**Focus**: Critical constitutional violations and user blockers
- [ ] ${CRITICAL_BUG_1} - Accessibility violation fix
- [ ] ${CRITICAL_BUG_2} - Privacy compliance issue resolution
- **Rationale**: Constitutional compliance cannot be delayed

## Short Term (Next Quarter)
**Focus**: High-impact user features with constitutional benefits
- [ ] ${HIGH_PRIORITY_FEATURE_1} - Privacy enhancement feature
- [ ] ${HIGH_PRIORITY_FEATURE_2} - Accessibility improvement
- **Rationale**: Strong user value with constitutional alignment

## Medium Term (Next 6 Months)
**Focus**: Strategic features and technical improvements
- [ ] ${MEDIUM_PRIORITY_FEATURE_1} - User-requested enhancement
- [ ] ${TECHNICAL_DEBT_ITEM} - Architecture improvement
- **Rationale**: Building on foundation, preparing for scale

## Long Term (6+ Months)
**Focus**: Innovation and market differentiation
- [ ] ${INNOVATION_FEATURE} - Competitive advantage feature
- [ ] ${EXPANSION_FEATURE} - New user segment targeting
- **Rationale**: Growth and differentiation after core experience solidified

## Dependencies and Constraints
- **Resource Allocation**: [Team capacity and skill constraints]
- **Technical Dependencies**: [Infrastructure or architecture prerequisites]
- **External Dependencies**: [Third-party integrations or partnerships]
- **Constitutional Deadlines**: [Compliance or accessibility requirements]
```

## Prioritization Session Guidelines

### Stakeholder Involvement
- **Product Owner**: Strategic alignment and user value assessment
- **Technical Lead**: Feasibility and implementation complexity evaluation
- **Accessibility Expert**: Constitutional principle assessment and compliance requirements
- **User Research**: User impact validation and pain point prioritization

### Decision Criteria Documentation
- Document the reasoning behind each priority decision
- Record trade-offs made and alternative considerations
- Track constitutional principle prioritization patterns
- Maintain historical context for future prioritization sessions

## Validation Gates
- [ ] All backlog items loaded and analyzed?
- [ ] Constitutional compliance assessment complete?
- [ ] Value-effort analysis applied consistently?
- [ ] Priority tiers properly balanced?
- [ ] Dependencies and conflicts identified?
- [ ] Smart promotion suggestions generated?
- [ ] Resource allocation realistic for team capacity?
- [ ] Decision rationale clearly documented?

## Error Conditions
- "Empty backlog" → No items found in Context/Backlog/ - use add-idea/add-bug first
- "Corrupt backlog state" → Backlog files corrupted or inconsistent - validate and repair
- "Constitutional assessment incomplete" → Missing constitutional principle analysis for items
- "Invalid priority distribution" → Too many critical items or unrealistic prioritization
- "Capacity mismatch" → Prioritization exceeds realistic team capacity and timeline
- "Missing project context" → Insufficient project goals and strategic context for prioritization

## Integration with Development Workflow

### Prioritization Cadence
- **Sprint Planning**: Review critical and high priority items for immediate work
- **Quarterly Planning**: Full backlog prioritization with strategic alignment
- **Constitutional Review**: Monthly assessment of compliance violations and remediation
- **Ad-hoc Reprioritization**: When new constitutional violations or critical bugs emerge

### Constitutional Principle Evolution
- Use prioritization sessions to identify systematic constitutional gaps
- Track compliance improvement over time through prioritization metrics
- Integrate constitutional compliance into development velocity and quality metrics
- Evolve constitutional principles based on real-world prioritization decisions and outcomes

### Quality Assurance Integration
- Link prioritized items to quality gates and validation requirements
- Ensure constitutional compliance validation is built into implementation tasks
- Track resolution of constitutional violations through development pipeline
- Monitor that prioritization decisions align with delivered value and user satisfaction