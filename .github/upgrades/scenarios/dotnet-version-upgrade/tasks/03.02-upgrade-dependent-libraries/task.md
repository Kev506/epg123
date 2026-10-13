# 03.02-upgrade-dependent-libraries: Retarget GaRyan2.Github and GaRyan2.SchedulesDirect on top of upgraded utilities

# 03.02-upgrade-dependent-libraries

## Objective
Retarget dependency-layer libraries that consume `GaRyan2.Utilities` and resolve compatibility breaks.

## Scope
- `src/GaRyan2.Github/GaRyan2.Github.csproj`
- `src/GaRyan2.SchedulesDirect/GaRyan2.SchedulesDirect.csproj`
- Related source files and package references

## Steps
1. Retarget both projects to modern .NET (windows-targeted where required).
2. Update package references and framework references to supported equivalents.
3. Resolve compile errors/warnings introduced by retargeting.
4. Build both projects successfully.

## Done when
- Both projects target modern TFMs compatible with the selected strategy.
- Both projects build without errors.
- Referencing `GaRyan2.Utilities` remains valid on upgraded TFMs.
