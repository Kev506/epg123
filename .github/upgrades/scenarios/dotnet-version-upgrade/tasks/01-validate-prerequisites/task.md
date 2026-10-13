# 01-validate-prerequisites: Validate toolchain and upgrade preconditions

Validate that the local environment is ready for .NET 10 migration work before structural edits begin. This includes confirming installed SDK compatibility, solution-level restore/build baseline capture, and validating that upgrade automation prerequisites are stable for all projects in scope.

This task also establishes the initial quality gate for the remaining migration work so later build failures can be tied to actual migration changes instead of environmental drift.

## Scope Inventory

- **Projects in scope**: `epg123_gui`, `GaRyan2.Utilities`, `GaRyan2.Github`, `GaRyan2.SchedulesDirect`
- **Distinct concerns**: SDK availability, global.json compatibility, baseline solution build health
- **Assessment signals considered**: all projects currently target `net48` and require migration to modern .NET; all are non-SDK-style
- **Loaded skills**: `building-projects` (build orchestration), `managing-target-frameworks` (later-stage TFM work)

## Research Findings

- `validate_dotnet_sdk_installation(net10.0)` returned **Compatible SDK found**.
- `validate_dotnet_sdk_in_globaljson(net10.0, epg123.sln, epg123_gui.csproj)` returned **no global.json config found**.
- Baseline solution validation via `run_build` completed successfully before migration changes.

**Done when**: .NET SDK requirements are confirmed, current solution baseline build status is captured, and the upgrade prerequisites are documented in the task record.
