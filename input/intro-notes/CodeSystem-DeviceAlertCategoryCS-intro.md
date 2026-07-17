This code system defines high-level categories for alerts represented in the PHD DeviceAlert profile.

The detailed list of codes, displays, and definitions is maintained in the CodeSystem content itself. This intro focuses on intended use rather than repeating terminology entries.

## Implementation Notes

- Use category for coarse grouping, filtering, and routing of alerts.
- Use DeviceAlert.type for the specific alert condition.
- If multiple categories are plausible, choose the category most useful for operational triage.
- Preserve local or device-native identifiers through local mappings or ConceptMap artifacts when needed.

