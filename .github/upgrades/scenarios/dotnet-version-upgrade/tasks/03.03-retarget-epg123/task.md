# 03.03-retarget-epg123: Retarget epg123 to net10.0-windows

# 03.03-retarget-epg123: Retarget epg123 to net10.0-windows

## Objective
Update `src/epg123/epg123.csproj` from `net48` to `net10.0-windows` and validate build behavior after dependency retargeting.

## Scope
- Update target framework settings for the root application project.
- Preserve package versions where possible; apply only required compatibility metadata updates.
- Build the retargeted project and resolve immediate TFM mismatch issues.

## Done when
- Project target framework is set to `net10.0-windows`.
- Project restores/builds without TFM mismatch errors.
- Any remaining compilation/runtime migration issues are documented for Task 04.
