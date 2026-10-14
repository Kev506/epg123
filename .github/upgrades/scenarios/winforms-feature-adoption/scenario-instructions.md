# WinForms Feature Adoption

## Strategy
Application-wide modernization in phased order: Dark Mode → Async APIs → MVVM.

## Preferences
- **Flow Mode**: Automatic
- **Commit Strategy**: After Each Task
- **Pace**: Standard
- **Target Project**: src/epg123_gui/epg123_gui.csproj
- **Selected Features**: Dark Mode, Async APIs, MVVM
- **Scope**: Application-wide
- **MVVM Rollout**: Incremental (start with ConfigForm)

## Decisions
- Apply all selected features to epg123_gui with phased implementation to reduce risk.
- Prioritize ConfigForm and frmLogos for early dark mode and async modernization.
- Start MVVM adoption with ConfigForm before extending to additional forms.

## Custom Instructions
<!-- Task-specific overrides: "For {taskId}: {instruction}" -->

## Source Control
- **Source Branch**: upgrade-dotnet-10-8
- **Working Branch**: winforms-feature-adoption
- **Commit Strategy**: After Each Task
- **Branch Sync**: Auto (Merge)
