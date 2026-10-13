# 03-upgrade-epg123transfer-to-net10: Retarget epg123Transfer to modern .NET and resolve compatibility issues

Retarget `epg123Transfer` to a Windows-specific modern .NET target, align package and framework references for WinForms on modern .NET, and address the assessment's 765 reported API issues. The work will need to account for heavy Windows Forms usage, `System.Drawing` compatibility, legacy configuration behavior, and Windows-only assemblies referenced by the application.

This is the core migration task. It combines project-level retargeting with code and configuration remediation so the app can compile and run on the new framework without leaving deferred compatibility stubs behind.

## Scope Inventory

- **Projects affected**: `src/epg123Transfer/epg123Transfer.csproj` and its code/config files
- **Distinct concerns**: target framework retargeting, package/reference cleanup, WinForms/resource compatibility, and API fixes required for modern .NET
- **Referenced modern projects**: `GaRyan2.MxfXmltvTools`, `GaRyan2.Utilities`, and `GaRyan2.WmcUtilities` already target `net10.0-windows`
- **Key files likely in scope**: `Program.cs`, `frmTransfer.cs`, `frmTransfer.Designer.cs`, `Properties/Settings.Designer.cs`, `app.config`, and the SDK-style project file

## Research Findings

- The project now uses SDK-style format but still needs retargeting from `net48` to a Windows-specific modern TFM so it can consume the already-upgraded project references.
- `Program.cs` uses `Assembly.ReflectionOnlyLoad(...).GlobalAssemblyCache`, which is not supported on modern .NET and must be replaced as part of the migration.
- The project still relies on desktop-only resources (`.resx`, icons, WinForms designer files), so validation should continue to use Visual Studio/MSBuild-oriented builds for reliable resource processing.
- `Properties/Settings.Designer.cs` depends on `System.Configuration.ApplicationSettingsBase`, so the project needs the `System.Configuration.ConfigurationManager` package after moving off .NET Framework.
- The project has no source-level usage of `System.Web` or `System.Deployment`, so legacy framework references can be dropped in favor of the modern WinForms plus compatibility package set.

**Done when**: `epg123Transfer` targets modern .NET for Windows, the required compatibility/package updates are applied, assessment-driven code issues are resolved inline, and the upgraded project builds cleanly.
