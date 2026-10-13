# 03.04-validate-upgraded-scope: Validate upgraded project set builds cleanly together

# 03.04-validate-upgraded-scope

## Objective
Run cross-project validation for the full upgraded scope after all retargeting and compatibility fixes.

## Scope
- Full solution build verification for impacted projects
- Test discovery/execution for relevant tests, if available

## Steps
1. Build the solution/workspace after upgrades.
2. Run relevant tests for impacted projects if test projects are present.
3. Resolve any final cross-project errors/warnings.

## Scope Inventory
- **Impacted upgraded projects**:
  - `src/GaRyan2.Utilities/GaRyan2.Utilities.csproj`
  - `src/GaRyan2.Github/GaRyan2.Github.csproj`
  - `src/GaRyan2.SchedulesDirect/GaRyan2.SchedulesDirect.csproj`
  - `src/epg123_gui/epg123_gui.csproj`
- **Validation focus**:
  - Confirm dependency chain builds together on upgraded TFMs
  - Confirm no warnings remain in upgraded project set
  - Confirm test-project availability for scoped projects

## Research Findings
- No test projects were discovered for the scoped upgraded projects (`discover_test_projects` returned no matches).
- Build validation therefore focuses on project and workspace compilation health for the upgraded scope.

## Done when
- Upgraded scope builds successfully end-to-end.
- Relevant tests pass or are documented if unavailable.
- Task evidence is captured for parent task completion.
