# 02-convert-hdhr2mxf-to-sdk-style: Convert hdhr2mxf project format

## Objective
Convert `src/hdhr2mxf/hdhr2mxf.csproj` from classic MSBuild format to SDK-style while preserving behavior and keeping the project on its current framework baseline during conversion.

## Scope Inventory
- **Projects affected**: `src/hdhr2mxf/hdhr2mxf.csproj` only.
- **Distinct concerns**: project-format migration, legacy reference cleanup, packages.config migration to PackageReference, post-conversion buildability.
- **Dependency context**: `hdhr2mxf` is the top-level app and depends on `GaRyan2.Utilities`, `GaRyan2.MxfXmltvTools`, and `GaRyan2.WmcUtilities` (already modernized).

## Assessment Findings Relevant to This Task
- `Project.0001` (Mandatory): project must be converted to SDK-style.
- `Project.0002` (Mandatory): TFM must be changed later to `net10.0-windows` (handled in next task).
- `NuGet.0002` + API issues exist but are intentionally deferred to the retarget/remediation task.

## Execution Plan
1. Run `convert_project_to_sdk_style` for `hdhr2mxf.csproj`.
2. Verify generated SDK-style project file and package migration outcome.
3. Build converted project at pre-retarget state to validate structural conversion.

## Done When
- `hdhr2mxf.csproj` is SDK-style.
- Legacy `packages.config` is removed/migrated.
- Post-conversion build attempt is executed and only expected cross-TFM incompatibility blockers are present (to be resolved by retargeting in the next task).
