# 04-final-validation-epgtray: Run scoped and solution validation and capture outcomes

Perform final validation after `epgTray` migration changes: confirm upgraded project builds cleanly, check for warnings in modified files/projects, attempt broader solution validation, and record resulting scope boundaries.

## Scope Inventory

- **Projects in scope**: `epgTray` (primary validated output), plus dependency build visibility for `GaRyan2.Utilities`
- **Distinct concerns**: warning-free project build on target TFM, repository-level validation signal, and documentation of any out-of-scope blockers
- **Inputs from prior tasks**: SDK-style conversion complete; TFM now `net10.0-windows`; named pipe/API compatibility fixes applied; package downgrade resolved

## Research Findings

- Prior targeted MSBuild validation succeeded for `epgTray` on `net10.0-windows`.
- Repository still contains other legacy projects (`epg123Transfer` on `net48`) that are known to produce solution-wide reference compatibility failures unrelated to this scope.
- `run_build` in this workspace reports these broader solution failures even when project-scoped paths are provided, so final validation must distinguish scoped success from pre-existing out-of-scope failures.

## Planned Validation

- Run targeted Visual Studio MSBuild for `src/epgTray/epgTray.csproj` and confirm zero warnings/errors.
- Run solution-level build signal and compare failure signatures to known baseline.
- Check for discovered test projects; run tests if applicable.
- Document final upgraded state and remaining out-of-scope follow-up.

**Done when**: epgTray scoped validation succeeds warning-free on `net10.0-windows`, solution-level validation signal is captured with baseline comparison, and final outcomes/follow-up notes are documented.
