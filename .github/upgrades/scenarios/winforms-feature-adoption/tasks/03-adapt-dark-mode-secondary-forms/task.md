# 03-adapt-dark-mode-secondary-forms: Adapt remaining forms for dark mode consistency

Review and adjust `frmLineups`, `frmLineupAdd`, `frmRemoteServers`, and `frmPreview` so control and background colors are consistent with system theme behavior.

**Done when**: Remaining forms visually match the selected theme without readability issues, and the project builds cleanly.

## Research Notes
- Reviewed secondary form code-behind files:
  - `src/epg123_gui/frmLineups.cs`
  - `src/epg123_gui/frmLineupAdd.cs`
  - `src/epg123_gui/frmPreview.cs`
  - `src/epg123_gui/Server/frmRemoteServers.cs`
- No hardcoded custom foreground/background colors were found in these code-behind files.
- Existing designer/background usage is already system-theme-friendly (`SystemColors.Window` found in `frmRemoteServers.designer.cs`; no conflicting fixed ARGB assignments found in the reviewed secondary forms).

## Execution Scope
- No source code color changes required for this task based on current implementation.
- Validate project build and record manual visual verification guidance for final QA.
