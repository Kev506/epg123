# 01-enable-dark-mode-bootstrap: Enable dark mode at application startup

Add the application-level dark mode bootstrap in the WinForms entry point so forms can inherit system theme behavior. This task establishes the global prerequisite for all per-form dark-mode refinements.

**Done when**: `Program.cs` calls `Application.SetColorMode(...)` before running the main form, and the project builds cleanly.
