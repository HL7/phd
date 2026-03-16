# PHD Device Alert Profile

## Overview
The PhdDeviceAlert profile is based on the FHIR R6 DeviceAlert resource type and defines how personal health devices (PHDs) report alert conditions in the FHIR Personal Health Device implementation guide. This profile represents alerts as separate resources that reference the measurement observations that triggered the alert condition, providing a clear separation between measurement data and alert notifications.

## Purpose
Device alerts indicate noteworthy conditions or occurrences detected by personal health devices, such as when a measured value exceeds configured threshold limits. Common examples include:
- High or low blood pressure readings
- Abnormal heart rate measurements
- Low oxygen saturation levels
- Out-of-range glucose values
- Device technical alerts

By representing alerts as separate DeviceAlert resources (rather than embedding them within measurement observations), the profile enables:
- **Independent querying**: Alerts can be searched and filtered separately from measurements
- **Multiple alerts per measurement**: A single observation can trigger different alert types
- **Component-specific alerts**: For compound observations, alerts can reference specific components
- **Clear data model**: Separation of concerns between measurement data and alert conditions

## Profile Structure

### Alert Type (`type`)
The `type` element identifies the kind of alert using IEEE 11073-10101 MDC nomenclature codes from the MDCValueSet. Common alert event codes include:
- **MDC_EVT_RANGE_HI** (196618): Value exceeds upper threshold
- **MDC_EVT_RANGE_LO** (196616): Value below lower threshold
- **MDC_EVT_RANGE** (196614): Value outside acceptable range

### Alert Condition (`derivedFrom`)
The profile requires one or more `derivedFrom` elements to link the alert to its source measurement observation(s). Each derivedFrom element contains:

- **observation** (required): Reference to the source observation (PhdNumericObservation, PhdCompoundNumericObservation, PhdCompoundObservation, or PhdBaseObservation)
- **component** (optional): For compound observations, identifies which specific component triggered the alert (e.g., systolic vs. diastolic blood pressure)
- **limit** (optional): The threshold range defining when the alert is triggered

This structure allows precise identification of what measurement value caused the alert condition.

### Alert Label (`label`)
An optional human-readable text that describes the alert condition, typically combining information about the measurement type, value, and threshold (e.g., "Systolic BP > 140 mm[Hg]" or "SpO2 < 80%").

### Signal Information (`signal`)
The `signal` element describes how the alert is being annunciated or notified. It includes:
- **activationState**: Whether the alert signaling is active, paused, or off
- **presence**: Current annunciation status (on, off, latched, acknowledged)
- **type**: Details about the signal manifestation and operational state
- **manifestation**: How the signal is presented (visual, auditory, etc.)
- **indication**: Time period during which signaling occurred

### Required Elements
The profile inherits required elements from the base DeviceAlert resource:
- **status**: Current state of the alert (in-progress, completed, entered-in-error, unknown)
- **code**: Specific condition that triggered the alert
- **subject**: The patient or entity the alert is about
- **presence**: Whether the alert condition is currently active (true/false)
- **derivedFrom**: One or more references to source observations (required by this profile)

### Optional Elements
- **category**: Alert classifications (e.g., vital-signs, phd)
- **priority**: Alert priority level (info, low, medium, high, critical)
- **device**: The device that detected the alert condition
- **occurrenceDateTime/Period**: When the alert condition occurred
- **acknowledged**: Whether the alert has been acknowledged
- **location**: Physical location when alert occurred

## IEEE 11073 Mapping
The profile maps to IEEE 11073-10206 ACOM (Alerting Communication Model) as follows:

| FHIR Element | IEEE 11073-10206 Element |
|--------------|--------------------------|
| type | Simple-Sa-Observed-Value.metric-id |
| derivedFrom.limit | Simple-Sa-Observed-Value.current-limits |
| signal | Simple-Sa-Observed-Value.state and alert-op-text-string |
| label | Simple-Sa-Observed-Value.nu-val-obs-simp-str |
| derivedFrom | Associated with metric observations via logical linkage |

## Usage Patterns

### Simple Numeric Alert
For a single numeric measurement (e.g., heart rate, temperature):
```json
{
  "resourceType": "DeviceAlert",
  "status": "in-progress",
  "type": { "coding": [{ "system": "urn:iso:std:iso:11073:10101", "code": "196618" }] },
  "derivedFrom": [{
    "observation": { "reference": "Observation/heart-rate-123" },
    "limit": {
      "low": { "value": 60 },
      "high": { "value": 100 }
    }
  }]
}
```

### Component-Specific Alert
For compound observations where only one component triggers an alert:
```json
{
  "derivedFrom": [{
    "observation": { "reference": "Observation/blood-pressure-456" },
    "component": {
      "system": "urn:iso:std:iso:11073:10101",
      "code": "150021",
      "display": "MDC_PRESS_BLD_NONINV_SYS"
    },
    "limit": {
      "low": { "value": 90, "unit": "mm[Hg]" },
      "high": { "value": 140, "unit": "mm[Hg]" }
    }
  }]
}
```

### Multiple Observations
An alert can reference multiple observations if needed:
```json
{
  "derivedFrom": [
    { "observation": { "reference": "Observation/reading-1" } },
    { "observation": { "reference": "Observation/reading-2" } }
  ]
}
```

## Clinical Use
Device alerts enable:
1. **Remote Patient Monitoring**: Healthcare providers can query for active alerts to identify patients requiring attention
2. **Alert Acknowledgment**: Tracking which alerts have been reviewed and acknowledged
3. **Historical Analysis**: Analyzing patterns of alert occurrences over time
4. **Device Configuration**: Understanding what thresholds are configured on devices
5. **Clinical Decision Support**: Triggering workflows based on specific alert types

## Examples
See the following examples demonstrating this profile:
- [Blood Pressure Device Alert](DeviceAlert-bp-device-alert.html): High systolic blood pressure alert