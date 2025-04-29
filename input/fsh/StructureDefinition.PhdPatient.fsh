Profile: PhdPatient
Parent: Patient
Id: PhdPatient
Description: "The patient information reported from personal health gateways (PHG)"
* ^meta.lastUpdated = "2017-10-16T05:10:41.036-04:00"
* ^url = "http://hl7.org/fhir/uv/phd/StructureDefinition/PhdPatient"
// * ^status = #draft
* ^date = "2017-08-04T06:04:53.838-04:00"
* identifier ^slicing.discriminator.type = #value
* identifier ^slicing.discriminator.path = "type.coding.system"
* identifier ^slicing.rules = #open
* identifier contains v2Coding 1..1
* identifier[v2Coding] ^short = "Code defined by http://terminology.hl7.org/CodeSystem/v2-0203"
* identifier[v2Coding] ^definition = "A code using the V2 http://terminology.hl7.org/CodeSystem/v2-0203/ system."
* identifier[v2Coding] ^comment = "This IG requires the HL7 V2 coding system that supports many possible types of identifiers. For a local coding system use 'L', for an unknown identifier, for example with an unknown patient, use 'U'"
* identifier[v2Coding].type.coding.system = "http://terminology.hl7.org/CodeSystem/v2-0203" (exactly)
* identifier[v2Coding].type.coding.code 1..
* identifier[v2Coding].type.coding.code ^definition = "A symbol defined by the coding system. For example, the code 'MR' indicates the identifier is a Medical Record Number. 'SS' indicates that the identifier value is a US social security number and 'SR' indicates a state registry id."
* identifier[v2Coding].system 1..
* identifier[v2Coding].system ^short = "The system associated with the value. For XDSb this would be the enterprise identifier (an OID)."
* identifier[v2Coding].system ^comment = "For an unknown patient the system http://terminology.hl7.org/CodeSystem/v2-0004 can be used with value 'U'"
* identifier[v2Coding].value 1..

