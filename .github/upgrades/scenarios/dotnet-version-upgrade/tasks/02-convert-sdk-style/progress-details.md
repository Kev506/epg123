# 02-convert-sdk-style Progress Details

## Summary
Converted all scoped legacy projects to SDK-style while preserving `net48` targets.

## Files modified
- `src/GaRyan2.Utilities/GaRyan2.Utilities.csproj`
- `src/GaRyan2.SchedulesDirect/GaRyan2.SchedulesDirect.csproj`
- `src/GaRyan2.Github/GaRyan2.Github.csproj`
- `src/epg123_gui/epg123_gui.csproj`
- `.github/upgrades/scenarios/dotnet-version-upgrade/tasks/02-convert-sdk-style/task.md`

## Files removed
- `src/GaRyan2.SchedulesDirect/packages.config`
- `src/GaRyan2.Github/packages.config`

## Validation
- Converted each project using `convert_project_to_sdk_style` sequentially.
- Built each converted project with Visual Studio `MSBuild.exe`:
  - `GaRyan2.Utilities.csproj`: success
  - `GaRyan2.SchedulesDirect.csproj`: success
  - `GaRyan2.Github.csproj`: success
  - `epg123_gui.csproj`: success
- Full workspace build via `run_build`: **Build successful**.

## Issues encountered and resolved
- `dotnet build` failed on converted `GaRyan2.Utilities` with `MSB4803` (`ResolveComReference` unsupported in .NET Core MSBuild).
  - Resolution: switched to full Visual Studio `MSBuild.exe` for net48 converted projects.
- `GaRyan2.Utilities` then failed with missing `System.IO.Packaging` symbols.
  - Resolution: added `<Reference Include="WindowsBase" />` to preserve legacy packaging API availability on net48.

## Done-when verification
- All scoped projects are SDK-style: ✅
- No conversion regressions remain: ✅
- Solution builds on pre-upgrade framework after conversion: ✅
