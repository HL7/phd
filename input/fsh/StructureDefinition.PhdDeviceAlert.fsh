// ============================================================
// Profile: PhdDeviceAlert
// ============================================================

Profile: PhdDeviceAlert
Parent: DeviceAlert
Id: PhdDeviceAlert
Title: "PhdDeviceAlert"
Description: "Profile for device alert that capture alert conditions from personal health devices."
* ^meta.lastUpdated = "2026-02-13T00:00:00.000-05:00"
* ^url = "http://hl7.org/fhir/uv/phd/StructureDefinition/PhdDeviceAlert"
* ^date = "2026-02-13T00:00:00.000-05:00"
* ^abstract = false

// ------------------------------------------------------------
// Alert Code
// ------------------------------------------------------------
* code from http://hl7.org/fhir/uv/phd/ValueSet/MDCValueSet (required)
  * ^short = "Code for the alert condition"
  * ^definition = "MDC nomenclature code indicating the alert condition being reported"
  * ^comment = "The code identifies the specific alert condition from the IEEE 11073 medical device communication nomenclature."

// ------------------------------------------------------------
// Alert Label/Notification Text
// ------------------------------------------------------------
* label 0..1
  * ^short = "Threshold notification text"
  * ^definition = "Notification message displayed when the threshold is crossed."

// ------------------------------------------------------------
// Signal - for operational state and text
// ------------------------------------------------------------
* signal ^slicing.discriminator[0].type = #value
  * ^slicing.discriminator[=].path = "type"
  * ^slicing.rules = #open
// ------------------------------------------------------------
// derivedFrom: Link to source observations
// ------------------------------------------------------------
* derivedFrom 1..*
  * ^short = "Reference to the observation(s) this alert is associated with"
  * ^definition = "References to the PhdNumericObservation, PhdCompoundNumericObservation, PhdCompoundObservation, or other observations that this alert condition is derived from or associated with."
  * ^comment = "The alert is now represented as a separate resource that references the source measurement observation(s) via derivedFrom. The component element can be used to identify a specific component in case of an alert on a compound observation, e.g. on systolic blood pressure in a blood pressure observation."
* derivedFrom only Reference(PhdNumericObservation or PhdCompoundNumericObservation or PhdCompoundObservation)

// ------------------------------------------------------------
// Mapping
// ------------------------------------------------------------
Mapping: IEEE-11073-10206-PhdDeviceAlert
Id: IEEE-11073-10206-PhdDeviceAlert
Title: "IEEE-11073-10206 ACOM Alert to FHIR"
Source: PhdDeviceAlert
* -> "Simple-Sa-Observed-Value"
* code -> "Simple-Sa-Observed-Value.metric-id"
* signal -> "Simple-Sa-Observed-Value.state and alert-op-text-string"
* label -> "Simple-Sa-Observed-Value.nu-val-obs-simp-str"
* derivedFrom -> "Associated with metric observations via logical linkage"
