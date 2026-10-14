# 04-modernize-async-ui-marshaling: Replace legacy UI marshaling with modern async APIs

Modernize UI-thread marshaling by replacing `Control.Invoke(...)` patterns (notably in `Controls/ListView`) with `Control.InvokeAsync(...)`, and ensure async workflows avoid UI-thread blocking.

**Done when**: UI marshaling paths use async-safe APIs, no blocking marshaling calls remain in targeted files, and the project builds cleanly.

## Research Notes
- Confirmed explicit UI-thread marshaling call in task scope:
  - `src/epg123_gui/Controls/ListView.cs` line with `ListView?.Invoke(...)` inside `Station.LogoChanged` event callback.
- This path should be moved to non-blocking `InvokeAsync(...)` to avoid synchronous UI-thread waits.
- `Station.cs` contains delegate `handler?.Invoke(...)` calls, but those are event invocations (not WinForms marshaling) and are out of scope for this task.

## Execution Scope
- Update `src/epg123_gui/Controls/ListView.cs` to use `InvokeAsync` in the logo invalidation callback.
- Keep behavior equivalent: if already on UI thread, invalidate directly.
- Build `epg123_gui.csproj` to validate modernization.
