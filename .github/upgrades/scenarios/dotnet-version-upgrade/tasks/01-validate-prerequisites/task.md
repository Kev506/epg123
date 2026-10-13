# 01-validate-prerequisites: Validate SDK and baseline for epg123Transfer scope

Verify the local environment is ready for the `epg123Transfer.csproj` migration to .NET 10, including SDK availability, global.json compatibility, and baseline build behavior in the current mixed-target solution state.

This task captures factual pre-upgrade conditions so downstream errors can be attributed to migration work instead of environment drift.

## Scope Inventory

- **Projects in scope**: `epg123Transfer` (upgrade target), plus referenced dependencies `GaRyan2.MxfXmltvTools`, `GaRyan2.Utilities`, and `GaRyan2.WmcUtilities` already on `net10.0-windows`
- **Distinct concerns**: SDK readiness, global.json gating, baseline compile status across mixed TFMs, and build tool selection for a non-SDK WinForms project
- **Assessment signals considered**: `epg123Transfer` is a non-SDK `net48` WinForms project with SDK-style conversion and target framework retargeting required; the assessment reported 765 API issues concentrated in Windows Forms and `System.Drawing`
- **Loaded skills**: `building-projects` for build-tool and baseline validation behavior

## Research Findings

- `validate_dotnet_sdk_installation(net10.0)` returned **Compatible SDK found**.
- `validate_dotnet_sdk_in_globaljson(net10.0, epg123.sln, epg123Transfer.csproj)` returned **Success: no global.json config found**.
- The build path for `epg123Transfer` should stay on Visual Studio/`msbuild.exe` style tooling until conversion because it is a non-SDK WinForms project with resources.
- Baseline solution build (`run_build`) **failed** before migration edits with expected cross-target reference errors because `epg123Transfer` still targets `net48` while its referenced projects target `net10.0-windows`.
- The failing project references are `GaRyan2.MxfXmltvTools`, `GaRyan2.Utilities`, and `GaRyan2.WmcUtilities`, confirming that retargeting the legacy desktop app is required to restore compatibility.

**Done when**: SDK prerequisites are confirmed and baseline restore/build outcomes are documented for the scoped project and solution context.
