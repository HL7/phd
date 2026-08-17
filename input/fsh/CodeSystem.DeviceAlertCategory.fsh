CodeSystem: DeviceAlertCategoryCS
Id: DeviceAlertCategoryCS
Title: "Device Alert Category Code System"
Description: "Codes used to categorize device alerts coming from PHD devices."
// * ^meta.profile = "http://hl7.org/fhir/StructureDefinition/shareablecodesystem"
* ^url = "http://terminology.hl7.org/CodeSystem/devicealert-category"
* ^version = "0.1.0"
* ^status = #active
* ^experimental = false
* ^date = "2026-07-15"
* ^publisher = "Health Level Seven International (Devices Work Group)"
* ^caseSensitive = true
* ^content = #complete
* #communication-connectivity "Communication / Connectivity" "Alert related to device, gateway, network, wireless, wired, or protocol connectivity issues."
* #battery-power "Battery / Power" "Alert related to battery level, charging state, power supply, or power source failure."
* #device-signal-issue "Device / Signal Issue" "Alert related to sensor attachment, signal loss, poor signal quality, missing signal, artifact, or signal acquisition failure."
* #measurement-validity "Measurement Validity" "Alert indicating that a measured value may be invalid, unreliable, out of measurement range, artifact-affected, or clinically/technically unusable."
* #configuration "Configuration" "Alert related to device, metric, alarm, threshold, profile, mode, or system configuration."
* #data-acquisition "Data Acquisition" "Alert related to collecting, sampling, buffering, or receiving data from a device, metric, sensor, or gateway."
* #time-synchronization "Time Synchronization" "Alert related to clock drift, missing timestamp, invalid timestamp, NTP/PTP failure, or inconsistent device/gateway time."
* #device-gateway-malfunction "Device / Gateway Malfunction" "Alert related to malfunction, fault, internal error, failed self-test, software fault, hardware fault, or gateway runtime failure."
* #gateway-backend "Gateway / Backend" "Alert related to gateway-to-backend processing, queueing, storage, service availability, API failure, FHIR publishing, or cloud/platform delivery."
* #security "Security" "Alert related to authentication, authorization, certificate, encryption, integrity, access control, or cybersecurity concern."
* #environment "Environment" "Related to environmental conditions."
* #respiratory "Respiratory" "Related to subject's respiratory function."
* #maintenance "Maintenance" "Related to maintenance of the subject, such as a device."