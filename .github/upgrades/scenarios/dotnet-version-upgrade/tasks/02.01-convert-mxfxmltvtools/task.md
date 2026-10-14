# 02.01-convert-mxfxmltvtools: Convert GaRyan2.MxfXmltvTools to SDK-style and validate build

## Objective
Convert `src/GaRyan2.MxfXmltvTools/GaRyan2.MxfXmltvTools.csproj` to SDK-style without changing target framework values.

## Scope
- Run `convert_project_to_sdk_style` for this project only.
- Preserve net48 targeting during conversion.
- Build the converted project and resolve conversion-only issues.

## Research Findings
- Project is currently legacy format (`<Project ToolsVersion="15.0" ...>` with `Microsoft.CSharp.targets` import).
- Project currently targets `.NETFramework,Version=v4.8` and references `GaRyan2.Utilities`.
- No `packages.config` file was found under `src/GaRyan2.MxfXmltvTools/`; package migration is likely minimal for this project.
- Conversion must run before dependent root app conversion to reduce downstream format mismatch risks.

## Done when
- Project uses SDK-style format.
- Target framework values remain equivalent to pre-conversion intent.
- Build is attempted after conversion and no new conversion-structure errors are introduced.
- Any remaining build failures are documented as pre-existing cross-target compatibility blockers.
- Legacy `packages.config` for this project is removed if conversion migrated references.
