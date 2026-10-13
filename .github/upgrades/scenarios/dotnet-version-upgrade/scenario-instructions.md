# .NET Version Upgrade

## Strategy
**Selected**: All-At-Once
**Rationale**: Single .NET Framework project (`epg123Server`) requires migration, so the plan uses a focused all-at-once upgrade flow with isolated structural and TFM steps.

### Execution Constraints
- Convert `epg123Server` to SDK-style before any target framework change.
- Keep SDK conversion and TFM retargeting as separate tasks.
- Retarget to `net10.0-windows` only after baseline and conversion validation succeed.
- Run full solution build and warning cleanup for modified projects before completing final validation.

## Preferences
- **Flow Mode**: Automatic
- **Scope**: `src/tokenServer/epg123Server.csproj`
- **Target Framework**: `net10.0`

## Source Control
- **Source Branch**: `upgrade-dotnet-10-2`
- **Working Branch**: `upgrade-dotnet-10-3`
- **Commit Strategy**: Single Commit at End
- **Branch Sync**: Auto (Merge)
