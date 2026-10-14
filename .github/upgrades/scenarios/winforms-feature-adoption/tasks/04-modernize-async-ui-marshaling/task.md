# 04-modernize-async-ui-marshaling: Replace legacy UI marshaling with modern async APIs

Modernize UI-thread marshaling by replacing `Control.Invoke(...)` patterns (notably in `Controls/ListView`) with `Control.InvokeAsync(...)`, and ensure async workflows avoid UI-thread blocking.

**Done when**: UI marshaling paths use async-safe APIs, no blocking marshaling calls remain in targeted files, and the project builds cleanly.
