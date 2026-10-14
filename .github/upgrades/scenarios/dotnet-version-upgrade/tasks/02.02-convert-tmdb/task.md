# 02.02-convert-tmdb: Convert GaRyan2.Tmdb to SDK-style and validate build

## Objective
Convert `src/GaRyan2.Tmdb/GaRyan2.Tmdb.csproj` to SDK-style without changing target framework values.

## Scope
- Run `convert_project_to_sdk_style` for this project only after 02.01 succeeds.
- Preserve net48 targeting during conversion.
- Build the converted project and resolve conversion-only issues.

## Research Findings
- Project is legacy format (`<Project ToolsVersion="15.0" ...>`) and includes a `packages.config` file.
- Project targets `.NETFramework,Version=v4.8` and references already-modernized `GaRyan2.Utilities`.
- `packages.config` migration to `PackageReference` is expected as part of conversion and must not change package versions.
- Known baseline cross-target compatibility mismatch may still block build until retargeting task.

## Done when
- Project uses SDK-style format.
- Target framework values remain equivalent to pre-conversion intent.
- Build is attempted after conversion and no new conversion-structure errors are introduced.
- Any remaining build failures are documented as pre-existing cross-target compatibility blockers.
- Legacy `packages.config` for this project is removed if conversion migrated references.
