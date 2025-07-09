RuleSet: Bitcode(concept, define, description, eventOrState, source, mdcmapping)
* {concept} {define} {description}
  * ^property[0].code = #eventOrState
  * ^property[=].valueCode = #{eventOrState}
  * ^property[+].code = #source
  * ^property[=].valueCode = #{source}
  * ^property[+].code = #MDCCode
  * ^property[=].valueCoding = Mdc#{mdcmapping}

CodeSystem: ASN1ToHL7
Id: ASN1ToHL7
Title: "ASN1 bits to HL7 enumerated values"
Description: "Codesystem for mapping IEEE 11073-10206 bitstrings to FHIR Codeable Concepts"
* ^meta.profile = "http://hl7.org/fhir/StructureDefinition/shareablecodesystem"
* ^url = "http://hl7.org/fhir/uv/phd/CodeSystem/ASN1ToHL7"
//* ^version = "2.1.0"
//* ^status = #active
* ^experimental = false
* ^date = "2018-09-18"
* ^publisher = "Health Level Seven International (Devices Work Group)"
* ^caseSensitive = true
// * ^hierarchyMeaning = #grouped-by
* ^content = #complete
* ^property[0].code = #eventOrState
* ^property[=].uri = "http://hl7.org/fhir/uv/phd/CodeSystem/ASN1ToHL7#eventOrState"
* ^property[=].description = "The code type is an event or state"
* ^property[=].type = #code
* ^property[+].code = #source
* ^property[=].uri = "http://hl7.org/fhir/uv/phd/CodeSystem/ASN1ToHL7#source"
* ^property[=].description = "The code originates from a measurement or an attribute that further describes a measurement or the sensor device."
* ^property[=].type = #code
* ^property[+].code = #MDCCode
* ^property[=].uri = "http://hl7.org/fhir/uv/phd/CodeSystem/ASN1ToHL7#MDCCode"
* ^property[=].description = "The decimal code for the MDC code of the bits observation"
* ^property[=].type = #Coding
// values for properties are defined here for FHIR R4, although that is not the best way to do it
* #source "Source" "The source of the bit"
* #eventOrState "Event or State" "Whether the bit represents an event or a state"
* #device "Attribute" "The bit represents a device attribute"
* #measurement "Measurement" "The bit represents a measurement attribute"
* #event "Event" "The bit represents an event"
* #state "State" "The bit represents a state"
* #MDCCode "MDC Code" "The MDC code for the bit"

