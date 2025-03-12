CodeSystem: ASN1ToHL7Concepts
Id: ASN1ToHL7Concepts
Title: "11073 ASN1ToHl7 codesystem concepts"
Description: "Code system to have a formal definition and URI for these concepts."
* ^meta.profile = "http://hl7.org/fhir/StructureDefinition/shareablecodesystem"
* ^url = "http://hl7.org/fhir/uv/phd/CodeSystem/ASN1ToHL7Concepts"
* ^version = "current"
* ^experimental = false
// * ^status = #draft
* ^caseSensitive = true
* ^hierarchyMeaning = #grouped-by
* ^content = #complete
* ^publisher = "Health Level Seven International (Health Care Devices Work Group)"
* #eventOrState "Event or State" "Indicates whether the bit represents an event or a state"
* #event "Event" "indicates that the bit represents an event that happens"
* #state "State" "indicates that the bit represents a state that persists"
* #source "Source" "indicates if a bit comes from a measurement or a device"
* #device "Device" "Indicates that the bit represents a device attribute"
* #measurement "Measurement" "Indicates that the bit represents a measurement attribute"
* #MDCCode "MDC Code" "original MDC code of the bitstring observation type"
