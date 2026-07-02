# PHD Implementation Guide
The source repository for the HL7 FHIR PHD implementation guide.

## Build Options (Summary)

Use the scripts in the repository root to run IG Publisher in different modes.

| Mode | macOS/Linux | Windows | Notes |
|---|---|---|---|
| Standard build | `./_build.sh` or `./_genonce.sh` | `_build.bat` or `_genonce.bat` | Full build with normal defaults. |
| Build without Sushi | `./_build.sh nosushi` | `_build.bat nosushi` | Skips SUSHI execution in publisher flow. |
| Build without terminology server | `./_build.sh notx` | `_build.bat notx` | Runs with `-tx n/a` for offline/faster checks. |
| Continuous build (watch) | `./_gencontinuous.sh` | `_gencontinuous.bat` | Rebuilds on file changes. |
| Fast local build (skip previous-version comparison) | `./_build_fast_local.sh [tx\|notx]` | `_build_fast_local.bat [tx\|notx]` | Best for quick local iteration. Defaults to `notx`; use `tx` to enable terminology/network while still skipping previous-version comparison. Temporarily hides `publication-request.json`, swaps in `input/ignoreWarnings-fast-local.txt` for broader terminology QA suppression, and restores originals after the run. |

### Typical Workflow

1. Use fast local build while iterating on FSH and examples.
2. Run standard build before committing to validate full behavior.

### Publication Process
See https://confluence.hl7.org/pages/viewpage.action?pageId=40740908.
Project Insight ID: 1277
