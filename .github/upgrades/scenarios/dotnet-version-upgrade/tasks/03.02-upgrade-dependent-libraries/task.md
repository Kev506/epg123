# 03.02-upgrade-dependent-libraries: Retarget GaRyan2.Github and GaRyan2.SchedulesDirect on top of upgraded utilities

# 03.02-upgrade-dependent-libraries

## Objective
Retarget dependency-layer libraries that consume `GaRyan2.Utilities` and resolve compatibility breaks.

## Scope
- `src/GaRyan2.Github/GaRyan2.Github.csproj`
- `src/GaRyan2.SchedulesDirect/GaRyan2.SchedulesDirect.csproj`
- Related source files and package references

## Steps
1. Retarget both projects to modern .NET (windows-targeted where required).
2. Update package references and framework references to supported equivalents.
3. Resolve compile errors/warnings introduced by retargeting.
4. Build both projects successfully.

## Scope Inventory
- **Projects**:
  - `src/GaRyan2.Github/GaRyan2.Github.csproj`
  - `src/GaRyan2.SchedulesDirect/GaRyan2.SchedulesDirect.csproj`
- **Dependency context**: both projects depend on `GaRyan2.Utilities`, which now targets `net10.0-windows`.
- **Concerns**:
  - Retarget TFMs and align references/packages
  - Remove legacy framework-only references (for example, `System.Web`)
  - Ensure project references remain compatible with upgraded utilities library

## Research Findings
- Assessment proposes:
  - `GaRyan2.Github` → `net10.0`
  - `GaRyan2.SchedulesDirect` → `net10.0-windows`
- Both projects have `Project.0002` (TFM update required).
- Both projects include `Newtonsoft.Json` and were flagged for upgrade to `13.0.4`.
- `GaRyan2.SchedulesDirect` has WinForms APIs and currently includes `System.Web` reference that is not valid on modern .NET.
- Because both projects reference `GaRyan2.Utilities` (now `net10.0-windows`), both dependents must be windows-targeted for TFM compatibility.

## Execution Notes
- Retargeted both projects to `net10.0-windows`.
- Updated `Newtonsoft.Json` to `13.0.4` in both projects.
- Removed legacy framework-only reference usage in `GaRyan2.SchedulesDirect` (notably `System.Web`) and added `Microsoft.Windows.Compatibility` support package.
- Added assembly-level `[SupportedOSPlatform("windows")]` attributes for both libraries to satisfy platform analysis under windows-targeted TFMs.
- Validated both projects build cleanly against upgraded `GaRyan2.Utilities`.

## Done when
- Both projects target modern TFMs compatible with the selected strategy.
- Both projects build without errors.
- Referencing `GaRyan2.Utilities` remains valid on upgraded TFMs.
