ValueSet: MDCobject
Id: MDCobject
Title: "IEEE 11073 MDC Object infrastructure and Device nomenclature"
Description: "ValueSet for the ISO/IEEE 11073-10101 Nomenclature filtered by Object partition."
* ^meta.profile = "http://hl7.org/fhir/StructureDefinition/shareablevalueset"
* ^url = "http://hl7.org/fhir/uv/phd/ValueSet/MDCobject"
* ^version = "0.3.0"
* ^status = #draft
* ^experimental = false
* ^date = "2018-08-17"
* ^publisher = "Health Level Seven International (Health Care Devices Work Group)"
* include codes from system Mdc where partition = "1"
