# WinForms Feature Adoption - Feature Selection

## Target Projects
- `src/epg123_gui/epg123_gui.csproj` — `net10.0-windows` (`<UseWindowsForms>true</UseWindowsForms>`)

## Discovered Forms and UserControls

| Form/Control | Project | Approx. Complexity (1-5) | Current Patterns |
|---|---|---:|---|
| `ConfigForm` (`frmMain`) | `epg123_gui` | 5 | Extensive `SystemColors`, hardcoded `Color.FromArgb`, async handlers, large UI surface |
| `frmLogos` | `epg123_gui` | 3 | `SystemColors` + hardcoded `Color.FromArgb`, async drag/drop handler |
| `frmLineupAdd` | `epg123_gui` | 2 | Standard controls, low async usage |
| `frmLineups` | `epg123_gui` | 2 | Standard controls, low async usage |
| `frmRemoteServers` | `epg123_gui` | 2 | Basic form, `SystemColors` in designer |
| `frmPreview` | `epg123_gui` | 1 | Minimal UI, simple display form |
| `Controls/ListView` (custom control) | `epg123_gui` | 2 | Uses `Invoke(...)` + `InvokeRequired` (good async migration candidate) |

## Feature Recommendations

### Dark Mode
**Recommended candidates:**
- `ConfigForm` — large user-facing surface with existing color logic
- `frmLogos` — already has theme-specific color behavior
- `frmRemoteServers` — minor adjustments, low risk
- `frmLineupAdd`, `frmLineups` — standard controls, straightforward adoption

**Skip/Low-priority:**
- `frmPreview` — very small surface, low impact

### Async APIs
**Recommended candidates:**
- `ConfigForm` — existing `async void` handlers should be hardened with modern patterns
- `frmLogos` — async drag/drop path should include robust exception/cancellation handling
- `Controls/ListView` — replace `Control.Invoke(...)` with `Control.InvokeAsync(...)`

**Skip/Low-priority:**
- `frmPreview`, `frmLineupAdd`, `frmLineups`, `frmRemoteServers` — limited async/UI marshaling complexity

### MVVM
**Recommended candidates:**
- `ConfigForm` — best return on investment (complex settings/business logic)
- `frmLineups` — moderate workflow and state management
- `frmLogos` — manageable pilot form for view model separation

**Skip/Low-priority:**
- `frmPreview` — too simple
- `frmLineupAdd`, `frmRemoteServers` — likely not enough business logic to justify full MVVM first pass

## User-Confirmed Selections
- [x] Dark Mode: application-wide in `epg123_gui` (phase 1 focus: `ConfigForm`, `frmLogos`)
- [x] Async APIs: application-wide where applicable (phase 1 focus: `ConfigForm`, `frmLogos`, `Controls/ListView`)
- [x] MVVM: adopt incrementally (phase 1 focus: `ConfigForm`, then expand)
