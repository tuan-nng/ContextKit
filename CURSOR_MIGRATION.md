# ContextKit for Cursor - Migration Guide

## Key Differences from Claude Code Version

### Architecture Changes

#### 1. **Command System**
- **Claude Code**: Uses custom `/ctxk:*` commands installed in `~/.claude/commands/`
- **Cursor**: Commands are markdown files placed in `.cursor/rules/` that can be referenced with `@` mentions
  - Example: `@ctxk:proj:init` instead of `/ctxk:proj:init`

#### 2. **Directory Structure**
- **Claude Code**: 
  - Global commands: `~/.claude/commands/ctxk/`
  - Project commands: `.claude/commands/ctxk/`
  - Agents: `.claude/agents/ctxk/`
  - Settings: `.claude/settings.json`
  - Scripts: `Context/Scripts/`

- **Cursor**:
  - Global reference: `~/.cursor/contextkit/`
  - Project commands: `.cursor/rules/ctxk/`
  - Guidelines: `Context/Guidelines/`
  - Context rules: `.cursorrules`
  - Scripts: Not directly supported (no hooks)

#### 3. **Hooks System**
- **Claude Code**: Supports PostToolUse and SessionStart hooks
  - `AutoFormat.sh` - Auto-formats Swift files after edits
  - `VersionStatus.sh` - Checks for updates on session start
  - `CustomStatusline.sh` - Displays context and usage stats

- **Cursor**: No native hook system
  - Formatting can be handled via Cursor's built-in formatter settings
  - Version checking done manually via `@ctxk:proj:migrate`
  - Status information available through Cursor's UI

#### 4. **Agents**
- **Claude Code**: Supports specialized sub-agents with YAML frontmatter
  - Agents can be invoked directly
  - Have their own tool permissions

- **Cursor**: No native agent system
  - Convert agents to guideline documents in `Context/Guidelines/`
  - Reference guidelines using `@` mentions
  - Guidelines provide instructions for the main AI assistant

#### 5. **Context Management**
- **Claude Code**: 
  - Custom statusline shows context usage
  - CLAUDE.md file for project context
  - Manual compact/resume workflow

- **Cursor**:
  - Built-in context management
  - `.cursorrules` file for project context
  - Natural `@` mention system for referencing files
  - `@Codebase` for broad searches
  - `@Files` for specific file references

### File Mappings

| Claude Code | Cursor | Notes |
|------------|--------|-------|
| `CLAUDE.md` | `.cursorrules` | Project context file |
| `~/.claude/commands/` | `~/.cursor/contextkit/` | Global reference location |
| `.claude/commands/` | `.cursor/rules/` | Project-specific commands |
| `.claude/agents/` | `Context/Guidelines/` | Quality guidelines |
| `.claude/settings.json` | Cursor Settings | Built-in settings UI |
| `Context/Scripts/` | N/A | No direct equivalent |

### Migration Checklist

- [x] Update README.md with Cursor references
- [x] Update install.sh for Cursor directory structure
- [ ] Create .cursorrules template (replace CLAUDE.md)
- [ ] Update Commands/ to work with Cursor's @ mention system
- [ ] Convert Agents/ to Guidelines/ documentation
- [ ] Remove/document Scripts/ (no hook support)
- [ ] Remove settings.json (use Cursor's built-in settings)
- [ ] Update all command files to use Cursor paths
- [ ] Update version headers in all changed files

### Command Invocation Changes

| Feature | Claude Code | Cursor |
|---------|------------|--------|
| Initialize | `/ctxk:proj:init` | `@ctxk:proj:init` |
| Plan Spec | `/ctxk:plan:1-spec` | `@ctxk:plan:1-spec` |
| Start Work | `/ctxk:impl:start-working` | `@ctxk:impl:start-working` |
| Migrate | `/ctxk:proj:migrate` | `@ctxk:proj:migrate` |

### Features to Adapt

#### Keep As-Is
- Feature planning workflow (3-phase approach)
- Spec-kit methodology
- Constitutional principles
- Template versioning system
- Context.md project configuration
- Backlog management

#### Modify
- Command invocation (/ → @)
- File paths (.claude → .cursor)
- Context file (CLAUDE.md → .cursorrules)
- Agent → Guideline conversion

#### Remove
- Hooks system (AutoFormat.sh, VersionStatus.sh, CustomStatusline.sh)
- settings.json (use Cursor's settings)
- Agent YAML frontmatter
- Statusline scripts

### Implementation Strategy

1. **Phase 1: Core Updates** ✅
   - Update README.md
   - Update install.sh
   - Update primary documentation

2. **Phase 2: Template Updates** (Current)
   - Update command templates
   - Convert agents to guidelines
   - Create .cursorrules template
   - Update settings template

3. **Phase 3: Testing**
   - Test installation flow
   - Verify command execution
   - Validate context management
   - Test migration workflow

4. **Phase 4: Documentation**
   - Update CURSOR.md (development guide)
   - Create migration guide for existing users
   - Update CHANGELOG.md
   - Version all changed templates

