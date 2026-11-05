# Pulse Oximeter Sensor-Displaced Alert Example

## Purpose
This example demonstrates a technical `PhdDeviceAlert` generated from a device/sensor
**status bit** rather than from a measured value crossing a threshold. The pulse oximeter
reported a device-status observation in which the `sensor-displaced` bit was set, and the
Personal Health Gateway (PHG) raised a corresponding alert.

## Key Features

### 1. **Technical alert type**
`type = technical` — the condition concerns the device/sensor, not a physiological value.

### 2. **Condition code from the ASN1ToHL7 code system**
`code` uses the device's own status code directly — `150604.2 sensor-displaced` from the
ASN1ToHL7 code system. The profile binds `code` to a value set that accepts either an
IEEE 11073-10101 MDC partition-3 condition code or an ASN1ToHL7 code, so no MDC "umbrella"
code is needed for a device/sensor status condition.

### 3. **Derived from a bits-enumeration observation**
`derivedFrom.observation` references [`bits-observation`](Observation-bits-observation.html),
a `PhdBitsEnumerationObservation`, and `derivedFrom.component` points at the exact ASN.1 bit
(`150604.2 sensor-displaced`) that triggered the alert. There is no `limit`, because no
threshold was crossed.

### 4. **Signal**
The alert is annunciated (`signal.activationState = on`, `signal.presence = on`).

## How the sensor triggers this alert
Unlike a limit alarm (value out of range), a sensor-displaced condition is reported by the
device as a **status bit** in its device-status object. The PHG reads that bit from the
measurement report, surfaces it on the `PhdBitsEnumerationObservation`, and generates this
`DeviceAlert` referencing that observation and the specific bit.
