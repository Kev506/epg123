# 03-upgrade-target-frameworks-and-packages — Progress Details

## Summary
Completed target framework retargeting for the remaining legacy scope projects and captured post-retarget validation status.

## Subtasks completed
- `03.01-retarget-mxfxmltvtools`
- `03.02-retarget-tmdb`
- `03.03-retarget-epg123`
- `03.04-validate-retargeting-scope`

## Retargeting outcomes
- `GaRyan2.MxfXmltvTools` retargeted to `net10.0-windows` and builds successfully.
- `GaRyan2.Tmdb` retargeted to `net10.0-windows`; package alignment and warning fixes applied; builds successfully.
- `epg123` retargeted to `net10.0-windows`; package alignment and immediate warning cleanups applied; project builds successfully.

## Additional adjustments during retargeting
- Updated Newtonsoft.Json package versions in retargeted projects to align with dependency graph (`13.0.4`).
- Added `[SupportedOSPlatform("windows")]` metadata in retargeted assemblies where needed.
- Removed obsolete/redundant framework references from SDK-style project files to prevent assembly conflict warnings.
- Replaced obsolete WebClient usage and normalized alias naming in touched files to eliminate build warnings.

## Validation outcome
- Project-level builds for retargeted scope succeed.
- Full solution build still reports cross-target mismatches in other remaining net48 projects outside this task’s scope.

## Files modified (task scope)
- `src/GaRyan2.MxfXmltvTools/GaRyan2.MxfXmltvTools.csproj`
- `src/GaRyan2.MxfXmltvTools/Properties/AssemblyInfo.cs`
- `src/GaRyan2.Tmdb/GaRyan2.Tmdb.csproj`
- `src/GaRyan2.Tmdb/Properties/AssemblyInfo.cs`
- `src/GaRyan2.Tmdb/TmdbApi.cs`
- `src/epg123/epg123.csproj`
- `src/epg123/Properties/AssemblyInfo.cs`
- `src/epg123/sdJson2mxf/*.cs` (targeted warning-remediation edits)
- plus task artifacts under `.github/upgrades/scenarios/dotnet-version-upgrade/tasks/03*`

## Result
Task complete: all intended legacy projects are retargeted to `net10.0-windows`; follow-on work remains in Task 04 and Task 05 for broader solution convergence and final validation.