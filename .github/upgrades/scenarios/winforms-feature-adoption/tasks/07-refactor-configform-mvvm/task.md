# 07-refactor-configform-mvvm: Refactor ConfigForm to MVVM

Extract core presentation/state logic from `ConfigForm` into a dedicated view model with bindable properties and command-style actions where practical, while keeping Designer-generated code untouched.

**Done when**: `ConfigForm` behavior is preserved with view-model-backed state, Designer still opens, and the project builds cleanly.

## Research Notes
- `ConfigForm` currently sets and reads UI state directly (`txtBaseApi`, `txtBaseArtwork`, `ckDebug`) and updates `Config` in code-behind event handlers.
- Existing text/checkbox handlers provide a low-risk seam for incremental MVVM adoption without changing Designer files.
- MVVM infrastructure already exists from prior task (`ViewModelBase`, `RelayCommand`, `AsyncRelayCommand`).

## Execution Scope
- Add `ConfigFormViewModel` with bindable properties for key configuration fields (`BaseApiUrl`, `BaseArtworkUrl`, `UseDebug`).
- Wire `ConfigForm` to the view model using WinForms data bindings in code-behind and set `DataContext`.
- Keep existing event handlers, but source updates from the view model-backed state.
- Do not modify `.Designer.cs` files.
