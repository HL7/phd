Profile: PhdStringEnumerationObservation
Parent: PhdBaseObservation
Id: PhdStringEnumerationObservation
Description: "StructureDefinition for Observation Resources representing measurement data coming from a medical device where the measurement itself is an enumerated human readable string."
* ^meta.lastUpdated = "2017-12-08T05:24:29.234-05:00"
* ^extension.url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-wg"
* ^extension.valueCode = #oo
* ^url = "http://hl7.org/fhir/uv/phd/StructureDefinition/PhdStringEnumerationObservation"
* ^status = #draft
* ^date = "2017-06-02T14:29:52.39367-04:00"
* . ^short = "Reports measurements that are enumerated human-readable strings"
* . ^definition = "The PhdStringEnumerationObservation reports PHD measurements that contain a Enum-Observed-Value-Simple-Str attribute."
* . ^comment = "This type of measurement is used when the Personal Health Device reports a measurement as an arbitrary text string. An example would be the program name of an exercise option on a piece of cardio equipment. These strings are not generically processable by machine and only for human consumption."
// * meta 1..
// * meta.profile ^slicing.discriminator.type = #value
// * meta.profile ^slicing.discriminator.path = "value"
// * meta.profile ^slicing.rules = #open
// * meta.profile contains phdProfile 1..1
// * meta.profile[phdProfile] = "http://hl7.org/fhir/uv/phd/StructureDefinition/PhdStringEnumerationObservation" (exactly)
* value[x] 1..
* value[x] only string
* value[x] ^short = "Human readable text string"
* dataAbsentReason ^short = "Populated when the Measurement-Status or an Enum-Observed-Value status indicates invalid, not unavailable, or msmt ongoing"
* dataAbsentReason ^definition = "Provides a reason why the expected value in the element Observation.valueString is missing."
* dataAbsentReason ^comment = "Only the Measurement-Status/status flags indicating invalid, not unavailable, or msmt ongoing will generate this element and cause the value[x] to be absent. The remaining settings of the status values are reported in the meta.security element or interpretation element."
* dataAbsentReason.coding ^slicing.discriminator.type = #value
* dataAbsentReason.coding ^slicing.discriminator.path = "system"
* dataAbsentReason.coding ^slicing.rules = #open
* dataAbsentReason.coding contains FhirDefault 1..1
* dataAbsentReason.coding[FhirDefault].system 1..
* dataAbsentReason.coding[FhirDefault].system = "http://terminology.hl7.org/CodeSystem/data-absent-reason" (exactly)
* dataAbsentReason.coding[FhirDefault].code 1..
