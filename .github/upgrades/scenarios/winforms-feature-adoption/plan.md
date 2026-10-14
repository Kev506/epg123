# WinForms Feature Adoption Plan

## Overview

**Target**: Modernize `epg123_gui` WinForms UI with dark mode support, modern async UI patterns, and incremental MVVM adoption.
**Scope**: Single WinForms project (`src/epg123_gui`) with 6 forms and one custom list control.

## Upgrade Options

| Option | Selected | Why |
|--------|----------|-----|
| Feature Set | Dark Mode + Async APIs + MVVM | Requested modernization scope and fully supported on `net10.0-windows`. |
| Functional Scope | Application-wide | Covers the whole user-facing GUI while allowing phased delivery by risk. |
| MVVM Rollout | Incremental (start with `ConfigForm`) | Reduces migration risk on the largest form and enables validation before broader rollout. |
| Task Order | Dark Mode → Async APIs → MVVM | Matches scenario dependency guidance and minimizes rework. |

## Tasks

### 01-enable-dark-mode-bootstrap: Enable dark mode at application startup

Add the application-level dark mode bootstrap in the WinForms entry point so forms can inherit system theme behavior. This task establishes the global prerequisite for all per-form dark-mode refinements.

**Done when**: `Program.cs` calls `Application.SetColorMode(...)` before running the main form, and the project builds cleanly.

---

### 02-adapt-dark-mode-core-forms: Adapt high-impact forms for dark mode

Update `ConfigForm` (`frmMain`) and `frmLogos` color behavior to respect theme-aware colors. Replace brittle hardcoded colors where needed and ensure custom drawing paths react correctly when dark mode is enabled.

**Done when**: `frmMain` and `frmLogos` render correctly in both light and dark mode with no hardcoded-color regressions, and the project builds cleanly.

---

### 03-adapt-dark-mode-secondary-forms: Adapt remaining forms for dark mode consistency

Review and adjust `frmLineups`, `frmLineupAdd`, `frmRemoteServers`, and `frmPreview` so control and background colors are consistent with system theme behavior.

**Done when**: Remaining forms visually match the selected theme without readability issues, and the project builds cleanly.

---

### 04-modernize-async-ui-marshaling: Replace legacy UI marshaling with modern async APIs

Modernize UI-thread marshaling by replacing `Control.Invoke(...)` patterns (notably in `Controls/ListView`) with `Control.InvokeAsync(...)`, and ensure async workflows avoid UI-thread blocking.

**Done when**: UI marshaling paths use async-safe APIs, no blocking marshaling calls remain in targeted files, and the project builds cleanly.

---

### 05-harden-async-event-handlers: Improve async event-handler reliability

Harden async handlers in forms (`frmMain`, `frmLogos`) with explicit exception handling and consistent async flow control so runtime failures do not surface as unhandled UI exceptions.

**Done when**: Targeted async handlers use robust try/catch patterns and preserve current UX behavior, and the project builds cleanly.

---

### 06-add-mvvm-infrastructure: Add project-level MVVM infrastructure

Introduce minimal MVVM infrastructure for WinForms (ViewModels folder, base view model patterns, and any required package/reference updates) to support form-level refactors.

**Done when**: MVVM infrastructure compiles, is wired for reuse, and does not break Designer support.

---

### 07-refactor-configform-mvvm: Refactor ConfigForm to MVVM

Extract core presentation/state logic from `ConfigForm` into a dedicated view model with bindable properties and command-style actions where practical, while keeping Designer-generated code untouched.

**Done when**: `ConfigForm` behavior is preserved with view-model-backed state, Designer still opens, and the project builds cleanly.

---

### 08-refactor-additional-forms-mvvm: Extend MVVM to selected additional forms

Apply the MVVM pattern to additional forms with meaningful logic (`frmLineups` and `frmLogos` first) using the established infrastructure and conventions from earlier tasks.

**Done when**: Selected forms run with equivalent behavior using view models, Designer compatibility remains intact, and the project builds cleanly.
