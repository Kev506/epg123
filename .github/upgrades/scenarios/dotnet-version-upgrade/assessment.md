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

  - [%USERPROFILE%\source\repos\epg123\src\GaRyan2.MxfXmltvTools\GaRyan2.MxfXmltvTools.csproj](#%userprofile%sourcereposepg123srcgaryan2mxfxmltvtoolsgaryan2mxfxmltvtoolscsproj)
  - [%USERPROFILE%\source\repos\epg123\src\GaRyan2.Utilities\GaRyan2.Utilities.csproj](#%userprofile%sourcereposepg123srcgaryan2utilitiesgaryan2utilitiescsproj)
  - [%USERPROFILE%\source\repos\epg123\src\GaRyan2.WmcUtilities\GaRyan2.WmcUtilities.csproj](#%userprofile%sourcereposepg123srcgaryan2wmcutilitiesgaryan2wmcutilitiescsproj)
  - [epg123Transfer.csproj](#epg123transfercsproj)


## Executive Summary

### Highlevel Metrics

| Metric | Count | Status |
| :--- | :---: | :--- |
| Total Projects | 4 | 1 require upgrade |
| Total NuGet Packages | 0 | All compatible |
| Total Code Files | 79 |  |
| Total Code Files with Incidents | 7 |  |
| Total Lines of Code | 9180 |  |
| Total Number of Issues | 768 |  |
| Estimated LOC to modify | 765+ | at least 8.3% of codebase |

### Projects Compatibility

| Project | Target Framework | Difficulty | Package Issues | API Issues | Binding Issues | Est. LOC Impact | Description |
| :--- | :---: | :---: | :---: | :---: | :---: | :---: | :--- |
| [%USERPROFILE%\source\repos\epg123\src\GaRyan2.MxfXmltvTools\GaRyan2.MxfXmltvTools.csproj](#%userprofile%sourcereposepg123srcgaryan2mxfxmltvtoolsgaryan2mxfxmltvtoolscsproj) | net10.0-windows | ✅ None | 0 | 0 | 0 |  | ClassLibrary, Sdk Style = True |
| [%USERPROFILE%\source\repos\epg123\src\GaRyan2.Utilities\GaRyan2.Utilities.csproj](#%userprofile%sourcereposepg123srcgaryan2utilitiesgaryan2utilitiescsproj) | net10.0-windows | ✅ None | 0 | 0 | 0 |  | ClassLibrary, Sdk Style = True |
| [%USERPROFILE%\source\repos\epg123\src\GaRyan2.WmcUtilities\GaRyan2.WmcUtilities.csproj](#%userprofile%sourcereposepg123srcgaryan2wmcutilitiesgaryan2wmcutilitiescsproj) | net10.0-windows | ✅ None | 0 | 0 | 0 |  | ClassLibrary, Sdk Style = True |
| [epg123Transfer.csproj](#epg123transfercsproj) | net48 | 🟡 Medium | 1 | 765 | 0 | 765+ | ClassicWinForms, Sdk Style = False |

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
| 🔴 Binary Incompatible | 754 | High - Require code changes |
| 🟡 Source Incompatible | 10 | Medium - Needs re-compilation and potential conflicting API error fixing |
| 🔵 Behavioral change | 1 | Low - Behavioral changes that may require testing at runtime |
| ✅ Compatible | 1141 |  |
| ***Total APIs Analyzed*** | ***1906*** |  |

## Aggregate NuGet packages details

| Package | Current Version | Suggested Version | Projects | Description |
| :--- | :---: | :---: | :--- | :--- |

## Top API Migration Challenges

### Technologies and Features

| Technology | Issues | Percentage | Migration Path |
| :--- | :---: | :---: | :--- |
| Windows Forms | 754 | 98.6% | Windows Forms APIs for building Windows desktop applications with traditional Forms-based UI that are available in .NET on Windows. Enable Windows Desktop support: Option 1 (Recommended): Target net9.0-windows; Option 2: Add <UseWindowsDesktop>true</UseWindowsDesktop>; Option 3 (Legacy): Use Microsoft.NET.Sdk.WindowsDesktop SDK. |
| GDI+ / System.Drawing | 6 | 0.8% | System.Drawing APIs for 2D graphics, imaging, and printing that are available via NuGet package System.Drawing.Common. Note: Not recommended for server scenarios due to Windows dependencies; consider cross-platform alternatives like SkiaSharp or ImageSharp for new code. |
| Legacy Configuration System | 2 | 0.3% | Legacy XML-based configuration system (app.config/web.config) that has been replaced by a more flexible configuration model in .NET Core. The old system was rigid and XML-based. Migrate to Microsoft.Extensions.Configuration with JSON/environment variables; use System.Configuration.ConfigurationManager NuGet package as interim bridge if needed. |
| Windows Forms Legacy Controls | 1 | 0.1% | Legacy Windows Forms controls that have been removed from .NET Core/5+ including StatusBar, DataGrid, ContextMenu, MainMenu, MenuItem, and ToolBar. These controls were replaced by more modern alternatives. Use ToolStrip, MenuStrip, ContextMenuStrip, and DataGridView instead. |

### Most Frequent API Issues

| API | Count | Percentage | Category |
| :--- | :---: | :---: | :--- |
| T:System.Windows.Forms.ListView | 55 | 7.2% | Binary Incompatible |
| T:System.Windows.Forms.SortOrder | 50 | 6.5% | Binary Incompatible |
| T:System.Windows.Forms.Button | 38 | 5.0% | Binary Incompatible |
| T:System.Windows.Forms.Label | 33 | 4.3% | Binary Incompatible |
| T:System.Windows.Forms.AnchorStyles | 32 | 4.2% | Binary Incompatible |
| T:System.Windows.Forms.ColumnHeader | 31 | 4.1% | Binary Incompatible |
| T:System.Windows.Forms.SplitContainer | 23 | 3.0% | Binary Incompatible |
| P:System.Windows.Forms.ListViewItem.Tag | 17 | 2.2% | Binary Incompatible |
| P:System.Windows.Forms.ColumnHeader.Width | 11 | 1.4% | Binary Incompatible |
| F:System.Windows.Forms.SortOrder.Ascending | 11 | 1.4% | Binary Incompatible |
| T:System.Windows.Forms.ContextMenuStrip | 11 | 1.4% | Binary Incompatible |
| P:System.Windows.Forms.Control.Name | 11 | 1.4% | Binary Incompatible |
| P:System.Windows.Forms.Control.Size | 10 | 1.3% | Binary Incompatible |
| P:System.Windows.Forms.ListViewItem.Checked | 9 | 1.2% | Binary Incompatible |
| T:System.Windows.Forms.ListView.ListViewItemCollection | 9 | 1.2% | Binary Incompatible |
| P:System.Windows.Forms.ListView.Items | 9 | 1.2% | Binary Incompatible |
| T:System.Windows.Forms.ListView.ColumnHeaderCollection | 9 | 1.2% | Binary Incompatible |
| P:System.Windows.Forms.ListView.Columns | 9 | 1.2% | Binary Incompatible |
| P:System.Windows.Forms.ListViewItem.BackColor | 9 | 1.2% | Binary Incompatible |
| T:System.Windows.Forms.OpenFileDialog | 9 | 1.2% | Binary Incompatible |
| T:System.Windows.Forms.Control.ControlCollection | 9 | 1.2% | Binary Incompatible |
| P:System.Windows.Forms.Control.Controls | 9 | 1.2% | Binary Incompatible |
| M:System.Windows.Forms.Control.ControlCollection.Add(System.Windows.Forms.Control) | 9 | 1.2% | Binary Incompatible |
| P:System.Windows.Forms.Control.TabIndex | 9 | 1.2% | Binary Incompatible |
| P:System.Windows.Forms.Control.Location | 9 | 1.2% | Binary Incompatible |
| T:System.Windows.Forms.Cursor | 8 | 1.0% | Binary Incompatible |
| T:System.Windows.Forms.ListViewItem | 8 | 1.0% | Binary Incompatible |
| T:System.Windows.Forms.ToolStripMenuItem | 8 | 1.0% | Binary Incompatible |
| T:System.Windows.Forms.SplitterPanel | 8 | 1.0% | Binary Incompatible |
| P:System.Windows.Forms.ListView.ColumnHeaderCollection.Item(System.Int32) | 7 | 0.9% | Binary Incompatible |
| T:System.Windows.Forms.MessageBoxButtons | 6 | 0.8% | Binary Incompatible |
| T:System.Windows.Forms.DialogResult | 6 | 0.8% | Binary Incompatible |
| P:System.Windows.Forms.Control.Anchor | 6 | 0.8% | Binary Incompatible |
| T:System.Windows.Forms.View | 6 | 0.8% | Binary Incompatible |
| T:System.Windows.Forms.DockStyle | 6 | 0.8% | Binary Incompatible |
| M:System.Windows.Forms.ListViewItem.#ctor(System.String[]) | 5 | 0.7% | Binary Incompatible |
| T:System.Windows.Forms.CheckState | 5 | 0.7% | Binary Incompatible |
| T:System.Windows.Forms.Keys | 5 | 0.7% | Binary Incompatible |
| M:System.Windows.Forms.Control.ResumeLayout(System.Boolean) | 5 | 0.7% | Binary Incompatible |
| P:System.Windows.Forms.SplitContainer.Panel1 | 5 | 0.7% | Binary Incompatible |
| M:System.Windows.Forms.Control.SuspendLayout | 5 | 0.7% | Binary Incompatible |
| T:System.Windows.Forms.Cursors | 4 | 0.5% | Binary Incompatible |
| P:System.Windows.Forms.Control.Cursor | 4 | 0.5% | Binary Incompatible |
| F:System.Windows.Forms.SortOrder.Descending | 4 | 0.5% | Binary Incompatible |
| T:System.Windows.Forms.ListViewItem.ListViewSubItemCollection | 4 | 0.5% | Binary Incompatible |
| P:System.Windows.Forms.ListViewItem.SubItems | 4 | 0.5% | Binary Incompatible |
| T:System.Windows.Forms.ListViewItem.ListViewSubItem | 4 | 0.5% | Binary Incompatible |
| P:System.Windows.Forms.ListViewItem.ListViewSubItemCollection.Item(System.Int32) | 4 | 0.5% | Binary Incompatible |
| P:System.Windows.Forms.ListViewItem.ListViewSubItem.Text | 4 | 0.5% | Binary Incompatible |
| F:System.Windows.Forms.AnchorStyles.Bottom | 4 | 0.5% | Binary Incompatible |

## Projects Relationship Graph

Legend:
📦 SDK-style project
⚙️ Classic project

```mermaid
flowchart LR
    P1["<b>⚙️&nbsp;epg123Transfer.csproj</b><br/><small>net48</small>"]
    P1 --> P2
    P1 --> P3
    P1 --> P4
    P2 --> P3
    P4 --> P2
    P4 --> P3
    click P1 "#epg123transfercsproj"

```

## Project Details

<a id="epg123transfercsproj"></a>
### epg123Transfer.csproj

#### Project Info

- **Current Target Framework:** net48
- **Proposed Target Framework:** net10.0-windows
- **SDK-style**: False
- **Project Kind:** ClassicWinForms
- **Dependencies**: 3
- **Dependants**: 0
- **Number of Files**: 10
- **Number of Files with Incidents**: 7
- **Lines of Code**: 1326
- **Estimated LOC to modify**: 765+ (at least 57.7% of the project)

#### Dependency Graph

Legend:
📦 SDK-style project
⚙️ Classic project

```mermaid
flowchart TB
    subgraph current["epg123Transfer.csproj"]
        MAIN["<b>⚙️&nbsp;epg123Transfer.csproj</b><br/><small>net48</small>"]
        click MAIN "#epg123transfercsproj"
    end
    subgraph downstream["Dependencies (3"]
    end
    MAIN --> P2
    MAIN --> P3
    MAIN --> P4

```

### API Compatibility

| Category | Count | Impact |
| :--- | :---: | :--- |
| 🔴 Binary Incompatible | 754 | High - Require code changes |
| 🟡 Source Incompatible | 10 | Medium - Needs re-compilation and potential conflicting API error fixing |
| 🔵 Behavioral change | 1 | Low - Behavioral changes that may require testing at runtime |
| ✅ Compatible | 1141 |  |
| ***Total APIs Analyzed*** | ***1906*** |  |

#### Project Technologies and Features

| Technology | Issues | Percentage | Migration Path |
| :--- | :---: | :---: | :--- |
| Legacy Configuration System | 2 | 0.3% | Legacy XML-based configuration system (app.config/web.config) that has been replaced by a more flexible configuration model in .NET Core. The old system was rigid and XML-based. Migrate to Microsoft.Extensions.Configuration with JSON/environment variables; use System.Configuration.ConfigurationManager NuGet package as interim bridge if needed. |
| GDI+ / System.Drawing | 6 | 0.8% | System.Drawing APIs for 2D graphics, imaging, and printing that are available via NuGet package System.Drawing.Common. Note: Not recommended for server scenarios due to Windows dependencies; consider cross-platform alternatives like SkiaSharp or ImageSharp for new code. |
| Windows Forms Legacy Controls | 1 | 0.1% | Legacy Windows Forms controls that have been removed from .NET Core/5+ including StatusBar, DataGrid, ContextMenu, MainMenu, MenuItem, and ToolBar. These controls were replaced by more modern alternatives. Use ToolStrip, MenuStrip, ContextMenuStrip, and DataGridView instead. |
| Windows Forms | 754 | 98.6% | Windows Forms APIs for building Windows desktop applications with traditional Forms-based UI that are available in .NET on Windows. Enable Windows Desktop support: Option 1 (Recommended): Target net9.0-windows; Option 2: Add <UseWindowsDesktop>true</UseWindowsDesktop>; Option 3 (Legacy): Use Microsoft.NET.Sdk.WindowsDesktop SDK. |

