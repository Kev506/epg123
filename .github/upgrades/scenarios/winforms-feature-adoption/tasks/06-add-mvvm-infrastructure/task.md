# 06-add-mvvm-infrastructure: Add project-level MVVM infrastructure

Introduce minimal MVVM infrastructure for WinForms (ViewModels folder, base view model patterns, and any required package/reference updates) to support form-level refactors.

**Done when**: MVVM infrastructure compiles, is wired for reuse, and does not break Designer support.

## Research Notes
- Current project has no MVVM infrastructure and no existing references to `ICommand`, `ObservableObject`, or MVVM toolkit types.
- `epg123_gui.csproj` currently has no MVVM-related packages; introducing infrastructure in-project avoids immediate multi-project restructuring risk.
- For incremental rollout, lightweight reusable primitives are sufficient:
  - `ViewModelBase` (`INotifyPropertyChanged`)
  - `RelayCommand` (`ICommand`)
  - `AsyncRelayCommand` (`ICommand` with guarded async execution)

## Execution Scope
- Add new files under `src/epg123_gui/ViewModels` and `src/epg123_gui/Commands`.
- Keep infrastructure UI-framework-friendly and designer-safe (no Designer file edits).
- Build `epg123_gui.csproj` after adding infrastructure.
