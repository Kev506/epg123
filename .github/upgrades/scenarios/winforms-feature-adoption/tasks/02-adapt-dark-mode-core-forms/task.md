# 02-adapt-dark-mode-core-forms: Adapt high-impact forms for dark mode

Update `ConfigForm` (`frmMain`) and `frmLogos` color behavior to respect theme-aware colors. Replace brittle hardcoded colors where needed and ensure custom drawing paths react correctly when dark mode is enabled.

**Done when**: `frmMain` and `frmLogos` render correctly in both light and dark mode with no hardcoded-color regressions, and the project builds cleanly.

## Research Notes

- Targeted files: `src/epg123_gui/frmMain.cs` and `src/epg123_gui/frmLogos.cs`.
- `frmMain` contains a hardcoded light-mode hover fill color in owner-drawn ListView header (`Color.FromArgb(255, 217, 235, 249)`) that should be theme-aware.
- `frmLogos` contains repeated hardcoded preview-background colors (`Color.FromArgb(255, 6, 15, 30)` and `Color.White`) that should be centralized and adjusted per dark/light mode.

## Execution Scope

- Add theme-aware helper colors in `frmMain` for owner-drawn header hover state.
- Add theme-aware helper colors in `frmLogos` for logo preview backgrounds and replace repeated literals.
- Build `epg123_gui.csproj` to validate compilation after color updates.
