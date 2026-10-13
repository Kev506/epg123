# .NET Version Upgrade Plan

## Overview

**Target**: Upgrade `src/epg123/epg123.csproj` and required legacy dependencies from .NET Framework 4.8 to modern .NET (`net10.0-windows`).
**Scope**: 6 related projects in the dependency graph, with 3 legacy net48 projects requiring conversion and retargeting.

### Selected Strategy
**Bottom-Up (Dependency-First)** — Upgrade leaf dependencies first, then the root app.
**Rationale**: Multiple .NET Framework projects and dependency layering require tiered migration to keep risk bounded and validation incremental.

### Dependency Tiers
Tier 2: `[epg123]`

Tier 1: `[GaRyan2.Github] [GaRyan2.MxfXmltvTools] [GaRyan2.SchedulesDirect] [GaRyan2.Tmdb] [GaRyan2.Utilities]`

## Tasks

### 01-validate-prerequisites: Validate SDK and baseline build state

Verify the machine and repository are ready for this migration scope: confirm .NET 10 SDK support, confirm the solution can be restored and built from a clean baseline on the new working branch, and capture pre-upgrade build behavior for comparison.

This establishes the execution baseline so subsequent failures can be attributed to migration changes instead of environmental drift.

**Done when**: SDK prerequisites are confirmed and baseline restore/build outcomes are documented for the scoped solution.

---

### 02-convert-legacy-projects-to-sdk-style: Convert legacy projects to SDK-style without changing TFMs

Convert the legacy non-SDK projects that still target net48 (`epg123`, `GaRyan2.MxfXmltvTools`, and `GaRyan2.Tmdb`) to SDK-style while preserving their current target framework during this task. The assessment flags this as required before TFM migration.

This task is structural only (project-system modernization and package reference shape), intentionally separated from framework retargeting to isolate risk.

**Done when**: All scoped legacy projects are SDK-style and the solution still restores/builds on the pre-upgrade framework targets.

---

### 03-upgrade-target-frameworks-and-packages: Retarget legacy projects to .NET 10 with dependency-safe sequencing

Upgrade all remaining net48 projects to modern targets, applying multi-targeting where transitional compatibility is required by dependency order and replacing framework-era package/configuration assumptions as needed. This includes coordinating retargeting across `GaRyan2.MxfXmltvTools`, `GaRyan2.Tmdb`, and `epg123`.

The assessment indicates cross-project compatibility pressure, so this task should preserve dependency order while moving each project to the finalized target framework configuration.

**Done when**: All scoped legacy projects are retargeted to the intended modern .NET configuration and compile successfully in dependency order.

---

### 04-resolve-api-compatibility-and-runtime-behavior: Fix source/binary API issues for WinForms and drawing-heavy code

Resolve the flagged API compatibility issues (binary/source/behavioral) directly in upgraded code with emphasis on Windows Forms and System.Drawing call sites. Apply Windows compatibility support where required and ensure no deferred stubs remain.

Given the high incident volume in `epg123`, this task focuses on functional equivalence and compile-time correctness after API migration.

**Done when**: API-compatibility errors are resolved in scoped projects and upgraded projects build cleanly without unresolved migration blockers.

---

### 05-final-validation-and-post-upgrade-notes: Validate end-to-end and capture deferred recommendations

Run final solution validation on upgraded outputs, execute available tests, and record post-upgrade recommendations that were intentionally deferred during migration (notably central package management adoption).

This closes the scoped upgrade with a verifiable build/test checkpoint and a clear follow-up backlog.

**Done when**: Final validation passes for the upgraded scope and deferred modernization recommendations are documented.
