# Upgrade Options — epg123Transfer

Assessment: 4 projects analyzed; 1 classic WinForms net48 project requires upgrade; referenced libraries already target net10.0-windows; assessment found 765 API issues in the app project.

## Strategy

### Upgrade Strategy
A single non-SDK-style application project needs migration work, while its referenced projects are already on modern .NET, so an atomic app-focused upgrade is the best fit.

| Value | Description |
|-------|-------------|
| **All-at-Once** (selected) | Upgrade the remaining legacy application in one atomic pass with separate prerequisite, conversion, upgrade, and validation tasks. |
| Bottom-Up | Upgrade dependency tiers separately with validation between tiers. |

## Project Structure

### Project Approach
`epg123Transfer` is a Windows desktop application rather than a web project or shared multi-targeted library, so it should be migrated directly in place.

| Value | Description |
|-------|-------------|
| **In-place** (selected) | Replace the current project format and target framework directly without introducing a parallel application. |

## Compatibility

### Unsupported API Handling
The assessment reported 754 binary-incompatible APIs and 10 source-incompatible APIs, so breaking API changes must be handled as part of the upgrade.

| Value | Description |
|-------|-------------|
| **Fix Inline** (selected) | Resolve API changes in the upgrade task so no stubbed follow-up work remains. |
| Defer Complex Changes | Apply simple replacements now and create stub-resolution subtasks for complex cases. |

### Windows Native APIs
The project is a WinForms desktop application with broad Windows-specific API usage, including Windows Forms and System.Drawing.

| Value | Description |
|-------|-------------|
| **Windows Compatibility Pack** (selected) | Add Microsoft.Windows.Compatibility so Windows-only APIs continue to work on modern .NET. |
| No Compatibility Pack | Surface Windows API issues immediately and replace them with cross-platform alternatives. |

## Modernization

### Nullable Reference Types
The upgrade already has substantial breaking-change work, so nullable enablement should stay out of the initial migration scope.

| Value | Description |
|-------|-------------|
| **Leave Disabled** (selected) | Keep nullable reference types off during the framework migration. |
| Enable Nullable Reference Types | Enable nullable analysis now and fix the resulting warnings during the upgrade. |
