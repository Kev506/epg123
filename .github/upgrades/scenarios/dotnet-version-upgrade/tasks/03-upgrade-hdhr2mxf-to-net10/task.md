# 03-upgrade-hdhr2mxf-to-net10: Retarget hdhr2mxf and remediate API/package issues

## Objective
Retarget `src/hdhr2mxf/hdhr2mxf.csproj` to `net10.0-windows`, align package versions, and remediate API compatibility issues identified by assessment.

## Scope Inventory
- **Projects affected**: `src/hdhr2mxf/hdhr2mxf.csproj`, `src/hdhr2mxf/API/SiliconDustApi.cs`, and any minimal calling code impacted by API updates.
- **Distinct concerns**: TFM retargeting, package bump (`Newtonsoft.Json`), WebRequest API replacement, and post-retarget compile validation.
- **Dependency context**: direct project references already target `net10.0-windows`, so retargeting `hdhr2mxf` is required to restore project-reference compatibility.

## Assessment Findings Relevant to This Task
- `Project.0002` (Mandatory): `hdhr2mxf` must move from `net48` to `net10.0-windows`.
- `NuGet.0002`: upgrade `Newtonsoft.Json` from `13.0.2` to `13.0.4`.
- `Api.0002`: replace/avoid legacy `WebRequest.Create(string)` usage.
- `Api.0003` behavioral changes around URI/HTTP/XML serializer usage should be validated after retarget.

## Execution Plan
1. Retarget project to `net10.0-windows` and align package version.
2. Remove obsolete WebRequest-based implementation by using HttpClient-based request flow.
3. Build and fix any compile/warning issues in modified project.

## Done When
- `hdhr2mxf.csproj` targets `net10.0-windows`.
- `Newtonsoft.Json` is updated to `13.0.4`.
- `WebRequest.Create`-based call path is removed/replaced in `SiliconDustApi`.
- `hdhr2mxf` builds successfully with no warnings in modified project.