* insert Bitcode(#67925.0, "onMains", "The device is on mains power", state, device, 67925)
* insert Bitcode(#67925.1, "onBattery", "The device is on Battery power", state, device, 67925)
* insert Bitcode(#67925.8, "chargingFull", "The device battery is charging at maximum rate", event, device, 67925)
* insert Bitcode(#67925.9, "chargingTrickle", "The device battery is charging at a trickle rate", event, device, 67925)
* insert Bitcode(#67925.10, "chargingOff", "The device battery charging is on", state, device, 67925)
* insert Bitcode(#532354.0, "negated-regulation-status", "Device is regulated when *cleared* and unregulated when *set*", state, device, 532354)
* insert Bitcode(#68219.0, "mds-time-capab-real-time-clock", "Real time clock is supported", event, device, 68219)
* insert Bitcode(#68219.1, "mds-time-capab-set-clock", "Support for the PHG to set the time", event, device, 68219)
* insert Bitcode(#68219.2, "mds-time-capab-relative-time", "Relative Time is supported", event, device, 68219)
* insert Bitcode(#68219.3, "mds-time-capab-high-res-relative-time", "Hi-Res Relative Time is supported", event, device, 68219)
* insert Bitcode(#68219.4, "mds-time-capab-sync-abs-time", "Syncing the absolute time is supported", event, device, 68219)
* insert Bitcode(#68219.5, "mds-time-capab-sync-rel-time", "Syncing the relative time is supported", event, device, 68219)
* insert Bitcode(#68219.6, "mds-time-capab-sync-hi-res-relative-time", "Syncing hi-res relative time is supported", event, device, 68219)
* insert Bitcode(#68219.7, "mds-time-capab-bo-time", "The real-time clock supports base offset time", event, device, 68219)
* insert Bitcode(#68219.8, "mds-time-state-abs-time-synced", "The absolute time has been synced", event, device, 68219)
* insert Bitcode(#68219.9, "mds-time-state-rel-time-synced", "The relative time has been synced", event, device, 68219)
* insert Bitcode(#68219.10, "mds-time-state-hi-res-relative-time-synced", "The hi-res time has been synced", event, device, 68219)
* insert Bitcode(#68219.11, "mds-time-mgr-set-time", "PHG Requested to set the time", event, device, 68219)
* insert Bitcode(#68219.12, "mds-time-capab-sync-bo-time", "Syncing base-offset time is supported", event, device, 68219)
* insert Bitcode(#68219.13, "mds-time-state-bo-time-synced", "Base-offset time has been synced", event, device, 68219)
* insert Bitcode(#68219.14, "mds-time-state-bo-time-UTC-aligned", "Base-offset time is aligned with UTC time standard", event, device, 68219)
* insert Bitcode(#68219.15, "mds-time-dst-rules-enabled", "Support for daylight savings time rules", event, device, 68219)
* insert Bitcode(#67846.0, "lim-alert-off", "Both the high and the low limit alerts are disabled", state, measurement, 67846)
* insert Bitcode(#67846.1, "lim-low-off", "The low limit alert is disabled", state, measurement, 67846)
* insert Bitcode(#67846.2, "lim-high-off", "The high limit alert is disabled", state, measurement, 67846)
* insert Bitcode(#150604.0, "sensor-disconnected", "The device is not connected with the sensor", event, measurement, 150604)
* insert Bitcode(#150604.1, "sensor-malfunction", "The sensor has malfunctioned", event, measurement, 150604)
* insert Bitcode(#150604.2, "sensor-displaced", "The sensor is not correctly placed on the user", event, measurement, 150604) 
* insert Bitcode(#150604.3, "sensor-unsupported", "The sensor connected to the device is unsupported", event, measurement, 150604)
* insert Bitcode(#150604.4, "sensor-off", "The sensor is not connected to the user", event, measurement, 150604)
* insert Bitcode(#150604.5, "sensor-interference", "The sensor is experiencing interference", event, measurement, 150604)
* insert Bitcode(#150604.6, "signal-searching", "The sensor is searching for a signal", event, measurement, 150604)
* insert Bitcode(#150604.7, "signal-pulse-questionable", "A questionable pulse has been detected", event, measurement, 150604)
* insert Bitcode(#150604.8, "signal-non-pulsatile", "A non pulsatile signal has been detected", event, measurement, 150604)
* insert Bitcode(#150604.9, "signal-erratic", "A signal has been discovered\, but it is erratic", event, measurement, 150604)
* insert Bitcode(#150604.10, "signal-low-perfusion", "The signal is experiencing low perfusion", event, measurement, 150604)
* insert Bitcode(#150604.11, "signal-poor", "The signal has been discovered\, but it is poor", event, measurement, 150604)
* insert Bitcode(#150604.12, "signal-inadequate", "The signal has been discovered\, but it is inadequate", event, measurement, 150604)
* insert Bitcode(#150604.13, "signal-processing-irregularity", "The signal has been discovered\, but is experiencing processing irregularity", event, measurement, 150604)
* insert Bitcode(#150604.14, "device-equipment-malfunction", "A device malfunction has occurred", event, measurement, 150604)
* insert Bitcode(#150604.15, "device-extended-update", "An extended display update is in progress on device", event, measurement, 150604) 
* insert Bitcode(#150605.0, "pulse-qual-nominal", "No abnormalities have been detected by the sensor", event, measurement, 150605)
* insert Bitcode(#150605.1, "pulse-qual-marginal", "The pulse quality is marginal", event, measurement, 150605)
* insert Bitcode(#150605.2, "pulse-qual-minimal", "The pulse quality is minimal", event, measurement, 150605)
* insert Bitcode(#150605.3, "pulse-qual-unacceptable", "The pulse quality is unacceptable", event, measurement, 150605)
* insert Bitcode(#8410584.0, "leadwire-loss", "Loss of unspecified lead wire or electrode connection", event, measurement, 8410584)
* insert Bitcode(#8410584.1, "leadsignal-loss", "Loss of unspecified lead signal", event, measurement, 8410584)
* insert Bitcode(#8410584.2, "leadwire-loss-first-lead", "Loss of 1st lead wire or electrode connection", event, measurement, 8410584)
* insert Bitcode(#8410584.3, "leadsignal-loss-first-lead", "Loss of 1st lead signal", event, measurement, 8410584)
* insert Bitcode(#8410584.4, "leadwire-loss-second-lead", "Loss of 2nd lead wire or electrode connection", event, measurement, 8410584)
* insert Bitcode(#8410584.5, "leadsignal-loss-second-lead", "Loss of 2nd lead signal", event, measurement, 8410584)
* insert Bitcode(#8410584.6, "leadwire-loss-third-lead", "Loss of 3rd lead wire or electrode connection", event, measurement, 8410584)
* insert Bitcode(#8410584.7, "leadsignal-loss-third-lead", "Loss of 3rd lead signal", event, measurement, 8410584)
* insert Bitcode(#8417752.0, "device-battery-low", "The device battery is low", event, measurement, 8417752)
* insert Bitcode(#8417752.1, "sensor-malfunction", "The sensor has malfunctioned", event, measurement, 8417752)
* insert Bitcode(#8417752.2, "sensor-sample-size-insufficient", "The sensor's sample size is insufficient", event, measurement, 8417752)
* insert Bitcode(#8417752.3, "sensor-strip-insertion", "The test strip was inserted incorrectly", event, measurement, 8417752)
* insert Bitcode(#8417752.4, "sensor-strip-type-incorrect", "The test strip type is incompatible with the sensor", event, measurement, 8417752)
* insert Bitcode(#8417752.5, "sensor-result-too-high", "The value reported by the sensor is too high", event, measurement, 8417752)
* insert Bitcode(#8417752.6, "sensor-result-too-low", "The value reported by the sensor is too low", event, measurement, 8417752)
* insert Bitcode(#8417752.7, "sensor-temp-too-high", "The temperature is too high", event, measurement, 8417752)
* insert Bitcode(#8417752.8, "sensor-temp-too-low", "The temperature is too low", event, measurement, 8417752)
* insert Bitcode(#8417752.9, "sensor-read-interrupt", "The read process was interrupted", event, measurement, 8417752)
* insert Bitcode(#8417752.10, "device-gen-fault", "General Device Fault", event, measurement, 8417752)
* insert Bitcode(#8417752.11, "sensor-temp-out-of-range", "The temperature is out of range", event, measurement, 8417752)
* insert Bitcode(#8417909.0, "inr-device-battery-low", "The INR device battery is low", event, measurement, 8417909)
* insert Bitcode(#8417909.1, "inr-sensor-malfunction", "The INR device sensor has malfunctioned", event, measurement, 8417909)
* insert Bitcode(#8417909.2, "inr-sensor-sample-size-insufficient", "The sample size was insufficient", event, measurement, 8417909)
* insert Bitcode(#8417909.3, "inr-sensor-strip-insertion", "The test script was inserted incorrectly", event, measurement, 8417909)
* insert Bitcode(#8417909.4, "inr-sensor-strip-type-incorrect", "The test strip used is not compatible with the INR", event, measurement, 8417909)
* insert Bitcode(#8417909.5, "inr-sensor-result-too-high", "The test result is too high", event, measurement, 8417909)
* insert Bitcode(#8417909.6, "inr-sensor-result-too-low", "The test result is too low", event, measurement, 8417909)
* insert Bitcode(#8417909.7, "inr-sensor-temp-too-high", "The temperature is too high", event, measurement, 8417909)  
* insert Bitcode(#8417909.8, "inr-sensor-temp-too-low", "The temperature is too low", event, measurement, 8417909)
* insert Bitcode(#8417909.9, "inr-sensor-read-interrupt", "The read process was interrupted", event, measurement, 8417909)
* insert Bitcode(#8417909.10, "inr-device-gen-fault", "General device fault", event, measurement, 8417909)
* insert Bitcode(#8417909.11, "inr-sensor-calibration-due", "The INR sensor calibration is due", event, measurement, 8417909)
* insert Bitcode(#8408608.0, "device-status-undetermined", "Undetermined device status event", event, measurement, 8408608)
* insert Bitcode(#8408608.1, "device-status-reset", "Device reset", event, measurement, 8408608)
* insert Bitcode(#8408608.5, "device-status-error", "Device error", event, measurement, 8408608)
* insert Bitcode(#8408608.6, "device-status-error-mechanical", "Mechanical error", event, measurement, 8408608)
* insert Bitcode(#8408608.7, "device-status-error-electronic", "Electronic error", event, measurement, 8408608)
* insert Bitcode(#8408608.8, "device-status-error-software", "Software error", event, measurement, 8408608)
* insert Bitcode(#8408608.9, "device-status-error-battery", "Battery error", event, measurement, 8408608)
* insert Bitcode(#8408608.15, "device-status-service", "Undetermined device status event\, service needed", event, measurement, 8408608)
* insert Bitcode(#8408608.16, "device-status-service-time-sync-required", "Time sync service required", event, measurement, 8408608)
* insert Bitcode(#8408608.17, "device-status-service-calibration-required", "Calibration required", event, measurement, 8408608)
* insert Bitcode(#8408608.18, "device-status-service-replenishment-required", "Replenishment required", event, measurement, 8408608)
* insert Bitcode(#8408608.25, "device-status-battery-low", "Battery power is too low", event, measurement, 8408608)
* insert Bitcode(#8408608.26, "device-status-battery-depleted", "Battery is depleted", event, measurement, 8408608)
* insert Bitcode(#8408608.27, "device-status-battery-replaced", "Battery has been replaced", event, measurement, 8408608)
* insert Bitcode(#8408608.28, "device-status-battery-interrupted", "Battery was interrupted", event, measurement, 8408608)
* insert Bitcode(#8418060.0, "sensor-session-stopped", "Session stopped", event, measurement, 8418060)
* insert Bitcode(#8418060.2, "sensor-type-incorrect", "Sensor type incorrect for device", event, measurement, 8418060)
* insert Bitcode(#8418060.3, "sensor-malfunction", "The sensor malfunctioned", event, measurement, 8418060)
* insert Bitcode(#8418060.4, "device-specific-alert", "Device specific alert", event, measurement, 8418060)
* insert Bitcode(#8418060.7, "sensor-calibration-not-allowed", "Calibrating the sensor is not allowed", event, measurement, 8418060)
* insert Bitcode(#8418060.8, "sensor-calibration-recommended", "Calibrating the sensor is recommended", event, measurement, 8418060)
* insert Bitcode(#8418060.9, "sensor-calibration-required", "Calibrating the sensor is required", event, measurement, 8418060)
* insert Bitcode(#8418060.10, "sensor-temp-too-high", "Temperature is too high for a valid result", event, measurement, 8418060)
* insert Bitcode(#8418060.11, "sensor-temp-too-low", "Temperature is too low for a valid result", event, measurement, 8418060)
* insert Bitcode(#8418060.12, "sensor-result-below-patient-low", "Sensor result below the Patient Low level", event, measurement, 8418060)
* insert Bitcode(#8418060.13, "sensor-result-above-patient-high", "Sensor result above the Patient High level", event, measurement, 8418060)
* insert Bitcode(#8418060.14, "sensor-low-hypo", "Sensor result below level", event, measurement, 8418060)
* insert Bitcode(#8418060.15, "sensor-high-hyper", "Sensor result above level", event, measurement, 8418060)
* insert Bitcode(#8418060.16, "sensor-rate-decrease-exceeded", "The sensor rate of decrease has been exceeded", event, measurement, 8418060)
* insert Bitcode(#8418060.17, "sensor-rate-increase-exceeded", "The sensor rate of increase has been exceeded", event, measurement, 8418060)
* insert Bitcode(#8418060.18, "sensor-result-too-low", "Sensor result is lower than the device can process", event, measurement, 8418060)
* insert Bitcode(#8418060.19, "sensor-result-too-high", "Sensor result is higher than the device can process", event, measurement, 8418060)
* insert Bitcode(#8418060.20, "sensor-com-out-of-range", "The sensor communication is out of range", event, measurement, 8418060)
* insert Bitcode(#8418512.0, "Battery-status-Undetermined", "The status of the battery is unknown", state, measurement, 8418512)
* insert Bitcode(#8418512.1, "Battery-absent", "The battery is absent", state, measurement, 8418512)
* insert Bitcode(#8418512.2, "Battery-active", "The battery is active in the system", state, measurement, 8418512)
* insert Bitcode(#8418512.3, "Battery-charging", "The battery is charging", state, measurement, 8418512)
* insert Bitcode(#8418512.4, "Battery-fullyCharged", "The battery is fully charged", state, measurement, 8418512)
* insert Bitcode(#8418512.5, "Battery-disposable", "The battery is disposable", state, measurement, 8418512)
* insert Bitcode(#8418512.6, "Battery-rechargeable", "The battery is rechargeable", state, measurement, 8418512)
* insert Bitcode(#8418512.7, "Battery-overTemperature", "The battery is too hot", event, measurement, 8418512)
* insert Bitcode(#8418512.8, "Battery-faulty", "The battery is faulty", event, measurement, 8418512)
* insert Bitcode(#8418512.9, "Battery-incompatible", "The battery is incompatible", event, measurement, 8418512)
* insert Bitcode(#8410608.0, "body-movement", "Too much body movement", event, measurement, 8410608)
* insert Bitcode(#8410608.1, "cuff-too-loose", "The cuff was too loose", event, measurement, 8410608)
* insert Bitcode(#8410608.2, "irregular-pulse", "An irregular pulse was detected", event, measurement, 8410608)
* insert Bitcode(#8410608.3, "pulse-over-range-limit", "The pulse was too high for sensor to work", event, measurement, 8410608)
* insert Bitcode(#8410608.4, "pulse-under-range-limit", "The pulse was too low for sensor to work", event, measurement, 8410608)
* insert Bitcode(#8410608.5, "improper-body-position", "The cuff was incorrectly placed with respect to the heart", event, measurement, 8410608)
