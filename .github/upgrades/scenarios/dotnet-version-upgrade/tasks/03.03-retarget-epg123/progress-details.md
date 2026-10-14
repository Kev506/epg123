# 03.03-retarget-epg123 — Progress Details

## Summary
Retargeted `epg123` to `net10.0-windows`, aligned package versioning, resolved retarget-time warnings, and validated successful build.

## Changes made
- Updated `src/epg123/epg123.csproj`:
  - `<TargetFramework>net48</TargetFramework>` -> `<TargetFramework>net10.0-windows</TargetFramework>`
  - Updated `Newtonsoft.Json` package version `13.0.2` -> `13.0.4` for dependency alignment.
  - Removed redundant framework `<Reference>` items carried from legacy format (`Microsoft.VisualBasic`, `System.Net.Http`, `System.ServiceProcess`, `System.Web`, `System.Data.DataSetExtensions`, `Microsoft.CSharp`) to avoid assembly resolution warnings under SDK-style net10.
- Updated `src/epg123/Properties/AssemblyInfo.cs`:
  - Added `using System.Runtime.Versioning;`
  - Added `[assembly: SupportedOSPlatform("windows")]`.
- Updated `sdJson2mxf` files to remove CS8981 warning pattern by renaming alias `api` -> `Api` and updating call sites:
  - `sdJson2mxf.cs`, `lineupServices.cs`, `programEntries.cs`, `scheduleEntries.cs`, `mxf2xmltv.cs`, `seriesImages.cs`, `seriesInfos.cs`.
- Replaced obsolete `WebClient` usage in `lineupServices.cs` with `HttpClient` synchronous retrieval pattern to eliminate `SYSLIB0014`.
- Enriched subtask task artifact with research findings.

## Validation
- Built with Visual Studio MSBuild:
  - `MSBuild.exe ...\epg123.csproj /restore /t:Build /p:Configuration=Debug`
- Build succeeded for `epg123` and all referenced projects with no TFM mismatch errors.

## Files modified
- `src/epg123/epg123.csproj`
- `src/epg123/Properties/AssemblyInfo.cs`
- `src/epg123/sdJson2mxf/sdJson2mxf.cs`
- `src/epg123/sdJson2mxf/lineupServices.cs`
- `src/epg123/sdJson2mxf/programEntries.cs`
- `src/epg123/sdJson2mxf/scheduleEntries.cs`
- `src/epg123/sdJson2mxf/mxf2xmltv.cs`
- `src/epg123/sdJson2mxf/seriesImages.cs`
- `src/epg123/sdJson2mxf/seriesInfos.cs`
- `.github/upgrades/scenarios/dotnet-version-upgrade/tasks/03.03-retarget-epg123/task.md`
- `.github/upgrades/scenarios/dotnet-version-upgrade/tasks/03.03-retarget-epg123/progress-details.md`

## Result
Subtask complete: `epg123` is retargeted to `net10.0-windows`; immediate retarget and mismatch issues are resolved.