Profile: PhdStringObservation
Parent: PhdBaseObservation
Id: PhdStringObservation
Description: "Observations from a PHD where the measurement is a human readable string."
* ^meta.lastUpdated = "2017-12-08T05:24:29.234-05:00"
* ^extension.url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-wg"
* ^extension.valueCode = #oo
* ^url = "http://hl7.org/fhir/uv/phd/StructureDefinition/PhdStringObservation"
* ^status = #active
* ^date = "2017-06-02T14:29:52.39367-04:00"
* . ^short = "Reports observations that are human-readable strings"
* . ^definition = "The PhdStringObservation reports PHD observations that contain a string as the observation value."
* . ^comment = "This type of observation is used when the Personal Health Device reports an arbitrary text string as the observation value. An example would be the program name of an exercise option on a piece of cardio equipment."
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
