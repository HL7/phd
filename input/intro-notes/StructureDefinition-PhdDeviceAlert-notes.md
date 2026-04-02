## Implementation Notes

### Understanding derivedFrom Structure
The `derivedFrom` element is a backbone element with two key sub-elements:

#### observation (required)
- References the measurement observation that triggered the alert
- Must reference a PhdNumericObservation, PhdCompoundNumericObservation, or PhdCompoundObservation
- The actual measured value that exceeded limits is found in the referenced observation's `value[x]` or `component.value[x]`

#### component (optional)
- Used when the alert applies to a specific component of a compound observation
- Contains a Coding that matches one of the `Observation.component.code` values in the referenced observation (which will be an MDC code in the context of this IG)
- Example: For a blood pressure observation with systolic, diastolic, and mean components, this identifies which component (e.g., systolic) triggered the alert
- If omitted, the alert applies to the overall compound observation 

### Presence vs Status
Two elements track alert state:

- **presence** (boolean): Is the alert condition currently occurring? (true/false)
- **status**: Workflow state of the alert resource (in-progress, completed, etc.)

These work together:
- Active alert: `presence=true`, `status=in-progress`
- Resolved alert: `presence=false`, `status=completed`
- Alert acknowledged but still present: `presence=true`, `status=in-progress`, `signal.presence=acknowledged`

### When did the alert occur
In the `occurence[x]` element use `occurrenceDateTime` for a specific point in time when the alert occurred, or `occurrencePeriod` for alerts that span a time range. This represents when the condition was detected, is typically close to the `effectiveDateTime` of the referenced observation.

### Query Patterns
Common queries for DeviceAlert resources:

- Active alerts for a patient: `GET /DeviceAlert?subject=Patient/123&status=in-progress&presence=true`
- Unacknowledged alerts: `GET /DeviceAlert?acknowledged=false&status=in-progress`
- High priority alerts: `GET /DeviceAlert?priority=high&status=in-progress`
- Alerts for specific device: `GET /DeviceAlert?device=Device/456`
- Alerts by type: `GET /DeviceAlert?type=urn:iso:std:iso:11073:10101|196618` (high range alerts)

### Compatibility Considerations
For systems transitioning from the earlier SimpleAlerting extension approach:

1. **Migration Path**: Existing observations with SimpleAlerting extensions can be transformed into separate DeviceAlert resources
2. **Backward Compatibility**: Both approaches can coexist during transition periods
3. **Data Mapping**: 
   - Extension `currentLimits` → DeviceAlert `derivedFrom.limit`
   - Extension `alertOperationalState` → DeviceAlert `signal.activationState` and `signal.type`
   - Extension `thresholdNotificationText` → DeviceAlert `label`
   - Observation `interpretation` (in-alarm) → DeviceAlert `presence=true`

### Best Practices

1. **Always provide derivedFrom**: Link alerts to their source observations for traceability
2. **Use component for compound observations**: Be specific about which component triggered the alert
3. **Include limit ranges when available**: Helps understand device configuration and alert logic
4. **Provide meaningful labels**: Make alerts human-readable for clinicians
5. **Set appropriate categories**: Enable proper filtering and access control
6. **Include device references**: Track which device generated the alert
7. **Use standard MDC codes**: Ensure interoperability with IEEE 11073 ecosystem
8. **Update status appropriately**: Mark alerts as completed when conditions resolve

### Limitations

1. **Single component per derivedFrom**: If multiple components of the same observation trigger alerts, create separate derivedFrom entries or separate DeviceAlert resources
2. **Limit precision**: The limit element is a Range with Quantity values, which may not capture all complexity of alert logic (e.g., rate-of-change alerts, multi-condition alerts)
3. **Signal details**: The signal element may not capture all aspects of complex multi-sensory alerting systems
4. **Historical limits**: No built-in mechanism to track changes in limit settings over time 
