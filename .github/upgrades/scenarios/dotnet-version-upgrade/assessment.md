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
  - [%USERPROFILE%\source\repos\epg123\src\GaRyan2.MxfXmltvTools\GaRyan2.MxfXmltvTools.csproj](#%userprofile%sourcereposepg123srcgaryan2mxfxmltvtoolsgaryan2mxfxmltvtoolscsproj)
  - [%USERPROFILE%\source\repos\epg123\src\GaRyan2.Utilities\GaRyan2.Utilities.csproj](#%userprofile%sourcereposepg123srcgaryan2utilitiesgaryan2utilitiescsproj)
  - [%USERPROFILE%\source\repos\epg123\src\GaRyan2.WmcUtilities\GaRyan2.WmcUtilities.csproj](#%userprofile%sourcereposepg123srcgaryan2wmcutilitiesgaryan2wmcutilitiescsproj)
  - [epg123Client.csproj](#epg123clientcsproj)


## Executive Summary

### Highlevel Metrics

| Metric | Count | Status |
| :--- | :---: | :--- |
| Total Projects | 5 | 2 require upgrade |
| Total NuGet Packages | 0 | All compatible |
| Total Code Files | 116 |  |
| Total Code Files with Incidents | 39 |  |
| Total Lines of Code | 20515 |  |
| Total Number of Issues | 10945 |  |
| Estimated LOC to modify | 10941+ | at least 53.3% of codebase |

### Projects Compatibility

| Project | Target Framework | Difficulty | Package Issues | API Issues | Binding Issues | Est. LOC Impact | Description |
| :--- | :---: | :---: | :---: | :---: | :---: | :---: | :--- |
| [%USERPROFILE%\source\repos\epg123\src\GaRyan2.Github\GaRyan2.Github.csproj](#%userprofile%sourcereposepg123srcgaryan2githubgaryan2githubcsproj) | net10.0-windows | ✅ None | 0 | 0 | 0 |  | ClassLibrary, Sdk Style = True |
| [%USERPROFILE%\source\repos\epg123\src\GaRyan2.MxfXmltvTools\GaRyan2.MxfXmltvTools.csproj](#%userprofile%sourcereposepg123srcgaryan2mxfxmltvtoolsgaryan2mxfxmltvtoolscsproj) | net10.0-windows | ✅ None | 0 | 0 | 0 |  | ClassLibrary, Sdk Style = True |
| [%USERPROFILE%\source\repos\epg123\src\GaRyan2.Utilities\GaRyan2.Utilities.csproj](#%userprofile%sourcereposepg123srcgaryan2utilitiesgaryan2utilitiescsproj) | net10.0-windows | ✅ None | 0 | 0 | 0 |  | ClassLibrary, Sdk Style = True |
| [%USERPROFILE%\source\repos\epg123\src\GaRyan2.WmcUtilities\GaRyan2.WmcUtilities.csproj](#%userprofile%sourcereposepg123srcgaryan2wmcutilitiesgaryan2wmcutilitiescsproj) | net48 | 🟢 Low | 0 | 16 | 0 | 16+ | ClassicClassLibrary, Sdk Style = False |
| [epg123Client.csproj](#epg123clientcsproj) | net48 | 🟡 Medium | 0 | 10925 | 0 | 10925+ | ClassicWinForms, Sdk Style = False |

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
| 🔴 Binary Incompatible | 10297 | High - Require code changes |
| 🟡 Source Incompatible | 639 | Medium - Needs re-compilation and potential conflicting API error fixing |
| 🔵 Behavioral change | 5 | Low - Behavioral changes that may require testing at runtime |
| ✅ Compatible | 14355 |  |
| ***Total APIs Analyzed*** | ***25296*** |  |

## Aggregate NuGet packages details

| Package | Current Version | Suggested Version | Projects | Description |
| :--- | :---: | :---: | :--- | :--- |

## Top API Migration Challenges

### Technologies and Features

| Technology | Issues | Percentage | Migration Path |
| :--- | :---: | :---: | :--- |
| Windows Forms | 10294 | 94.1% | Windows Forms APIs for building Windows desktop applications with traditional Forms-based UI that are available in .NET on Windows. Enable Windows Desktop support: Option 1 (Recommended): Target net9.0-windows; Option 2: Add <UseWindowsDesktop>true</UseWindowsDesktop>; Option 3 (Legacy): Use Microsoft.NET.Sdk.WindowsDesktop SDK. |
| GDI+ / System.Drawing | 589 | 5.4% | System.Drawing APIs for 2D graphics, imaging, and printing that are available via NuGet package System.Drawing.Common. Note: Not recommended for server scenarios due to Windows dependencies; consider cross-platform alternatives like SkiaSharp or ImageSharp for new code. |
| Legacy Configuration System | 17 | 0.2% | Legacy XML-based configuration system (app.config/web.config) that has been replaced by a more flexible configuration model in .NET Core. The old system was rigid and XML-based. Migrate to Microsoft.Extensions.Configuration with JSON/environment variables; use System.Configuration.ConfigurationManager NuGet package as interim bridge if needed. |
| Legacy Cryptography | 2 | 0.0% | Obsolete or insecure cryptographic algorithms that have been deprecated for security reasons. These algorithms are no longer considered secure by modern standards. Migrate to modern cryptographic APIs using secure algorithms. |
| Windows Forms Legacy Controls | 2 | 0.0% | Legacy Windows Forms controls that have been removed from .NET Core/5+ including StatusBar, DataGrid, ContextMenu, MainMenu, MenuItem, and ToolBar. These controls were replaced by more modern alternatives. Use ToolStrip, MenuStrip, ContextMenuStrip, and DataGridView instead. |
| Windows Access Control Lists (ACLs) | 1 | 0.0% | Windows Access Control List (ACL) APIs for file, directory, and synchronization object security that have moved to extension methods or different types. While .NET Core supports Windows ACLs, the APIs have been reorganized. Use System.IO.FileSystem.AccessControl and similar packages for ACL functionality. |

### Most Frequent API Issues

| API | Count | Percentage | Category |
| :--- | :---: | :---: | :--- |
| T:System.Windows.Forms.Label | 833 | 7.6% | Binary Incompatible |
| T:System.Windows.Forms.Button | 418 | 3.8% | Binary Incompatible |
| T:System.Windows.Forms.CheckBox | 319 | 2.9% | Binary Incompatible |
| T:System.Windows.Forms.ListView | 258 | 2.4% | Binary Incompatible |
| T:System.Windows.Forms.ToolStripButton | 236 | 2.2% | Binary Incompatible |
| P:System.Windows.Forms.Control.Name | 229 | 2.1% | Binary Incompatible |
| T:System.Windows.Forms.TextBox | 221 | 2.0% | Binary Incompatible |
| P:System.Windows.Forms.Control.Location | 218 | 2.0% | Binary Incompatible |
| P:System.Windows.Forms.Control.Size | 217 | 2.0% | Binary Incompatible |
| T:System.Windows.Forms.NumericUpDown | 214 | 2.0% | Binary Incompatible |
| T:System.Windows.Forms.Control.ControlCollection | 214 | 2.0% | Binary Incompatible |
| P:System.Windows.Forms.Control.Controls | 214 | 2.0% | Binary Incompatible |
| M:System.Windows.Forms.Control.ControlCollection.Add(System.Windows.Forms.Control) | 214 | 2.0% | Binary Incompatible |
| P:System.Windows.Forms.Control.TabIndex | 209 | 1.9% | Binary Incompatible |
| T:System.Windows.Forms.GroupBox | 199 | 1.8% | Binary Incompatible |
| T:System.Windows.Forms.TrackBar | 182 | 1.7% | Binary Incompatible |
| T:System.Windows.Forms.ColumnHeader | 147 | 1.3% | Binary Incompatible |
| T:System.Windows.Forms.Cursor | 138 | 1.3% | Binary Incompatible |
| T:System.Windows.Forms.SplitContainer | 106 | 1.0% | Binary Incompatible |
| T:System.Windows.Forms.DialogResult | 104 | 1.0% | Binary Incompatible |
| P:System.Windows.Forms.Label.Text | 101 | 0.9% | Binary Incompatible |
| T:System.Windows.Forms.TabPage | 101 | 0.9% | Binary Incompatible |
| T:System.Windows.Forms.RadioButton | 92 | 0.8% | Binary Incompatible |
| T:System.Drawing.FontStyle | 88 | 0.8% | Source Incompatible |
| T:System.Windows.Forms.SortOrder | 87 | 0.8% | Binary Incompatible |
| T:System.Drawing.Bitmap | 78 | 0.7% | Source Incompatible |
| P:System.Windows.Forms.Control.Enabled | 78 | 0.7% | Binary Incompatible |
| T:System.Windows.Forms.ToolStrip | 78 | 0.7% | Binary Incompatible |
| M:System.Windows.Forms.Label.#ctor | 76 | 0.7% | Binary Incompatible |
| T:System.Windows.Forms.MessageBoxButtons | 76 | 0.7% | Binary Incompatible |
| P:System.Windows.Forms.CheckBox.Checked | 76 | 0.7% | Binary Incompatible |
| T:System.Windows.Forms.ToolStripMenuItem | 76 | 0.7% | Binary Incompatible |
| T:System.Windows.Forms.ToolStripComboBox | 75 | 0.7% | Binary Incompatible |
| T:System.Windows.Forms.Cursors | 69 | 0.6% | Binary Incompatible |
| P:System.Windows.Forms.Control.Cursor | 69 | 0.6% | Binary Incompatible |
| P:System.Windows.Forms.TextBox.Text | 68 | 0.6% | Binary Incompatible |
| T:System.Drawing.ContentAlignment | 66 | 0.6% | Source Incompatible |
| P:System.Windows.Forms.ButtonBase.UseVisualStyleBackColor | 63 | 0.6% | Binary Incompatible |
| P:System.Windows.Forms.ButtonBase.Text | 62 | 0.6% | Binary Incompatible |
| T:System.Windows.Forms.ListViewItem | 61 | 0.6% | Binary Incompatible |
| T:System.Windows.Forms.ToolStripSeparator | 57 | 0.5% | Binary Incompatible |
| T:System.Windows.Forms.MessageBoxIcon | 56 | 0.5% | Binary Incompatible |
| T:System.Drawing.Font | 55 | 0.5% | Source Incompatible |
| T:System.Windows.Forms.ListViewItem.ListViewSubItem | 55 | 0.5% | Binary Incompatible |
| T:System.Drawing.GraphicsUnit | 54 | 0.5% | Source Incompatible |
| T:System.Windows.Forms.ToolStripContainer | 54 | 0.5% | Binary Incompatible |
| P:System.Windows.Forms.Label.AutoSize | 53 | 0.5% | Binary Incompatible |
| T:System.Windows.Forms.ComboBox | 52 | 0.5% | Binary Incompatible |
| T:System.Windows.Forms.ListViewItem.ListViewSubItemCollection | 51 | 0.5% | Binary Incompatible |
| P:System.Windows.Forms.ListViewItem.SubItems | 51 | 0.5% | Binary Incompatible |

## Projects Relationship Graph

Legend:
📦 SDK-style project
⚙️ Classic project

```mermaid
flowchart LR
    P1["<b>⚙️&nbsp;epg123Client.csproj</b><br/><small>net48</small>"]
    P1 --> P2
    P1 --> P3
    P1 --> P4
    P1 --> P5
    P2 --> P4
    P3 --> P4
    P5 --> P3
    P5 --> P4
    click P1 "#epg123clientcsproj"

```

## Project Details

<a id="epg123clientcsproj"></a>
### epg123Client.csproj

#### Project Info

- **Current Target Framework:** net48
- **Proposed Target Framework:** net10.0-windows
- **SDK-style**: False
- **Project Kind:** ClassicWinForms
- **Dependencies**: 4
- **Dependants**: 0
- **Number of Files**: 69
- **Number of Files with Incidents**: 34
- **Lines of Code**: 12332
- **Estimated LOC to modify**: 10925+ (at least 88.6% of the project)

#### Dependency Graph

Legend:
📦 SDK-style project
⚙️ Classic project

```mermaid
flowchart TB
    subgraph current["epg123Client.csproj"]
        MAIN["<b>⚙️&nbsp;epg123Client.csproj</b><br/><small>net48</small>"]
        click MAIN "#epg123clientcsproj"
    end
    subgraph downstream["Dependencies (4"]
    end
    MAIN --> P2
    MAIN --> P3
    MAIN --> P4
    MAIN --> P5

```

### API Compatibility

| Category | Count | Impact |
| :--- | :---: | :--- |
| 🔴 Binary Incompatible | 10297 | High - Require code changes |
| 🟡 Source Incompatible | 627 | Medium - Needs re-compilation and potential conflicting API error fixing |
| 🔵 Behavioral change | 1 | Low - Behavioral changes that may require testing at runtime |
| ✅ Compatible | 12605 |  |
| ***Total APIs Analyzed*** | ***23530*** |  |

#### Project Technologies and Features

| Technology | Issues | Percentage | Migration Path |
| :--- | :---: | :---: | :--- |
| Windows Access Control Lists (ACLs) | 1 | 0.0% | Windows Access Control List (ACL) APIs for file, directory, and synchronization object security that have moved to extension methods or different types. While .NET Core supports Windows ACLs, the APIs have been reorganized. Use System.IO.FileSystem.AccessControl and similar packages for ACL functionality. |
| Legacy Cryptography | 1 | 0.0% | Obsolete or insecure cryptographic algorithms that have been deprecated for security reasons. These algorithms are no longer considered secure by modern standards. Migrate to modern cryptographic APIs using secure algorithms. |
| Legacy Configuration System | 17 | 0.2% | Legacy XML-based configuration system (app.config/web.config) that has been replaced by a more flexible configuration model in .NET Core. The old system was rigid and XML-based. Migrate to Microsoft.Extensions.Configuration with JSON/environment variables; use System.Configuration.ConfigurationManager NuGet package as interim bridge if needed. |
| Windows Forms Legacy Controls | 2 | 0.0% | Legacy Windows Forms controls that have been removed from .NET Core/5+ including StatusBar, DataGrid, ContextMenu, MainMenu, MenuItem, and ToolBar. These controls were replaced by more modern alternatives. Use ToolStrip, MenuStrip, ContextMenuStrip, and DataGridView instead. |
| GDI+ / System.Drawing | 589 | 5.4% | System.Drawing APIs for 2D graphics, imaging, and printing that are available via NuGet package System.Drawing.Common. Note: Not recommended for server scenarios due to Windows dependencies; consider cross-platform alternatives like SkiaSharp or ImageSharp for new code. |
| Windows Forms | 10294 | 94.2% | Windows Forms APIs for building Windows desktop applications with traditional Forms-based UI that are available in .NET on Windows. Enable Windows Desktop support: Option 1 (Recommended): Target net9.0-windows; Option 2: Add <UseWindowsDesktop>true</UseWindowsDesktop>; Option 3 (Legacy): Use Microsoft.NET.Sdk.WindowsDesktop SDK. |

