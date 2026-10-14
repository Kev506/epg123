# 02-convert-legacy-projects-to-sdk-style: Convert legacy projects to SDK-style without changing TFMs

Convert the legacy non-SDK projects that still target net48 (`epg123`, `GaRyan2.MxfXmltvTools`, and `GaRyan2.Tmdb`) to SDK-style while preserving their current target framework during this task. The assessment flags this as required before TFM migration.

This task is structural only (project-system modernization and package reference shape), intentionally separated from framework retargeting to isolate risk.

## Scope Inventory

- **Projects requiring conversion**: `src/GaRyan2.MxfXmltvTools/GaRyan2.MxfXmltvTools.csproj`, `src/GaRyan2.Tmdb/GaRyan2.Tmdb.csproj`, `src/epg123/epg123.csproj`
- **Projects already SDK-style in this dependency chain**: `GaRyan2.Utilities`, `GaRyan2.Github`, `GaRyan2.SchedulesDirect`
- **Concern groups**:
  1. Structural csproj conversion only (no TFM changes)
  2. Buildability validation per converted project
  3. packages.config removal verification

## Research Findings

- Topological project order from `get_projects_in_topological_order` places conversion targets as:
  1. `GaRyan2.MxfXmltvTools`
  2. `GaRyan2.Tmdb`
  3. `epg123`
- `grep_search` confirmed non-SDK project signatures (`<Project ToolsVersion=...>`) in all three target projects.
- `converting-to-sdk-style` skill requires:
  - use dedicated conversion tool (`convert_project_to_sdk_style`) project-by-project (no parallel calls),
  - build each converted project immediately,
  - stop on unresolved blocker before proceeding downstream.

## Execution Plan

- Break down into project-level subtasks to reduce failure blast radius and enforce ordered checkpoints.
- Convert and validate each project in dependency-safe order.
- Conclude with a scoped validation subtask confirming all three projects are SDK-style and no `packages.config` remains for converted targets.

**Done when**: All scoped legacy projects are SDK-style and the solution still restores/builds on the pre-upgrade framework targets.
