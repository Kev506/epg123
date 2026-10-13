# .NET Version Upgrade

## Preferences
- **Flow Mode**: Automatic
- **Scope**: `src/epgTray/epgTray.csproj`
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

### Modernization
- Nullable Reference Types: Leave Disabled

## Strategy
**Selected**: Bottom-Up (Dependency-First)
**Rationale**: The assessment includes two projects with a .NET Framework project (`epgTray`) depending on an already-upgraded modern .NET library, which falls under the framework migration rule requiring a dependency-first sequencing model for multi-project scope.

### Execution Constraints
- Validate SDK/global.json compatibility and baseline build behavior before migration changes.
- Keep SDK-style conversion isolated from target framework retargeting.
- Upgrade `epgTray` to `net10.0-windows` and resolve API compatibility issues inline.
- Use bounded build-fix passes after structural and retargeting changes, then run final scoped and solution validation.
- Record deferred CPM adoption as post-migration follow-up once all scoped projects are on SDK-style modern .NET.

## Source Control
- **Source Branch**: `upgrade-dotnet-10-4`
- **Working Branch**: `upgrade-dotnet-10-5`
- **Commit Strategy**: After Each Task
- **Branch Sync**: Auto (Merge)

## Build Tool Decisions
- **src/epgTray/epgTray.csproj**: Visual Studio build / `run_build` preferred for validation (SDK-style WinForms project with `.resx` resources and icons)
