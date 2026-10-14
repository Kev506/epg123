# Progress Details - 04-modernize-async-ui-marshaling

## Summary
Modernized targeted UI-thread marshaling in custom ListView item handling to use non-blocking async APIs.

## Files Modified
- `src/epg123_gui/Controls/ListView.cs`
- `.github/upgrades/scenarios/winforms-feature-adoption/tasks/04-modernize-async-ui-marshaling/task.md`

## Changes Applied
- Updated `Station.LogoChanged` callback in `MemberListViewItem` from synchronous `ListView.Invoke(...)` to `await ListView.InvokeAsync(...)` when marshaling is required.
- Kept direct invalidation path when already on UI thread.
- Preserved existing interruption handling behavior.

## Validation
- Build: `src/epg123_gui/epg123_gui.csproj` — **successful**.

## Notes
- Targeted file no longer uses blocking marshaling API in this path.
