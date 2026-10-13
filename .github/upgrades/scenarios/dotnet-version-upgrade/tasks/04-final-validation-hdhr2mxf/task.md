# 04-final-validation-hdhr2mxf: Run scoped and solution validation

## Objective
Validate the `hdhr2mxf` upgrade outcome with project-level and solution-level builds, and record any remaining blockers.

## Scope Inventory
- **Projects affected**: validation-only task; no product code changes required.
- **Distinct concerns**: scoped build verification, full-solution compatibility check, test-project discovery.

## Validation Findings
- Scoped build for `src/hdhr2mxf/hdhr2mxf.csproj`: **passed**.
- Full solution build for `src/epg123.sln`: **failed** due to an existing out-of-scope project mismatch:
  - `src/logViewer/logViewer.csproj` remains `.NET Framework 4.8` and references `GaRyan2.Utilities` now on `net10.0-windows`.
- Test project discovery returned no test projects in current solution scope.

## Done When
- Scoped `hdhr2mxf` build passes after retargeting.
- Full solution build is attempted and outcomes are documented.
- Any remaining blockers are clearly recorded for follow-up scope decisions.
