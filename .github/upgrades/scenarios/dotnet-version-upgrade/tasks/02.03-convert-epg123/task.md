# 02.03-convert-epg123: Convert epg123 to SDK-style and validate build

# 02.03-convert-epg123: Convert epg123 to SDK-style and validate build

## Objective
Convert `src/epg123/epg123.csproj` to SDK-style without changing target framework values.

## Scope
- Run `convert_project_to_sdk_style` for this project only after 02.02 succeeds.
- Preserve net48 targeting during conversion.
- Build the converted project and resolve conversion-only issues.

## Done when
- Project uses SDK-style format.
- Target framework values remain equivalent to pre-conversion intent.
- Project build succeeds after conversion.
- Legacy `packages.config` for this project is removed if conversion migrated references.
