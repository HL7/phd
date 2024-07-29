CodeSystem: ASN1ToHL7
Id: ASN1ToHL7
Title: "ASN1 bits to HL7 enumerated values"
Description: "Maps IEEE 11073 ASN1 BITS measurements to codes. All these codes have two possible values, set or cleared. The code may either represent an event or a state. When an event, the defined event has occurred when set. If a state, the described item is either set or cleared. Sometimes the states may be defined in unexpected manners. For example, the regulation state when set is unregulated and when cleared it is regulated. In addition the code may derive from an IEEE 11073 attribute or from a measurement. More codes maybe added to this list in the future."
* ^meta.profile = "http://hl7.org/fhir/StructureDefinition/shareablecodesystem"
* ^url = "http://hl7.org/fhir/uv/phd/CodeSystem/ASN1ToHL7"
* ^version = "current"
* ^status = #active
* ^experimental = false
* ^publisher = "Health Level Seven International (Health Care Devices Work Group)"
* ^caseSensitive = true
* ^hierarchyMeaning = #grouped-by
* ^content = #complete
* ^property[0].code = #type
* ^property[=].uri = "https://sagroups.ieee.org/11073/TypeIsASN1EventOrState"
* ^property[=].description = "Indicates that the code type is an event or state"
* ^property[=].type = #code
* ^property[+].code = #source
* ^property[=].uri = "https://sagroups.ieee.org/11073/SourceIsMeasurementOrDevice"
* ^property[=].description = "Indicates that the code originates from a measurement or an attribute that further describes a measurement or the sensor device."
* ^property[=].type = #string
* #67925.0 "onMains" "Indicates whether the PHD is on or off mains power"
  * ^property[0].code = #type
  * ^property[=].valueCode = ASN1EventOrState#state
  * ^property[+].code = #source
  * ^property[=].valueString = "attribute"
* #67925.1 "onBattery" "Indicates whether the PHD is on or off Battery power"
  * ^property[0].code = #type
  * ^property[=].valueCode = ASN1EventOrState#state
  * ^property[+].code = #source
  * ^property[=].valueString = "attribute"
* #67925.8 "chargingFull" "Indicates whether the PHD battery is charging at maximum rate"
  * ^property[0].code = #type
  * ^property[=].valueCode = ASN1EventOrState#event
  * ^property[+].code = #source
  * ^property[=].valueString = "attribute"
* #67925.9 "chargingTrickle" "Indicates whether the PHD battery is charging at a trickle rate"
  * ^property[0].code = #type
  * ^property[=].valueCode = ASN1EventOrState#event
  * ^property[+].code = #source
  * ^property[=].valueString = "attribute"
* #67925.10 "chargingOff" "Indicates whether the PHD battery charging is on or off"
  * ^property[0].code = #type
  * ^property[=].valueCode = ASN1EventOrState#state
  * ^property[+].code = #source
  * ^property[=].valueString = "attribute"
* #532354.0 "regulation-status" "Indicates device is regulated when cleared"
  * ^property[0].code = #type
  * ^property[=].valueCode = ASN1EventOrState#state
  * ^property[+].code = #source
  * ^property[=].valueString = "attribute"
* #68219.0 "mds-time-capab-real-time-clock" "Indicates real time clock is supported"
  * ^property[0].code = #type
  * ^property[=].valueCode = ASN1EventOrState#event
  * ^property[+].code = #source
  * ^property[=].valueString = "attribute"
* #68219.1 "mds-time-capab-set-clock" "Indicates support for the PHG to set the time"
  * ^property[0].code = #type
  * ^property[=].valueCode = ASN1EventOrState#event
  * ^property[+].code = #source
  * ^property[=].valueString = "attribute"
* #68219.2 "mds-time-capab-relative-time" "Indicates Relative Time is supported"
  * ^property[0].code = #type
  * ^property[=].valueCode = ASN1EventOrState#event
  * ^property[+].code = #source
  * ^property[=].valueString = "attribute"
* #68219.3 "mds-time-capab-high-res-relative-time" "Indicates Hi-Res Relative Time is supported"
  * ^property[0].code = #type
  * ^property[=].valueCode = ASN1EventOrState#event
  * ^property[+].code = #source
  * ^property[=].valueString = "attribute"
