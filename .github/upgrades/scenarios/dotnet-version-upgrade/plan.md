# .NET Version Upgrade Plan

## Overview

**Target**: Upgrade `src/epg123_gui/epg123_gui.csproj` and its required project dependencies from .NET Framework 4.8 to modern .NET (`net10.0-windows`).
**Scope**: 4 projects, ~10k LOC, all currently non-SDK-style with significant WinForms API compatibility impact.

### Selected Strategy
**Bottom-Up (Dependency-First)** — Upgrade from leaf dependencies to root application.
**Rationale**: The assessment identified a multi-project .NET Framework dependency graph, where upgrading dependencies first reduces downstream breakage and makes validation checkpoints clearer.

### Dependency Tiers
Tier 3: `[epg123_gui]`

Tier 2: `[GaRyan2.Github] [GaRyan2.SchedulesDirect]`

Tier 1: `[GaRyan2.Utilities]`

## Tasks

### 01-validate-prerequisites: Validate toolchain and upgrade preconditions

Validate that the local environment is ready for .NET 10 migration work before structural edits begin. This includes confirming installed SDK compatibility, solution-level restore/build baseline capture, and validating that upgrade automation prerequisites are stable for all projects in scope.

This task also establishes the initial quality gate for the remaining migration work so later build failures can be tied to actual migration changes instead of environmental drift.

**Done when**: .NET SDK requirements are confirmed, current solution baseline build status is captured, and the upgrade prerequisites are documented in the task record.

---

### 02-convert-sdk-style: Convert legacy project files to SDK-style

Convert all non-SDK-style projects in scope (`GaRyan2.Utilities`, `GaRyan2.Github`, `GaRyan2.SchedulesDirect`, and `epg123_gui`) to SDK-style while keeping the existing target framework during this phase. The assessment flagged all projects as classic format, and conversion is required before target framework upgrades can be applied safely.

This task focuses only on project-system modernization (csproj shape and package reference model) and explicitly excludes target framework migration to isolate risk and simplify rollback.

**Done when**: All scoped projects are SDK-style, no conversion regressions remain, and the solution builds on the pre-upgrade framework after conversion.

---

### 03-upgrade-target-framework-and-code: Upgrade TFMs and resolve API compatibility issues

Upgrade project target frameworks to modern .NET (Windows-targeted where required), then resolve breaking API usage identified in the assessment, with priority on WinForms and System.Drawing compatibility hotspots. This task includes dependency-ordered execution within the task scope so foundational libraries are stabilized before the GUI application.

Assessment signals indicate high API churn and broad impact across multiple files, so this task includes iterative compile/fix loops until all affected projects are restored to a working build state on the new target framework.

**Done when**: All scoped projects target the intended modern TFM set, compatibility changes are applied, and upgraded projects build cleanly with no unresolved migration blockers.

---

### 04-final-validation-and-cleanup: Run end-to-end validation and document post-upgrade recommendations

Run full-scope validation for the upgraded project set, including solution build and relevant test execution, then document any deferred post-migration recommendations (including Central Package Management adoption after framework migration stabilization).

This task provides final confirmation that modernization goals were met and leaves clear follow-up guidance for optional post-upgrade refinements.

**Done when**: Final build/test validation succeeds for the migrated scope, and post-upgrade recommendations are captured with no remaining blocking issues.
