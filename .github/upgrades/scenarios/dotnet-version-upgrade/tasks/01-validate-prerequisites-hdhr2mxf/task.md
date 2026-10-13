# 01-validate-prerequisites-hdhr2mxf: Validate prerequisites and baseline compatibility

## Objective
Validate toolchain readiness and capture the current baseline for `src/hdhr2mxf/hdhr2mxf.csproj` before conversion/retargeting work.

## Scope Inventory
- **Projects affected**: `src/hdhr2mxf/hdhr2mxf.csproj` (direct), plus referenced dependencies `src/GaRyan2.Utilities/GaRyan2.Utilities.csproj`, `src/GaRyan2.WmcUtilities/GaRyan2.WmcUtilities.csproj`, `src/GaRyan2.MxfXmltvTools/GaRyan2.MxfXmltvTools.csproj`.
- **Distinct concerns**: SDK/toolchain readiness; baseline build compatibility at current TFM mix; upgrade blocking conditions.
- **Assessment signals**: `hdhr2mxf` is classic non-SDK net48 with recommended project conversion and TFM retargeting; dependency projects are already SDK-style `net10.0-windows`.

## Research Findings
- .NET SDK validation for `net10.0` succeeded.
- No `global.json` constraint was found, so no SDK pinning conflict exists.
- Baseline project build for `hdhr2mxf` fails due to framework mismatch with referenced projects already targeting `net10.0-windows`.
- The baseline failure confirms the required execution ordering: convert project format, then retarget `hdhr2mxf` to `net10.0-windows` so references become compatible.

## Baseline Evidence
Build errors observed:
- `Project '..\\GaRyan2.Utilities\\GaRyan2.Utilities.csproj' targets 'net10.0-windows'. It cannot be referenced by a project that targets '.NETFramework,Version=v4.8'.`
- `Project '..\\GaRyan2.WmcUtilities\\GaRyan2.WmcUtilities.csproj' targets 'net10.0-windows'. It cannot be referenced by a project that targets '.NETFramework,Version=v4.8'.`
- `Project '..\\GaRyan2.MxfXmltvTools\\GaRyan2.MxfXmltvTools.csproj' targets 'net10.0-windows'. It cannot be referenced by a project that targets '.NETFramework,Version=v4.8'.`

## Done When
- Toolchain prerequisites for net10.0 are validated.
- Baseline compatibility blockers are captured and documented for downstream tasks.
