# 04-resolve-api-compatibility-and-runtime-behavior: Fix source/binary API issues for WinForms and drawing-heavy code

Resolve the flagged API compatibility issues (binary/source/behavioral) directly in upgraded code with emphasis on Windows Forms and System.Drawing call sites. Apply Windows compatibility support where required and ensure no deferred stubs remain.

Given the high incident volume in `epg123`, this task focuses on functional equivalence and compile-time correctness after API migration.

## Scope Inventory

- **Primary project scope**: `epg123` (WinForms + System.Drawing heavy), plus retargeted supporting libraries `GaRyan2.Tmdb` and `GaRyan2.MxfXmltvTools`.
- **Compatibility concerns**:
  1. TFM mismatch errors removed by retargeting and dependency alignment.
  2. Legacy API usage warnings from newer compiler/runtime (alias naming, obsolete WebClient usage).
  3. Platform-compatibility analyzer alignment for Windows-only projects.
- **Execution evidence source**: API remediation work performed during Task 03 retargeting subtasks where build feedback surfaced concrete incompatibilities.

## Research Findings

- `epg123` and key dependencies now build on `net10.0-windows` after compatibility edits.
- No deferred stub placeholders were introduced.
- Key remediations already applied include:
  - replacing obsolete `WebClient` call path with `HttpClient` in `lineupServices.cs`,
  - normalizing lower-case type alias usage (`api` -> `Api`) to remove language-reserved-name warnings,
  - adding `[SupportedOSPlatform("windows")]` for upgraded Windows-only assemblies,
  - removing redundant legacy framework references from SDK-style projects to avoid assembly resolution conflicts.

**Done when**: API-compatibility errors are resolved in scoped projects and upgraded projects build cleanly without unresolved migration blockers.
