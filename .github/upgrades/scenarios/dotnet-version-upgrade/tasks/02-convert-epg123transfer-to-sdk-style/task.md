# 02-convert-epg123transfer-to-sdk-style: Convert epg123Transfer to SDK-style on its current framework

Convert `src/epg123Transfer/epg123Transfer.csproj` from classic project format to SDK-style while keeping it on its current framework for this task. The conversion must preserve WinForms resources, linked files, Windows Media Center assembly references, ClickOnce-related metadata that still matters, and any project settings needed for the current desktop application behavior.

This project still uses old-style imports and `packages.config`, so the structural conversion needs to stay isolated from target framework changes. Keeping the task narrow makes later retargeting failures easier to diagnose.

## Scope Inventory

- **Projects affected**: `src/epg123Transfer/epg123Transfer.csproj`
- **Distinct concerns**: SDK-style conversion, `packages.config` migration, WinForms/resource preservation, and validation on the pre-upgrade framework target
- **Referenced projects**: `GaRyan2.MxfXmltvTools`, `GaRyan2.Utilities`, and `GaRyan2.WmcUtilities` already target `net10.0-windows`
- **Primary dependencies**: `Newtonsoft.Json` 13.0.2 via `packages.config`; direct assembly references include `BDATunePIA`, `mcepg`, `mcstore`, `System.Web`, `System.Deployment`, `System.Drawing`, `System.Windows.Forms`, and `WindowsBase`

## Research Findings

- The current project is a legacy MSBuild project with `ToolsVersion="14.0"`, explicit `Microsoft.CSharp.targets` import, and framework target `v4.8`.
- The project contains WinForms designer files and `.resx` resources, so build validation should continue to use Visual Studio/MSBuild-style tooling during and immediately after conversion.
- The project includes linked source (`..\SolutionInfo.cs`) and several designer-generated artifacts (`frmTransfer.Designer.cs`, `Properties\Resources.Designer.cs`, `Properties\Settings.Designer.cs`) that must remain correctly associated after conversion.
- `packages.config` currently contains only `Newtonsoft.Json` 13.0.2, so package migration scope is small, but the project also carries non-NuGet Windows Media Center assembly references from `src\wmc_dlls\w7` that must remain as file references.
- The solution is currently not buildable because this `net48` app references projects already retargeted to `net10.0-windows`, so successful validation for this task should focus on confirming the project becomes SDK-style without introducing additional structural regressions before the TFM retargeting task.

**Done when**: `epg123Transfer.csproj` is SDK-style, package management is updated as needed for SDK-style build semantics, and the project builds successfully on its pre-upgrade framework target.
