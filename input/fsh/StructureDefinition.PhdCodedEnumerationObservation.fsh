Profile: PhdCodedEnumerationObservation
Parent: PhdBaseObservation
Id: PhdCodedEnumerationObservation
Description: "StructureDefinition for Observation Resources representing measurement data coming from a medical device where the measurement itself is an enumerated code."
* ^meta.lastUpdated = "2017-12-08T05:24:29.234-05:00"
* ^extension.url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-wg"
* ^extension.valueCode = #oo
* ^url = "http://hl7.org/fhir/uv/phd/StructureDefinition/PhdCodedEnumerationObservation"
* ^status = #draft
* ^date = "2017-06-02T14:29:52.39367-04:00"
* . ^short = "Reports measurements that are enumeration MDC codes"
* . ^definition = "The PhdCodedEnumerationObservation reports PHD measurements that contain a Enum-Observed-Value-Simple-OID attribute."
* . ^comment = "This type of measurement is used when the Personal Health Device reports a measurement as an IEEE 11073-10101 code. An example would be the most recent meal context associated with a glucose measurement such as 'breakfast', 'fasting', 'snack', etc. The list of codes for these meal options is finite."
* value[x] only CodeableConcept
* valueCodeableConcept.coding ^slicing.discriminator.type = #value
* valueCodeableConcept.coding ^slicing.discriminator.path = "system"
* valueCodeableConcept.coding ^slicing.rules = #open
* valueCodeableConcept.coding contains MDCType 1..1
* valueCodeableConcept.coding[MDCType] ^short = "Required MDC code entry"
* valueCodeableConcept.coding[MDCType].system 1..
* valueCodeableConcept.coding[MDCType].system = "urn:iso:std:iso:11073:10101" (exactly)
* dataAbsentReason ^short = "Populated when the Measurement-Status or an Enum-Observed-Value status indicates invalid, not unavailable, or msmt ongoing"
* dataAbsentReason ^definition = "Provides a reason why the expected value in the element Observation.valueCodeableConcept is missing."
* dataAbsentReason ^comment = "Only the Measurement-Status/status flags indicating invalid, not unavailable, or msmt ongoing will generate this element and cause the value[x] to be absent. The remaining settings of the status values are reported in the meta.security element or interpretation element."
* dataAbsentReason.coding ^slicing.discriminator.type = #value
* dataAbsentReason.coding ^slicing.discriminator.path = "system"
* dataAbsentReason.coding ^slicing.rules = #open
* dataAbsentReason.coding contains FhirDefault 1..1
* dataAbsentReason.coding[FhirDefault].system 1..
* dataAbsentReason.coding[FhirDefault].system = "http://terminology.hl7.org/CodeSystem/data-absent-reason" (exactly)
* dataAbsentReason.coding[FhirDefault].code 1..
