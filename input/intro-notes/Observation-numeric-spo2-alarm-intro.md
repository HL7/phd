# Numeric SpO2 Alarm Example

## Purpose
This example demonstrates the use of the FHIR `Observation` resource to represent a numeric SpO2 (oxygen saturation) measurement with an associated alarm system. The resource is designed to monitor SpO2 levels and trigger alerts when the measurement falls outside predefined limits.

### Key Features:
1. **Profile Conformance**:
   - The resource conforms to the `PhdNumericObservation` profile, ensuring compatibility with the FHIR Personal Health Device (PHD) implementation guide.

2. **Alerting System**:
   - The `SimpleAlerting` extension is used to define the alerting behavior:
     - **Current Limits**: Specifies the acceptable range for SpO2 values (80% to 100%).
     - **Operational State**: Indicates that the alerting system is active and monitoring the defined limits (`Limits-On`).
     - **Alert Texts**: Provides human-readable descriptions for the alerting behavior and threshold notifications.

3. **Interpretation**:
   - The `interpretation` element indicates that the measurement is currently in an alarm state (`in-alarm`).

4. **Measurement Details**:
   - The `valueQuantity` element records the SpO2 measurement as 79%, which is below the lower limit of 80%, triggering the alarm.

5. **Device and Patient Context**:
   - The resource includes references to the associated patient and device, providing context for the measurement.

### Use Case:
This example is intended for scenarios where continuous monitoring of SpO2 levels is critical, such as in hospital settings or remote patient monitoring. The alerting system ensures timely notifications when SpO2 levels fall below safe thresholds, enabling prompt intervention.