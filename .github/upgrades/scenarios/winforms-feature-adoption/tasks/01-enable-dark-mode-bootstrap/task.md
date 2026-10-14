# 01-enable-dark-mode-bootstrap: Enable dark mode at application startup

Add the application-level dark mode bootstrap in the WinForms entry point so forms can inherit system theme behavior. This task establishes the global prerequisite for all per-form dark-mode refinements.

**Done when**: `Program.cs` calls `Application.SetColorMode(...)` before running the main form, and the project builds cleanly.

## Research Notes
- Target project is `src/epg123_gui/epg123_gui.csproj` (`net10.0-windows`, WinForms enabled).
- Entry point file is `src/epg123_gui/Program.cs`; this is the only file required for the bootstrap call.
- Per WinForms dark-mode guidance, `Application.SetColorMode(SystemColorMode.System)` must be called after `ApplicationConfiguration.Initialize()` and before `Application.Run(...)`.

## Execution Scope
- Modify: `src/epg123_gui/Program.cs`
- Validate build for `src/epg123_gui/epg123_gui.csproj` after change.
