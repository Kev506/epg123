# .NET Version Upgrade Plan

## Overview

**Target**: Upgrade `src/epg123Transfer/epg123Transfer.csproj` from .NET Framework 4.8 to modern .NET.
**Scope**: Single legacy WinForms application plus its already-modern project references (`GaRyan2.MxfXmltvTools`, `GaRyan2.Utilities`, `GaRyan2.WmcUtilities`) across a 4-project assessed dependency graph.

### Selected Strategy
**All-At-Once** — Single-project migration executed as one focused upgrade stream.
**Rationale**: `epg123Transfer` is the only project in scope that still targets .NET Framework, while its referenced libraries already target `net10.0-windows`, so the migration can stay app-focused without dependency-tier sequencing.

## Tasks

### 01-validate-prerequisites: Validate SDK and baseline for epg123Transfer scope

Confirm environment readiness for this migration by validating .NET 10 SDK availability, checking global.json compatibility, and capturing the current solution build behavior before any structural edits. This task should also verify the existing branch state and record whether `epg123Transfer` currently builds cleanly on .NET Framework 4.8 with its modernized project references.

This assessment scope is centered on one application project, but it still carries a large WinForms API surface and several Windows-only dependencies. Establishing a baseline first reduces the risk of misattributing pre-existing issues to the migration work.

**Done when**: SDK and tooling prerequisites are confirmed, and baseline restore/build results are documented for the scoped project and solution.

---

### 02-convert-epg123transfer-to-sdk-style: Convert epg123Transfer to SDK-style on its current framework

Convert `src/epg123Transfer/epg123Transfer.csproj` from classic project format to SDK-style while keeping it on its current framework for this task. The conversion must preserve WinForms resources, linked files, Windows Media Center assembly references, ClickOnce-related metadata that still matters, and any project settings needed for the current desktop application behavior.

This project still uses old-style imports and `packages.config`, so the structural conversion needs to stay isolated from target framework changes. Keeping the task narrow makes later retargeting failures easier to diagnose.

**Done when**: `epg123Transfer.csproj` is SDK-style, package management is updated as needed for SDK-style build semantics, and the project builds successfully on its pre-upgrade framework target.

---

### 03-upgrade-epg123transfer-to-net10: Retarget epg123Transfer to modern .NET and resolve compatibility issues

Retarget `epg123Transfer` to a Windows-specific modern .NET target, align package and framework references for WinForms on modern .NET, and address the assessment's 765 reported API issues. The work will need to account for heavy Windows Forms usage, `System.Drawing` compatibility, legacy configuration behavior, and Windows-only assemblies referenced by the application.

This is the core migration task. It combines project-level retargeting with code and configuration remediation so the app can compile and run on the new framework without leaving deferred compatibility stubs behind.

**Done when**: `epg123Transfer` targets modern .NET for Windows, the required compatibility/package updates are applied, assessment-driven code issues are resolved inline, and the upgraded project builds cleanly.

---

### 04-final-validation-epg123transfer: Run final validation and capture upgrade outcomes

Run final validation for the upgraded scope by building the full solution, fixing remaining warnings in modified projects, and exercising any available automated tests. Document the final state of the migration, including any intentional follow-up work that stays out of scope for this upgrade.

This closes the scenario with a verifiable end state for the application and its dependencies, plus a clear record of anything the user may want to modernize next.

**Done when**: Final validation passes for the upgraded scope, remaining warnings in modified projects are addressed, and upgrade outcomes are documented in task progress details.
