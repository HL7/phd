ValueSet: ASN1EventOrStateValues
Id: ASN1EventOrStateValues
Title: "ASN1 Event or State Values"
Description: "ValueSet for the eventOrState property values in the ASN1ToHL7 CodeSystem"
* ^meta.profile = "http://hl7.org/fhir/StructureDefinition/shareablevalueset"
* ^url = "http://hl7.org/fhir/uv/phd/ValueSet/ASN1EventOrStateValues"
* ^status = #active
* ^experimental = false
* ^date = "2024-11-13"
* include codes from system ASN1ToHL7 where concept is-a #eventOrState
* ASN1ToHL7#event "Event"
* ASN1ToHL7#state "State"

ValueSet: ASN1SourceValues
Id: ASN1SourceValues
Title: "ASN1 Source Values"
Description: "ValueSet for the source property values in the ASN1ToHL7 CodeSystem"
* ^meta.profile = "http://hl7.org/fhir/StructureDefinition/shareablevalueset"
* ^url = "http://hl7.org/fhir/uv/phd/ValueSet/ASN1SourceValues"
* ^status = #active
* ^experimental = false
* ^date = "2024-11-13"
* include codes from system ASN1ToHL7 where concept is-a #source
* ASN1ToHL7#device "Attribute"
* ASN1ToHL7#measurement "Measurement"
