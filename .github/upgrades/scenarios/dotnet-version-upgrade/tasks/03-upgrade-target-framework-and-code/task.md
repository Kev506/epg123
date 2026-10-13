# 03-upgrade-target-framework-and-code: Upgrade TFMs and resolve API compatibility issues

Upgrade project target frameworks to modern .NET (Windows-targeted where required), then resolve breaking API usage identified in the assessment, with priority on WinForms and System.Drawing compatibility hotspots. This task includes dependency-ordered execution within the task scope so foundational libraries are stabilized before the GUI application.

Assessment signals indicate high API churn and broad impact across multiple files, so this task includes iterative compile/fix loops until all affected projects are restored to a working build state on the new target framework.

**Done when**: All scoped projects target the intended modern TFM set, compatibility changes are applied, and upgraded projects build cleanly with no unresolved migration blockers.
