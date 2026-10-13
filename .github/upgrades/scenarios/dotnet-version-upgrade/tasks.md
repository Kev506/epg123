# .NET Version Upgrade Progress

## Overview

This workflow upgrades `epg123.csproj` and its remaining net48 dependency projects to modern .NET on a dependency-first path. Work is split into structural conversion, retargeting, compatibility remediation, and final validation steps.

**Progress**: 1/5 tasks complete <progress value="20" max="100"></progress> 20%

## Tasks

- ✅ 01-validate-prerequisites: Validate SDK and baseline build state ([Content](tasks/01-validate-prerequisites/task.md), [Progress](tasks/01-validate-prerequisites/progress-details.md))
- 🔲 02-convert-legacy-projects-to-sdk-style: Convert legacy projects to SDK-style without changing TFMs
- 🔲 03-upgrade-target-frameworks-and-packages: Retarget legacy projects to .NET 10 with dependency-safe sequencing
- 🔲 04-resolve-api-compatibility-and-runtime-behavior: Fix source/binary API issues for WinForms and drawing-heavy code
- 🔲 05-final-validation-and-post-upgrade-notes: Validate end-to-end and capture deferred recommendations
