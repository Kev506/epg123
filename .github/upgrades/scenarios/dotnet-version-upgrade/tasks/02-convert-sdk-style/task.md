# 02-convert-sdk-style: Convert legacy project files to SDK-style

Convert all non-SDK-style projects in scope (`GaRyan2.Utilities`, `GaRyan2.Github`, `GaRyan2.SchedulesDirect`, and `epg123_gui`) to SDK-style while keeping the existing target framework during this phase. The assessment flagged all projects as classic format, and conversion is required before target framework upgrades can be applied safely.

This task focuses only on project-system modernization (csproj shape and package reference model) and explicitly excludes target framework migration to isolate risk and simplify rollback.

**Done when**: All scoped projects are SDK-style, no conversion regressions remain, and the solution builds on the pre-upgrade framework after conversion.
