# .NET Version Upgrade Plan

## Overview

**Target**: Upgrade `src/logViewer/logViewer.csproj` from .NET Framework 4.8 to `net10.0-windows`.
**Scope**: Single classic WinForms project with one project dependency (`GaRyan2.Utilities`) already on modern .NET.

## Tasks

### 01-upgrade-logviewer-to-net10: Upgrade logViewer project to .NET 10

Upgrade `src/logViewer/logViewer.csproj` by converting it from classic non-SDK format to SDK-style, retargeting to `net10.0-windows`, and remediating compatibility issues required for successful WinForms compilation on modern .NET. This includes handling legacy configuration/settings patterns and any API adjustments required after retargeting.

Validation for this task includes both scoped and solution-level builds, with warnings in modified projects treated as actionable and resolved before completion.

**Done when**: `logViewer.csproj` is SDK-style, targets `net10.0-windows`, builds cleanly without errors, and the solution build succeeds with no unresolved warnings in modified projects.
