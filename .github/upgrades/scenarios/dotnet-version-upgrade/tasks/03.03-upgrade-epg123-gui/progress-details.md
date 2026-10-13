# 03.03-upgrade-epg123-gui Progress Details

## Summary
Retargeted the WinForms GUI project to .NET 10 (Windows) and resolved compile/warning blockers from obsolete networking/thread APIs.

## Files modified
- `src/epg123_gui/epg123_gui.csproj`
- `src/epg123_gui/Properties/AssemblyInfo.cs`
- `src/epg123_gui/frmMain.cs`
- `src/epg123_gui/frmLogos.cs`
- `.github/upgrades/scenarios/dotnet-version-upgrade/tasks/03.03-upgrade-epg123-gui/task.md`

## What changed
- Changed TFM: `net48` → `net10.0-windows`.
- Project file modernization for runtime compatibility:
  - Removed legacy bootstrapper/ClickOnce-era framework metadata carried from .NET Framework.
  - Added `Microsoft.Windows.Compatibility` and `System.ServiceProcess.ServiceController` package references.
  - Removed unnecessary `System.Configuration.ConfigurationManager` package after `NU1510` warning indicated it is auto-provided.
- Warning and compatibility fixes in source:
  - Replaced obsolete `WebClient` and `WebRequest` usage with `HttpClient`-based helpers/flows.
  - Replaced obsolete `Thread.Abort()` calls with interrupt + join timeout and warning logging.
  - Renamed alias `github` to `GitHubApi` to remove `CS8981` warning.
  - Added `[assembly: SupportedOSPlatform("windows")]` in `AssemblyInfo.cs`.

## Validation
- Built `epg123_gui.csproj` with Visual Studio `MSBuild.exe` (`/restore /t:Build /p:Configuration=Release /v:minimal`).
- Build output succeeded and no warnings remained for the project build output.

## Done-when verification
- `epg123_gui` targets `net10.0-windows`: ✅
- Project builds with no errors: ✅
- Major compatibility hotspots addressed for compilation: ✅
