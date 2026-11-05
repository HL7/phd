ValueSet: DeviceAlertConditionVS
Id: DeviceAlertConditionVS
Title: "Device Alert Condition Codes (MDC or ASN1ToHL7)"
Description: "Alert condition codes for PHD device alerts: IEEE 11073-10101 MDC partition-3 condition codes, or device/sensor status codes from the ASN1ToHL7 code system."
// * ^meta.profile = "http://hl7.org/fhir/StructureDefinition/shareablevalueset" // from CRMI
* ^url = "http://hl7.org/fhir/uv/phd/ValueSet/DeviceAlertConditionVS"
* ^status = #active
* ^experimental = false
* ^publisher = "Health Level Seven International (Devices Work Group)"
* include codes from valueset http://terminology.hl7.org/ValueSet/devicealert-condition|2.0.0
* include codes from system ASN1ToHL7
