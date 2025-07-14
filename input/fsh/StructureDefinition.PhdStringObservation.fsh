Profile: PhdStringObservation
Parent: PhdBaseObservation
Id: PhdStringObservation
Description: "Observations from a PHD where the measurement is a human readable string."
* ^meta.lastUpdated = "2017-12-08T05:24:29.234-05:00"
* ^extension.url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-wg"
* ^extension.valueCode = #oo
* ^url = "http://hl7.org/fhir/uv/phd/StructureDefinition/PhdStringObservation"
// * ^status = #draft
* ^date = "2017-06-02T14:29:52.39367-04:00"
* . ^short = "Reports measurements that are enumerated human-readable strings"
* . ^definition = "The PhdStringObservation reports PHD measurements that contain a Enum-Observed-Value-Simple-Str attribute."
* . ^comment = "This type of measurement is used when the Personal Health Device reports a measurement as an arbitrary text string. An example would be the program name of an exercise option on a piece of cardio equipment. These strings are not generically processable by machine and only for human consumption."
* value[x] only string
* value[x] ^short = "Human readable text string"

// Mapping Section
Mapping: IEEE-11073-10206-PhdStringObservation
Id: IEEE-11073-10206-PhdStringObservation
Title: "Mapping for PhdStringObservation"
Source: PhdStringObservation
Target: "https://sagroups.ieee.org/11073/phd-wg"
* -> "ACOM"
* valueString -> "StringObservation.value"