* #68219.4 "mds-time-capab-sync-abs-time" "Indicates that syncing the absolute time is supported"
  * ^property[0].code = #type
  * ^property[=].valueCode = ASN1EventOrState#event
  * ^property[+].code = #source
  * ^property[=].valueString = "attribute"
* #68219.5 "mds-time-capab-sync-rel-time" "Indicates that syncing the relative time is supported"
  * ^property[0].code = #type
  * ^property[=].valueCode = ASN1EventOrState#event
  * ^property[+].code = #source
  * ^property[=].valueString = "attribute"
* #68219.6 "mds-time-capab-sync-hi-res-relative-time" "Indicates that syncing hi-res relative time is supported"
  * ^property[0].code = #type
  * ^property[=].valueCode = ASN1EventOrState#event
  * ^property[+].code = #source
  * ^property[=].valueString = "attribute"
* #68219.7 "mds-time-capab-bo-time" "Indicates that the real-time clock supports base offset time"
  * ^property[0].code = #type
  * ^property[=].valueCode = ASN1EventOrState#event
  * ^property[+].code = #source
  * ^property[=].valueString = "attribute"
* #68219.8 "mds-time-state-abs-time-synced" "Indicates the absolute time has been synced"
  * ^property[0].code = #type
  * ^property[=].valueCode = ASN1EventOrState#event
  * ^property[+].code = #source
  * ^property[=].valueString = "attribute"
* #68219.9 "mds-time-state-rel-time-synced" "Indicates the relative time has been synced"
  * ^property[0].code = #type
  * ^property[=].valueCode = ASN1EventOrState#event
  * ^property[+].code = #source
  * ^property[=].valueString = "attribute"
* #68219.10 "mds-time-state-hi-res-relative-time-synced" "Indicates the hi-res time has been synced"
  * ^property[0].code = #type
  * ^property[=].valueCode = ASN1EventOrState#event
  * ^property[+].code = #source
  * ^property[=].valueString = "attribute"
* #68219.11 "mds-time-mgr-set-time" "PHG Requested to set the time"
  * ^property[0].code = #type
  * ^property[=].valueCode = ASN1EventOrState#event
  * ^property[+].code = #source
  * ^property[=].valueString = "attribute"
* #68219.12 "mds-time-capab-sync-bo-time" "Indicates that syncing base-offset time is supported"
  * ^property[0].code = #type
  * ^property[=].valueCode = ASN1EventOrState#event
  * ^property[+].code = #source
  * ^property[=].valueString = "attribute"
* #68219.13 "mds-time-state-bo-time-synced" "Indicates that base-offset time has been synced"
  * ^property[0].code = #type
  * ^property[=].valueCode = ASN1EventOrState#event
  * ^property[+].code = #source
  * ^property[=].valueString = "attribute"
* #68219.14 "mds-time-state-bo-time-UTC-aligned" "Indicates that base-offset time is aligned with UTC time standard"
  * ^property[0].code = #type
  * ^property[=].valueCode = ASN1EventOrState#event
  * ^property[+].code = #source
  * ^property[=].valueString = "attribute"
* #68219.15 "mds-time-dst-rules-enabled" "Indicates support for daylight savings time rules"
  * ^property[0].code = #type
  * ^property[=].valueCode = ASN1EventOrState#event
  * ^property[+].code = #source
  * ^property[=].valueString = "attribute"
* #67846.0 "lim-alert-off" "Indicates both the high and the low limit alerts are disabled"
  * ^property[0].code = #type
  * ^property[=].valueCode = ASN1EventOrState#state
  * ^property[+].code = #source
  * ^property[=].valueString = "measurement"
* #67846.1 "lim-low-off" "Indicates the low limit alert is disabled"
  * ^property[0].code = #type
  * ^property[=].valueCode = ASN1EventOrState#state
  * ^property[+].code = #source
  * ^property[=].valueString = "measurement"
* #67846.2 "lim-high-off" "Indicates the high limit alert is disabled"
  * ^property[0].code = #type
  * ^property[=].valueCode = ASN1EventOrState#state
  * ^property[+].code = #source
  * ^property[=].valueString = "measurement"
* #150604.0 "sensor-disconnected" "Indicates the device is not connected with the sensor"
  * ^property[0].code = #type
  * ^property[=].valueCode = ASN1EventOrState#event
  * ^property[+].code = #source
  * ^property[=].valueString = "measurement"
