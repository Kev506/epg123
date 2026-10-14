# 03.02-upgrade-dependent-libraries Progress Details

## Summary
Retargeted dependency-layer libraries to modern .NET and aligned them with upgraded `GaRyan2.Utilities`.

## Files modified
- `src/GaRyan2.Github/GaRyan2.Github.csproj`
- `src/GaRyan2.Github/Properties/AssemblyInfo.cs`
- `src/GaRyan2.SchedulesDirect/GaRyan2.SchedulesDirect.csproj`
- `src/GaRyan2.SchedulesDirect/Properties/AssemblyInfo.cs`
- `.github/upgrades/scenarios/dotnet-version-upgrade/tasks/03.02-upgrade-dependent-libraries/task.md`

## What changed
- Changed target frameworks:
  - `GaRyan2.Github`: `net48` → `net10.0-windows`
  - `GaRyan2.SchedulesDirect`: `net48` → `net10.0-windows`
- Updated package references:
  - `Newtonsoft.Json` to `13.0.4` in both projects.
  - Added `Microsoft.Windows.Compatibility` `10.0.12` to `GaRyan2.SchedulesDirect`.
- Removed legacy direct framework references from converted SDK-style files as part of modernized csproj structure, including dropping `System.Web` from `GaRyan2.SchedulesDirect`.
- Added `[assembly: SupportedOSPlatform("windows")]` in both projects to align platform analysis with windows-targeted TFMs.

## Validation
- Built `GaRyan2.Github.csproj` with Visual Studio `MSBuild.exe` (`/restore /t:Build /p:Configuration=Release /v:minimal`) — success.
- Built `GaRyan2.SchedulesDirect.csproj` with Visual Studio `MSBuild.exe` (`/restore /t:Build /p:Configuration=Release /v:minimal`) — success.
- Both builds validated transitively against `GaRyan2.Utilities` targeting `net10.0-windows`.

## Done-when verification
- Both projects target modern TFMs compatible with the selected strategy: ✅
- Both projects build without errors: ✅
- Referencing `GaRyan2.Utilities` remains valid on upgraded TFMs: ✅
