# 03.01-upgrade-utilities: Retarget GaRyan2.Utilities and resolve first-wave compatibility issues

# 03.01-upgrade-utilities

## Objective
Retarget `GaRyan2.Utilities` from `net48` to `net10.0-windows` and fix build errors introduced by the framework change.

## Scope
- `src/GaRyan2.Utilities/GaRyan2.Utilities.csproj`
- Utility source files failing after retarget

## Steps
1. Update target framework to `net10.0-windows`.
2. Add/adjust package and framework references required for build on modern .NET.
3. Resolve compile errors and warnings in this project.
4. Build `GaRyan2.Utilities` successfully.

## Scope Inventory
- **Project**: `src/GaRyan2.Utilities/GaRyan2.Utilities.csproj`
- **Dependencies**: none within scoped upgrade set (foundation library)
- **Dependents**: `GaRyan2.Github`, `GaRyan2.SchedulesDirect`, `epg123_gui`
- **Primary concerns**: target framework retarget, Windows compatibility APIs, package baseline updates, compile warning cleanup

## Research Findings
- Assessment proposes `net10.0-windows` for this project.
- Assessment reports `Project.0002` plus significant API changes (ServiceController, System.IO.Packaging, WinForms/System.Drawing).
- `Newtonsoft.Json` package was flagged for upgrade recommendation.
- The project currently builds on `net48` after SDK-style conversion with explicit `WindowsBase` reference.
- Build tool decision for migration validation: use full Visual Studio `MSBuild.exe` because the project relies on COM interop (`TaskScheduler` COM reference).

## Execution Notes
- Retargeted `GaRyan2.Utilities` from `net48` to `net10.0-windows`.
- Replaced legacy framework references with modern package references (`Microsoft.Windows.Compatibility`, `System.ServiceProcess.ServiceController`) and updated `Newtonsoft.Json` to `13.0.4`.
- Preserved `TaskScheduler` interop through COM reference for compatibility with existing scheduler integration code.
- Added assembly-level `[SupportedOSPlatform("windows")]` marker to align platform analysis with Windows-only target.
- Removed obsolete `ServicePointManager` usage in `BaseAPIClass.Initialize()` to clear `SYSLIB0014` warnings.

## Done when
- Project targets `net10.0-windows`.
- Project builds with no errors.
- No unresolved migration warnings remain in this project.
