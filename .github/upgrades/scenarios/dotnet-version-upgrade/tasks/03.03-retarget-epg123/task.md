# 03.03-retarget-epg123: Retarget epg123 to net10.0-windows

## Objective
Update `src/epg123/epg123.csproj` from `net48` to `net10.0-windows` and validate build behavior after dependency retargeting.

## Scope
- Update target framework settings for the root application project.
- Preserve package versions where possible; apply only required compatibility metadata updates.
- Build the retargeted project and resolve immediate TFM mismatch issues.

## Research Findings
- `TargetFramework` is defined directly in `epg123.csproj` and currently set to `net48`.
- Project references now-retargeted dependencies (`GaRyan2.MxfXmltvTools`, `GaRyan2.Tmdb`) plus existing `net10.0-windows` dependencies (`GaRyan2.Utilities`, `GaRyan2.Github`, `GaRyan2.SchedulesDirect`).
- Package alignment is required: dependent projects already moved to `Newtonsoft.Json` `13.0.4`.
- Some legacy framework references (e.g., `System.Web`) are expected to surface API-level build issues after retargeting and will be handled in Task 04.

## Done when
- Project target framework is set to `net10.0-windows`.
- Project restores/builds without TFM mismatch errors.
- Any remaining compilation/runtime migration issues are documented for Task 04.
