Extension: Accuracy
Id: Accuracy
Title: "Numeric Accuracy"
Description: "The accuracy of a measurable quantity."
Context: Observation, DeviceMetric, Observation.component
* ^url = "http://hl7.org/fhir/uv/phd/StructureDefinition/Accuracy"
* ^version = "1.0.0"
// * ^status = #draft
* . 0..1
* . ^short = "Numeric Accuracy"
* . ^definition = "The accuracy of a measurable quantity."
* value[x] 1..
* value[x] only Quantity
* value[x].value ^definition = "The actual accuracy value should positive."
* value[x].unit ^definition = "The unit should be the same as the unit of the quantity this applies to."