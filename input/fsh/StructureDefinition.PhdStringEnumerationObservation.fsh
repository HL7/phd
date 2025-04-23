Profile: PhdStringEnumerationObservation
Parent: PhdBaseObservation
Id: PhdStringEnumerationObservation
Description: "StructureDefinition for Observation Resources representing measurement data coming from a medical device where the measurement itself is an enumerated human readable string."
* ^meta.lastUpdated = "2017-12-08T05:24:29.234-05:00"
* ^extension.url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-wg"
* ^extension.valueCode = #oo
* ^url = "http://hl7.org/fhir/uv/phd/StructureDefinition/PhdStringEnumerationObservation"
// * ^status = #draft
* ^date = "2017-06-02T14:29:52.39367-04:00"
* . ^short = "Reports measurements that are enumerated human-readable strings"
* . ^definition = "The PhdStringEnumerationObservation reports PHD measurements that contain a Enum-Observed-Value-Simple-Str attribute."
* . ^comment = "This type of measurement is used when the Personal Health Device reports a measurement as an arbitrary text string. An example would be the program name of an exercise option on a piece of cardio equipment. These strings are not generically processable by machine and only for human consumption."
* value[x] only string
* value[x] ^short = "Human readable text string"
