Extension: Confidence95
Id: Confidence95
Title: "Confidence 95 range"
Description: "The Confidence 95 range of a measurable quantity."
Context: Observation, DeviceMetric, Observation.component
* ^url = "http://hl7.org/fhir/uv/phd/StructureDefinition/Confidence95"
* ^version = "1.0.0"
* ^status = #active
* . 0..1
* . ^short = "Confidence95"
* . ^definition = "The Confidence 95 range of a measurable quantity."
* value[x] 1..
* value[x] only Range
* value[x].low.unit ^definition = "The unit should be the same as the unit of the quantity this applies to."
* value[x].high.unit ^definition = "The unit should be the same as the unit of the quantity this applies to."
* value[x] obeys confidence-range-units

Invariant: confidence-range-units
Description: "The units used should be equal."
* severity = #warning
* expression = "low.unit.exists() and high.unit.exists() and low.unit = high.unit"
//* xpath = "@value|f:*|h:div"
