ValueSet: DeviceAlertCategoryVS
Id: DeviceAlertCategoryVS
Title: "Device Alert Category Value Set"
Description: "Categories used to classify device alerts coming from PHD devices."
// * ^meta.profile = "http://hl7.org/fhir/StructureDefinition/shareablevalueset" // from CRMI
* ^url = "http://terminology.hl7.org/ValueSet/phd-devicealert-category"
* ^version = "0.1.0"
* ^status = #active
* ^experimental = false
* ^publisher = "Health Level Seven International (Devices Work Group)"
* include codes from system DeviceAlertCategoryCS
