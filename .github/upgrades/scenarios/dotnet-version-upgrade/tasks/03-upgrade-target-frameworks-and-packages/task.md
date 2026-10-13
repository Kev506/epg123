# 03-upgrade-target-frameworks-and-packages: Retarget legacy projects to .NET 10 with dependency-safe sequencing

Upgrade all remaining net48 projects to modern targets, applying multi-targeting where transitional compatibility is required by dependency order and replacing framework-era package/configuration assumptions as needed. This includes coordinating retargeting across `GaRyan2.MxfXmltvTools`, `GaRyan2.Tmdb`, and `epg123`.

The assessment indicates cross-project compatibility pressure, so this task should preserve dependency order while moving each project to the finalized target framework configuration.

## Scope Inventory

- **Projects to retarget**: `GaRyan2.MxfXmltvTools`, `GaRyan2.Tmdb`, `epg123`
- **Dependency order**: `GaRyan2.MxfXmltvTools` + `GaRyan2.Tmdb` first, then `epg123` (depends on both plus already-modernized libs)
- **Current TFM state**: all three still on `net48`
- **Package management state**: per-project `PackageReference`, no centralized package management

## Research Findings

- `get_project_dependencies` confirms no CPM and local package definitions in project files (`Newtonsoft.Json` where applicable).
- All three projects are SDK-style now, so direct `TargetFramework` retargeting is possible.
- Existing build failures are cross-target compatibility errors (`NU1201`) because net48 projects reference dependencies already at `net10.0-windows`.
- To restore graph compatibility, these three projects must retarget to `net10.0-windows` in dependency-safe sequence.

## Execution Plan

- Break down by project in dependency order to reduce blast radius and keep validation checkpoints clear.
- Retarget and validate `GaRyan2.MxfXmltvTools`.
- Retarget and validate `GaRyan2.Tmdb`.
- Retarget and validate `epg123` once dependency projects are aligned.
- Run scoped validation and document outcomes before completing the parent task.

**Done when**: All scoped legacy projects are retargeted to the intended modern .NET configuration and compile successfully in dependency order.
