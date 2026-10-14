# 02.04-validate-sdk-conversion-scope: Validate all converted projects and capture results

## Objective
Validate that all scoped legacy projects were converted to SDK-style successfully and document any remaining pre-upgrade baseline limitations.

## Scope
- Verify the three target projects now use SDK-style project files.
- Verify no remaining `packages.config` files for converted projects.
- Run scoped/solution build checks and document outcomes.

## Research Findings
- All three target projects (`GaRyan2.MxfXmltvTools`, `GaRyan2.Tmdb`, `epg123`) now have SDK-style project root declarations.
- `packages.config` files for `GaRyan2.Tmdb` and `epg123` were removed during conversion; none exists for `GaRyan2.MxfXmltvTools`.
- Solution build remains blocked by known cross-target incompatibilities (`net48` projects referencing `net10.0-windows` projects), which are expected to resolve during target-framework retargeting.

## Done when
- All three conversion subtasks are complete.
- Conversion outcomes and build validation are documented.
- Parent task can be completed with evidence in progress details.
