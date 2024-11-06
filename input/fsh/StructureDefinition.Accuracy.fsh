Extension: Accuracy
Id: Accuracy
Title: "Numeric Accuracy"
Description: "The accuracy of a measurable quantity."
Context: Observation, DeviceMetric
* ^url = "http://hl7.org/fhir/uv/phd/StructureDefinition/Accuracy"
* . 0..1
* . ^short = "Numeric Accuracy"
* . ^definition = "The accuracy of a measurable quantity. The unit should be the same as the unit of the quantity this applies to."
* url = "http://hl7.org/fhir/uv/phd/StructureDefinition/Accuracy" (exactly)
* value[x] 1..
* value[x] only Quantity