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

## Done when
- `epg123_gui` targets `net10.0-windows`.
- Project builds with no errors.
- Major compatibility hotspots identified by assessment are addressed for compilation.
