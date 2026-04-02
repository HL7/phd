# PHD Device Alert Profile

## Overview
The PhdDeviceAlert profile is based on the FHIR R6 DeviceAlert resource type and defines how personal health devices (PHDs) report alert conditions in the FHIR Personal Health Device implementation guide. When a Personal Health Gateway (PHG) detects an observation with a status code of `msmt-value-exceeded-boundaries`, it generates a DeviceAlert resource. This profile represents alerts as separate resources that reference the measurement observations that triggered the alert condition, providing a clear separation between measurement data and alert notifications.

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

Device alerts enable important clinical use cases:
- **Remote Patient Monitoring**: Healthcare providers can query for active alerts to identify patients requiring attention
- **Alert Acknowledgment**: Tracking which alerts have been reviewed and acknowledged
- **Historical Analysis**: Analyzing patterns of alert occurrences over time
- **Device Configuration**: Understanding what thresholds are configured on devices
- **Clinical Decision Support**: Triggering workflows based on specific alert types

## Profile Structure

### Alert Type (`type`)
The `type` element identifies the alert condition using IEEE 11073-10101 MDC nomenclature codes from the MDCValueSet. The binding is required, meaning a code must always be provided. Common alert event codes include:

<!-- TODO: the codes below are fake. We need a proper set of MDC codes suitable for PHD/PHG generated alerts->
- **MDC_EVT_RANGE_HI** (196618): Value exceeds upper threshold
- **MDC_EVT_RANGE_LO** (196616): Value below lower threshold
- **MDC_EVT_RANGE** (196614): Value outside acceptable range

### Alert Condition (`type` and `derivedFrom`)
The alert condition is defined by two related elements:

**Type (`type`)**: The `type` element specifies the specific condition that triggered the alert with a required binding, providing a coded representation of what alert condition is being reported.

**Cause of Condition (`derivedFrom`)**: The profile requires one or more `derivedFrom` elements to reference the source measurement observation(s) that caused this alert condition. Each derivedFrom element contains:

- **observation** (required): Reference to the source observation (PhdNumericObservation, PhdCompoundNumericObservation, or PhdCompoundObservation)
- **component** (optional): For compound observations, identifies which specific component triggered the alert (e.g., systolic vs. diastolic blood pressure)

This structure allows precise identification of which measurement observation caused the alert condition.

### Alert Label (`label`)
An optional human-readable text that describes the alert condition, typically combining information about the measurement type, value, and threshold (e.g., "Systolic BP > 140 mm[Hg]" or "SpO2 < 80%").

### Signal Information (`signal`)
The `signal` element describes how the alert is being annunciated or notified. It includes:
- **activationState**: Whether the alert signaling is active, paused, or off
- **presence**: Current annunciation status (on, off, latched, acknowledged)
- **type**: Details about the signal manifestation and operational state
- **manifestation**: How the signal is presented (visual, auditory, etc.)
- **indication**: Time period during which signaling occurred

## Examples
See the following examples demonstrating this profile:
- [Blood Pressure Device Alert](DeviceAlert-bp-device-alert.html): High systolic blood pressure alert
