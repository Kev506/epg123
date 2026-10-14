# 03-upgrade-target-framework-and-code: Upgrade TFMs and resolve API compatibility issues

Upgrade project target frameworks to modern .NET (Windows-targeted where required), then resolve breaking API usage identified in the assessment, with priority on WinForms and System.Drawing compatibility hotspots. This task includes dependency-ordered execution within the task scope so foundational libraries are stabilized before the GUI application.

Assessment signals indicate high API churn and broad impact across multiple files, so this task includes iterative compile/fix loops until all affected projects are restored to a working build state on the new target framework.

## Scope Inventory

- **Projects affected**:
  - `src/GaRyan2.Utilities/GaRyan2.Utilities.csproj`
  - `src/GaRyan2.Github/GaRyan2.Github.csproj`
  - `src/GaRyan2.SchedulesDirect/GaRyan2.SchedulesDirect.csproj`
  - `src/epg123_gui/epg123_gui.csproj`
- **Dependency tiers from assessment graph**:
  - Level 0: `GaRyan2.Utilities`
  - Level 1: `GaRyan2.Github`, `GaRyan2.SchedulesDirect`
  - Level 2: `epg123_gui`
- **Distinct concerns**:
  - Retarget each project from `net48` to modern .NET (windows-targeted where required)
  - Fix package/framework references and API breaks per project
  - Build stabilization after each dependency tier
- **Assessment signals**:
  - `GaRyan2.Utilities`: 664 issues (`Project.0002`, API+package migration)
  - `GaRyan2.Github`: 3 issues (`Project.0002` + package)
  - `GaRyan2.SchedulesDirect`: 20 issues (`Project.0002`, API+package migration)
  - `epg123_gui`: 6815 issues (`Project.0002` + extensive WinForms/System.Drawing/configuration API changes)

## Decomposition Decision

This task is decomposed due to multi-project dependency ordering, very large API-change surface in `epg123_gui`, and high failure blast radius if all retargeting/fixes are attempted atomically.

**Done when**: All scoped projects target the intended modern TFM set, compatibility changes are applied, and upgraded projects build cleanly with no unresolved migration blockers.
