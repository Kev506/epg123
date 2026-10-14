# 07-refactor-configform-mvvm: Refactor ConfigForm to MVVM

Extract core presentation/state logic from `ConfigForm` into a dedicated view model with bindable properties and command-style actions where practical, while keeping Designer-generated code untouched.

**Done when**: `ConfigForm` behavior is preserved with view-model-backed state, Designer still opens, and the project builds cleanly.
