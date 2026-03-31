# Blood Pressure Device Alert Example

## Purpose
This example demonstrates a PHD Device Alert resource that represents a high systolic blood pressure alert condition from a personal health device. The alert is triggered when the systolic blood pressure measurement exceeds the configured threshold limits.

## Key Features

### 1. **Profile Conformance**
The resource conforms to the `PhdDeviceAlert` profile, which is based on the FHIR R6 DeviceAlert resource type. This ensures compatibility with the FHIR Personal Health Device (PHD) implementation guide for device alert conditions.

### 2. **Alert Type**
- **Type Code**: MDC_EVT_RANGE_HI (196618) from IEEE 11073-10101 nomenclature
- Indicates a "high range" alert event, meaning the measured value exceeded the upper threshold limit

### 3. **Alert Categories**
The alert is categorized as:
- **Vital Signs**: Standard FHIR observation category
- **PHD**: Personal Health Device category specific to the PHD implementation guide

### 4. **Alert Derivation**
The alert references the source measurement observation via the `derivedFrom` element:
- **Source Observation**: References `Observation/compound-numeric-blood-pressure` 
- **Specific Component**: Identifies the systolic blood pressure component (MDC_PRESS_BLD_NONINV_SYS, code 150021)
- **Threshold Limits**: Defines the normal range as 90-140 mm[Hg]

This structure allows the alert to be associated with a specific component of a compound observation, making it clear that the alert applies to systolic BP rather than diastolic or mean BP.

### 5. **Alert Status and Presence**
- **Status**: "in-progress" - indicates the alert is currently active
- **Presence**: true - confirms the alert condition is currently occurring

### 6. **Alert Label**
The `label` element provides a human-readable description: "Systolic BP > 140 mm[Hg]", which combines information about the measurement type, the threshold, and the alert condition.

### 7. **Signal Information**
The `signal` element describes the annunciation or notification of the alert:
- **Activation State**: "on" - the signaling system is active
- **Presence**: "on" - the signal is currently being annunciated
- **Type**: "Limits-On" with descriptive text explaining the alerting behavior

### 8. **Device and Patient References**
- **Subject**: References `Patient/patientExample-1`
- **Device**: References the blood pressure monitor device (`Device/phd-711000FEFF5F49B0.B0495F001071`)
- **Occurrence**: Records when the alert condition occurred (2018-11-11T11:38:15-05:00)

## Use Case
This example represents a common scenario in remote patient monitoring where:
1. A blood pressure monitor takes a measurement
2. The systolic blood pressure value (116 mm[Hg] in the referenced observation) would normally be within range
3. However, if the measurement exceeded 140 mm[Hg], this alert would be generated
4. The Personal Health Gateway (PHG) receives this alert condition and generates the DeviceAlert resource, which references the source observation
5. The alert signal will trigger the caretaker's attention, enabling prompt identification of patients requiring intervention

## Separation from Measurement Data
Unlike older approaches where alert information was embedded within the measurement observation (using extensions), this example demonstrates the newer pattern of representing alerts as separate DeviceAlert resources. This provides:
- **Clear Separation**: Measurements and alerts are distinct resources
- **Flexible Querying**: Alerts can be searched and filtered independently
- **Multiple Alerts**: A single observation can trigger multiple different alert types
- **Component-Specific Alerts**: For compound observations, alerts can reference specific components
