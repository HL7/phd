CodeSystem: ContinuaHFS
Id: ContinuaHFS
Title: "Continua Health and Fitness Service Interfaces"
Description: "Codes used to describe the Continua Health and Fitness interfaces supported by a Personal Health Gateway. More codes maybe added to this list in the future."
* ^meta.profile = "http://hl7.org/fhir/StructureDefinition/shareablecodesystem"
* ^url = "http://hl7.org/fhir/uv/phd/CodeSystem/ContinuaHFS"
* ^version = "0.3.0"
* ^status = #active
* ^experimental = false
* ^date = "2018-09-18"
* ^publisher = "Health Level Seven International (Devices Work Group)"
* ^caseSensitive = true
* ^content = #complete
* #0 "observation-upload-soap" "The PHG has been certified for the PCD-01 upload using Web services"
* #1 "consent-enabled-soap" "The PHG has been certified for the PCD-01 upload using Web services with patient consent"
* #2 "capabilities" "The PHG has been certified for Capabilities Exchange"
* #3 "observation-upload-hdata" "The PHG has been certified for PCD-01 upload using HDATA"
* #4 "consent-enabled-hdata" "The PHG has been certified for PCD-01 upload using HDATA with patient consent"
* #5 "questionnaire" "The PHG has been certified for the CDA questionnaire"
* #6 "aps" "The PHG has been certified for Authenticated Persistent Sessions"
* #7 "observation-upload-fhir" "The PHG has been certified for uploading FHIR resources"
