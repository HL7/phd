ValueSet: MDCobject
Id: MDCobject
Title: "MDC Object and Device nomenclature"
Description: "ValueSet for the ISO/IEEE 11073-10101 Nomenclature filtered by & Device nomenclature partition."
* ^meta.profile = "http://hl7.org/fhir/StructureDefinition/shareablevalueset"
* ^url = "http://hl7.org/fhir/uv/phd/ValueSet/MDCobject"
* ^version = "current"
// * ^status = #draft
* ^experimental = false
* ^publisher = "Health Level Seven International (Devices Work Group)"
* include codes from system Mdc where partition = "1"
