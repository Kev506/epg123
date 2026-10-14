# 02-convert-epgtray-to-sdk-style: Convert epgTray to SDK-style on net48

Convert `src/epgTray/epgTray.csproj` from classic MSBuild format to SDK-style while keeping the project on `net48` for this task.

The goal is structural modernization only: preserve WinForms behavior, resources, icons, settings, and project references while removing legacy project-system constructs. TFM retargeting is explicitly deferred to the next task.

## Scope Inventory

- **Projects in scope**: `epgTray` (directly modified), with compatibility checks against referenced `GaRyan2.Utilities`, `GaRyan2.MxfXmltvTools`, and `GaRyan2.WmcUtilities`
- **Distinct concerns**: SDK-style conversion mechanics, legacy metadata preservation, resource handling for WinForms `.resx`/icons, and post-conversion build validation
- **Assessment signals considered**: `Project.0001` (SDK-style conversion required), `Project.0002` (TFM retarget required next task), and 292 API compatibility issues in code files (`Program.cs`, `trayApplication.cs`, `Properties/*Designer.cs`) to be addressed later
- **Build strategy**: Use Visual Studio build (`run_build`) because this WinForms project includes resources/icons and requires Windows-desktop tooling behavior

## Research Findings

- Assessment project summary confirms `epgTray.csproj` is **SDK-style: False** and **Project Kind: ClassicWinForms**, with proposed target `net10.0-windows`.
- Files flagged by assessment indicate this task should only touch the project file conversion marker (`Project.0001`) and avoid code/API remediation in this step.
- `epgTray.csproj` currently uses old-style markers (`<Project ToolsVersion=...>`, `Microsoft.CSharp.targets`, explicit framework references), matching conversion prerequisites.
- Baseline build currently fails due to expected cross-target references (`net48` app referencing `net10.0-windows` libraries); conversion task success is measured by preserving build behavior and producing a valid SDK-style project, not by eliminating this mismatch yet.

## Planned Edits

- Run `convert_project_to_sdk_style` for `src/epgTray/epgTray.csproj`.
- Verify resulting project preserves Windows Forms settings, resource includes, app settings, and `GaRyan2.Utilities` project reference.
- Build the converted project to confirm conversion correctness on current framework before retargeting.

**Done when**: `epgTray.csproj` is SDK-style while still on `net48`, key WinForms/resource/project-reference semantics are preserved, and post-conversion build behavior is validated/documented.
