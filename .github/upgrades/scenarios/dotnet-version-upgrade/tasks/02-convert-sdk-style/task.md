# 02-convert-sdk-style: Convert legacy project files to SDK-style

Convert all non-SDK-style projects in scope (`GaRyan2.Utilities`, `GaRyan2.Github`, `GaRyan2.SchedulesDirect`, and `epg123_gui`) to SDK-style while keeping the existing target framework during this phase. The assessment flagged all projects as classic format, and conversion is required before target framework upgrades can be applied safely.

This task focuses only on project-system modernization (csproj shape and package reference model) and explicitly excludes target framework migration to isolate risk and simplify rollback.

## Scope Inventory

- **Projects affected**:
  - `src/GaRyan2.Utilities/GaRyan2.Utilities.csproj`
  - `src/GaRyan2.SchedulesDirect/GaRyan2.SchedulesDirect.csproj`
  - `src/GaRyan2.Github/GaRyan2.Github.csproj`
  - `src/epg123_gui/epg123_gui.csproj`
- **Distinct concerns**:
  - Legacy-to-SDK project conversion (no TFM changes)
  - Build validation per project immediately after conversion
  - Verify `packages.config` removal as part of conversion
- **Dependency/topological order source**: `get_projects_in_topological_order`
  - Scoped conversion order: `GaRyan2.Utilities` → `GaRyan2.SchedulesDirect` → `GaRyan2.Github` → `epg123_gui`
- **Assessment signals (per project)**:
  - `GaRyan2.Utilities`: 664 issues; includes `Project.0001` (SDK-style required)
  - `GaRyan2.SchedulesDirect`: 20 issues; includes `Project.0001` (SDK-style required)
  - `GaRyan2.Github`: 3 issues; includes `Project.0001` (SDK-style required)
  - `epg123_gui`: 6815 issues; includes `Project.0001` (SDK-style required)
- **Loaded skills**:
  - `converting-to-sdk-style`
  - `building-projects`

## Research Findings

- Conversion will be done with `convert_project_to_sdk_style` **sequentially** (one project at a time).
- Validation approach:
  - Build each converted project immediately after conversion (using MSBuild-compatible flow for net48 SDK-style projects).
  - Run solution build after all four projects convert.
- Conversion constraints:
  - Keep existing target frameworks unchanged during this task.
  - Do not perform package version upgrades in this task.

## Execution Notes

- Converted projects in dependency order:
  1. `GaRyan2.Utilities`
  2. `GaRyan2.SchedulesDirect`
  3. `GaRyan2.Github`
  4. `epg123_gui`
- `dotnet build` on converted `GaRyan2.Utilities` failed with `MSB4803` (COM reference task not supported by .NET Core MSBuild); switched validation to Visual Studio `MSBuild.exe` for converted `net48` projects.
- Added missing framework reference `<Reference Include="WindowsBase" />` to `GaRyan2.Utilities.csproj` to restore `System.IO.Packaging` types required by existing code.
- Removed leftover `packages.config` files after conversion in:
  - `src/GaRyan2.SchedulesDirect/packages.config`
  - `src/GaRyan2.Github/packages.config`

**Done when**: All scoped projects are SDK-style, no conversion regressions remain, and the solution builds on the pre-upgrade framework after conversion.
