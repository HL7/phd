## Implementation Notes
The base [DeviceAlert resource]({{site.data.fhir.path}}devicealert.html) defines the
general element semantics, the condition/signal state machine, and the search parameters. These
notes cover only PHD-specific behavior.

### derivedFrom in this IG
- `derivedFrom.observation` is restricted to a PhdNumericObservation, PhdCompoundNumericObservation,
  PhdCompoundObservation, or PhdBitsEnumerationObservation. For a bits observation the triggering
  status bit is the `component` carrying an ASN1ToHL7 code.
- `derivedFrom.component` is a Coding matching one of the referenced `Observation.component.code`
  values — an MDC code for a compound numeric component (e.g. systolic BP), or an ASN1ToHL7 code for
  a status bit. Omit it when the alert applies to the whole observation.
- `derivedFrom.limit` is populated by the PHG (from device configuration or patient-specific
  settings), because ACOM does not transmit limit values.

### Alert generation pathways
PhdDeviceAlert resources are produced by the PHG in two ways:

- **Limit (threshold) alerts** — the PHG compares a numeric measurement against the applicable
  limits and, when the value is out of range, creates an alert with an MDC `MDC_EVT_HI`/`MDC_EVT_LO`
  condition code and a `derivedFrom.limit`. Limits may be device-reported or **patient-specific**
  values the PHG holds for the subject; because ACOM does not transmit limits, the PHG is the source
  of the `limit` range. For compound observations, `derivedFrom.component` identifies which component
  (e.g. systolic BP) breached its limit.
- **Status-bit alerts** — the PHG inspects the device/sensor status bits reported on a
  PhdBitsEnumerationObservation. When a bit denotes an alert condition (e.g. `sensor-displaced`,
  `device-battery-low`, `device-specific-alert`), the PHG creates a `type = technical` alert whose
  `code` is the ASN1ToHL7 bit code and whose `derivedFrom.component` points at that bit. No `limit`
  applies.

### Alert state and timing
The relationship between `occurrence` (condition timing), `signal.presence`/`signal.activationState`
(annunciation), and `status` (resource workflow) follows the base resource state machine; see the
[DeviceAlert resource]({{site.data.fhir.path}}devicealert.html). For PHD,
`occurrence.start` is typically close to the source observation's `effectiveDateTime`, and a source
numeric observation in alarm carries `interpretation = in-alarm`.

### Querying
The standard DeviceAlert search parameters apply. A PHD-specific use is searching by condition code,
e.g. `GET /DeviceAlert?code=urn:iso:std:iso:11073:10101|196648` (high range alerts), or by an
ASN1ToHL7 status code.

### Compatibility Considerations
For systems transitioning from the earlier SimpleAlerting extension approach:

1. **Migration Path**: Existing observations with SimpleAlerting extensions can be transformed into separate DeviceAlert resources
2. **Backward Compatibility**: Both approaches can coexist during transition periods
3. **Data Mapping**: 
   - Extension `currentLimits` → DeviceAlert `derivedFrom.limit`
   - Extension `alertOperationalState` → DeviceAlert `signal.activationState` and `signal.type`
   - Extension `thresholdNotificationText` → DeviceAlert `label`
   - Observation `interpretation` (in-alarm) → DeviceAlert `signal.presence=on`
4. **ASN.1 status bits**: Measurement-embedded alert bits from the ASN1ToHL7 code system map as follows:
   - `lim-alert-off`, `lim-low-off`, `lim-high-off` (limit alerting disabled) → no DeviceAlert is generated while disabled; an existing DeviceAlert for that limit has `signal.activationState = off`.
   - `device-specific-alert` (a device-specific alert condition is present) → generate a DeviceAlert with the appropriate partition-3 condition `code` and a `derivedFrom` reference to the source observation.

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
