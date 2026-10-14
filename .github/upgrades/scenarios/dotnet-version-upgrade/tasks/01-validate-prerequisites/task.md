# 01-validate-prerequisites: Validate SDK and baseline for epgTray scope

Verify the local environment is ready for the `epgTray.csproj` migration to .NET 10, including SDK availability, global.json compatibility, and baseline build behavior before structural project conversion.

This task captures the pre-upgrade state so downstream migration issues can be attributed correctly.

## Scope Inventory

- **Projects in scope**: `epgTray` (upgrade target), plus referenced projects that already target modern .NET (`GaRyan2.Utilities`, `GaRyan2.MxfXmltvTools`, `GaRyan2.WmcUtilities`)
- **Distinct concerns**: SDK readiness, global.json constraints, baseline compatibility failures, and build-tool decision for a classic WinForms project
- **Assessment signals considered**: `epgTray` is a non-SDK `net48` WinForms project with 292 compatibility issues (249 binary + 43 source) and a proposed target of `net10.0-windows`
- **Loaded skills**: `building-projects` for selecting/validating build behavior during migration

## Research Findings

- `validate_dotnet_sdk_installation(net10.0)` returned **Compatible SDK found**.
- `validate_dotnet_sdk_in_globaljson(net10.0, epg123.sln, epgTray.csproj)` returned **Success: no global.json config found**.
- Baseline build for `src/epgTray/epgTray.csproj` failed prior to migration due to expected cross-target project-reference incompatibility (`net48` cannot reference `net10.0-windows` dependencies).
- The baseline errors confirmed this migration dependency mismatch for references to `GaRyan2.MxfXmltvTools`, `GaRyan2.Utilities`, and `GaRyan2.WmcUtilities`.
- Build tool decision for migration flow: use Visual Studio build/`run_build` for this WinForms/resource-heavy project and re-validate after conversion and retargeting.

**Done when**: SDK prerequisites are confirmed and baseline build outcomes are documented for the scoped project and solution context.
