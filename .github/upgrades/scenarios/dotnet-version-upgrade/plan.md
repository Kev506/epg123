# .NET Version Upgrade Plan

## Overview

**Target**: Upgrade `src/hdhr2mxf/hdhr2mxf.csproj` from .NET Framework 4.8 to `net10.0-windows`.
**Scope**: 4 related projects in assessment, with one classic non-SDK WinForms executable requiring conversion and retargeting.

### Selected Strategy
**Bottom-Up (Dependency-First)** — Upgrade from leaf nodes to root applications, tier by tier.
**Rationale**: The assessed graph includes multiple projects and one remaining .NET Framework app (`hdhr2mxf`) depending on already-modernized libraries.

Dependency shape:
- Tier 1 (already modernized): `GaRyan2.Utilities`, `GaRyan2.MxfXmltvTools`, `GaRyan2.WmcUtilities`
- Tier 2 (upgrade target): `hdhr2mxf`

## Tasks

### 01-validate-prerequisites-hdhr2mxf: Validate prerequisites and baseline compatibility

Validate the .NET 10 SDK/toolchain, confirm dependency projects referenced by `hdhr2mxf` build cleanly on their current `net10.0-windows` targets, and capture baseline build status for the scoped upgrade path. This task establishes a known-good starting point before structural conversion.

This task also confirms no blocking package compatibility issues beyond the single recommended NuGet update flagged for the project and verifies the branch/workflow state used for execution.

**Done when**: SDK availability, scoped baseline build results, and dependency compatibility checks are documented for `hdhr2mxf` execution.

---

### 02-convert-hdhr2mxf-to-sdk-style: Convert hdhr2mxf project format

Convert `src/hdhr2mxf/hdhr2mxf.csproj` from classic non-SDK format to SDK-style while remaining on the current framework baseline during conversion mechanics. This isolates project-structure changes from runtime/API changes to reduce failure blast radius.

The conversion includes migrating legacy project structure and package management metadata to modern SDK-style equivalents needed for later retargeting.

**Done when**: `hdhr2mxf.csproj` is SDK-style and builds successfully on the pre-retarget framework configuration.

---

### 03-upgrade-hdhr2mxf-to-net10: Retarget hdhr2mxf and remediate API/package issues

Retarget `hdhr2mxf` to `net10.0-windows`, align package references to supported modern equivalents, and fix the source-incompatible plus behavioral API findings identified in assessment (including `WebRequest.Create` migration and related URI/HTTP behavior checks).

This task upgrades the remaining application tier after its dependency libraries are already modernized, preserving bottom-up ordering and focusing code changes within the scoped project.

**Done when**: `hdhr2mxf` targets `net10.0-windows`, package references are updated for compatibility, and compilation succeeds without upgrade-related errors.

---

### 04-final-validation-hdhr2mxf: Run scoped and solution validation

Run project-level and solution-level validation to confirm the upgraded `hdhr2mxf` integrates with existing net10 dependencies and does not regress shared build quality. Address any remaining warnings in modified projects and confirm runtime-relevant behavior for critical paths.

Document final outcomes and deferred follow-ups (if any) for post-upgrade review.

**Done when**: Scoped and solution builds pass for the upgrade branch, tests (if present) execute successfully, and upgrade results are documented.
