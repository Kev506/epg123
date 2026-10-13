# Projects and dependencies analysis

This document provides a comprehensive overview of the projects and their dependencies in the context of upgrading to .NETCoreApp,Version=v10.0.

## Table of Contents

- [Executive Summary](#executive-Summary)
  - [Highlevel Metrics](#highlevel-metrics)
  - [Projects Compatibility](#projects-compatibility)
  - [Package Compatibility](#package-compatibility)
  - [API Compatibility](#api-compatibility)
  - [Binding Redirect Configuration](#binding-redirect-configuration)
- [Aggregate NuGet packages details](#aggregate-nuget-packages-details)
- [Top API Migration Challenges](#top-api-migration-challenges)
  - [Technologies and Features](#technologies-and-features)
  - [Most Frequent API Issues](#most-frequent-api-issues)
- [Projects Relationship Graph](#projects-relationship-graph)
- [Project Details](#project-details)

  - [%USERPROFILE%\source\repos\epg123\src\GaRyan2.Github\GaRyan2.Github.csproj](#%userprofile%sourcereposepg123srcgaryan2githubgaryan2githubcsproj)
  - [%USERPROFILE%\source\repos\epg123\src\GaRyan2.Utilities\GaRyan2.Utilities.csproj](#%userprofile%sourcereposepg123srcgaryan2utilitiesgaryan2utilitiescsproj)
  - [epg123Server.csproj](#epg123servercsproj)


## Executive Summary

### Highlevel Metrics

| Metric | Count | Status |
| :--- | :---: | :--- |
| Total Projects | 3 | 1 require upgrade |
| Total NuGet Packages | 0 | All compatible |
| Total Code Files | 39 |  |
| Total Code Files with Incidents | 11 |  |
| Total Lines of Code | 4922 |  |
| Total Number of Issues | 64 |  |
| Estimated LOC to modify | 61+ | at least 1.2% of codebase |

### Projects Compatibility

| Project | Target Framework | Difficulty | Package Issues | API Issues | Binding Issues | Est. LOC Impact | Description |
| :--- | :---: | :---: | :---: | :---: | :---: | :---: | :--- |
| [%USERPROFILE%\source\repos\epg123\src\GaRyan2.Github\GaRyan2.Github.csproj](#%userprofile%sourcereposepg123srcgaryan2githubgaryan2githubcsproj) | net10.0-windows | ✅ None | 0 | 0 | 0 |  | ClassLibrary, Sdk Style = True |
| [%USERPROFILE%\source\repos\epg123\src\GaRyan2.Utilities\GaRyan2.Utilities.csproj](#%userprofile%sourcereposepg123srcgaryan2utilitiesgaryan2utilitiescsproj) | net10.0-windows | ✅ None | 0 | 0 | 0 |  | ClassLibrary, Sdk Style = True |
| [epg123Server.csproj](#epg123servercsproj) | net48 | 🟢 Low | 1 | 61 | 0 | 61+ | ClassicWinForms, Sdk Style = False |

### Package Compatibility

| Status | Count | Percentage |
| :--- | :---: | :---: |
| ✅ Compatible | 0 | 0.0% |
| ⚠️ Incompatible | 0 | 0.0% |
| 🔄 Upgrade Recommended | 0 | 0.0% |
| ***Total NuGet Packages*** | ***0*** | ***100%*** |

### API Compatibility

| Category | Count | Impact |
| :--- | :---: | :--- |
| 🔴 Binary Incompatible | 1 | High - Require code changes |
| 🟡 Source Incompatible | 36 | Medium - Needs re-compilation and potential conflicting API error fixing |
| 🔵 Behavioral change | 24 | Low - Behavioral changes that may require testing at runtime |
| ✅ Compatible | 3985 |  |
| ***Total APIs Analyzed*** | ***4046*** |  |

## Aggregate NuGet packages details

| Package | Current Version | Suggested Version | Projects | Description |
| :--- | :---: | :---: | :--- | :--- |

## Top API Migration Challenges

### Technologies and Features

| Technology | Issues | Percentage | Migration Path |
| :--- | :---: | :---: | :--- |

### Most Frequent API Issues

| API | Count | Percentage | Category |
| :--- | :---: | :---: | :--- |
| T:System.Net.Http.HttpContent | 12 | 19.7% | Behavioral Change |
| M:System.TimeSpan.FromHours(System.Double) | 10 | 16.4% | Source Incompatible |
| T:System.Uri | 8 | 13.1% | Behavioral Change |
| P:System.Net.HttpListenerRequest.UserAgent | 7 | 11.5% | Source Incompatible |
| M:System.TimeSpan.FromDays(System.Double) | 3 | 4.9% | Source Incompatible |
| M:System.TimeSpan.FromMinutes(System.Double) | 2 | 3.3% | Source Incompatible |
| T:System.ServiceProcess.ServiceBase | 2 | 3.3% | Source Incompatible |
| P:System.ServiceProcess.ServiceBase.CanShutdown | 2 | 3.3% | Source Incompatible |
| M:System.ServiceProcess.ServiceBase.#ctor | 2 | 3.3% | Source Incompatible |
| P:System.Uri.AbsolutePath | 1 | 1.6% | Behavioral Change |
| M:System.Uri.#ctor(System.String) | 1 | 1.6% | Behavioral Change |
| M:System.TimeSpan.FromSeconds(System.Double) | 1 | 1.6% | Source Incompatible |
| P:System.IO.DirectoryInfo.FullName | 1 | 1.6% | Binary Incompatible |
| M:System.Net.Http.HttpContent.ReadAsStreamAsync | 1 | 1.6% | Behavioral Change |
| P:System.Uri.PathAndQuery | 1 | 1.6% | Behavioral Change |
| M:System.ServiceProcess.ServiceBase.Run(System.ServiceProcess.ServiceBase[]) | 1 | 1.6% | Source Incompatible |
| P:System.ServiceProcess.ServiceBase.ServiceName | 1 | 1.6% | Source Incompatible |
| M:System.ServiceProcess.ServiceBase.Dispose(System.Boolean) | 1 | 1.6% | Source Incompatible |
| M:System.ServiceProcess.ServiceBase.OnStop | 1 | 1.6% | Source Incompatible |
| M:System.ServiceProcess.ServiceBase.OnShutdown | 1 | 1.6% | Source Incompatible |
| M:System.ServiceProcess.ServiceBase.Stop | 1 | 1.6% | Source Incompatible |
| P:System.ServiceProcess.ServiceBase.ExitCode | 1 | 1.6% | Source Incompatible |

## Projects Relationship Graph

Legend:
📦 SDK-style project
⚙️ Classic project

```mermaid
flowchart LR
    P1["<b>⚙️&nbsp;epg123Server.csproj</b><br/><small>net48</small>"]
    P1 --> P2
    P1 --> P3
    P2 --> P3
    click P1 "#epg123servercsproj"

```

## Project Details

<a id="epg123servercsproj"></a>
### epg123Server.csproj

#### Project Info

- **Current Target Framework:** net48
- **Proposed Target Framework:** net10.0-windows
- **SDK-style**: False
- **Project Kind:** ClassicWinForms
- **Dependencies**: 2
- **Dependants**: 0
- **Number of Files**: 18
- **Number of Files with Incidents**: 11
- **Lines of Code**: 2440
- **Estimated LOC to modify**: 61+ (at least 2.5% of the project)

#### Dependency Graph

Legend:
📦 SDK-style project
⚙️ Classic project

```mermaid
flowchart TB
    subgraph current["epg123Server.csproj"]
        MAIN["<b>⚙️&nbsp;epg123Server.csproj</b><br/><small>net48</small>"]
        click MAIN "#epg123servercsproj"
    end
    subgraph downstream["Dependencies (2"]
    end
    MAIN --> P2
    MAIN --> P3

```

### API Compatibility

| Category | Count | Impact |
| :--- | :---: | :--- |
| 🔴 Binary Incompatible | 1 | High - Require code changes |
| 🟡 Source Incompatible | 36 | Medium - Needs re-compilation and potential conflicting API error fixing |
| 🔵 Behavioral change | 24 | Low - Behavioral changes that may require testing at runtime |
| ✅ Compatible | 3985 |  |
| ***Total APIs Analyzed*** | ***4046*** |  |