* #150604.1 "sensor-malfunction" "Indicates the sensor has malfunctioned"
  * ^property[0].code = #type
  * ^property[=].valueCode = ASN1EventOrState#event
  * ^property[+].code = #source
  * ^property[=].valueString = "measurement"
* #150604.2 "sensor-displaced" "Indicates the sensor is not correctly placed on the user"
  * ^property[0].code = #type
  * ^property[=].valueCode = ASN1EventOrState#event
  * ^property[+].code = #source
  * ^property[=].valueString = "measurement"
* #150604.3 "sensor-unsupported" "Indicates the sensor connected to the device is unsupported"
  * ^property[0].code = #type
  * ^property[=].valueCode = ASN1EventOrState#event
  * ^property[+].code = #source
  * ^property[=].valueString = "measurement"
* #150604.4 "sensor-off" "Indicates the sensor is not connected to the user"
  * ^property[0].code = #type
  * ^property[=].valueCode = ASN1EventOrState#event
  * ^property[+].code = #source
  * ^property[=].valueString = "measurement"
* #150604.5 "sensor-interference" "Indicates the sensor is experiencing interference"
  * ^property[0].code = #type
  * ^property[=].valueCode = ASN1EventOrState#event
  * ^property[+].code = #source
  * ^property[=].valueString = "measurement"
* #150604.6 "signal-searching" "Indicates the sensor is searching for a signal"
  * ^property[0].code = #type
  * ^property[=].valueCode = ASN1EventOrState#event
  * ^property[+].code = #source
  * ^property[=].valueString = "measurement"
* #150604.7 "signal-pulse-questionable" "Indicates a questionable pulse has been detected"
  * ^property[0].code = #type
  * ^property[=].valueCode = ASN1EventOrState#event
  * ^property[+].code = #source
  * ^property[=].valueString = "measurement"
* #150604.8 "signal-non-pulsatile" "Indicates a non pulsatile signal has been detected"
  * ^property[0].code = #type
  * ^property[=].valueCode = ASN1EventOrState#event
  * ^property[+].code = #source
  * ^property[=].valueString = "measurement"
* #150604.9 "signal-erratic" "Indicates a signal has been discovered, but it is erratic"
  * ^property[0].code = #type
  * ^property[=].valueCode = ASN1EventOrState#event
  * ^property[+].code = #source
  * ^property[=].valueString = "measurement"
* #150604.10 "signal-low-perfusion" "Indicates the signal is experiencing low perfusion"
  * ^property[0].code = #type
  * ^property[=].valueCode = ASN1EventOrState#event
  * ^property[+].code = #source
  * ^property[=].valueString = "measurement"
* #150604.11 "signal-poor" "Indicates the signal has been discovered, but it is poor"
  * ^property[0].code = #type
  * ^property[=].valueCode = ASN1EventOrState#event
  * ^property[+].code = #source
  * ^property[=].valueString = "measurement"
* #150604.12 "signal-inadequate" "Indicates the signal has been discovered, but it is inadequate"
  * ^property[0].code = #type
  * ^property[=].valueCode = ASN1EventOrState#event
  * ^property[+].code = #source
  * ^property[=].valueString = "measurement"
* #150604.13 "signal-processing-irregularity" "Indicates the signal has been discovered, but is experiencing processing irregularity"
  * ^property[0].code = #type
  * ^property[=].valueCode = ASN1EventOrState#event
  * ^property[+].code = #source
  * ^property[=].valueString = "measurement"
* #150604.14 "device-equipment-malfunction" "Indicates a device malfunction has occurred"
  * ^property[0].code = #type
  * ^property[=].valueCode = ASN1EventOrState#event
  * ^property[+].code = #source
  * ^property[=].valueString = "measurement"
* #150604.15 "device-extended-update" "Indicates an extended display update is in progress on device"
  * ^property[0].code = #type
  * ^property[=].valueCode = ASN1EventOrState#event
  * ^property[+].code = #source
  * ^property[=].valueString = "measurement"
* #150605.0 "pulse-qual-nominal" "Indicates no abnormalities have been detected by the sensor"
  * ^property[0].code = #type
  * ^property[=].valueCode = ASN1EventOrState#event
  * ^property[+].code = #source
  * ^property[=].valueString = "measurement"
