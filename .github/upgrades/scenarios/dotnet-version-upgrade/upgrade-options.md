# Upgrade Options — epg123

Assessment: 6 projects total with mixed frameworks (net48 + net10.0-windows), classic-to-SDK migration required, and significant API compatibility changes in WinForms/System.Drawing.

## Strategy

### Upgrade Strategy
Multiple projects cross the .NET Framework to modern .NET boundary, so dependency-first execution is the safest fit.

| Value | Description |
|-------|-------------|
| **Bottom-Up** (selected) | Upgrade leaf-node libraries first, then move upward through dependency levels with validation after each level. |

## Project Structure

### Project Approach
The upgrade includes .NET Framework class libraries consumed during transition, so temporary compatibility across frameworks is needed.

| Value | Description |
|-------|-------------|
| **Multi-targeting** (selected) | Keep old and new frameworks side-by-side in library projects during migration to support transitional consumers. |
| In-place | Replace the existing target framework directly without temporary dual targeting. |

### Package Management
The solution still includes classic projects and a framework-boundary migration, so centralization is best deferred.

| Value | Description |
|-------|-------------|
| **Per-Project (defer CPM to post-migration)** (selected) | Keep package versions managed per project during migration and adopt CPM after framework convergence. |
| Central Package Management (CPM) | Centralize package versions into Directory.Packages.props during this upgrade. |

## Compatibility

### Unsupported API Handling
The assessment reports binary/source API incompatibilities that must be resolved while preserving compile correctness.

| Value | Description |
|-------|-------------|
| **Fix Inline** (selected) | Resolve all API compatibility issues directly in upgrade tasks without introducing stubs. |
| Defer Complex Changes | Apply simple fixes now and defer complex changes with temporary build-preserving stubs. |

### Windows Native APIs
The codebase heavily uses WinForms and System.Drawing, indicating a Windows-focused runtime profile.

| Value | Description |
|-------|-------------|
| **Windows Compatibility Pack** (selected) | Add Windows compatibility support so Windows-specific APIs continue to work on modern .NET. |
| No Compatibility Pack | Require immediate replacement of Windows-specific APIs with cross-platform alternatives. |

## Modernization

### Nullable Reference Types
The assessment shows a larger multi-project migration with substantial compatibility work, so nullable enablement should be deferred.

| Value | Description |
|-------|-------------|
| **Leave Disabled** (selected) | Keep nullable annotations disabled during framework migration to limit concurrent change risk. |
| Enable Nullable Reference Types | Turn on nullable analysis now and address nullability warnings during migration. |
