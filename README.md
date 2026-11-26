# PHD Implementation Guide
The source repository for the HL7 FHIR PHD implementation guide.

## Build Options (Summary)

Use the scripts in the `scripts/` directory to run IG Publisher in different modes.

| Mode | macOS/Linux | Notes |
|---|---|---|
| Standard build | `./scripts/_build.sh build` | Full build with normal defaults. |
| Build without Sushi | `./scripts/_build.sh nosushi` | Skips SUSHI execution in publisher flow. |
| Build without terminology server | `./scripts/_build.sh notx` | Runs with `-tx n/a` for offline/faster checks. |
| Continuous build (watch) | `./scripts/_build.sh -watch` | Rebuilds on file changes. |
| Update/download publisher | `./scripts/_updatePublisher.sh` | Downloads or updates `publisher.jar` in `input-cache/`. |

### Typical Workflow

1. Use `./scripts/_build.sh build` while iterating on FSH and examples.
2. Run standard build before committing to validate full behavior.

### Publication Process
See https://confluence.hl7.org/pages/viewpage.action?pageId=40740908.
Project Insight ID: 1277
