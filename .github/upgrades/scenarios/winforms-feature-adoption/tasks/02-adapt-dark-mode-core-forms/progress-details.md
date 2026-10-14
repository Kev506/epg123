# Progress Details - 02-adapt-dark-mode-core-forms

## Summary
Implemented dark-mode-aware color behavior for the two highest-impact forms: `ConfigForm` (`frmMain`) and `frmLogos`.

## Files Modified
- `src/epg123_gui/frmMain.cs`
- `src/epg123_gui/frmLogos.cs`
- `.github/upgrades/scenarios/winforms-feature-adoption/tasks/02-adapt-dark-mode-core-forms/task.md`

## Changes Applied
- `frmMain`:
  - Added `GetLineupHeaderHoverBackColor()` to select hover background color based on `Application.IsDarkModeEnabled`.
  - Updated `lvLineupChannels_DrawColumnHeader` to use the helper and dispose rendering brushes via `using` blocks.
- `frmLogos`:
  - Added centralized theme-aware preview color properties: `DarkPreviewBackColor` and `LightPreviewBackColor`.
  - Replaced repeated hardcoded `Color.FromArgb(255, 6, 15, 30)`/`Color.White` assignments with the centralized theme-aware colors across local and remote preview image paths.

## Validation
- Build: `src/epg123_gui/epg123_gui.csproj` — **successful**.

## Notes
- Visual verification in both OS light and dark modes is still recommended by the scenario for final UX confirmation.