* #150605.1 "pulse-qual-marginal" "Indicates the pulse profusion or quality is marginal"
  * ^property[0].code = #type
  * ^property[=].valueCode = ASN1EventOrState#event
  * ^property[+].code = #source
  * ^property[=].valueString = "measurement"
* #150605.2 "pulse-qual-minimal" "Indicates the pulse profusion or quality is minimal"
  * ^property[0].code = #type
  * ^property[=].valueCode = ASN1EventOrState#event
  * ^property[+].code = #source
  * ^property[=].valueString = "measurement"
* #150605.3 "pulse-qual-unacceptable" "Indicates the pulse profusion or quality is unacceptable"
  * ^property[0].code = #type
  * ^property[=].valueCode = ASN1EventOrState#event
  * ^property[+].code = #source
  * ^property[=].valueString = "measurement"
* #8410584.0 "leadwire-loss" "Loss of unspecified lead wire or electrode connection"
  * ^property[0].code = #type
  * ^property[=].valueCode = ASN1EventOrState#event
  * ^property[+].code = #source
  * ^property[=].valueString = "measurement"
* #8410584.1 "leadsignal-loss" "Loss of unspecified lead signal"
  * ^property[0].code = #type
  * ^property[=].valueCode = ASN1EventOrState#event
  * ^property[+].code = #source
  * ^property[=].valueString = "measurement"
* #8410584.2 "leadwire-loss-first-lead" "Loss of 1st lead wire or electrode connection"
  * ^property[0].code = #type
  * ^property[=].valueCode = ASN1EventOrState#event
  * ^property[+].code = #source
  * ^property[=].valueString = "measurement"
* #8410584.3 "leadsignal-loss-first-lead" "Loss of 1st lead signal"
  * ^property[0].code = #type
  * ^property[=].valueCode = ASN1EventOrState#event
  * ^property[+].code = #source
  * ^property[=].valueString = "measurement"
* #8410584.4 "leadwire-loss-second-lead" "Loss of 2nd lead wire or electrode connection"
  * ^property[0].code = #type
  * ^property[=].valueCode = ASN1EventOrState#event
  * ^property[+].code = #source
  * ^property[=].valueString = "measurement"
* #8410584.5 "leadsignal-loss-second-lead" "Loss of 2nd lead signal"
  * ^property[0].code = #type
  * ^property[=].valueCode = ASN1EventOrState#event
  * ^property[+].code = #source
  * ^property[=].valueString = "measurement"
* #8410584.6 "leadwire-loss-third-lead" "Loss of 3rd lead wire or electrode connection"
  * ^property[0].code = #type
  * ^property[=].valueCode = ASN1EventOrState#event
  * ^property[+].code = #source
  * ^property[=].valueString = "measurement"
* #8410584.7 "leadsignal-loss-third-lead" "Loss of 3rd lead signal"
  * ^property[0].code = #type
  * ^property[=].valueCode = ASN1EventOrState#event
  * ^property[+].code = #source
  * ^property[=].valueString = "measurement"
* #8417752.0 "device-battery-low" "The device battery is low"
  * ^property[0].code = #type
  * ^property[=].valueCode = ASN1EventOrState#event
  * ^property[+].code = #source
  * ^property[=].valueString = "measurement"
* #8417752.1 "sensor-malfunction" "The sensor has malfunctioned"
  * ^property[0].code = #type
  * ^property[=].valueCode = ASN1EventOrState#event
  * ^property[+].code = #source
  * ^property[=].valueString = "measurement"
* #8417752.2 "sensor-sample-size-insufficient" "The sensor's sample size is insufficient"
  * ^property[0].code = #type
  * ^property[=].valueCode = ASN1EventOrState#event
  * ^property[+].code = #source
  * ^property[=].valueString = "measurement"
* #8417752.3 "sensor-strip-insertion" "The test strip was inserted incorrectly"
  * ^property[0].code = #type
  * ^property[=].valueCode = ASN1EventOrState#event
  * ^property[+].code = #source
  * ^property[=].valueString = "measurement"
* #8417752.4 "sensor-strip-type-incorrect" "The test strip type is incompatable with the sensor"
  * ^property[0].code = #type
  * ^property[=].valueCode = ASN1EventOrState#event
  * ^property[+].code = #source
  * ^property[=].valueString = "measurement"
