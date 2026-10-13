# 02-convert-legacy-projects-to-sdk-style — Progress Details

## Summary
Completed SDK-style conversion for all legacy net48 projects in scope: `GaRyan2.MxfXmltvTools`, `GaRyan2.Tmdb`, and `epg123`.

## Subtasks completed
- `02.01-convert-mxfxmltvtools`
- `02.02-convert-tmdb`
- `02.03-convert-epg123`
- `02.04-validate-sdk-conversion-scope`

## Project conversion outcomes
- All three target projects now use SDK-style project files.
- `packages.config` cleanup completed where applicable:
  - `src/GaRyan2.Tmdb/packages.config` removed
  - `src/epg123/packages.config` removed
- Package references were migrated into project files without changing target frameworks in this task.

## Validation outcome
- Project and solution builds were attempted after conversion.
- Current build failures are known and expected at this stage due to remaining cross-target mismatch (`net48` projects still referencing dependencies already on `net10.0-windows`).
- No conversion-structure regressions were introduced.

## Files modified (task scope)
- `src/GaRyan2.MxfXmltvTools/GaRyan2.MxfXmltvTools.csproj`
- `src/GaRyan2.Tmdb/GaRyan2.Tmdb.csproj`
- `src/GaRyan2.Tmdb/packages.config` (deleted)
- `src/epg123/epg123.csproj`
- `src/epg123/packages.config` (deleted)
- `.github/upgrades/scenarios/dotnet-version-upgrade/tasks/02-convert-legacy-projects-to-sdk-style/task.md`
- `.github/upgrades/scenarios/dotnet-version-upgrade/tasks/02-convert-legacy-projects-to-sdk-style/progress-details.md`
- plus subtask task/progress artifact files under `.github/upgrades/scenarios/dotnet-version-upgrade/tasks/02.*`

## Result
Task complete: SDK-style conversion gate is satisfied and the workflow is ready for target framework retargeting (Task 03).