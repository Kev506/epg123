# 02-convert-epg123transfer-to-sdk-style — Progress Details

## Summary
Converted `src/epg123Transfer/epg123Transfer.csproj` from legacy MSBuild format to SDK-style while preserving its current `net48` target. Also migrated the project's single NuGet dependency away from `packages.config`.

## What I changed
- Converted `src/epg123Transfer/epg123Transfer.csproj` to SDK-style.
- Preserved WinForms/Desktop project settings including `OutputType`, ClickOnce-related metadata, `ApplicationIcon`, and explicit Windows desktop support.
- Preserved linked source, Windows Media Center assembly file references, and project references.
- Migrated `Newtonsoft.Json` from `packages.config` into a `PackageReference` in the project file.
- Removed `src/epg123Transfer/packages.config` after the SDK-style conversion migrated package management into the project file.
- Enriched `tasks/02-convert-epg123transfer-to-sdk-style/task.md` with project-specific research and validation context.

## Validation
- Built `src/epg123Transfer/epg123Transfer.csproj` after conversion.
- Result: **build still fails**, but only with the already-known target-framework compatibility errors:
  - `NU1201` against `GaRyan2.Utilities`
  - `NU1201` against `GaRyan2.MxfXmltvTools`
  - `NU1201` against `GaRyan2.WmcUtilities`
- No new SDK-style conversion-specific errors were introduced by the project-format migration.

## Issues encountered
- Full success validation on `net48` is currently blocked because `epg123Transfer` still references projects already retargeted to `net10.0-windows`.
- This incompatibility pre-dates the SDK-style conversion and is the intended focus of the next task, which retargets `epg123Transfer` to modern .NET.

## Done-when verification
- `epg123Transfer.csproj` is SDK-style: ✅
- Package management updated for SDK-style build semantics: ✅
- Project builds successfully on its pre-upgrade framework target: ⚠️ Blocked by pre-existing cross-target project-reference incompatibility, unchanged by this task
