# Notes for the SimpleAlerting Extension

The `SimpleAlerting` extension is used to define the behavior and configuration of simple alerting systems for PHD Devices. Below is a description of the original IEEE 11073-20601 attributes, including their MDC code and the corresponding element in the extension. 
In IEEE 11073-10206 / ACOM simple alerting can be modeled as an extension to a numeric observation with the same attributes as this FHIR extension.


## Alert Type
In some cases there can be multiple types of alerts defined for a monitored value. For example in a continuous glucose monitor there can be a patient normal range low and high value and a critical hypo and hyper value. In IEEE 11073-20601 these are reported as numeric settings with MDC codes `MDC_CONC_GLU_PATIENT_THRESHOLDS_LOW_HIGH` and `MDC_CONC_GLU_THRESHOLDS_HYPO_HYPER` that reports the monitored low and high limits.

## Current Limits
The IEEE 11073 Current-Limits attribute specifies the lower and upper threshold limits of the monitored parameter. The MDC code of the attribute is `MDC_ATTR_LIMIT_CURR`.

The `currentLimits` element specifies the acceptable range for the monitored parameter. It is represented as a `valueRange` with the following sub-elements:
- **`low`**: The lower limit of the acceptable range. If the monitored value falls below this limit, an alert may be triggered.
- **`high`**: The upper limit of the acceptable range. If the monitored value exceeds this limit, an alert may be triggered.
- **Units**: The limits are expressed in a specific unit (e.g., `%` for percentages) using the Unified Code for Units of Measure (UCUM) and should match the unit of the monitored parameter.

## Alert Operational State
The IEEE 11073 Alert Operational State attribute uses an ASN1-BITs field to indicate whether the alerts on a given limit (upper or lower) are on or off. When `SET`, the alerts are off. This is a state-type measurement, and when this attribute is present, both the set and cleared states are reported. The MDC code of the attribute is `MDC_ATTR_AL_OP_STAT`.

The `alertOperationalState` element indicates the current operational state of the alerting system. It is represented as a `valueCodeableConcept` with codes from the `SimpleAlertOperationalStates` ValueSet. Examples of operational states include:
- **`On`**: The alerting system is active and monitoring the parameter.
- **`LowLimitOff`**: The lower limit monitoring is disabled.
- **`HighLimitOff`**: The upper limit monitoring is disabled.
- **`LimitsOff`**: Both upper and lower limit monitoring are disabled.

## Alert Operational Text
The IEEE 11073 Alert Operational Text attribute consists of a pair of strings that describe the operational state of the lower and upper threshold monitoring.

The `alertOperationalText` element provides a single human-readable string describing the operational state of the lower and upper threshold monitoring.

## Threshold Notification Text
The IEEE 11073 Threshold-Notification-Text-String attribute provides a human-readable string notifying the user of a value outside the current limits. It may include details about the condition that triggered the alert or instructions for responding to it. The MDC code is `MDC_ATTR_THRES_NOTIF_TEXT_STRING`

The `thresholdNotificationText` element provides this notification text, ensuring that users are informed about the specific condition that caused the alert.

---

These elements collectively define the configuration and behavior of the `SimpleAlerting` extension, enabling systems to monitor and respond to specific conditions effectively.