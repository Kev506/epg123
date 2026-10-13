# 03.02-retarget-tmdb — Progress Details

## Summary
Retargeted `GaRyan2.Tmdb` from `net48` to `net10.0-windows`, resolved package compatibility and code warning issues, and validated a clean project build.

## Changes made
- Updated `src/GaRyan2.Tmdb/GaRyan2.Tmdb.csproj`:
  - `<TargetFramework>net48</TargetFramework>` -> `<TargetFramework>net10.0-windows</TargetFramework>`
  - Removed redundant framework references (`System.Data.DataSetExtensions`, `Microsoft.CSharp`, `System.Net.Http`) to avoid assembly conflict warnings.
  - Updated `Newtonsoft.Json` package reference from `13.0.2` to `13.0.4` to resolve transitive package downgrade (`NU1605`) caused by dependency on `GaRyan2.Utilities`.
- Updated `src/GaRyan2.Tmdb/Properties/AssemblyInfo.cs`:
  - Added `using System.Runtime.Versioning;`
  - Added `[assembly: SupportedOSPlatform("windows")]`.
- Updated `src/GaRyan2.Tmdb/TmdbApi.cs`:
  - Initialized `IncludeAdultTitles` field to remove `CS0649` warning.
- Enriched subtask record with research findings.

## Validation
- Built project with Visual Studio MSBuild:
  - `MSBuild.exe ...\GaRyan2.Tmdb.csproj /restore /t:Build /p:Configuration=Debug`
- Build succeeded with no errors/warnings for the retargeted project.

## Files modified
- `src/GaRyan2.Tmdb/GaRyan2.Tmdb.csproj`
- `src/GaRyan2.Tmdb/Properties/AssemblyInfo.cs`
- `src/GaRyan2.Tmdb/TmdbApi.cs`
- `.github/upgrades/scenarios/dotnet-version-upgrade/tasks/03.02-retarget-tmdb/task.md`
- `.github/upgrades/scenarios/dotnet-version-upgrade/tasks/03.02-retarget-tmdb/progress-details.md`

## Result
Subtask complete: `GaRyan2.Tmdb` is now on `net10.0-windows` and builds cleanly.