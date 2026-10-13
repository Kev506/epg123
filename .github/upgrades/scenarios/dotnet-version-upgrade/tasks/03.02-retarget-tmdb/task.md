# 03.02-retarget-tmdb: Retarget GaRyan2.Tmdb to net10.0-windows

# 03.02-retarget-tmdb: Retarget GaRyan2.Tmdb to net10.0-windows

## Objective
Update `src/GaRyan2.Tmdb/GaRyan2.Tmdb.csproj` from `net48` to `net10.0-windows` and verify the project builds.

## Scope
- Change only target framework settings and directly related project metadata for this retarget.
- Preserve existing package references unless compatibility fixes are required.
- Validate build for this project after retargeting.

## Done when
- Project target framework is set to `net10.0-windows`.
- Project restores/builds with no errors.
- Any TFM-driven compatibility adjustments are documented.
