# 03.04-validate-upgraded-scope: Validate upgraded project set builds cleanly together

# 03.04-validate-upgraded-scope

## Objective
Run cross-project validation for the full upgraded scope after all retargeting and compatibility fixes.

## Scope
- Full solution build verification for impacted projects
- Test discovery/execution for relevant tests, if available

## Steps
1. Build the solution/workspace after upgrades.
2. Run relevant tests for impacted projects if test projects are present.
3. Resolve any final cross-project errors/warnings.

## Done when
- Upgraded scope builds successfully end-to-end.
- Relevant tests pass or are documented if unavailable.
- Task evidence is captured for parent task completion.