* #8417752.5 "sensor-result-too-high" "The value reported by the sensor is too high"
  * ^property[0].code = #type
  * ^property[=].valueCode = ASN1EventOrState#event
  * ^property[+].code = #source
  * ^property[=].valueString = "measurement"
* #8417752.6 "sensor-result-too-low" "The value reported by the sensor is too low"
  * ^property[0].code = #type
  * ^property[=].valueCode = ASN1EventOrState#event
  * ^property[+].code = #source
  * ^property[=].valueString = "measurement"
* #8417752.7 "sensor-temp-too-high" "The temperature is too high"
  * ^property[0].code = #type
  * ^property[=].valueCode = ASN1EventOrState#event
  * ^property[+].code = #source
  * ^property[=].valueString = "measurement"
* #8417752.8 "sensor-temp-too-low" "The temperature is too low"
  * ^property[0].code = #type
  * ^property[=].valueCode = ASN1EventOrState#event
  * ^property[+].code = #source
  * ^property[=].valueString = "measurement"
* #8417752.9 "sensor-read-interrupt" "The read process was interrupted"
  * ^property[0].code = #type
  * ^property[=].valueCode = ASN1EventOrState#event
  * ^property[+].code = #source
  * ^property[=].valueString = "measurement"
* #8417752.10 "device-gen-fault" "General Device Fault"
  * ^property[0].code = #type
  * ^property[=].valueCode = ASN1EventOrState#event
  * ^property[+].code = #source
  * ^property[=].valueString = "measurement"
* #8417752.11 "sensor-temp-out-of-range" "The temperature is out of range"
  * ^property[0].code = #type
  * ^property[=].valueCode = ASN1EventOrState#event
  * ^property[+].code = #source
  * ^property[=].valueString = "measurement"
* #8417909.0 "inr-device-battery-low" "The INR device battery is low"
  * ^property[0].code = #type
  * ^property[=].valueCode = ASN1EventOrState#event
  * ^property[+].code = #source
  * ^property[=].valueString = "measurement"
* #8417909.1 "inr-sensor-malfunction" "The INR device sensor has malfunctioned"
  * ^property[0].code = #type
  * ^property[=].valueCode = ASN1EventOrState#event
  * ^property[+].code = #source
  * ^property[=].valueString = "measurement"
* #8417909.2 "inr-sensor-sample-size-insufficient" "The sample size was insufficient"
  * ^property[0].code = #type
  * ^property[=].valueCode = ASN1EventOrState#event
  * ^property[+].code = #source
  * ^property[=].valueString = "measurement"
* #8417909.3 "inr-sensor-strip-insertion" "The test script was inserted incorrectly"
  * ^property[0].code = #type
  * ^property[=].valueCode = ASN1EventOrState#event
  * ^property[+].code = #source
  * ^property[=].valueString = "measurement"
* #8417909.4 "inr-sensor-strip-type-incorrect" "The test strip used is not compatible with the INR"
  * ^property[0].code = #type
  * ^property[=].valueCode = ASN1EventOrState#event
  * ^property[+].code = #source
  * ^property[=].valueString = "measurement"
* #8417909.5 "inr-sensor-result-too-high" "The test result is too high"
  * ^property[0].code = #type
  * ^property[=].valueCode = ASN1EventOrState#event
  * ^property[+].code = #source
  * ^property[=].valueString = "measurement"
* #8417909.6 "inr-sensor-result-too-low" "The test result is too low"
  * ^property[0].code = #type
  * ^property[=].valueCode = ASN1EventOrState#event
  * ^property[+].code = #source
  * ^property[=].valueString = "measurement"
* #8417909.7 "inr-sensor-temp-too-high" "The temperature is too high"
  * ^property[0].code = #type
  * ^property[=].valueCode = ASN1EventOrState#event
  * ^property[+].code = #source
  * ^property[=].valueString = "measurement"
* #8417909.8 "inr-sensor-temp-too-low" "The temperature is too low"
  * ^property[0].code = #type
  * ^property[=].valueCode = ASN1EventOrState#event
  * ^property[+].code = #source
  * ^property[=].valueString = "measurement"
* #8417909.9 "inr-sensor-read-interrupt" "The read process was  interrupted"
  * ^property[0].code = #type
  * ^property[=].valueCode = ASN1EventOrState#event
  * ^property[+].code = #source
  * ^property[=].valueString = "measurement"
