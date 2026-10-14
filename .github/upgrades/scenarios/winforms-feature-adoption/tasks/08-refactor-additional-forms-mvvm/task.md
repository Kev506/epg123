# 08-refactor-additional-forms-mvvm: Extend MVVM to selected additional forms

Apply the MVVM pattern to additional forms with meaningful logic (`frmLineups` and `frmLogos` first) using the established infrastructure and conventions from earlier tasks.

**Done when**: Selected forms run with equivalent behavior using view models, Designer compatibility remains intact, and the project builds cleanly.

## Research Notes
- `frmMain` relies on:
  - `frmLineups.Cancel` to decide whether to continue lineup refresh.
  - `frmLogos.LogoChanged` to decide when remote custom logos must be refreshed.
- `frmLogos` already has a natural bindable UI seam (`label7.Text`) and mutable state flag (`LogoChanged`).
- `frmLineups` has mutable state (`Cancel`) suitable for migration to a view-model-backed property while preserving existing public API.

## Execution Scope
- Add `LineupsViewModel` and `LogosViewModel` under `ViewModels`.
- Wire `frmLineups` and `frmLogos` to use `DataContext` with incremental bindings in code-behind only.
- Preserve externally observed behavior (`Cancel`, `LogoChanged`) via view-model-backed properties.
- Keep Designer files untouched.
