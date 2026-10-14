# Progress Details - 08-refactor-additional-forms-mvvm

## Summary
Extended incremental MVVM adoption to `frmLineups` and `frmLogos` using dedicated view models while preserving existing form interactions.

## Files Modified
- `src/epg123_gui/ViewModels/LineupsViewModel.cs`
- `src/epg123_gui/ViewModels/LogosViewModel.cs`
- `src/epg123_gui/frmLineups.cs`
- `src/epg123_gui/frmLogos.cs`
- `.github/upgrades/scenarios/winforms-feature-adoption/tasks/08-refactor-additional-forms-mvvm/task.md`

## Changes Applied
- Added `LineupsViewModel` with `CancelOperation` bindable state.
- Added `LogosViewModel` with bindable `StationSummary` and `LogoChanged` state.
- Updated `frmLineups`:
  - Added view model field and assigned `DataContext`.
  - Migrated public `Cancel` state to view-model-backed property while preserving existing external usage (`frmMain` checks this value after dialog close).
- Updated `frmLogos`:
  - Added view model field and assigned `DataContext`.
  - Added binding for `label7.Text` to `LogosViewModel.StationSummary`.
  - Migrated `LogoChanged` state to view-model-backed property while preserving existing external usage (`frmMain` logo refresh check).

## Validation
- Build: `src/epg123_gui/epg123_gui.csproj` — **successful**.

## Notes
- No `.Designer.cs` files were modified, preserving Designer compatibility.
