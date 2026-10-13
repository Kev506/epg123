# .NET Version Upgrade Plan

## Overview

**Target**: Upgrade `src/tokenServer/epg123Server.csproj` from .NET Framework 4.8 to modern .NET (`net10.0-windows`).
**Scope**: Single legacy WinForms/service project plus its already-modern project references (`GaRyan2.Github`, `GaRyan2.Utilities`).

### Selected Strategy
**All-At-Once** — Single-project migration executed as one focused upgrade stream.
**Rationale**: The assessment scope has one project requiring upgrade. Rules for single .NET Framework project migrations favor a simplified all-at-once plan while keeping SDK conversion and TFM migration as separate tasks.

## Tasks

### 01-validate-prerequisites: Validate SDK and baseline for tokenServer scope

Confirm environment readiness for this specific migration by validating .NET 10 SDK availability, global.json compatibility, and baseline build behavior for the solution before any project-format changes. Capture baseline status for `epg123Server` and its referenced dependencies so failures can be attributed to migration changes.

The assessment marks this as a low-difficulty project upgrade, but baseline validation is still required to avoid hidden environment drift and to verify the current branch state before structural edits.

**Done when**: SDK/tooling prerequisites are confirmed and baseline restore/build output is documented for the scoped project.

---

### 02-convert-tokenserver-to-sdk-style: Convert epg123Server project to SDK-style on current framework

Convert `src/tokenServer/epg123Server.csproj` from classic project format to SDK-style while staying on net48 for this task. This includes migrating `packages.config` to `PackageReference` and preserving service/WinForms-specific settings needed for the existing runtime behavior.

Keeping this conversion isolated from TFM retargeting reduces risk by separating project-system changes from API-surface changes.

**Done when**: `epg123Server.csproj` is SDK-style, package references are migrated, and the project builds successfully on its pre-upgrade framework target.

---

### 03-upgrade-tokenserver-to-net10: Retarget epg123Server to net10.0-windows and resolve compatibility issues

Retarget `epg123Server` to `net10.0-windows`, align package references for modern .NET, and address assessment-reported API compatibility issues across affected files (`System.ServiceProcess`, `HttpContent`, `Uri`, and `TimeSpan` usage). Ensure referenced projects remain compatible without regressions.

This is the core upgrade task where project targeting and source-level fixes are applied together after the structural conversion step.

**Done when**: `epg123Server` targets `net10.0-windows`, compilation issues tied to the framework transition are resolved, and the project builds cleanly.

---

### 04-final-validation-tokenserver: Run final validation and capture upgrade outcomes

Run final build/test validation for the solution with emphasis on the upgraded tokenServer path, confirm no warnings remain in modified projects, and document any intentional follow-up modernization work that is out of scope for this migration.

This closes the upgrade with a verifiable end state and a clear record of any deferred items.

**Done when**: Final validation passes for the upgraded scope and outcomes are documented in progress details.
