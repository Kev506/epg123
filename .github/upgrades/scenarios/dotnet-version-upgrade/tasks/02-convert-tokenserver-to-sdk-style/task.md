# 02-convert-tokenserver-to-sdk-style: Convert epg123Server project to SDK-style on current framework

Convert `src/tokenServer/epg123Server.csproj` from classic project format to SDK-style while staying on net48 for this task. This includes migrating `packages.config` to `PackageReference` and preserving service/WinForms-specific settings needed for the existing runtime behavior.

Keeping this conversion isolated from TFM retargeting reduces risk by separating project-system changes from API-surface changes.

## Scope Inventory

- **Projects affected**: `src/tokenServer/epg123Server.csproj` (direct), with compatibility validation against referenced `GaRyan2.Github` and `GaRyan2.Utilities`
- **Distinct concerns**: SDK-style project conversion, package reference migration, preserving existing non-TFM build settings
- **Assessment signals**: `Project.0001` (must convert to SDK-style), `Project.0002` pending for later retargeting task, `NuGet.0002` recommends Newtonsoft.Json 13.0.4
- **Execution boundary**: no target framework change in this task; TFM retargeting handled only in next task

## Research Findings

- Current project is legacy (`ToolsVersion` + explicit `Microsoft.CSharp.targets` import) and includes `packages.config`.
- Assessment indicates low overall complexity for this project but requires SDK conversion before target framework change.
- Baseline solution build already has expected cross-target reference failures (`net48` → `net10.0-windows`); this task must not introduce additional regression types.

## Execution Notes

- Converted project using `convert_project_to_sdk_style` for `src/tokenServer/epg123Server.csproj`.
- Verified SDK-style result includes `<Project Sdk="Microsoft.NET.Sdk">` and preserves `TargetFramework` as `net48`.
- Confirmed `Newtonsoft.Json` was migrated to `<PackageReference Include="Newtonsoft.Json" Version="13.0.2" />`.
- Removed legacy `src/tokenServer/packages.config` after conversion.
- Direct project build shows expected pre-existing incompatibility errors (`NU1201` from net48 project referencing net10.0-windows dependencies), with no additional conversion-mechanical failures.

**Done when**: `epg123Server.csproj` is SDK-style, package references are migrated, and the conversion validates cleanly for this scope (no new conversion-specific build regressions beyond known baseline cross-target mismatches).
