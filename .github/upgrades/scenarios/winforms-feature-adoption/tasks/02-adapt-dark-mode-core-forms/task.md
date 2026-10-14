# 02-adapt-dark-mode-core-forms: Adapt high-impact forms for dark mode

Update `ConfigForm` (`frmMain`) and `frmLogos` color behavior to respect theme-aware colors. Replace brittle hardcoded colors where needed and ensure custom drawing paths react correctly when dark mode is enabled.

**Done when**: `frmMain` and `frmLogos` render correctly in both light and dark mode with no hardcoded-color regressions, and the project builds cleanly.
