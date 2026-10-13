# 03.03-upgrade-epg123-gui: Retarget epg123_gui and resolve WinForms/System.Drawing migration issues

# 03.03-upgrade-epg123-gui

## Objective
Retarget `epg123_gui` to modern .NET and address high-volume WinForms/System.Drawing/configuration compatibility issues.

## Scope
- `src/epg123_gui/epg123_gui.csproj`
- GUI project source and designer/resource files impacted by API changes

## Steps
1. Update target framework to `net10.0-windows`.
2. Adjust references/packages for WinForms and compatibility requirements.
3. Resolve compile errors/warnings across GUI source and generated code.
4. Build the GUI project successfully against upgraded dependencies.

## Scope Inventory
- **Project**: `src/epg123_gui/epg123_gui.csproj`
- **Dependencies**: `GaRyan2.Utilities`, `GaRyan2.Github`, `GaRyan2.SchedulesDirect` (already retargeted to `net10.0-windows`)
- **Primary concerns**:
  - Retarget GUI to `net10.0-windows`
  - Remove/replace legacy .NET Framework references and bootstrapper metadata
  - Resolve WinForms/System.Drawing and configuration-related compile issues
  - Eliminate warnings in the upgraded GUI project

## Research Findings
- Assessment proposes `net10.0-windows` with high issue count (6815), mostly WinForms/System.Drawing and legacy configuration generated code.
- Current SDK-style project still contains legacy .NET Framework bootstrapper/publish metadata and explicit framework references.
- Build validation should use full Visual Studio `MSBuild.exe` due to upstream COM interop use in project dependencies.
- Obsolete networking APIs (`WebClient`, `WebRequest`) and thread abort usage (`Thread.Abort`) produce modern framework warnings and require code replacement.

## Execution Notes
- Retargeted `epg123_gui` from `net48` to `net10.0-windows`.
- Removed legacy ClickOnce/bootstrapper and old-framework reference blocks from the project file; kept required linked source/project references.
- Added Windows-compat package references and updated networking/thread code paths to modern equivalents:
  - Replaced `WebClient`/`WebRequest` usage with `HttpClient`-based calls.
  - Replaced `Thread.Abort()` calls with interrupt + timeout logging flow.
  - Renamed lower-case alias `github` to `GitHubApi` to remove language-reserved naming warning.
- Added assembly-level `[SupportedOSPlatform("windows")]` marker for platform analysis alignment.

## Done when
- `epg123_gui` targets `net10.0-windows`.
- Project builds with no errors.
- Major compatibility hotspots identified by assessment are addressed for compilation.
