# WinForms Feature Adoption Assessment

## Scope
- Project: `src/epg123_gui/epg123_gui.csproj`
- Target framework: `net10.0-windows`
- WinForms forms discovered: 6 (`ConfigForm`, `frmLogos`, `frmLineups`, `frmLineupAdd`, `frmRemoteServers`, `frmPreview`)

## Feature Readiness
- **Dark Mode**: Supported (.NET 9+). Existing use of `SystemColors` helps; hardcoded `Color.FromArgb(...)` will need adaptation.
- **Async APIs**: Supported (.NET 9+). Found `async void` handlers and `Control.Invoke(...)` patterns suitable for modernization.
- **MVVM**: Supported (.NET 8+). Best ROI is incremental adoption starting with high-complexity forms.

## Key Findings
- Highest-impact form: `ConfigForm` (`frmMain`) with large UI surface and custom drawing/color logic.
- Medium-impact form: `frmLogos` with theme-sensitive image/color behavior.
- Custom control `Controls/ListView` uses `InvokeRequired` + `Invoke(...)`, a good candidate for `InvokeAsync`.

## Recommended Execution Sequence
1. Dark mode foundation and targeted form adaptation
2. Async API modernization in event/UI marshaling paths
3. Incremental MVVM extraction beginning with `ConfigForm`

## Confirmed Direction
- Adopt **Dark Mode + Async APIs + MVVM**
- Scope: **Application-wide** in `epg123_gui`, implemented incrementally by risk/impact
