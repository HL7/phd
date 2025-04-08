Profile: PhdPatient
Parent: Patient
Id: PhdPatient
Description: "The patient information reported from personal health gateways (PHG)"
* ^meta.lastUpdated = "2017-10-16T05:10:41.036-04:00"
* ^url = "http://hl7.org/fhir/uv/phd/StructureDefinition/PhdPatient"
// * ^status = #draft
* ^date = "2017-08-04T06:04:53.838-04:00"
* ^purpose = "All PHD related Observation resources reference a Patient resource containing a minimal set of information sufficient to identify the patient. However, it may require additional information to link the patient to a person that is only available to an authorized entity. In this manner, PHMI can be protected."
* . ^comment = "Note that the only element that is required to be populated is the identifier which can be made opaque to a third party viewer. PCHA also supports a situation where the PHG can be provided a logical id to a Patient Resource out of band. In this case, the PHG never uploads a Patient Resource, but uses the provided logical id in the Observation resources instead. In this manner, not even the opaque identifiers are sent over the wire."
* identifier 1..
* identifier.type 1..
* identifier.type.coding ^slicing.discriminator.type = #value
* identifier.type.coding ^slicing.discriminator.path = "system"
* identifier.type.coding ^slicing.rules = #open
* identifier.type.coding ^comment = "This element shall be populated."
* identifier.type.coding contains v2Coding 1..1
* identifier.type.coding[v2Coding] ^short = "Code defined by http://terminology.hl7.org/CodeSystem/v2-0203"
* identifier.type.coding[v2Coding] ^definition = "A code using the V2 http://terminology.hl7.org/CodeSystem/v2-0203/ system."
* identifier.type.coding[v2Coding] ^comment = "This HL7 V2 coding system identifies that this is the Continua identifier. The V2 system supports many possible types of identifiers. For a local coding system use 'L', for an unknown identifier, for example with an unknown patient, use 'U'"
* identifier.type.coding[v2Coding].system 1..
* identifier.type.coding[v2Coding].system = "http://terminology.hl7.org/CodeSystem/v2-0203" (exactly)
* identifier.type.coding[v2Coding].system ^definition = "The identification of the code system that defines the meaning of the symbol in the code. In this case the system is http://terminology.hl7.org/CodeSystem/v2-0203"
* identifier.type.coding[v2Coding].system ^comment = "HL7 defines several codes that can be used in the http://terminology.hl7.org/CodeSystem/v2-0203 system. For a list of the possible codes in this system see http://www.hl7.org/fhir/CodeSystem/v2-0203"
* identifier.type.coding[v2Coding].code 1..
* identifier.type.coding[v2Coding].code ^short = "a code from http://terminology.hl7.org/CodeSystem/v2-0203"
* identifier.type.coding[v2Coding].code ^definition = "A symbol defined by the http://terminology.hl7.org/CodeSystem/v2-0203 coding system. For example, the code 'MR' indicates the identifier is a Medical Record Number. 'SS' indicates that the identifier value is a US social security number and 'SR' indicates a state registry id."
* identifier.system 1..
* identifier.system ^short = "The system associated with the value. For XDSb this would be the enterprise identifier (an OID). For unknown patient 'http://terminology.hl7.org/CodeSystem/v2-0004'"
* identifier.system ^comment = "For an unknown patient the system http://terminology.hl7.org/CodeSystem/v2-0004 can be used with value 'U'"
* identifier.value 1..
* identifier.value ^short = "The patient identifier under the jurisdiction indicated by the system element. For unknown patient this would be 'U'."
