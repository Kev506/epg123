# 01-upgrade-logviewer-to-net10: Upgrade logViewer project to .NET 10

Upgrade `src/logViewer/logViewer.csproj` by converting it from classic non-SDK format to SDK-style, retargeting to `net10.0-windows`, and remediating compatibility issues required for successful WinForms compilation on modern .NET. This includes handling legacy configuration/settings patterns and any API adjustments required after retargeting.

Validation for this task includes both scoped and solution-level builds, with warnings in modified projects treated as actionable and resolved before completion.

## Research Notes

Assessment has been performed on `logViewer.csproj`, confirming it as a classic non-SDK WinForms project targeting `net48`. The necessary project-level actions identified are: `Project.0001` for SDK-style conversion, and `Project.0002` for retargeting the framework. The primary areas of incompatibility are related to WinForms (`Api.0001` binary incompatibilities) and legacy settings/configuration (`Api.0002`), mainly located in `Properties/Settings.Designer.cs`. No NuGet package upgrades are required; the focus is on updating the project format/TFM and runtime configuration APIs.

## Scope Inventory

- **Projects affected**: `src/logViewer/logViewer.csproj`.
- **Dependency touchpoints**: Project reference to `src/GaRyan2.Utilities/GaRyan2.Utilities.csproj`, which is already updated to `net10.0-windows`.
- **Expected files to update**: `src/logViewer/logViewer.csproj`, and potentially `src/logViewer/Properties/Settings.Designer.cs` if there are compatibility issues with the configuration API that need to be addressed.
- **Validation plan**: Initiate with a project-level build, followed by a full solution build; ensure all warnings in modified projects are resolved before considering the task complete.

**Done when**: `logViewer.csproj` is SDK-style, targets `net10.0-windows`, builds cleanly without errors, and the solution build succeeds with no unresolved warnings in modified projects.
