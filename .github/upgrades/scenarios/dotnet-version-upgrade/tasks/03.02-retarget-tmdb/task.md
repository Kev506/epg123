# 03.02-retarget-tmdb: Retarget GaRyan2.Tmdb to net10.0-windows

## Objective
Update `src/GaRyan2.Tmdb/GaRyan2.Tmdb.csproj` from `net48` to `net10.0-windows` and verify the project builds.

## Scope
- Change only target framework settings and directly related project metadata for this retarget.
- Preserve existing package references unless compatibility fixes are required.
- Validate build for this project after retargeting.

## Research Findings
- `TargetFramework` is defined directly in the project file and currently set to `net48`.
- Project references `GaRyan2.Utilities`, which is already `net10.0-windows`; retargeting removes the known `NU1201` mismatch.
- Project includes redundant direct framework references (`System.Data.DataSetExtensions`, `Microsoft.CSharp`, `System.Net.Http`) that can generate conflict warnings after retargeting.

## Done when
- Project target framework is set to `net10.0-windows`.
- Project restores/builds with no errors.
- Any TFM-driven compatibility adjustments are documented.
