# 04-final-validation-epg123transfer: Run final validation and capture upgrade outcomes

Run final validation for the upgraded scope by building the full solution, fixing remaining warnings in modified projects, and exercising any available automated tests. Document the final state of the migration, including any intentional follow-up work that stays out of scope for this upgrade.

This closes the scenario with a verifiable end state for the application and its dependencies, plus a clear record of anything the user may want to modernize next.

## Scope Inventory

- **Projects affected**: no new production code changes are planned; validation focuses on `src/epg123Transfer/epg123Transfer.csproj` and the solution build state
- **Distinct concerns**: scoped project build verification, full-solution validation, warning review for modified projects, and test discovery
- **Known blockers discovered during validation**: `src/hdhr2mxf/hdhr2mxf.csproj`, `src/epgTray/epgTray.csproj`, and `src/logViewer/logViewer.csproj` still target `.NET Framework 4.8` while referencing libraries already upgraded to `net10.0-windows`

## Research Findings

- `epg123Transfer` now builds successfully on `net10.0-windows` with its upgraded package set and modernized `Program.cs` assembly-resolution logic.
- Full solution validation still fails because unrelated legacy projects outside this scenario's scope reference `GaRyan2.MxfXmltvTools`, `GaRyan2.Utilities`, and `GaRyan2.WmcUtilities`, which already target `net10.0-windows`.
- No dedicated test projects were discovered for the scoped application, so automated test execution is not available as part of this validation pass.
- Because the solution does not build cleanly, the scenario's execution constraint for clean end-state validation is not yet satisfied.

**Done when**: Final validation passes for the upgraded scope, remaining warnings in modified projects are addressed, and upgrade outcomes are documented in task progress details.
