ValueSet: MDCnotObject
Id: MDCnotObject
Title: "MDC Non-Object codes"
Description: "ValueSet for the ISO/IEEE 11073-10101 Nomenclature excluding Object partition."
* ^meta.profile = "http://hl7.org/fhir/StructureDefinition/shareablevalueset"
* ^url = "http://hl7.org/fhir/uv/phd/ValueSet/MDCnotObject"
* ^version = "current"
// * ^status = #draft
* ^experimental = false
* ^publisher = "Health Level Seven International (Devices Work Group)"
// * include codes from system Mdc where partition = "2"
// * include codes from system Mdc where partition = "3"
// * include codes from system Mdc where partition = "4"
// * include codes from system Mdc where partition = "5"
// * include codes from system Mdc where partition = "7"
// * include codes from system Mdc where partition = "8"
// * include codes from system Mdc where partition = "127"
// * include codes from system Mdc where partition = "128"
// * include codes from system Mdc where partition = "258"
// * include codes from system Mdc where partition = "2"  or partition = "3"  or partition = "4"  or partition = "5"  or partition = "7"  or partition = "8"  or partition = "127"  or partition = "128"  or partition = "258"
// * include codes from system Mdc where partition not-in "1"
* include codes from valueset MDCValueSet
* exclude codes from valueset MDCobject
