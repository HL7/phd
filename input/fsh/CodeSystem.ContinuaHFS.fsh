CodeSystem: ContinuaHFS
Id: ContinuaHFS
Title: "Continua Health and Fitness Continua Service Interfaces"
Description: "Codes used to describe the Continua Health and Fitness interfaces supported by a Personal Health Gateway. More codes maybe added to this list in the future."
* ^meta.profile = "http://hl7.org/fhir/StructureDefinition/shareablecodesystem"
* ^url = "http://hl7.org/fhir/uv/phd/CodeSystem/ContinuaHFS"
* ^version = "0.3.0"
* ^status = #active
* ^experimental = false
* ^date = "2018-09-18"
* ^publisher = "Health Level Seven International (Health Care Devices Work Group)"
* ^caseSensitive = true
* ^hierarchyMeaning = #grouped-by
* ^content = #complete
* #0 "observation-upload-soap" "Indicates the PHG has been Continua certified for the PCD-01 upload using Web services"
* #1 "consent-enabled-soap" "Indicates the PHG has been Continua certified for the PCD-01 upload using Web services with patient consent"
* #2 "capabilities" "Indicates the PHG has been Continua certified for Capabilities Exchange"
* #3 "observation-upload-hdata" "Indicates the PHG has been Continua certified for PCD-01 upload using HDATA"
* #4 "consent-enabled-hdata" "Indicates the PHG has been Continua certfied for PCD-01 upload using HDATA with patient consent"
* #5 "questionnaire" "Indicates the PHG has been Continua certfied for the CDA questionnaire"
* #6 "aps" "Indicates the PHG has been Continua certfied for Authenticated Persistent Sessions"
* #7 "observation-upload-fhir" "Indicates the PHG has been Continua certfied for uploading FHIR resources"
