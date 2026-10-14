# 03.04-validate-retargeting-scope: Validate all retargeted projects and document outcomes

## Objective
Validate that all projects in Task 03 were retargeted correctly and capture post-retargeting build status before API remediation.

## Scope
- Verify target frameworks for all three projects are updated to `net10.0-windows`.
- Run solution-level build to establish the post-retarget baseline.
- Document remaining errors/warnings for follow-on API compatibility task.

## Research Findings
- Retargeted projects now show `TargetFramework` = `net10.0-windows` for:
  - `GaRyan2.MxfXmltvTools`
  - `GaRyan2.Tmdb`
  - `epg123`
- Project-level builds for retargeted scope succeed after dependency alignment and warning fixes.
- Full solution build still fails due unrelated remaining net48 projects outside Task 03 scope that reference already-modernized net10.0-windows dependencies.

## Done when
- All retargeting subtasks are complete.
- Retargeted framework values are verified in project files.
- Build validation and follow-up error inventory are documented.
