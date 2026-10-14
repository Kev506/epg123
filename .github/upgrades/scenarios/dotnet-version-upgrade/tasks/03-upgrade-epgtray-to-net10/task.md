# 03-upgrade-epgtray-to-net10: Retarget epgTray to net10.0-windows and remediate API breaks

Retarget `src/epgTray/epgTray.csproj` from `.NET Framework 4.8` to `.NET 10` for Windows and apply required compatibility changes so the application compiles on modern .NET.

This task is the migration core: project retargeting, package/compatibility alignment, and focused code fixes for the current compile/runtime contract.

## Scope Inventory

- **Projects in scope**: `epgTray` (primary), with validation against referenced modern projects `GaRyan2.Utilities`, `GaRyan2.MxfXmltvTools`, and `GaRyan2.WmcUtilities`
- **Distinct concerns**: target framework retargeting, legacy settings/config support, WinForms/system APIs on modern .NET, and process-launch/runtime compatibility behavior
- **Assessment signals considered**: `Project.0002` TFM change required; 294 issues total (249 mandatory binary incompatibilities + 43 potential source incompatibilities); issue concentration in `trayApplication.cs`, `Program.cs`, `Properties/Settings.Designer.cs`, and `Properties/Resources.Designer.cs`
- **Technology features detected**: WinForms, System.Drawing, legacy configuration/settings APIs, Windows ACL usage

## Research Findings

- Current project is SDK-style but still targets `net48`; references to modern `net10.0-windows` projects fail restore/build until retargeted.
- `Properties/Settings.Designer.cs` derives from `System.Configuration.ApplicationSettingsBase`, requiring modern configuration compatibility support.
- `trayApplication.cs` uses Windows-only APIs (registry, named pipes with security, WinForms tray UI), aligned with a Windows-targeted TFM and compatibility-pack strategy.
- `Process.Start(string)` calls are present for launching URLs/files and may need modernized `ProcessStartInfo` usage for robust behavior on modern .NET.

## Planned Edits

- Retarget `epgTray` to `net10.0-windows` in project file.
- Add compatibility package references for selected migration options (`Microsoft.Windows.Compatibility`) and legacy settings/config usage (`System.Configuration.ConfigurationManager`).
- Apply any immediate compile-time code adjustments discovered by build output.
- Build/fix iteratively until project compiles without warnings.

**Done when**: `epgTray` targets `net10.0-windows`, required compatibility/package updates are applied, compile/runtime compatibility issues found during build are resolved inline, and the project builds cleanly.