* #8417909.10 "inr-device-gen-fault" "General device fault"
  * ^property[0].code = #type
  * ^property[=].valueCode = ASN1EventOrState#event
  * ^property[+].code = #source
  * ^property[=].valueString = "measurement"
* #8417909.11 "inr-sensor-calibration-due" "The INR sensor calibration is due"
  * ^property[0].code = #type
  * ^property[=].valueCode = ASN1EventOrState#event
  * ^property[+].code = #source
  * ^property[=].valueString = "measurement"
* #8408608.0 "device-status-undetermined" "Undetermined device status event"
  * ^property[0].code = #type
  * ^property[=].valueCode = ASN1EventOrState#event
  * ^property[+].code = #source
  * ^property[=].valueString = "measurement"
* #8408608.1 "device-status-reset" "Device reset"
  * ^property[0].code = #type
  * ^property[=].valueCode = ASN1EventOrState#event
  * ^property[+].code = #source
  * ^property[=].valueString = "measurement"
* #8408608.5 "device-status-error" "Device error"
  * ^property[0].code = #type
  * ^property[=].valueCode = ASN1EventOrState#event
  * ^property[+].code = #source
  * ^property[=].valueString = "measurement"
* #8408608.6 "device-status-error-mechanical" "Mechanical error"
  * ^property[0].code = #type
  * ^property[=].valueCode = ASN1EventOrState#event
  * ^property[+].code = #source
  * ^property[=].valueString = "measurement"
* #8408608.7 "device-status-error-electronic" "Electronic error"
  * ^property[0].code = #type
  * ^property[=].valueCode = ASN1EventOrState#event
  * ^property[+].code = #source
  * ^property[=].valueString = "measurement"
* #8408608.8 "device-status-error-software" "Software error"
  * ^property[0].code = #type
  * ^property[=].valueCode = ASN1EventOrState#event
  * ^property[+].code = #source
  * ^property[=].valueString = "measurement"
* #8408608.9 "device-status-error-battery" "Battery error"
  * ^property[0].code = #type
  * ^property[=].valueCode = ASN1EventOrState#event
  * ^property[+].code = #source
  * ^property[=].valueString = "measurement"
* #8408608.15 "device-status-service" "Undetermined device status event, service needed"
  * ^property[0].code = #type
  * ^property[=].valueCode = ASN1EventOrState#event
  * ^property[+].code = #source
  * ^property[=].valueString = "measurement"
* #8408608.16 "device-status-service-time-sync-required" "Time sync service required"
  * ^property[0].code = #type
  * ^property[=].valueCode = ASN1EventOrState#event
  * ^property[+].code = #source
  * ^property[=].valueString = "measurement"
* #8408608.17 "device-status-service-calibration-required" "Calibration required"
  * ^property[0].code = #type
  * ^property[=].valueCode = ASN1EventOrState#event
  * ^property[+].code = #source
  * ^property[=].valueString = "measurement"
* #8408608.18 "device-status-service-replenishment-required" "Replenishment required"
  * ^property[0].code = #type
  * ^property[=].valueCode = ASN1EventOrState#event
  * ^property[+].code = #source
  * ^property[=].valueString = "measurement"
* #8408608.25 "device-status-battery-low" "Battery power is too low"
  * ^property[0].code = #type
  * ^property[=].valueCode = ASN1EventOrState#event
  * ^property[+].code = #source
  * ^property[=].valueString = "measurement"
* #8408608.26 "device-status-battery-depleted" "Battery is depleted"
  * ^property[0].code = #type
  * ^property[=].valueCode = ASN1EventOrState#event
  * ^property[+].code = #source
  * ^property[=].valueString = "measurement"
* #8408608.27 "device-status-battery-replaced" "Battery has been replaced"
  * ^property[0].code = #type
  * ^property[=].valueCode = ASN1EventOrState#event
  * ^property[+].code = #source
  * ^property[=].valueString = "measurement"
* #8408608.28 "device-status-battery-interrupted" "Battery was interrupted"
  * ^property[0].code = #type
  * ^property[=].valueCode = ASN1EventOrState#event
  * ^property[+].code = #source
  * ^property[=].valueString = "measurement"
* #8418060.0 "sensor-session-stopped" "Session stopped"
  * ^property[0].code = #type
  * ^property[=].valueCode = ASN1EventOrState#event
  * ^property[+].code = #source
  * ^property[=].valueString = "measurement"
