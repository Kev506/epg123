# 02.02-convert-tmdb — Progress Details

## Summary
Converted `GaRyan2.Tmdb.csproj` to SDK-style and migrated project package metadata while preserving net48.

## Changes made
- Ran `convert_project_to_sdk_style` for `src/GaRyan2.Tmdb/GaRyan2.Tmdb.csproj`.
- Updated subtask `task.md` with project-specific research and scoped done criteria.
- Removed legacy `src/GaRyan2.Tmdb/packages.config` after confirming package migration into the project file.

## Validation
- Confirmed project file now uses SDK-style root: `<Project Sdk="Microsoft.NET.Sdk">`.
- Confirmed target framework remains `net48`.
- Confirmed `Newtonsoft.Json` dependency now appears as `<PackageReference Include="Newtonsoft.Json" Version="13.0.2" />`.
- Attempted build of `src/GaRyan2.Tmdb/GaRyan2.Tmdb.csproj`.

## Build outcome
- Build remains blocked by known cross-target mismatch (`NU1201`): net48 projects currently reference dependencies already at `net10.0-windows`.
- No new conversion-format errors were introduced.

## Files modified
- `src/GaRyan2.Tmdb/GaRyan2.Tmdb.csproj`
- `src/GaRyan2.Tmdb/packages.config` (deleted)
- `.github/upgrades/scenarios/dotnet-version-upgrade/tasks/02.02-convert-tmdb/task.md`
- `.github/upgrades/scenarios/dotnet-version-upgrade/tasks/02.02-convert-tmdb/progress-details.md`

## Result
Subtask complete: SDK-style conversion and package-format migration succeeded; remaining build failure is a known framework retargeting dependency issue.