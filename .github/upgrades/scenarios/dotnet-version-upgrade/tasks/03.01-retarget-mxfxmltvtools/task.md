# 03.01-retarget-mxfxmltvtools: Retarget GaRyan2.MxfXmltvTools to net10.0-windows

## Objective
Update `src/GaRyan2.MxfXmltvTools/GaRyan2.MxfXmltvTools.csproj` from `net48` to `net10.0-windows` and verify the project builds.

## Scope
- Change only target framework settings and directly related project metadata for this retarget.
- Keep package versions unchanged unless build requires a compatibility adjustment.
- Validate build for this project after retargeting.

## Research Findings
- `TargetFramework` is declared directly in project file (not inherited from props).
- Project has a single project reference to `GaRyan2.Utilities`, already on `net10.0-windows`.
- Current `NU1201` mismatch will be resolved by retargeting this project to `net10.0-windows`.

## Done when
- Project target framework is set to `net10.0-windows`.
- Project restores/builds with no errors.
- Any required project metadata updates are captured in progress details.
