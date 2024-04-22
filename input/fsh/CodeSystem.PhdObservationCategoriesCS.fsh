CodeSystem: PhdObservationCategoriesCS
Id: PhdObservationCategoriesCS
Title: "PHD Observation Categories Code System"
Description: "Codes used for tagging observations coming from PHD devices. More codes maybe added to this list in the future."
* ^meta.profile = "http://hl7.org/fhir/StructureDefinition/shareablecodesystem"
* ^url = "http://hl7.org/fhir/uv/phd/CodeSystem/PhdObservationCategoriesCS"
* ^version = "0.1.0"
* ^status = #draft
* ^experimental = true
* ^date = "2024-04-18"
* ^publisher = "Health Level Seven International (Health Care Devices Work Group)"
* ^caseSensitive = true
* ^hierarchyMeaning = #grouped-by
* ^content = #complete
* #phd-observation "PHD generated Observation" "An observation coming from a personal health device, either directly or via a personal health gateway that maps the data received from the PHD into a FHIR Observation resource."
* #dummy "Test"
