# Upgrade Options — epg123.sln

Assessment: 2 projects analyzed; 1 .NET Framework WinForms project requires migration with high API compatibility impact and one already-modern dependency.

## Strategy

### Upgrade Strategy
Multi-project .NET Framework migration was detected, which requires dependency-first sequencing.

| Value | Description |
|-------|-------------|
| **Bottom-Up** (selected) | Upgrade projects from dependency leaves toward application roots with validation at each stage. |

## Project Structure

### Project Approach
The in-scope workload is a WinForms desktop app (not ASP.NET System.Web), so side-by-side web migration is not applicable.

| Value | Description |
|-------|-------------|
| **In-place** (selected) | Upgrade project(s) directly within existing structure during this migration run. |
| Multi-targeting | Keep old and new target frameworks temporarily in the same project during transition. |

### Package Management
Assessment indicates a framework-to-modern transition with non-SDK legacy project format in scope.

| Value | Description |
|-------|-------------|
| **Per-Project (defer CPM to post-migration)** (selected) | Keep package versions in individual project files during migration and adopt CPM afterward. |
| Central Package Management (CPM) | Move package versions into Directory.Packages.props for centralized version control. |

## Compatibility

### Unsupported API Handling
Assessment reported binary/source API incompatibilities that must be remediated during upgrade execution.

| Value | Description |
|-------|-------------|
| **Fix Inline** (selected) | Resolve all API incompatibilities during the upgrade task without deferring with stubs. |
| Defer Complex Changes | Apply mechanical fixes now and defer hard API migrations into follow-up subtasks. |

### Windows Native APIs
Assessment shows heavy WinForms/System.Drawing usage, so Windows compatibility support is required.

| Value | Description |
|-------|-------------|
| **Windows Compatibility Pack** (selected) | Keep Windows-specific APIs available on modern .NET via compatibility package support. |
| No Compatibility Pack | Surface Windows API breaks immediately and replace with cross-platform alternatives. |

## Modernization

### Nullable Reference Types
Migration scope is compatibility-heavy and should avoid adding nullable warning churn during framework transition.

| Value | Description |
|-------|-------------|
| **Leave Disabled** (selected) | Keep nullable reference types disabled during migration and consider enabling in a follow-up effort. |
| Enable Nullable Reference Types | Enable nullable annotations now and remediate resulting compiler warnings during this migration. |
