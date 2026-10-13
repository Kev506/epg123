# Migration Progress

**Progress**: 2/8 tasks complete <progress value="25" max="100"></progress> 25%
**Status**: In Progress - Task 02-convert-legacy-projects-to-sdk-style

## Tasks

- ✅ 01-validate-prerequisites: Validate SDK and baseline build state ([Content](tasks/01-validate-prerequisites/task.md), [Progress](tasks/01-validate-prerequisites/progress-details.md))
- 🔄 02-convert-legacy-projects-to-sdk-style: Convert legacy projects to SDK-style without changing TFMs ([Content](tasks/02-convert-legacy-projects-to-sdk-style/task.md))
  - ✅ 02.01-convert-mxfxmltvtools: Convert GaRyan2.MxfXmltvTools to SDK-style and validate build ([Content](tasks/02.01-convert-mxfxmltvtools/task.md), [Progress](tasks/02.01-convert-mxfxmltvtools/progress-details.md))
  - 🔲 02.02-convert-tmdb: Convert GaRyan2.Tmdb to SDK-style and validate build
  - 🔲 02.03-convert-epg123: Convert epg123 to SDK-style and validate build
  - 🔲 02.04-validate-sdk-conversion-scope: Validate all converted projects and capture results
- 🔲 03-upgrade-target-frameworks-and-packages: Retarget legacy projects to .NET 10 with dependency-safe sequencing
- 🔲 04-resolve-api-compatibility-and-runtime-behavior: Fix source/binary API issues for WinForms and drawing-heavy code
- 🔲 05-final-validation-and-post-upgrade-notes: Validate end-to-end and capture deferred recommendations

**Legend**: ✅ Complete | 🔄 In Progress | 🔲 Pending | ⚠️ Blocked | ❌ Failed
