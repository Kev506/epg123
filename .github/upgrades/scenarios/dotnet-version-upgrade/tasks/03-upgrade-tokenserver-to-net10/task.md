# 03-upgrade-tokenserver-to-net10: Retarget epg123Server to net10.0-windows and resolve compatibility issues

Retarget `epg123Server` to `net10.0-windows`, align package references for modern .NET, and address assessment-reported API compatibility issues across affected files (`System.ServiceProcess`, `HttpContent`, `Uri`, and `TimeSpan` usage). Ensure referenced projects remain compatible without regressions.

This is the core upgrade task where project targeting and source-level fixes are applied together after the structural conversion step.

## Scope Inventory

- **Projects affected**: `src/tokenServer/epg123Server.csproj` plus compile-time interaction with `GaRyan2.Github` and `GaRyan2.Utilities`
- **Distinct concerns**: TFM retargeting, package update (`Newtonsoft.Json`), compatibility fixes for `System.ServiceProcess` and BCL behavioral/source changes
- **Assessment signals**: `Project.0002` (retarget required), `NuGet.0002` (Newtonsoft.Json 13.0.4 suggested), and API issue clusters in `SchedulesDirect` + `Tcp` code paths
- **Expected risk**: net48→net10 surface differences may introduce compile/API adaptation work after TFM change

## Research Findings

- Assessment confirms `epg123Server` is now SDK-style and ready for TFM retargeting.
- High-frequency issue locations are in `SchedulesDirect/SchedulesDirectApi.cs`, `SchedulesDirect/SchedulesDirect.cs`, and `Tcp/ImageServer.cs`.
- Project currently contains legacy references (`System.Web`, `System.ServiceProcess`) that require package/framework adjustments on net10.

## Execution Notes

- Retargeted project TFM to `net10.0-windows`.
- Updated package references: `Newtonsoft.Json` -> `13.0.4`; added `System.ServiceProcess.ServiceController` `10.0.12`.
- Replaced `HttpUtility.UrlDecode` with `WebUtility.UrlDecode` and removed `System.Web` dependency.
- Added Windows platform annotations to satisfy CA1416 warnings:
  - Assembly-level `[SupportedOSPlatform("windows")]` in `Properties/AssemblyInfo.cs`
  - Class-level annotations on `HttpFileServer`, `ConfigServer`, and `HttpImageServer`.
- Validated build with full Visual Studio MSBuild (required due COM-reference dependencies in referenced projects).

**Done when**: `epg123Server` targets `net10.0-windows`, compilation issues tied to the framework transition are resolved, and the project builds cleanly.
