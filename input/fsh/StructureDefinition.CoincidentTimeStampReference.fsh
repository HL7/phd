Alias: $m49.htm = http://unstats.un.org/unsd/methods/m49/m49.htm

Extension: CoincidentTimeStampReference
Id: CoincidentTimeStampReference
Title: "Coincident Timestamp Reference"
Description: "Reference to a coincident timestamp observation that relates the gateway timeline to the PHD timeline."
Context: Observation
* ^extension[0].url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-wg"
* ^extension[=].valueCode = #dev
* ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-fmm"
* ^extension[=].valueInteger = 1
// * ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-standards-status"
// * ^extension[=].valueCode = #trial-use
* ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-type-characteristics"
* ^extension[=].valueCode = #can-bind
* ^url = "http://hl7.org/fhir/uv/phd/StructureDefinition/CoincidentTimeStampReference"
* ^identifier.system = "urn:ietf:rfc:3986"
* ^identifier.value = "urn:oid:2.16.840.1.113883.4.642.5.1460"
* ^version = "5.2.0-ballot"
* ^experimental = false
* ^date = "2015-03-02"
* ^publisher = "HL7 International / Devices"
* ^contact.telecom.system = #url
* ^contact.telecom.value = "http://www.hl7.org/Special/committees/orders"
* ^jurisdiction = $m49.htm#001
* . 0..1
* . ^short = "Coincident Timestamp Reference"
* . ^definition = "Reference to a coincident timestamp observation that relates the gateway timeline to the PHD timeline"
* url = "http://hl7.org/fhir/uv/phd/StructureDefinition/CoincidentTimeStampReference" (exactly)
* value[x] 1..
* value[x] only Reference(PhdCoincidentTimeStampObservation)