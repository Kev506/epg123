# 01-validate-prerequisites: Validate SDK and baseline for tokenServer scope

Verify the local environment is ready for the `epg123Server.csproj` migration to .NET 10, including SDK availability, global.json compatibility, and baseline build behavior in the current mixed-target solution state.

This task captures factual pre-upgrade conditions so downstream errors can be attributed to migration work instead of environment drift.

## Scope Inventory

- **Projects in scope**: `tokenServer` (upgrade target), plus referenced dependencies `GaRyan2.Github` and `GaRyan2.Utilities` already on `net10.0-windows`
- **Distinct concerns**: SDK readiness, global.json gating, baseline compile status across mixed TFMs
- **Assessment signals considered**: `epg123Server` is a non-SDK `net48` project with conversion + TFM retargeting required
- **Loaded skills**: `building-projects` for build-tool and baseline validation behavior

## Research Findings

- `validate_dotnet_sdk_installation(net10.0)` returned **Compatible SDK found**.
- `validate_dotnet_sdk_in_globaljson(net10.0, epg123.sln, epg123Server.csproj)` returned **Success: no global.json config found**.
- Baseline solution build (`run_build`) **failed** before migration edits with expected cross-TFM reference errors (`net48` projects cannot reference `net10.0-windows` projects).
- This baseline failure confirms that retargeting legacy `net48` projects (including `epg123Server`) is required to restore compatibility.

**Done when**: SDK prerequisites are confirmed and baseline restore/build outcomes are documented for the scoped project and solution context.
