# 02.03-convert-epg123: Convert epg123 to SDK-style and validate build

## Objective
Convert `src/epg123/epg123.csproj` to SDK-style without changing target framework values.

## Scope
- Run `convert_project_to_sdk_style` for this project only after 02.02 succeeds.
- Preserve net48 targeting during conversion.
- Build the converted project and resolve conversion-only issues.

## Research Findings
- Project is currently legacy format (`<Project ToolsVersion="14.0" ...>`) with WinForms/Desktop settings and `packages.config`.
- Project targets `.NETFramework,Version=v4.8` and references already-upgraded projects (`GaRyan2.Utilities`, `GaRyan2.Github`, `GaRyan2.SchedulesDirect`) targeting `net10.0-windows`.
- A baseline cross-target mismatch (`net48` -> `net10.0-windows`) is already known and may continue to block successful build until retargeting task.
- Conversion step is still required to modernize project format and migrate package metadata before TFM upgrade.

## Done when
- Project uses SDK-style format.
- Target framework values remain equivalent to pre-conversion intent.
- Build is attempted after conversion and no new conversion-structure errors are introduced.
- Any remaining build failures are documented as pre-existing cross-target compatibility blockers.
- Legacy `packages.config` for this project is removed if conversion migrated references.
