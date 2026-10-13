# .NET Version Upgrade

## Preferences
- **Flow Mode**: Automatic
- **Scope**: `src/epg123Transfer/epg123Transfer.csproj`
- **Target Framework**: `net10.0`

## Upgrade Options
**Source**: .github/upgrades/scenarios/dotnet-version-upgrade/upgrade-options.md

### Strategy
- Upgrade Strategy: All-at-Once

### Project Structure
- Project Approach: In-place

### Compatibility
- Unsupported API Handling: Fix Inline
- Windows Native APIs: Windows Compatibility Pack

### Modernization
- Nullable Reference Types: Leave Disabled

## Strategy
**Selected**: All-at-Once
**Rationale**: `epg123Transfer` is the only remaining legacy application in scope, while its referenced projects already target modern .NET, so a single atomic application-focused migration is the best fit.

### Execution Constraints
- Validate SDK/global.json compatibility and capture a baseline before structural changes.
- Keep SDK-style conversion separate from target framework retargeting and API remediation.
- Retarget `epg123Transfer` to a Windows-specific modern TFM during the upgrade task and resolve package/API issues inline.
- Perform a bounded build-fix pass after project and package changes, then run full scoped validation.
- Complete the scenario only after the solution builds cleanly and validation results are captured.

## Source Control
- **Source Branch**: `upgrade-dotnet-10-3`
- **Working Branch**: `upgrade-dotnet-10-4`
- **Commit Strategy**: Single Commit at End
- **Branch Sync**: Auto (Merge)

## Build Tool Decisions
- **src/epg123Transfer/epg123Transfer.csproj**: Visual Studio build / `run_build` preferred for validation (SDK-style WinForms project with `.resx` resources and icons)
