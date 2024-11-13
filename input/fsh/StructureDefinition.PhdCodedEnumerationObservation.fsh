Profile: PhdCodedEnumerationObservation
Parent: PhdBaseObservation
Id: PhdCodedEnumerationObservation
Description: "StructureDefinition for Observation Resources representing measurement data coming from a PHD where the measurement value is a code."
* ^meta.lastUpdated = "2017-12-08T05:24:29.234-05:00"
* ^extension.url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-wg"
* ^extension.valueCode = #oo
* ^url = "http://hl7.org/fhir/uv/phd/StructureDefinition/PhdCodedEnumerationObservation"
* ^status = #draft
* ^date = "2017-06-02T14:29:52.39367-04:00"
* . ^short = "Reports measurements with values that are single MDC codes."
* . ^definition = "The PhdCodedEnumerationObservation reports PHD observations that contain a single MDC code from a finite set as their value."
* . ^comment = "This type of measurement is used when the Personal Health Device reports a measurement as an IEEE 11073-10101 code. An example would be the most recent meal context associated with a glucose measurement such as 'breakfast', 'fasting', 'snack', etc. The list of codes for these meal options is finite."
* value[x] only CodeableConcept
* valueCodeableConcept.coding ^slicing.discriminator.type = #value
* valueCodeableConcept.coding ^slicing.discriminator.path = "system"
* valueCodeableConcept.coding ^slicing.rules = #open
* valueCodeableConcept.coding contains MDCType 1..1
* valueCodeableConcept.coding[MDCType] ^short = "Required MDC code"
* valueCodeableConcept.coding[MDCType].system 1..
* valueCodeableConcept.coding[MDCType].system = "urn:iso:std:iso:11073:10101" (exactly)

