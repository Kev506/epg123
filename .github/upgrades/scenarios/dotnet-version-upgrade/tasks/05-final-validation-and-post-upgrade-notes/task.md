# 05-final-validation-and-post-upgrade-notes: Validate end-to-end and capture deferred recommendations

Run final solution validation on upgraded outputs, execute available tests, and record post-upgrade recommendations that were intentionally deferred during migration (notably central package management adoption).

This closes the scoped upgrade with a verifiable build/test checkpoint and a clear follow-up backlog.

## Scope Inventory

- **Upgraded scope validation target**: `epg123` plus retargeted dependencies (`GaRyan2.MxfXmltvTools`, `GaRyan2.Tmdb`) and already-modernized referenced libraries.
- **End-state checks**:
  1. Scoped build success on net10.0-windows.
  2. Full solution build status capture for remaining out-of-scope legacy projects.
  3. Deferred recommendation capture (CPM and remaining-solution modernization).
- **Test baseline**: no dedicated test projects discovered in current solution inventory.

## Research Findings

- Task 03 and Task 04 established clean builds for upgraded scope projects.
- Full-solution state still includes additional net48 projects outside scoped target that continue to produce cross-target mismatch errors until they are upgraded.
- CPM remains intentionally deferred by scenario decision and should be recommended only after full-solution framework convergence.

**Done when**: Final validation passes for the upgraded scope and deferred modernization recommendations are documented.