* #8418060.2 "sensor-type-incorrect" "Sensor type incorrect for device"
  * ^property[0].code = #type
  * ^property[=].valueCode = ASN1EventOrState#event
  * ^property[+].code = #source
  * ^property[=].valueString = "measurement"
* #8418060.3 "sensor-malfunction" "The sensor malfunctioned"
  * ^property[0].code = #type
  * ^property[=].valueCode = ASN1EventOrState#event
  * ^property[+].code = #source
  * ^property[=].valueString = "measurement"
* #8418060.4 "device-specific-alert" "Device specific alert"
  * ^property[0].code = #type
  * ^property[=].valueCode = ASN1EventOrState#event
  * ^property[+].code = #source
  * ^property[=].valueString = "measurement"
* #8418060.7 "sensor-calibration-not-allowed" "Calibrating the sensor is not allowed"
  * ^property[0].code = #type
  * ^property[=].valueCode = ASN1EventOrState#event
  * ^property[+].code = #source
  * ^property[=].valueString = "measurement"
* #8418060.8 "sensor-calibration-recommended" "Calibrating the sensor is recommended"
  * ^property[0].code = #type
  * ^property[=].valueCode = ASN1EventOrState#event
  * ^property[+].code = #source
  * ^property[=].valueString = "measurement"
* #8418060.9 "sensor-calibration-required" "Calibrating the sensor is required"
  * ^property[0].code = #type
  * ^property[=].valueCode = ASN1EventOrState#event
  * ^property[+].code = #source
  * ^property[=].valueString = "measurement"
* #8418060.10 "sensor-temp-too-high" "Temperature is too high for a valid result"
  * ^property[0].code = #type
  * ^property[=].valueCode = ASN1EventOrState#event
  * ^property[+].code = #source
  * ^property[=].valueString = "measurement"
* #8418060.11 "sensor-temp-too-low" "Temperature is too low for a valid result"
  * ^property[0].code = #type
  * ^property[=].valueCode = ASN1EventOrState#event
  * ^property[+].code = #source
  * ^property[=].valueString = "measurement"
* #8418060.12 "sensor-result-below-patient-low" "Sensor result below the Patient Low level"
  * ^property[0].code = #type
  * ^property[=].valueCode = ASN1EventOrState#event
  * ^property[+].code = #source
  * ^property[=].valueString = "measurement"
* #8418060.13 "sensor-result-above-patient-high" "Sensor result above the Patient High level"
  * ^property[0].code = #type
  * ^property[=].valueCode = ASN1EventOrState#event
  * ^property[+].code = #source
  * ^property[=].valueString = "measurement"
* #8418060.14 "sensor-low-hypo" "Sensor result below level"
  * ^property[0].code = #type
  * ^property[=].valueCode = ASN1EventOrState#event
  * ^property[+].code = #source
  * ^property[=].valueString = "measurement"
* #8418060.15 "sensor-high-hyper" "Sensor result above level"
  * ^property[0].code = #type
  * ^property[=].valueCode = ASN1EventOrState#event
  * ^property[+].code = #source
  * ^property[=].valueString = "measurement"
* #8418060.16 "sensor-rate-decrease-exceeded" "The sensor rate of decrease has been exceeded"
  * ^property[0].code = #type
  * ^property[=].valueCode = ASN1EventOrState#event
  * ^property[+].code = #source
  * ^property[=].valueString = "measurement"
* #8418060.17 "sensor-rate-increase-exceeded" "The sensor rate of increase has been exceeded"
  * ^property[0].code = #type
  * ^property[=].valueCode = ASN1EventOrState#event
  * ^property[+].code = #source
  * ^property[=].valueString = "measurement"
* #8418060.18 "sensor-result-too-low" "Sensor result is lower than the device can process"
  * ^property[0].code = #type
  * ^property[=].valueCode = ASN1EventOrState#event
  * ^property[+].code = #source
  * ^property[=].valueString = "measurement"
* #8418060.19 "sensor-result-too-high" "Sensor result is higher than the device can process"
  * ^property[0].code = #type
  * ^property[=].valueCode = ASN1EventOrState#event
  * ^property[+].code = #source
  * ^property[=].valueString = "measurement"
