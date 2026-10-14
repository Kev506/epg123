# 05-harden-async-event-handlers: Improve async event-handler reliability

Harden async handlers in forms (`frmMain`, `frmLogos`) with explicit exception handling and consistent async flow control so runtime failures do not surface as unhandled UI exceptions.

**Done when**: Targeted async handlers use robust try/catch patterns and preserve current UX behavior, and the project builds cleanly.
