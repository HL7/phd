## Implementation Notes

### Alert Representation Model
The PHD Device Alert profile represents a significant architectural change from earlier approaches to device alerting in FHIR. Previously, alert information was embedded within measurement observations using extensions (such as the SimpleAlerting extension). The DeviceAlert resource provides a cleaner separation of concerns:

- **Measurement observations** (PhdNumericObservation, PhdCompoundNumericObservation, etc.) contain the actual measurement data
- **DeviceAlert resources** contain the alert conditions, thresholds, and signaling information
- The two are linked via the `derivedFrom` element

This separation allows:
1. Observations to remain focused on measurement data
2. Multiple different alerts to reference the same observation
3. Alerts to be queried, filtered, and managed independently
4. Clearer data model that aligns with FHIR R5 architecture

### IEEE 11073 Mapping
The profile maps data elements from IEEE 11073-10206 ACOM (Alerting Communication Model) to FHIR DeviceAlert elements:

| IEEE 11073-10206 Element | FHIR DeviceAlert Element | Notes |
|---------------------------|--------------------------|-------|
| Simple-Sa-Observed-Value.metric-id | type | Alert event code (e.g., MDC_EVT_RANGE_HI) |
| Simple-Sa-Observed-Value.current-limits | derivedFrom.limit | Threshold range that triggers the alert |
| Simple-Sa-Observed-Value.state | signal.activationState, signal.presence | Alert operational state |
| alert-op-text-string | signal.type.text | Operational text describing alerting behavior |
| nu-val-obs-simp-str | label | Human-readable notification text |
| Metric observation association | derivedFrom.observation | Reference to source measurement |

### Understanding derivedFrom Structure
The `derivedFrom` element is a backbone element with three key sub-elements:

#### observation (required)
- References the measurement observation that triggered the alert
- Must reference a PhdNumericObservation, PhdCompoundNumericObservation, PhdCompoundObservation, or PhdBaseObservation
- The actual measured value that exceeded limits is found in the referenced observation's `value[x]` or `component.value[x]`

#### component (optional)
- Used when the alert applies to a specific component of a compound observation
- Contains a Coding that matches one of the `Observation.component.code` values in the referenced observation
- Example: For a blood pressure observation with systolic, diastolic, and mean components, this identifies which component (e.g., systolic) triggered the alert
- If omitted, the alert applies to the overall observation value

#### limit (optional)
- Defines the threshold range that triggered the alert
- Contains low and/or high Quantity values
- Represents the current limit settings on the device
- The actual measured value (from the referenced observation) is compared against these limits
- May be omitted if the device doesn't report current limit settings

### Alert Types and Codes
The `type` element should contain IEEE 11073-10101 MDC alert event codes. Common codes include:

- **MDC_EVT_RANGE** (196614): General out-of-range condition
- **MDC_EVT_RANGE_LO** (196616): Value below lower threshold
- **MDC_EVT_RANGE_HI** (196618): Value above upper threshold
- **MDC_EVT_ALARM** (196612): General alarm condition

The `code` element contains a more specific description of what triggered the alert and may be the same as `type` or provide additional context.

### Signal Element Usage
The `signal` element describes the annunciation or notification of the alert. Key aspects:

#### activationState (required)
Indicates whether the signaling system is active:
- **on**: Alert signaling is active
- **paused**: Alert has been temporarily silenced ("snoozed")
- **off**: Alert signaling is not active

#### presence (optional)
Indicates current annunciation status:
- **on**: Signal is currently being annunciated
- **off**: Signal is not being annunciated
- **latched**: Signal continues even though the condition has ended
- **acknowledged**: Signal stopped because user acknowledged it

#### type (optional, 0..*)
Can contain multiple codings describing the signal characteristics:
- Operational state codes (e.g., "Limits-On" from SimpleAlertOperationalStatesCS)
- Signal details (e.g., visual indicator range, auditory characteristics)
- Descriptive text explaining the alerting behavior

### Status Values
The DeviceAlert `status` element has specific meanings:

- **in-progress**: Alert condition is currently active and ongoing
- **completed**: Alert condition has ended (no longer present)
- **entered-in-error**: Alert was created in error and should be ignored
- **unknown**: Alert status cannot be determined

### Presence vs Status
Two elements track alert state:

- **presence** (boolean): Is the alert condition currently occurring? (true/false)
- **status**: Workflow state of the alert resource (in-progress, completed, etc.)

These work together:
- Active alert: `presence=true`, `status=in-progress`
- Resolved alert: `presence=false`, `status=completed`
- Alert acknowledged but still present: `presence=true`, `status=in-progress`, `signal.presence=acknowledged`

### Label Construction
The `label` element provides human-readable text describing the alert. Good practices:

- Include measurement type: "Systolic BP", "SpO2", "Heart Rate"
- Include comparison operator: ">", "<", "outside"
- Include threshold value(s): "140 mm[Hg]", "80%"
- Keep concise: "Systolic BP > 140 mm[Hg]" or "SpO2 < 80%"
- Don't duplicate information better represented in coded elements

### Device References
The `device` element can reference:
- The top-level PHD device (PhdDevice) that detected the alert
- A component device (MDS, VMD, Channel in IEEE 11073 terminology)
- A DeviceMetric representing the specific metric in an alert state

Choose the most specific appropriate reference based on what information is available from the device.

### Category Values
Include appropriate categories for filtering and access control:

```json
"category": [
  {
    "coding": [{
      "system": "http://terminology.hl7.org/CodeSystem/observation-category",
      "code": "vital-signs"
    }]
  },
  {
    "coding": [{
      "system": "http://hl7.org/fhir/uv/phd/CodeSystem/PhdObservationCategories",
      "code": "phd"
    }]
  }
]
```

### Occurrence Time
Use `occurrenceDateTime` for a specific point in time when the alert occurred, or `occurrencePeriod` for alerts that span a time range. This represents when the condition was detected, which should match or be very close to the `effectiveDateTime` of the referenced observation.

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