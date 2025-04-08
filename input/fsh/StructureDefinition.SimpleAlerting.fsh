Extension: SimpleAlerting
Id: SimpleAlerting
Title: "Simple Alerting"
Description: "A simple alerting extension for PHDs."
Context: Observation, DeviceMetric, Observation.component
* ^url = "http://hl7.org/fhir/uv/phd/StructureDefinition/SimpleAlerting"
* ^version = "1.0.0"
* . 0..1
* . ^short = "SimpleAlerting"
* . ^definition = "A simple set of parameters for basic alerting on numerical observed data."
* extension contains
    alertType 0..1 and
    currentLimits 1..1 and 
    alertOperationalState 1..1 and
    alertOperationalText 0..1 and 
    thresholdNotificationText 0..1
* extension[alertType]
  * value[x] 1..
  * value[x] only CodeableConcept
  * valueCodeableConcept ^definition = "The type of alerting system."
  * valueCodeableConcept from http://hl7.org/fhir/uv/phd/ValueSet/MDCValueSet (extensible)
* extension[currentLimits]
  * value[x] 1..
  * value[x] only Range
  * value[x].low.unit ^definition = "The units should be the same as the unit of the quantity this applies to."
  * value[x].high.unit ^definition = "The units should be the same as the unit of the quantity this applies to."
  * value[x] obeys alerting-range-units
* extension[alertOperationalState]
  * value[x] 1..
  * value[x] only CodeableConcept
  * valueCodeableConcept ^definition = "The operational state of the alerting system."
  * valueCodeableConcept from SimpleAlertOperationalStates (extensible)
* extension[alertOperationalText]
  * value[x] 0..
  * value[x] only string
  * valueString ^definition = "A human readable description of the operational state of the alerting system ()."
* extension[thresholdNotificationText]
  * value[x] 0..
  * value[x] only string
  * valueString ^definition = "A human readable description of the threshold notification (DeviceAlert.label in FHIR R6)."
Invariant: alerting-range-units
Description: "The units used should be equal."
* severity = #warning
* expression = "low.code.exists() and high.code.exists() and low.code = high.code"
* xpath = "@value|f:*|h:div"

