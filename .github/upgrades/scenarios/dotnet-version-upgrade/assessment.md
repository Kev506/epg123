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

  - [%USERPROFILE%\source\repos\epg123\src\GaRyan2.Utilities\GaRyan2.Utilities.csproj](#%userprofile%sourcereposepg123srcgaryan2utilitiesgaryan2utilitiescsproj)
  - [epgTray.csproj](#epgtraycsproj)


## Executive Summary

### Highlevel Metrics

| Metric | Count | Status |
| :--- | :---: | :--- |
| Total Projects | 2 | 1 require upgrade |
| Total NuGet Packages | 0 | All compatible |
| Total Code Files | 20 |  |
| Total Code Files with Incidents | 5 |  |
| Total Lines of Code | 2778 |  |
| Total Number of Issues | 294 |  |
| Estimated LOC to modify | 292+ | at least 10.5% of codebase |

### Projects Compatibility

| Project | Target Framework | Difficulty | Package Issues | API Issues | Binding Issues | Est. LOC Impact | Description |
| :--- | :---: | :---: | :---: | :---: | :---: | :---: | :--- |
| [%USERPROFILE%\source\repos\epg123\src\GaRyan2.Utilities\GaRyan2.Utilities.csproj](#%userprofile%sourcereposepg123srcgaryan2utilitiesgaryan2utilitiescsproj) | net10.0-windows | ✅ None | 0 | 0 | 0 |  | ClassLibrary, Sdk Style = True |
| [epgTray.csproj](#epgtraycsproj) | net48 | 🟡 Medium | 0 | 292 | 0 | 292+ | ClassicWinForms, Sdk Style = False |

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
| 🔴 Binary Incompatible | 249 | High - Require code changes |
| 🟡 Source Incompatible | 43 | Medium - Needs re-compilation and potential conflicting API error fixing |
| 🔵 Behavioral change | 0 | Low - Behavioral changes that may require testing at runtime |
| ✅ Compatible | 423 |  |
| ***Total APIs Analyzed*** | ***715*** |  |

## Aggregate NuGet packages details

| Package | Current Version | Suggested Version | Projects | Description |
| :--- | :---: | :---: | :--- | :--- |

## Top API Migration Challenges

### Technologies and Features

| Technology | Issues | Percentage | Migration Path |
| :--- | :---: | :---: | :--- |
| Windows Forms | 248 | 84.9% | Windows Forms APIs for building Windows desktop applications with traditional Forms-based UI that are available in .NET on Windows. Enable Windows Desktop support: Option 1 (Recommended): Target net9.0-windows; Option 2: Add <UseWindowsDesktop>true</UseWindowsDesktop>; Option 3 (Legacy): Use Microsoft.NET.Sdk.WindowsDesktop SDK. |
| GDI+ / System.Drawing | 26 | 8.9% | System.Drawing APIs for 2D graphics, imaging, and printing that are available via NuGet package System.Drawing.Common. Note: Not recommended for server scenarios due to Windows dependencies; consider cross-platform alternatives like SkiaSharp or ImageSharp for new code. |
| Legacy Configuration System | 11 | 3.8% | Legacy XML-based configuration system (app.config/web.config) that has been replaced by a more flexible configuration model in .NET Core. The old system was rigid and XML-based. Migrate to Microsoft.Extensions.Configuration with JSON/environment variables; use System.Configuration.ConfigurationManager NuGet package as interim bridge if needed. |
| Windows Access Control Lists (ACLs) | 1 | 0.3% | Windows Access Control List (ACL) APIs for file, directory, and synchronization object security that have moved to extension methods or different types. While .NET Core supports Windows ACLs, the APIs have been reorganized. Use System.IO.FileSystem.AccessControl and similar packages for ACL functionality. |
| Windows Forms Legacy Controls | 1 | 0.3% | Legacy Windows Forms controls that have been removed from .NET Core/5+ including StatusBar, DataGrid, ContextMenu, MainMenu, MenuItem, and ToolBar. These controls were replaced by more modern alternatives. Use ToolStrip, MenuStrip, ContextMenuStrip, and DataGridView instead. |

### Most Frequent API Issues

| API | Count | Percentage | Category |
| :--- | :---: | :---: | :--- |
| T:System.Windows.Forms.ToolStripMenuItem | 62 | 21.2% | Binary Incompatible |
| T:System.Windows.Forms.NotifyIcon | 33 | 11.3% | Binary Incompatible |
| T:System.Drawing.Icon | 26 | 8.9% | Source Incompatible |
| T:System.Windows.Forms.ToolTipIcon | 18 | 6.2% | Binary Incompatible |
| T:System.Windows.Forms.ContextMenuStrip | 10 | 3.4% | Binary Incompatible |
| T:System.Windows.Forms.CheckState | 10 | 3.4% | Binary Incompatible |
| P:System.Windows.Forms.ToolStripItem.Name | 9 | 3.1% | Binary Incompatible |
| E:System.Windows.Forms.ToolStripItem.Click | 8 | 2.7% | Binary Incompatible |
| P:System.Windows.Forms.ToolStripItem.Text | 8 | 2.7% | Binary Incompatible |
| M:System.Windows.Forms.ToolStripMenuItem.#ctor | 8 | 2.7% | Binary Incompatible |
| T:System.Windows.Forms.Application | 6 | 2.1% | Binary Incompatible |
| P:System.Windows.Forms.NotifyIcon.BalloonTipText | 6 | 2.1% | Binary Incompatible |
| P:System.Windows.Forms.NotifyIcon.BalloonTipIcon | 6 | 2.1% | Binary Incompatible |
| P:System.Windows.Forms.NotifyIcon.Icon | 5 | 1.7% | Binary Incompatible |
| P:System.Configuration.ApplicationSettingsBase.Item(System.String) | 4 | 1.4% | Source Incompatible |
| P:System.Windows.Forms.ToolStripMenuItem.Enabled | 4 | 1.4% | Binary Incompatible |
| M:System.Windows.Forms.Application.Exit | 3 | 1.0% | Binary Incompatible |
| M:System.Windows.Forms.NotifyIcon.ShowBalloonTip(System.Int32) | 3 | 1.0% | Binary Incompatible |
| F:System.Windows.Forms.ToolTipIcon.Error | 3 | 1.0% | Binary Incompatible |
| P:System.Windows.Forms.NotifyIcon.BalloonTipTitle | 3 | 1.0% | Binary Incompatible |
| M:System.TimeSpan.FromMinutes(System.Double) | 3 | 1.0% | Source Incompatible |
| P:System.Windows.Forms.NotifyIcon.Visible | 3 | 1.0% | Binary Incompatible |
| M:System.Configuration.ApplicationSettingsBase.Save | 3 | 1.0% | Source Incompatible |
| T:System.Windows.Forms.MessageBoxIcon | 2 | 0.7% | Binary Incompatible |
| T:System.Windows.Forms.MessageBoxButtons | 2 | 0.7% | Binary Incompatible |
| M:System.TimeSpan.FromHours(System.Double) | 2 | 0.7% | Source Incompatible |
| F:System.Windows.Forms.CheckState.Unchecked | 2 | 0.7% | Binary Incompatible |
| F:System.Windows.Forms.CheckState.Checked | 2 | 0.7% | Binary Incompatible |
| P:System.Windows.Forms.ToolStripMenuItem.CheckState | 2 | 0.7% | Binary Incompatible |
| T:System.Windows.Forms.ToolStripSeparator | 2 | 0.7% | Binary Incompatible |
| M:System.Windows.Forms.ToolStripSeparator.#ctor | 2 | 0.7% | Binary Incompatible |
| M:System.Configuration.ApplicationSettingsBase.Upgrade | 2 | 0.7% | Source Incompatible |
| E:System.Windows.Forms.Application.ApplicationExit | 2 | 0.7% | Binary Incompatible |
| M:System.Windows.Forms.ApplicationContext.#ctor | 2 | 0.7% | Binary Incompatible |
| M:System.Configuration.ApplicationSettingsBase.#ctor | 1 | 0.3% | Source Incompatible |
| T:System.Configuration.ApplicationSettingsBase | 1 | 0.3% | Source Incompatible |
| M:System.Windows.Forms.Application.Run(System.Windows.Forms.ApplicationContext) | 1 | 0.3% | Binary Incompatible |
| M:System.Windows.Forms.Application.SetCompatibleTextRenderingDefault(System.Boolean) | 1 | 0.3% | Binary Incompatible |
| M:System.Windows.Forms.Application.EnableVisualStyles | 1 | 0.3% | Binary Incompatible |
| F:System.Windows.Forms.MessageBoxIcon.Error | 1 | 0.3% | Binary Incompatible |
| F:System.Windows.Forms.MessageBoxButtons.OK | 1 | 0.3% | Binary Incompatible |
| T:System.Windows.Forms.MessageBox | 1 | 0.3% | Binary Incompatible |
| T:System.Windows.Forms.DialogResult | 1 | 0.3% | Binary Incompatible |
| M:System.Windows.Forms.MessageBox.Show(System.String,System.String,System.Windows.Forms.MessageBoxButtons,System.Windows.Forms.MessageBoxIcon) | 1 | 0.3% | Binary Incompatible |
| F:System.Windows.Forms.ToolTipIcon.None | 1 | 0.3% | Binary Incompatible |
| F:System.Windows.Forms.ToolTipIcon.Info | 1 | 0.3% | Binary Incompatible |
| F:System.Windows.Forms.ToolTipIcon.Warning | 1 | 0.3% | Binary Incompatible |
| M:System.TimeSpan.FromSeconds(System.Double) | 1 | 0.3% | Source Incompatible |
| M:System.IO.Pipes.NamedPipeServerStream.#ctor(System.String,System.IO.Pipes.PipeDirection,System.Int32,System.IO.Pipes.PipeTransmissionMode,System.IO.Pipes.PipeOptions,System.Int32,System.Int32,System.IO.Pipes.PipeSecurity) | 1 | 0.3% | Binary Incompatible |
| M:System.Windows.Forms.ToolStripDropDown.Show | 1 | 0.3% | Binary Incompatible |

## Projects Relationship Graph

Legend:
📦 SDK-style project
⚙️ Classic project

```mermaid
flowchart LR
    P1["<b>⚙️&nbsp;epgTray.csproj</b><br/><small>net48</small>"]
    P1 --> P2
    click P1 "#epgtraycsproj"

```

## Project Details

<a id="epgtraycsproj"></a>
### epgTray.csproj

#### Project Info

- **Current Target Framework:** net48
- **Proposed Target Framework:** net10.0-windows
- **SDK-style**: False
- **Project Kind:** ClassicWinForms
- **Dependencies**: 1
- **Dependants**: 0
- **Number of Files**: 7
- **Number of Files with Incidents**: 5
- **Lines of Code**: 618
- **Estimated LOC to modify**: 292+ (at least 47.2% of the project)

#### Dependency Graph

Legend:
📦 SDK-style project
⚙️ Classic project

```mermaid
flowchart TB
    subgraph current["epgTray.csproj"]
        MAIN["<b>⚙️&nbsp;epgTray.csproj</b><br/><small>net48</small>"]
        click MAIN "#epgtraycsproj"
    end
    subgraph downstream["Dependencies (1"]
    end
    MAIN --> P2

```

### API Compatibility

| Category | Count | Impact |
| :--- | :---: | :--- |
| 🔴 Binary Incompatible | 249 | High - Require code changes |
| 🟡 Source Incompatible | 43 | Medium - Needs re-compilation and potential conflicting API error fixing |
| 🔵 Behavioral change | 0 | Low - Behavioral changes that may require testing at runtime |
| ✅ Compatible | 423 |  |
| ***Total APIs Analyzed*** | ***715*** |  |

#### Project Technologies and Features

| Technology | Issues | Percentage | Migration Path |
| :--- | :---: | :---: | :--- |
| Windows Access Control Lists (ACLs) | 1 | 0.3% | Windows Access Control List (ACL) APIs for file, directory, and synchronization object security that have moved to extension methods or different types. While .NET Core supports Windows ACLs, the APIs have been reorganized. Use System.IO.FileSystem.AccessControl and similar packages for ACL functionality. |
| Windows Forms Legacy Controls | 1 | 0.3% | Legacy Windows Forms controls that have been removed from .NET Core/5+ including StatusBar, DataGrid, ContextMenu, MainMenu, MenuItem, and ToolBar. These controls were replaced by more modern alternatives. Use ToolStrip, MenuStrip, ContextMenuStrip, and DataGridView instead. |
| GDI+ / System.Drawing | 26 | 8.9% | System.Drawing APIs for 2D graphics, imaging, and printing that are available via NuGet package System.Drawing.Common. Note: Not recommended for server scenarios due to Windows dependencies; consider cross-platform alternatives like SkiaSharp or ImageSharp for new code. |
| Legacy Configuration System | 11 | 3.8% | Legacy XML-based configuration system (app.config/web.config) that has been replaced by a more flexible configuration model in .NET Core. The old system was rigid and XML-based. Migrate to Microsoft.Extensions.Configuration with JSON/environment variables; use System.Configuration.ConfigurationManager NuGet package as interim bridge if needed. |
| Windows Forms | 248 | 84.9% | Windows Forms APIs for building Windows desktop applications with traditional Forms-based UI that are available in .NET on Windows. Enable Windows Desktop support: Option 1 (Recommended): Target net9.0-windows; Option 2: Add <UseWindowsDesktop>true</UseWindowsDesktop>; Option 3 (Legacy): Use Microsoft.NET.Sdk.WindowsDesktop SDK. |

