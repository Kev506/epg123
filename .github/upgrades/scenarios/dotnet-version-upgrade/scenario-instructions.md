# .NET Version Upgrade

## Preferences
- **Flow Mode**: Automatic
- **Target Framework**: net10.0
- **Scope**: src/hdhr2mxf/hdhr2mxf.csproj
- **New Requested Scope**: src/logViewer/logViewer.csproj (user request, 2026-10-13)

## Strategy
**Selected**: Bottom-Up (Dependency-First)
**Rationale**: Multi-project dependency graph with one remaining .NET Framework project (`hdhr2mxf`) depending on already-upgraded net10 libraries.

### Execution Constraints
- Keep dependency-first ordering: validate dependency libraries baseline before application-tier retargeting.
- Keep SDK-style conversion as a separate step before any target framework change.
- Retarget and API/package remediation occur within the application-tier upgrade task.
- Run scoped validation first, then full solution validation before completion.
- Resolve warnings in modified projects as part of task completion.

## Source Control
- **Source Branch**: upgrade-dotnet-10-6
- **Working Branch**: upgrade-dotnet-10-7
- **Commit Strategy**: After Each Task
- **Branch Sync**: Auto (Merge)

