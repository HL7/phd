ValueSet: MDCobject
Id: MDCobject
Title: "IEEE 11073 MDC Object infrastructure and Device nomenclature"
Description: "ValueSet for the ISO/IEEE 11073-10101 Nomenclature filtered by Object partition."
* ^meta.profile = "http://hl7.org/fhir/StructureDefinition/shareablevalueset"
* ^url = "http://hl7.org/fhir/uv/phd/ValueSet/MDCobject"
* ^version = "current"
* ^status = #active
* ^experimental = false
* ^publisher = "Health Level Seven International (Health Care Devices Work Group)"
* include codes from system Mdc where partition = "1"
