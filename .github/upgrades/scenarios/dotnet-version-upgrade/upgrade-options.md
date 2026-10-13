# Upgrade Options — epg123

Assessment: 4 net48 classic projects (WinForms + class libraries), non-SDK-style, with substantial API compatibility changes and Windows-specific API usage.

## Strategy

### Upgrade Strategy
Multiple .NET Framework projects are in scope, so dependency-first migration is required for safer execution.

| Value | Description |
|-------|-------------|
| **Bottom-Up** (selected) | Upgrade dependency layers first, then move upward to dependent projects with validation at each layer. |

## Project Structure

### Project Approach
All scoped projects are .NET Framework projects without System.Web web migration requirements, so in-place migration is the direct approach.

| Value | Description |
|-------|-------------|
| **In-place** (selected) | Replace existing target frameworks directly during migration without side-by-side web scaffolding. |
| Multi-targeting | Add old and new target frameworks side-by-side for transitional compatibility. |

### Package Management
The solution spans multiple classic projects crossing .NET Framework to modern .NET, so package divergence should be managed per project during migration.

| Value | Description |
|-------|-------------|
| **Per-Project (defer CPM to post-migration)** (selected) | Keep package versions in each project during migration and defer Central Package Management until all projects are modernized. |
| Central Package Management (CPM) | Move package versions into Directory.Packages.props for centralized version control. |

## Compatibility

### Unsupported API Handling
Assessment reported binary/source breaking API changes across the project graph that should be resolved during migration tasks.

| Value | Description |
|-------|-------------|
| **Fix Inline** (selected) | Resolve all API breaks directly in upgrade tasks, including complex replacements. |
| Defer Complex Changes | Stub only complex API changes and resolve them in follow-up subtasks. |

### Windows Native APIs
Assessment shows heavy System.Windows.Forms and System.Drawing usage, so Windows API compatibility support is needed during migration.

| Value | Description |
|-------|-------------|
| **Windows Compatibility Pack** (selected) | Add Microsoft.Windows.Compatibility support and keep Windows-only APIs functional during upgrade. |
| No Compatibility Pack | Force immediate replacement of Windows-specific APIs with cross-platform alternatives. |
