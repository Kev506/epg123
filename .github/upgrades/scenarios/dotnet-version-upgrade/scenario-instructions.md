# .NET Version Upgrade

## Preferences
- **Flow Mode**: Automatic
- **Target Framework**: net10.0
- **Scope**: src/logViewer/logViewer.csproj

## Strategy
**Selected**: All-at-Once
**Rationale**: Single project scope (`logViewer`) with no parallel project phasing required.

### Execution Constraints
- Keep SDK-style conversion inside the upgrade task and complete it before retargeting.
- Apply API/configuration remediation required by WinForms and legacy settings usage after retargeting.
- Run project-level validation first, then full solution validation.
- Resolve warnings in modified projects before marking the task complete.

## Source Control
- **Source Branch**: upgrade-dotnet-10-7
- **Working Branch**: upgrade-dotnet-10-8
- **Commit Strategy**: After Each Task
- **Branch Sync**: Auto (Merge)

