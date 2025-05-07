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
* identifier contains v2Coding 0..1
* identifier[v2Coding] ^short = "Code defined by http://terminology.hl7.org/CodeSystem/v2-0203"
* identifier[v2Coding] ^definition = "A code using the V2 http://terminology.hl7.org/CodeSystem/v2-0203/ system."
* identifier[v2Coding] ^comment = "This IG recommends the HL7 V2 coding system that supports many possible types of identifiers. For example, the code 'MR' indicates the identifier is a Medical Record Number. 'SS' indicates that the identifier value is a social security number and 'SR' indicates a state registry id."
* identifier[v2Coding] ^comment = "For a new patient resource that is uploaded by the PHG without a (supported) identifier the FHIR server should assign an identifier using its usual type code, such as 'MR' or 'LR', the usual value for the system and a newly assigned identifier.value."
* identifier[v2Coding].type.coding from http://terminology.hl7.org/ValueSet/v2-0203 (required)
* identifier[v2Coding].type.coding.system = "http://terminology.hl7.org/CodeSystem/v2-0203"
* identifier[v2Coding].system ^short = "The system associated with the value. For XDS.b this would be the enterprise identifier (an OID)."

