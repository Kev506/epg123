# .NET Version Upgrade Plan

## Overview

**Target**: Upgrade `src/epgTray/epgTray.csproj` from .NET Framework 4.8 to .NET 10 (`net10.0-windows`).
**Scope**: 2 assessed projects (1 project requiring upgrade, 1 already-modern dependency), ~2.8k LOC, WinForms-heavy desktop code with significant API compatibility updates expected.

### Selected Strategy
**Bottom-Up (Dependency-First)** — Upgrade from dependency foundation to app layer with ordered validation.
**Rationale**: Assessment includes multiple projects with a .NET Framework-to-modern transition (`epgTray` depends on already-modern `GaRyan2.Utilities`), which triggers the framework migration strategy rule for multi-project solutions.

## Tasks

### 01-validate-prerequisites: Validate SDK and baseline for epgTray scope

Validate .NET 10 SDK availability, global.json compatibility, and baseline build behavior for `src/epgTray/epgTray.csproj` before structural edits. This task captures current compiler behavior and confirms branch readiness so later failures are clearly attributable to migration changes.

Because assessment signals high API impact in a WinForms desktop project, capturing a clean baseline is required before project conversion and retargeting.

**Done when**: SDK/global.json checks are documented, baseline build results are captured for the scoped project, and the migration preconditions are recorded in task progress details.

---

### 02-convert-epgtray-to-sdk-style: Convert epgTray to SDK-style on net48

Convert `src/epgTray/epgTray.csproj` from classic project format to SDK-style while preserving `net48` during this step. Keep WinForms settings, icons/resources, linked files, and project references intact while removing legacy import/reference boilerplate.

This structural conversion is intentionally isolated from target framework changes because conversion and retargeting have different failure modes and must be validated independently.

**Done when**: `epgTray.csproj` is SDK-style on `net48`, legacy package/import structure is replaced with SDK-style equivalents, and the converted project builds successfully before retargeting.

---

### 03-upgrade-epgtray-to-net10: Retarget epgTray to net10.0-windows and remediate API breaks

Retarget `epgTray` to `net10.0-windows`, align Windows/WinForms compatibility requirements, and resolve assessment-reported binary/source incompatibilities inline. Focus includes Windows Forms surface area, `System.Drawing` usage, legacy configuration APIs, and any ACL-related API moves.

`GaRyan2.Utilities` is already on modern .NET, so this task upgrades the app layer while keeping dependency compatibility validated during build-fix iterations.

**Done when**: `epgTray` targets `net10.0-windows`, required compatibility/package adjustments are applied, migration errors are resolved without deferred stubs, and project build succeeds cleanly.

---

### 04-final-validation-epgtray: Run scoped and solution validation and capture outcomes

Run final validation using project and solution builds, fix remaining warnings in modified projects, and execute tests where available. Capture the resulting migration state, including any explicit post-upgrade recommendations (such as deferred CPM adoption) in progress documentation.

This task confirms the upgrade outcome is stable and leaves auditable results for handoff.

**Done when**: scoped + full solution validation succeeds, warnings are resolved for modified projects, and upgrade outcomes are documented in task progress details.
