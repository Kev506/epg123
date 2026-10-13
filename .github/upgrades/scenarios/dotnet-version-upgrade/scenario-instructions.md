# .NET Version Upgrade

## Strategy
**Selected**: Bottom-Up (Dependency-First)
**Rationale**: The assessed scope spans 6 interconnected projects with 3 legacy net48 projects and a dependency chain into `epg123`, so dependency-first sequencing minimizes break risk while migrating framework boundaries.

### Execution Constraints
- Complete SDK-style conversion before any target framework changes.
- Upgrade dependency libraries before `epg123` and validate buildability at each checkpoint.
- Keep package management per-project during migration; defer CPM until post-migration cleanup.
- Resolve unsupported APIs inline during the upgrade (no deferred stubs).
- Preserve Windows compatibility for WinForms/System.Drawing usage during migration.

## Preferences
- **Flow Mode**: Automatic
- **Scope**: `src/epg123/epg123.csproj`
- **Target Framework**: `net10.0`

## Upgrade Options
**Source**: .github/upgrades/scenarios/dotnet-version-upgrade/upgrade-options.md

### Strategy
- Upgrade Strategy: Bottom-Up

### Project Structure
- Project Approach: Multi-targeting
- Package Management: Per-Project (defer CPM to post-migration)

### Compatibility
- Unsupported API Handling: Fix Inline
- Windows Native APIs: Windows Compatibility Pack

### Modernization
- Nullable Reference Types: Leave Disabled

## Source Control
- **Source Branch**: `upgrade-dotnet-10`
- **Working Branch**: `upgrade-dotnet-10-2`
- **Commit Strategy**: After Each Task
- **Branch Sync**: Auto (Merge)
