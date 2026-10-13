# 01-validate-prerequisites: Validate SDK and baseline build state

Verify the local environment is ready for the `epg123.csproj` migration to .NET 10, including SDK availability, global.json compatibility, and baseline build behavior for the current mixed-target solution state.

This task establishes factual pre-upgrade conditions so downstream build failures can be attributed to migration changes rather than environment drift.

## Scope Inventory

- **Projects in scope**: `epg123`, `GaRyan2.MxfXmltvTools`, `GaRyan2.Tmdb` (upgrade targets), plus referenced dependencies already on `net10.0-windows`
- **Distinct concerns**: SDK readiness, global.json gating, baseline compile status in mixed-TFM graph
- **Assessment signals considered**: 3 legacy non-SDK net48 projects remain; root app references already-upgraded dependencies
- **Loaded skills**: `building-projects` for build orchestration and failure interpretation

## Research Findings

- `validate_dotnet_sdk_installation(net10.0)` returned **Compatible SDK found**.
- `validate_dotnet_sdk_in_globaljson(net10.0, epg123.sln, epg123.csproj)` returned **Success: no global.json config found**.
- Baseline solution build (`run_build`) **failed** before migration edits due to a cross-TFM reference mismatch: `epg123` (net48) references `GaRyan2.Utilities` (`net10.0-windows`).
- This baseline failure is expected given the partially upgraded state and confirms the need for coordinated retargeting in subsequent tasks.

**Done when**: SDK prerequisites are confirmed and baseline restore/build outcomes are documented for the scoped solution.
