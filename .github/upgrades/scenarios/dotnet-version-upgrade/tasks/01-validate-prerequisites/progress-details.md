# 01-validate-prerequisites — Progress Details

## Summary
Validated prerequisites for upgrading `src/epg123Transfer/epg123Transfer.csproj` to .NET 10 and captured the baseline mixed-target build failure before conversion and retargeting changes.

## What I changed
- Updated `tasks/01-validate-prerequisites/task.md` with epg123Transfer-specific scope inventory, build-tool guidance, and baseline findings.
- Updated `scenario-instructions.md` with the build tool decision for the legacy WinForms project.
- Updated this progress record with the current prerequisite and baseline validation results.

## Validation
- `validate_dotnet_sdk_installation(net10.0)`: **Compatible SDK found**
- `validate_dotnet_sdk_in_globaljson(net10.0, epg123.sln, epg123Transfer.csproj)`: **Success: no global.json config found**
- `run_build` on `src/epg123.sln`: **Build failed** with expected cross-target reference errors because `epg123Transfer` still targets `.NETFramework,Version=v4.8` while its referenced projects target `net10.0-windows`

## Issues encountered
- Baseline mismatch exists before migration: `epg123Transfer` cannot reference `GaRyan2.MxfXmltvTools`, `GaRyan2.Utilities`, or `GaRyan2.WmcUtilities` while it still targets `net48`.
- This is expected and confirms the upgrade task must retarget the legacy desktop application to a Windows-specific modern .NET TFM.

## Done-when verification
- .NET SDK prerequisites confirmed: ✅
- Baseline build outcome captured with root cause: ✅
- Findings documented in task artifact: ✅
