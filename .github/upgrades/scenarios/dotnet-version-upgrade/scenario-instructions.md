# .NET Version Upgrade

## Strategy
**Selected**: Bottom-Up (Dependency-First)
**Rationale**: Multiple .NET Framework projects are in the upgrade scope with a 3-tier dependency chain, so dependency-first sequencing reduces migration risk.

### Execution Constraints
- Complete SDK-style conversion before any target framework changes.
- Upgrade dependency projects first, then dependent projects, preserving tier order.
- Resolve API compatibility issues inline in each upgrade task.
- Keep package management per-project during migration; defer CPM until post-migration cleanup.
- Validate build and relevant tests after each task before moving to the next task.

## Preferences
- **Flow Mode**: Automatic
- **Commit Strategy**: After Each Task
- **Scope**: `src/epg123_gui/epg123_gui.csproj`
- **Target Framework**: `net10.0`

## Upgrade Options
**Source**: .github/upgrades/scenarios/dotnet-version-upgrade/upgrade-options.md

### Strategy
- Upgrade Strategy: Bottom-Up

### Project Structure
- Project Approach: In-place
- Package Management: Per-Project (defer CPM to post-migration)

### Compatibility
- Unsupported API Handling: Fix Inline
- Windows Native APIs: Windows Compatibility Pack

## Source Control
- **Source Branch**: `master`
- **Working Branch**: `upgrade-dotnet-10`
- **Commit Strategy**: After Each Task
- **Branch Sync**: Auto (Merge)
