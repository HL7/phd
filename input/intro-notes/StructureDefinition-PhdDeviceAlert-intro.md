### PHD Device Alert Profile

### Overview
The PhdDeviceAlert profile is based on the FHIR R6 DeviceAlert resource type and defines how personal health devices (PHDs) report alert conditions in the FHIR Personal Health Device implementation guide. A Personal Health Gateway (PHG) generates a DeviceAlert either when a numeric measurement crosses a configured or patient-specific limit, or when a device/sensor status bit signals a noteworthy condition. This profile represents alerts as separate resources that reference the measurement observations that triggered the alert condition, providing a clear separation between measurement data and alert notifications.

### Alert Sources
A PhdDeviceAlert can arise from two distinct sources in the PHD data flow:

#### 1. Threshold (limit) alerts on numeric observations
When a numeric measurement crosses a limit, an alert is raised. The limit may be a device-configured
threshold or a **patient-specific** limit maintained by the Personal Health Gateway (PHG). When the
PHG receives (or itself evaluates) a numeric observation whose value is outside the applicable range,
it generates a DeviceAlert:
- `type = physiological`
- `code` is an MDC partition-3 condition such as `MDC_EVT_HI` (196648) or `MDC_EVT_LO` (196670)
- `derivedFrom.observation` references the triggering PhdNumericObservation, PhdCompoundNumericObservation, or PhdCompoundObservation
- `derivedFrom.component` identifies the specific component for a compound observation (e.g. systolic blood pressure)
- `derivedFrom.limit` records the threshold range that was crossed. ACOM (IEEE 11073-10206) does not
  transmit limit values, so the PHG populates `limit` from device configuration or from
  locally-maintained, patient-specific settings

The source numeric observation also carries `interpretation = in-alarm` to mark that it is in an
alarm state. See the [Blood Pressure](DeviceAlert-bp-device-alert.html) and
[SpO2](DeviceAlert-spo2-device-alert.html) examples.

#### 2. Device and sensor status-bit alerts
Devices also report non-numeric conditions — sensor displacement, poor signal quality, low battery,
device malfunction, or a vendor **device-specific alert** — as status **bits** in their
measurement/device-status objects. The PHG surfaces these bits on a
[PhdBitsEnumerationObservation](StructureDefinition-PhdBitsEnumerationObservation.html) whose
`component` entries use ASN1ToHL7 codes. When such a bit represents an alert condition, the PHG
generates a DeviceAlert:
- `type = technical`
- `code` is the ASN1ToHL7 status code directly (no MDC "umbrella" code is required)
- `derivedFrom.observation` references the PhdBitsEnumerationObservation
- `derivedFrom.component` points at the exact ASN1ToHL7 bit that triggered the alert
- no `limit` is present, because no threshold was crossed

See the [Sensor-Displaced Alert](DeviceAlert-sensor-displaced-alert.html) example.

### Purpose
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

### Profile Structure
General element semantics (status, priority, occurrence, acknowledged, signal, the condition/signal
state machine, and search parameters) are defined by the base
[DeviceAlert resource]({{site.data.fhir.path}}devicealert.html). This section only
describes where this profile constrains or specializes that behavior for personal health devices.

#### Alert Condition code (`code`)
The `code` element identifies the alert condition. The binding is required to the [Device Alert Condition value set](ValueSet-DeviceAlertConditionVS.html), which accepts **either** an IEEE 11073-10101 MDC partition-3 condition code **or** a device/sensor status code from the ASN1ToHL7 code system (used when no MDC concept fits, e.g. a device-specific alert). A code must always be provided. Common alert codes include:

- **MDC_EVT_HI** (196648): Value exceeds upper threshold
- **MDC_EVT_LO** (196670): Value below lower threshold
- **MDC_EVT_SIG_OUT_OF_RANGE** (197054): Value/signal outside acceptable range


**Type (`type`)**: The `type` element specifies the type of condition that triggered the alert with a required binding. Supported types are physiological conditions (e.g., high blood pressure) and technical conditions (e.g., device malfunction).

**Cause of Condition (`derivedFrom`)**: The profile requires one or more `derivedFrom` elements to reference the source measurement observation(s) that caused this alert condition. Each derivedFrom element contains:

- **observation** (required): Reference to the source observation (PhdNumericObservation, PhdCompoundNumericObservation, PhdCompoundObservation, or PhdBitsEnumerationObservation)
- **component** (optional): For compound observations, identifies which specific component triggered the alert (e.g., systolic vs. diastolic blood pressure)
- **limit** (optional): The threshold range that was exceeded. Note: ACOM (IEEE 11073-10206 Alert Communication Model) does not report limit values; the Personal Health Gateway (PHG) populates this element from device configuration or locally maintained threshold settings.

This structure allows precise identification of which measurement observation caused the alert condition.

#### Alert Label (`label`)
An optional human-readable text that describes the alert condition, typically combining information about the measurement type, value, and threshold (e.g., "Systolic BP > 140 mm[Hg]" or "SpO2 < 80%").

#### Signal Information (`signal`)
The `signal` element and its annunciation state machine are used as defined by the base resource;
this profile adds no constraints. The PHD examples annunciate using `manifestation = auditory` or
`visual`.

### Examples
See the following examples demonstrating this profile:
- [Blood Pressure Device Alert](DeviceAlert-bp-device-alert.html): High systolic blood pressure alert
- [SpO2 Device Alert](DeviceAlert-spo2-device-alert.html): Low SpO2 range alert
- [Sensor-Displaced Alert](DeviceAlert-sensor-displaced-alert.html): Technical alert derived from an ASN.1 device-status bit