* #8418060.20 "sensor-com-out-of-range" "The sensor communication is out of range"
  * ^property[0].code = #type
  * ^property[=].valueCode = ASN1EventOrState#event
  * ^property[+].code = #source
  * ^property[=].valueString = "measurement"
* #8418512.0 "Battery-status-Undetermined" "the status of the battery is unknown"
  * ^property[0].code = #type
  * ^property[=].valueCode = ASN1EventOrState#state
  * ^property[+].code = #source
  * ^property[=].valueString = "measurement"
* #8418512.1 "Battery-absent" "Indicates if the battery is absent"
  * ^property[0].code = #type
  * ^property[=].valueCode = ASN1EventOrState#state
  * ^property[+].code = #source
  * ^property[=].valueString = "measurement"
* #8418512.2 "Battery-active" "Indicates if the battery is active in the system"
  * ^property[0].code = #type
  * ^property[=].valueCode = ASN1EventOrState#state
  * ^property[+].code = #source
  * ^property[=].valueString = "measurement"
* #8418512.3 "Battery-charging" "Indicates if the battery is charging"
  * ^property[0].code = #type
  * ^property[=].valueCode = ASN1EventOrState#state
  * ^property[+].code = #source
  * ^property[=].valueString = "measurement"
* #8418512.4 "Battery-fullyCharged" "Indicates if the battery is fully charged"
  * ^property[0].code = #type
  * ^property[=].valueCode = ASN1EventOrState#state
  * ^property[+].code = #source
  * ^property[=].valueString = "measurement"
* #8418512.5 "Battery-disposable" "Indicates if the battery is disposable"
  * ^property[0].code = #type
  * ^property[=].valueCode = ASN1EventOrState#state
  * ^property[+].code = #source
  * ^property[=].valueString = "measurement"
* #8418512.6 "Battery-rechargeable" "Indicates if battery is rechargable"
  * ^property[0].code = #type
  * ^property[=].valueCode = ASN1EventOrState#state
  * ^property[+].code = #source
  * ^property[=].valueString = "measurement"
* #8418512.8 "Battery-faulty" "Indicates if battery is faulty"
  * ^property[0].code = #type
  * ^property[=].valueCode = ASN1EventOrState#event
  * ^property[+].code = #source
  * ^property[=].valueString = "measurement"
  * #8418512.7 "Battery-overTemperature" "Indicates if the battery is too hot"
    * ^property[0].code = #type
    * ^property[=].valueCode = ASN1EventOrState#event
    * ^property[+].code = #source
    * ^property[=].valueString = "measurement"
* #8418512.9 "Battery-incompatible" "Indicates if battery is incompatible"
  * ^property[0].code = #type
  * ^property[=].valueCode = ASN1EventOrState#event
  * ^property[+].code = #source
  * ^property[=].valueString = "measurement"
* #8410608.0 "body-movement" "Indicates too much body movement"
  * ^property[0].code = #type
  * ^property[=].valueCode = ASN1EventOrState#event
  * ^property[+].code = #source
  * ^property[=].valueString = "measurement"
* #8410608.1 "cuff-too-loose" "Indicates the cuff was too loose"
  * ^property[0].code = #type
  * ^property[=].valueCode = ASN1EventOrState#event
  * ^property[+].code = #source
  * ^property[=].valueString = "measurement"
* #8410608.2 "irregular-pulse" "Indicates an irregular pulse was detected"
  * ^property[0].code = #type
  * ^property[=].valueCode = ASN1EventOrState#event
  * ^property[+].code = #source
  * ^property[=].valueString = "measurement"
* #8410608.3 "pulse-over-range-limit" "Indicates the pulse was too high for sensor to work"
  * ^property[0].code = #type
  * ^property[=].valueCode = ASN1EventOrState#event
  * ^property[+].code = #source
  * ^property[=].valueString = "measurement"
* #8410608.4 "pulse-under-range-limit" "Indicates the pulse was too low for sensor to work"
  * ^property[0].code = #type
  * ^property[=].valueCode = ASN1EventOrState#event
  * ^property[+].code = #source
  * ^property[=].valueString = "measurement"
* #8410608.5 "improper-body-position" "Indicates the cuff was incorrectly placed with respect to the heart"
  * ^property[0].code = #type
  * ^property[=].valueCode = ASN1EventOrState#event
  * ^property[+].code = #source
  * ^property[=].valueString = "measurement"