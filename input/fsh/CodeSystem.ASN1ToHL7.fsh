CodeSystem: ASN1ToHL7
Id: ASN1ToHL7
Title: "ASN1 bits to HL7 enumerated values"
Description: "Codesystem for mapping IEEE 11073 bitstrings to FHIR Codeable Concepts"
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
// * ^property[=].extension = http://hl7.org/fhir/StructureDefinition/codesystem-property-valueset - not supported in R4
// * ^property[=].extension.value = "http://hl7.org/fhir/uv/phd/CodeSystem/ASN1EventOrState" - not supported in R4
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
// MDC codes are refereced using a property of type Coding 
// * #67925 "MDC_ATTR_POWER_STAT" "MDS Power Status Attributes"
// * #532354 "MDC_REG_CERT_DATA_CONTINUA_REG_STATUS" "MDS Regulation Status from the Reg-Cert-Data-List Attribute"
// * #68219 "MDC_TIME_CAP_STATE" "MDS Time capabilities state from the Mds-Time-Info Attribute"
// * #67846 "MDC_ATTR_AL_OP_STAT" "Alert Operational Status Attribute"
// * #150604 "MDC_PULS_OXIM_DEV_STATUS" "Pulse Oximeter Device and Sensor status"
// * #150605 "MDC_PULS_OXIM_PULS_CHAR" "Pulse Oximeter Pulsatile characteristics"
// * #8410584 "MDC_ECG_DEV_STAT" "ECG Device and Sensor status"
// * #8417752 "MDC_GLU_METER_DEV_STATUS" "Glucose Meter Device and Sensor status"
// * #8417909 "MDC_INR_METER_DEV_STATUS" "Coagulation Meter Device and Sensor status"
// * #8408608 "MDC_PHD_DM_DEV_STAT" "Generic Device and Sensor status"
// * #8418060 "MDC_CGM_DEV_STAT" "Continuous Glucose Monitor Device and Sensor status"
// * #8418512 "MDC_BATTERY_STATUS" "Battery Status"
// * #8410608 "MDC_BLOOD_PRESSURE_MEASUREMENT_STATUS" "Blood Pressure Measurement Status"
* #67925.0 "onMains" "The device is on mains power"
  * ^property[0].code = #eventOrState
  * ^property[=].valueCode = #state
  * ^property[+].code = #source
  * ^property[=].valueCode = #device
  * ^property[+].code = #MDCCode
  * ^property[=].valueCoding = Mdc#67925
* #67925.1 "onBattery" "The device is on Battery power"
  * ^property[0].code = #eventOrState
  * ^property[=].valueCode = #state
  * ^property[+].code = #source
  * ^property[=].valueCode = #device
  * ^property[+].code = #MDCCode
  * ^property[=].valueCoding = Mdc#67925
* #67925.8 "chargingFull" "The device battery is charging at maximum rate"
  * ^property[0].code = #eventOrState
  * ^property[=].valueCode = #event
  * ^property[+].code = #source
  * ^property[=].valueCode = #device
  * ^property[+].code = #MDCCode
  * ^property[=].valueCoding = Mdc#67925
* #67925.9 "chargingTrickle" "The device battery is charging at a trickle rate"
  * ^property[0].code = #eventOrState
  * ^property[=].valueCode = #event
  * ^property[+].code = #source
  * ^property[=].valueCode = #device
  * ^property[+].code = #MDCCode
  * ^property[=].valueCoding = Mdc#67925
* #67925.10 "chargingOff" "The device battery charging is on"
  * ^property[0].code = #eventOrState
  * ^property[=].valueCode = #state
  * ^property[+].code = #source
  * ^property[=].valueCode = #device
  * ^property[+].code = #MDCCode
  * ^property[=].valueCoding = Mdc#67925
* #532354.0 "negated-regulation-status" "Device is regulated when *cleared* and unregulated when *set*"
  * ^property[0].code = #eventOrState
  * ^property[=].valueCode = #state
  * ^property[+].code = #source
  * ^property[=].valueCode = #device
  * ^property[+].code = #MDCCode
  * ^property[=].valueCoding = Mdc#532354
* #68219.0 "mds-time-capab-real-time-clock" "Real time clock is supported"
  * ^property[0].code = #eventOrState
  * ^property[=].valueCode = #event
  * ^property[+].code = #source
  * ^property[=].valueCode = #device
  * ^property[+].code = #MDCCode
  * ^property[=].valueCoding = Mdc#68219
* #68219.1 "mds-time-capab-set-clock"
 "Support for the PHG to set the time"
  * ^property[0].code = #eventOrState
  * ^property[=].valueCode = #event
  * ^property[+].code = #source
  * ^property[=].valueCode = #device
  * ^property[+].code = #MDCCode
  * ^property[=].valueCoding = Mdc#68219
* #68219.2 "mds-time-capab-relative-time" "Relative Time is supported"
  * ^property[0].code = #eventOrState
  * ^property[=].valueCode = #event
  * ^property[+].code = #source
  * ^property[=].valueCode = #device
  * ^property[+].code = #MDCCode
  * ^property[=].valueCoding = Mdc#68219
* #68219.3 "mds-time-capab-high-res-relative-time" "Hi-Res Relative Time is supported"
  * ^property[0].code = #eventOrState
  * ^property[=].valueCode = #event
  * ^property[+].code = #source
  * ^property[=].valueCode = #device
  * ^property[+].code = #MDCCode
  * ^property[=].valueCoding = Mdc#68219
* #68219.4 "mds-time-capab-sync-abs-time" "Syncing the absolute time is supported"
  * ^property[0].code = #eventOrState
  * ^property[=].valueCode = #event
  * ^property[+].code = #source
  * ^property[=].valueCode = #device
  * ^property[+].code = #MDCCode
  * ^property[=].valueCoding = Mdc#68219
* #68219.5 "mds-time-capab-sync-rel-time" "Syncing the relative time is supported"
  * ^property[0].code = #eventOrState
  * ^property[=].valueCode = #event
  * ^property[+].code = #source
  * ^property[=].valueCode = #device
  * ^property[+].code = #MDCCode
  * ^property[=].valueCoding = Mdc#68219
* #68219.6 "mds-time-capab-sync-hi-res-relative-time" "Syncing hi-res relative time is supported"
  * ^property[0].code = #eventOrState
  * ^property[=].valueCode = #event
  * ^property[+].code = #source
  * ^property[=].valueCode = #device
  * ^property[+].code = #MDCCode
  * ^property[=].valueCoding = Mdc#68219
* #68219.7 "mds-time-capab-bo-time" "The real-time clock supports base offset time"
  * ^property[0].code = #eventOrState
  * ^property[=].valueCode = #event
  * ^property[+].code = #source
  * ^property[=].valueCode = #device
  * ^property[+].code = #MDCCode
  * ^property[=].valueCoding = Mdc#68219
* #68219.8 "mds-time-state-abs-time-synced" "The absolute time has been synced"
  * ^property[0].code = #eventOrState
  * ^property[=].valueCode = #event
  * ^property[+].code = #source
  * ^property[=].valueCode = #device
  * ^property[+].code = #MDCCode
  * ^property[=].valueCoding = Mdc#68219
* #68219.9 "mds-time-state-rel-time-synced" "The relative time has been synced"
  * ^property[0].code = #eventOrState
  * ^property[=].valueCode = #event
  * ^property[+].code = #source
  * ^property[=].valueCode = #device
  * ^property[+].code = #MDCCode
  * ^property[=].valueCoding = Mdc#68219
* #68219.10 "mds-time-state-hi-res-relative-time-synced" "The hi-res time has been synced"
  * ^property[0].code = #eventOrState
  * ^property[=].valueCode = #event
  * ^property[+].code = #source
  * ^property[=].valueCode = #device
  * ^property[+].code = #MDCCode
  * ^property[=].valueCoding = Mdc#68219
* #68219.11 "mds-time-mgr-set-time" "PHG Requested to set the time"
  * ^property[0].code = #eventOrState
  * ^property[=].valueCode = #event
  * ^property[+].code = #source
  * ^property[=].valueCode = #device
  * ^property[+].code = #MDCCode
  * ^property[=].valueCoding = Mdc#68219
* #68219.12 "mds-time-capab-sync-bo-time" "Syncing base-offset time is supported"
  * ^property[0].code = #eventOrState
  * ^property[=].valueCode = #event
  * ^property[+].code = #source
  * ^property[=].valueCode = #device
  * ^property[+].code = #MDCCode
  * ^property[=].valueCoding = Mdc#68219
* #68219.13 "mds-time-state-bo-time-synced" "Base-offset time has been synced"
  * ^property[0].code = #eventOrState
  * ^property[=].valueCode = #event
  * ^property[+].code = #source
  * ^property[=].valueCode = #device
  * ^property[+].code = #MDCCode
  * ^property[=].valueCoding = Mdc#68219
* #68219.14 "mds-time-state-bo-time-UTC-aligned" "Base-offset time is aligned with UTC time standard"
  * ^property[0].code = #eventOrState
  * ^property[=].valueCode = #event
  * ^property[+].code = #source
  * ^property[=].valueCode = #device
  * ^property[+].code = #MDCCode
  * ^property[=].valueCoding = Mdc#68219
* #68219.15 "mds-time-dst-rules-enabled" "Support for daylight savings time rules"
  * ^property[0].code = #eventOrState
  * ^property[=].valueCode = #event
  * ^property[+].code = #source
  * ^property[=].valueCode = #device
  * ^property[+].code = #MDCCode
  * ^property[=].valueCoding = Mdc#68219
* #67846.0 "lim-alert-off" "Both the high and the low limit alerts are disabled"
  * ^property[0].code = #eventOrState
  * ^property[=].valueCode = #state
  * ^property[+].code = #source
  * ^property[=].valueCode = #measurement
  * ^property[+].code = #MDCCode
  * ^property[=].valueCoding = Mdc#67846
* #67846.1 "lim-low-off" "The low limit alert is disabled"
  * ^property[0].code = #eventOrState
  * ^property[=].valueCode = #state
  * ^property[+].code = #source
  * ^property[=].valueCode = #measurement
  * ^property[+].code = #MDCCode
  * ^property[=].valueCoding = Mdc#67846
* #67846.2 "lim-high-off" "The high limit alert is disabled"
  * ^property[0].code = #eventOrState
  * ^property[=].valueCode = #state
  * ^property[+].code = #source
  * ^property[=].valueCode = #measurement
  * ^property[+].code = #MDCCode
  * ^property[=].valueCoding = Mdc#67846
* #150604.0 "sensor-disconnected" "The device is not connected with the sensor"
  * ^property[0].code = #eventOrState
  * ^property[=].valueCode = #event
  * ^property[+].code = #source
  * ^property[=].valueCode = #measurement
  * ^property[+].code = #MDCCode
  * ^property[=].valueCoding = Mdc#150604
* #150604.1 "sensor-malfunction" "The sensor has malfunctioned"
  * ^property[0].code = #eventOrState
  * ^property[=].valueCode = #event
  * ^property[+].code = #source
  * ^property[=].valueCode = #measurement
  * ^property[+].code = #MDCCode
  * ^property[=].valueCoding = Mdc#150604
* #150604.2 "sensor-displaced" "The sensor is not correctly placed on the user"
  * ^property[0].code = #eventOrState
  * ^property[=].valueCode = #event
  * ^property[+].code = #source
  * ^property[=].valueCode = #measurement
  * ^property[+].code = #MDCCode
  * ^property[=].valueCoding = Mdc#150604
* #150604.3 "sensor-unsupported" "The sensor connected to the device is unsupported"
  * ^property[0].code = #eventOrState
  * ^property[=].valueCode = #event
  * ^property[+].code = #source
  * ^property[=].valueCode = #measurement
  * ^property[+].code = #MDCCode
  * ^property[=].valueCoding = Mdc#150604
* #150604.4 "sensor-off" "The sensor is not connected to the user"
  * ^property[0].code = #eventOrState
  * ^property[=].valueCode = #event
  * ^property[+].code = #source
  * ^property[=].valueCode = #measurement
  * ^property[+].code = #MDCCode
  * ^property[=].valueCoding = Mdc#150604
* #150604.5 "sensor-interference" "The sensor is experiencing interference"
  * ^property[0].code = #eventOrState
  * ^property[=].valueCode = #event
  * ^property[+].code = #source
  * ^property[=].valueCode = #measurement
  * ^property[+].code = #MDCCode
  * ^property[=].valueCoding = Mdc#150604
* #150604.6 "signal-searching" "The sensor is searching for a signal"
  * ^property[0].code = #eventOrState
  * ^property[=].valueCode = #event
  * ^property[+].code = #source
  * ^property[=].valueCode = #measurement
  * ^property[+].code = #MDCCode
  * ^property[=].valueCoding = Mdc#150604
* #150604.7 "signal-pulse-questionable" "A questionable pulse has been detected"
  * ^property[0].code = #eventOrState
  * ^property[=].valueCode = #event
  * ^property[+].code = #source
  * ^property[=].valueCode = #measurement
  * ^property[+].code = #MDCCode
  * ^property[=].valueCoding = Mdc#150604
* #150604.8 "signal-non-pulsatile" "A non pulsatile signal has been detected"
  * ^property[0].code = #eventOrState
  * ^property[=].valueCode = #event
  * ^property[+].code = #source
  * ^property[=].valueCode = #measurement
  * ^property[+].code = #MDCCode
  * ^property[=].valueCoding = Mdc#150604
* #150604.9 "signal-erratic" "A signal has been discovered, but it is erratic"
  * ^property[0].code = #eventOrState
  * ^property[=].valueCode = #event
  * ^property[+].code = #source
  * ^property[=].valueCode = #measurement
  * ^property[+].code = #MDCCode
  * ^property[=].valueCoding = Mdc#150604
* #150604.10 "signal-low-perfusion" "The signal is experiencing low perfusion"
  * ^property[0].code = #eventOrState
  * ^property[=].valueCode = #event
  * ^property[+].code = #source
  * ^property[=].valueCode = #measurement
  * ^property[+].code = #MDCCode
  * ^property[=].valueCoding = Mdc#150604
* #150604.11 "signal-poor" "The signal has been discovered, but it is poor"
  * ^property[0].code = #eventOrState
  * ^property[=].valueCode = #event
  * ^property[+].code = #source
  * ^property[=].valueCode = #measurement
  * ^property[+].code = #MDCCode
  * ^property[=].valueCoding = Mdc#150604
* #150604.12 "signal-inadequate" "The signal has been discovered, but it is inadequate"
  * ^property[0].code = #eventOrState
  * ^property[=].valueCode = #event
  * ^property[+].code = #source
  * ^property[=].valueCode = #measurement
  * ^property[+].code = #MDCCode
  * ^property[=].valueCoding = Mdc#150604
* #150604.13 "signal-processing-irregularity" "The signal has been discovered, but is experiencing processing irregularity"
  * ^property[0].code = #eventOrState
  * ^property[=].valueCode = #event
  * ^property[+].code = #source
  * ^property[=].valueCode = #measurement
  * ^property[+].code = #MDCCode
  * ^property[=].valueCoding = Mdc#150604
* #150604.14 "device-equipment-malfunction" "A device malfunction has occurred"
  * ^property[0].code = #eventOrState
  * ^property[=].valueCode = #event
  * ^property[+].code = #source
  * ^property[=].valueCode = #measurement
  * ^property[+].code = #MDCCode
  * ^property[=].valueCoding = Mdc#150604
* #150604.15 "device-extended-update" "An extended display update is in progress on device"
  * ^property[0].code = #eventOrState
  * ^property[=].valueCode = #event
  * ^property[+].code = #source
  * ^property[=].valueCode = #measurement
  * ^property[+].code = #MDCCode
  * ^property[=].valueCoding = Mdc#150604
* #150605.0 "pulse-qual-nominal" "No abnormalities have been detected by the sensor"
  * ^property[0].code = #eventOrState
  * ^property[=].valueCode = #event
  * ^property[+].code = #source
  * ^property[=].valueCode = #measurement
  * ^property[+].code = #MDCCode
  * ^property[=].valueCoding = Mdc#150605
* #150605.1 "pulse-qual-marginal" "The pulse quality is marginal"
  * ^property[0].code = #eventOrState
  * ^property[=].valueCode = #event
  * ^property[+].code = #source
  * ^property[=].valueCode = #measurement
  * ^property[+].code = #MDCCode
  * ^property[=].valueCoding = Mdc#150605
* #150605.2 "pulse-qual-minimal" "The pulse quality is minimal"
  * ^property[0].code = #eventOrState
  * ^property[=].valueCode = #event
  * ^property[+].code = #source
  * ^property[=].valueCode = #measurement
  * ^property[+].code = #MDCCode
  * ^property[=].valueCoding = Mdc#150605
* #150605.3 "pulse-qual-unacceptable" "The pulse quality is unacceptable"
  * ^property[0].code = #eventOrState
  * ^property[=].valueCode = #event
  * ^property[+].code = #source
  * ^property[=].valueCode = #measurement
  * ^property[+].code = #MDCCode
  * ^property[=].valueCoding = Mdc#150605
* #8410584.0 "leadwire-loss" "Loss of unspecified lead wire or electrode connection"
  * ^property[0].code = #eventOrState
  * ^property[=].valueCode = #event
  * ^property[+].code = #source
  * ^property[=].valueCode = #measurement
  * ^property[+].code = #MDCCode
  * ^property[=].valueCoding = Mdc#8410584
* #8410584.1 "leadsignal-loss" "Loss of unspecified lead signal"
  * ^property[0].code = #eventOrState
  * ^property[=].valueCode = #event
  * ^property[+].code = #source
  * ^property[=].valueCode = #measurement
  * ^property[+].code = #MDCCode
  * ^property[=].valueCoding = Mdc#8410584
* #8410584.2 "leadwire-loss-first-lead" "Loss of 1st lead wire or electrode connection"
  * ^property[0].code = #eventOrState
  * ^property[=].valueCode = #event
  * ^property[+].code = #source
  * ^property[=].valueCode = #measurement
  * ^property[+].code = #MDCCode
  * ^property[=].valueCoding = Mdc#8410584
* #8410584.3 "leadsignal-loss-first-lead" "Loss of 1st lead signal"
  * ^property[0].code = #eventOrState
  * ^property[=].valueCode = #event
  * ^property[+].code = #source
  * ^property[=].valueCode = #measurement
  * ^property[+].code = #MDCCode
  * ^property[=].valueCoding = Mdc#8410584
* #8410584.4 "leadwire-loss-second-lead" "Loss of 2nd lead wire or electrode connection"
  * ^property[0].code = #eventOrState
  * ^property[=].valueCode = #event
  * ^property[+].code = #source
  * ^property[=].valueCode = #measurement
  * ^property[+].code = #MDCCode
  * ^property[=].valueCoding = Mdc#8410584
* #8410584.5 "leadsignal-loss-second-lead" "Loss of 2nd lead signal"
  * ^property[0].code = #eventOrState
  * ^property[=].valueCode = #event
  * ^property[+].code = #source
  * ^property[=].valueCode = #measurement
  * ^property[+].code = #MDCCode
  * ^property[=].valueCoding = Mdc#8410584
* #8410584.6 "leadwire-loss-third-lead" "Loss of 3rd lead wire or electrode connection"
  * ^property[0].code = #eventOrState
  * ^property[=].valueCode = #event
  * ^property[+].code = #source
  * ^property[=].valueCode = #measurement
  * ^property[+].code = #MDCCode
  * ^property[=].valueCoding = Mdc#8410584
* #8410584.7 "leadsignal-loss-third-lead" "Loss of 3rd lead signal"
  * ^property[0].code = #eventOrState
  * ^property[=].valueCode = #event
  * ^property[+].code = #source
  * ^property[=].valueCode = #measurement
  * ^property[+].code = #MDCCode
  * ^property[=].valueCoding = Mdc#8410584
* #8417752.0 "device-battery-low" "The device battery is low"
  * ^property[0].code = #eventOrState
  * ^property[=].valueCode = #event
  * ^property[+].code = #source
  * ^property[=].valueCode = #measurement
  * ^property[+].code = #MDCCode
  * ^property[=].valueCoding = Mdc#8417752
* #8417752.1 "sensor-malfunction" "The sensor has malfunctioned"
  * ^property[0].code = #eventOrState
  * ^property[=].valueCode = #event
  * ^property[+].code = #source
  * ^property[=].valueCode = #measurement
  * ^property[+].code = #MDCCode
  * ^property[=].valueCoding = Mdc#8417752
* #8417752.2 "sensor-sample-size-insufficient" "The sensor's sample size is insufficient"
  * ^property[0].code = #eventOrState
  * ^property[=].valueCode = #event
  * ^property[+].code = #source
  * ^property[=].valueCode = #measurement
  * ^property[+].code = #MDCCode
  * ^property[=].valueCoding = Mdc#8417752
* #8417752.3 "sensor-strip-insertion" "The test strip was inserted incorrectly"
  * ^property[0].code = #eventOrState
  * ^property[=].valueCode = #event
  * ^property[+].code = #source
  * ^property[=].valueCode = #measurement
  * ^property[+].code = #MDCCode
  * ^property[=].valueCoding = Mdc#8417752
* #8417752.4 "sensor-strip-type-incorrect" "The test strip type is incompatable with the sensor"
  * ^property[0].code = #eventOrState
  * ^property[=].valueCode = #event
  * ^property[+].code = #source
  * ^property[=].valueCode = #measurement
  * ^property[+].code = #MDCCode
  * ^property[=].valueCoding = Mdc#8417752
* #8417752.5 "sensor-result-too-high" "The value reported by the sensor is too high"
  * ^property[0].code = #eventOrState
  * ^property[=].valueCode = #event
  * ^property[+].code = #source
  * ^property[=].valueCode = #measurement
  * ^property[+].code = #MDCCode
  * ^property[=].valueCoding = Mdc#8417752
* #8417752.6 "sensor-result-too-low" "The value reported by the sensor is too low"
  * ^property[0].code = #eventOrState
  * ^property[=].valueCode = #event
  * ^property[+].code = #source
  * ^property[=].valueCode = #measurement
  * ^property[+].code = #MDCCode
  * ^property[=].valueCoding = Mdc#8417752
* #8417752.7 "sensor-temp-too-high" "The temperature is too high"
  * ^property[0].code = #eventOrState
  * ^property[=].valueCode = #event
  * ^property[+].code = #source
  * ^property[=].valueCode = #measurement
  * ^property[+].code = #MDCCode
  * ^property[=].valueCoding = Mdc#8417752
* #8417752.8 "sensor-temp-too-low" "The temperature is too low"
  * ^property[0].code = #eventOrState
  * ^property[=].valueCode = #event
  * ^property[+].code = #source
  * ^property[=].valueCode = #measurement
  * ^property[+].code = #MDCCode
  * ^property[=].valueCoding = Mdc#8417752
* #8417752.9 "sensor-read-interrupt" "The read process was interrupted"
  * ^property[0].code = #eventOrState
  * ^property[=].valueCode = #event
  * ^property[+].code = #source
  * ^property[=].valueCode = #measurement
  * ^property[+].code = #MDCCode
  * ^property[=].valueCoding = Mdc#8417752
* #8417752.10 "device-gen-fault" "General Device Fault"
  * ^property[0].code = #eventOrState
  * ^property[=].valueCode = #event
  * ^property[+].code = #source
  * ^property[=].valueCode = #measurement
  * ^property[+].code = #MDCCode
  * ^property[=].valueCoding = Mdc#8417752
* #8417752.11 "sensor-temp-out-of-range" "The temperature is out of range"
  * ^property[0].code = #eventOrState
  * ^property[=].valueCode = #event
  * ^property[+].code = #source
  * ^property[=].valueCode = #measurement
  * ^property[+].code = #MDCCode
  * ^property[=].valueCoding = Mdc#8417752
* #8417909.0 "inr-device-battery-low" "The INR device battery is low"
  * ^property[0].code = #eventOrState
  * ^property[=].valueCode = #event
  * ^property[+].code = #source
  * ^property[=].valueCode = #measurement
  * ^property[+].code = #MDCCode
  * ^property[=].valueCoding = Mdc#8417909
* #8417909.1 "inr-sensor-malfunction" "The INR device sensor has malfunctioned"
  * ^property[0].code = #eventOrState
  * ^property[=].valueCode = #event
  * ^property[+].code = #source
  * ^property[=].valueCode = #measurement
  * ^property[+].code = #MDCCode
  * ^property[=].valueCoding = Mdc#8417909
* #8417909.2 "inr-sensor-sample-size-insufficient" "The sample size was insufficient"
  * ^property[0].code = #eventOrState
  * ^property[=].valueCode = #event
  * ^property[+].code = #source
  * ^property[=].valueCode = #measurement
  * ^property[+].code = #MDCCode
  * ^property[=].valueCoding = Mdc#8417909
* #8417909.3 "inr-sensor-strip-insertion" "The test script was inserted incorrectly"
  * ^property[0].code = #eventOrState
  * ^property[=].valueCode = #event
  * ^property[+].code = #source
  * ^property[=].valueCode = #measurement
  * ^property[+].code = #MDCCode
  * ^property[=].valueCoding = Mdc#8417909
* #8417909.4 "inr-sensor-strip-type-incorrect" "The test strip used is not compatible with the INR"
  * ^property[0].code = #eventOrState
  * ^property[=].valueCode = #event
  * ^property[+].code = #source
  * ^property[=].valueCode = #measurement
  * ^property[+].code = #MDCCode
  * ^property[=].valueCoding = Mdc#8417909
* #8417909.5 "inr-sensor-result-too-high" "The test result is too high"
  * ^property[0].code = #eventOrState
  * ^property[=].valueCode = #event
  * ^property[+].code = #source
  * ^property[=].valueCode = #measurement
  * ^property[+].code = #MDCCode
  * ^property[=].valueCoding = Mdc#8417909
* #8417909.6 "inr-sensor-result-too-low" "The test result is too low"
  * ^property[0].code = #eventOrState
  * ^property[=].valueCode = #event
  * ^property[+].code = #source
  * ^property[=].valueCode = #measurement
  * ^property[+].code = #MDCCode
  * ^property[=].valueCoding = Mdc#8417909
* #8417909.7 "inr-sensor-temp-too-high" "The temperature is too high"
  * ^property[0].code = #eventOrState
  * ^property[=].valueCode = #event
  * ^property[+].code = #source
  * ^property[=].valueCode = #measurement
  * ^property[+].code = #MDCCode
  * ^property[=].valueCoding = Mdc#8417909
* #8417909.8 "inr-sensor-temp-too-low" "The temperature is too low"
  * ^property[0].code = #eventOrState
  * ^property[=].valueCode = #event
  * ^property[+].code = #source
  * ^property[=].valueCode = #measurement
  * ^property[+].code = #MDCCode
  * ^property[=].valueCoding = Mdc#8417909
* #8417909.9 "inr-sensor-read-interrupt" "The read process was interrupted"
  * ^property[0].code = #eventOrState
  * ^property[=].valueCode = #event
  * ^property[+].code = #source
  * ^property[=].valueCode = #measurement
  * ^property[+].code = #MDCCode
  * ^property[=].valueCoding = Mdc#8417909
* #8417909.10 "inr-device-gen-fault" "General device fault"
  * ^property[0].code = #eventOrState
  * ^property[=].valueCode = #event
  * ^property[+].code = #source
  * ^property[=].valueCode = #measurement
  * ^property[+].code = #MDCCode
  * ^property[=].valueCoding = Mdc#8417909
* #8417909.11 "inr-sensor-calibration-due" "The INR sensor calibration is due"
  * ^property[0].code = #eventOrState
  * ^property[=].valueCode = #event
  * ^property[+].code = #source
  * ^property[=].valueCode = #measurement
  * ^property[+].code = #MDCCode
  * ^property[=].valueCoding = Mdc#8417909
* #8408608.0 "device-status-undetermined" "Undetermined device status event"
  * ^property[0].code = #eventOrState
  * ^property[=].valueCode = #event
  * ^property[+].code = #source
  * ^property[=].valueCode = #measurement
  * ^property[+].code = #MDCCode
  * ^property[=].valueCoding = Mdc#8408608
* #8408608.1 "device-status-reset" "Device reset"
  * ^property[0].code = #eventOrState
  * ^property[=].valueCode = #event
  * ^property[+].code = #source
  * ^property[=].valueCode = #measurement
  * ^property[+].code = #MDCCode
  * ^property[=].valueCoding = Mdc#8408608
* #8408608.5 "device-status-error" "Device error"
  * ^property[0].code = #eventOrState
  * ^property[=].valueCode = #event
  * ^property[+].code = #source
  * ^property[=].valueCode = #measurement
  * ^property[+].code = #MDCCode
  * ^property[=].valueCoding = Mdc#8408608
* #8408608.6 "device-status-error-mechanical" "Mechanical error"
  * ^property[0].code = #eventOrState
  * ^property[=].valueCode = #event
  * ^property[+].code = #source
  * ^property[=].valueCode = #measurement
  * ^property[+].code = #MDCCode
  * ^property[=].valueCoding = Mdc#8408608
* #8408608.7 "device-status-error-electronic" "Electronic error"
  * ^property[0].code = #eventOrState
  * ^property[=].valueCode = #event
  * ^property[+].code = #source
  * ^property[=].valueCode = #measurement
  * ^property[+].code = #MDCCode
  * ^property[=].valueCoding = Mdc#8408608
* #8408608.8 "device-status-error-software" "Software error"
  * ^property[0].code = #eventOrState
  * ^property[=].valueCode = #event
  * ^property[+].code = #source
  * ^property[=].valueCode = #measurement
  * ^property[+].code = #MDCCode
  * ^property[=].valueCoding = Mdc#8408608
* #8408608.9 "device-status-error-battery" "Battery error"
  * ^property[0].code = #eventOrState
  * ^property[=].valueCode = #event
  * ^property[+].code = #source
  * ^property[=].valueCode = #measurement
  * ^property[+].code = #MDCCode
  * ^property[=].valueCoding = Mdc#8408608
* #8408608.15 "device-status-service" "Undetermined device status event, service needed"
  * ^property[0].code = #eventOrState
  * ^property[=].valueCode = #event
  * ^property[+].code = #source
  * ^property[=].valueCode = #measurement
  * ^property[+].code = #MDCCode
  * ^property[=].valueCoding = Mdc#8408608
* #8408608.16 "device-status-service-time-sync-required" "Time sync service required"
  * ^property[0].code = #eventOrState
  * ^property[=].valueCode = #event
  * ^property[+].code = #source
  * ^property[=].valueCode = #measurement
  * ^property[+].code = #MDCCode
  * ^property[=].valueCoding = Mdc#8408608
* #8408608.17 "device-status-service-calibration-required" "Calibration required"
  * ^property[0].code = #eventOrState
  * ^property[=].valueCode = #event
  * ^property[+].code = #source
  * ^property[=].valueCode = #measurement
  * ^property[+].code = #MDCCode
  * ^property[=].valueCoding = Mdc#8408608
* #8408608.18 "device-status-service-replenishment-required" "Replenishment required"
  * ^property[0].code = #eventOrState
  * ^property[=].valueCode = #event
  * ^property[+].code = #source
  * ^property[=].valueCode = #measurement
  * ^property[+].code = #MDCCode
  * ^property[=].valueCoding = Mdc#8408608
* #8408608.25 "device-status-battery-low" "Battery power is too low"
  * ^property[0].code = #eventOrState
  * ^property[=].valueCode = #event
  * ^property[+].code = #source
  * ^property[=].valueCode = #measurement
  * ^property[+].code = #MDCCode
  * ^property[=].valueCoding = Mdc#8408608
* #8408608.26 "device-status-battery-depleted" "Battery is depleted"
  * ^property[0].code = #eventOrState
  * ^property[=].valueCode = #event
  * ^property[+].code = #source
  * ^property[=].valueCode = #measurement
  * ^property[+].code = #MDCCode
  * ^property[=].valueCoding = Mdc#8408608
* #8408608.27 "device-status-battery-replaced" "Battery has been replaced"
  * ^property[0].code = #eventOrState
  * ^property[=].valueCode = #event
  * ^property[+].code = #source
  * ^property[=].valueCode = #measurement
  * ^property[+].code = #MDCCode
  * ^property[=].valueCoding = Mdc#8408608
* #8408608.28 "device-status-battery-interrupted" "Battery was interrupted"
  * ^property[0].code = #eventOrState
  * ^property[=].valueCode = #event
  * ^property[+].code = #source
  * ^property[=].valueCode = #measurement
  * ^property[+].code = #MDCCode
  * ^property[=].valueCoding = Mdc#8408608
* #8418060.0 "sensor-session-stopped" "Session stopped"
  * ^property[0].code = #eventOrState
  * ^property[=].valueCode = #event
  * ^property[+].code = #source
  * ^property[=].valueCode = #measurement
  * ^property[+].code = #MDCCode
  * ^property[=].valueCoding = Mdc#8418060
* #8418060.2 "sensor-type-incorrect" "Sensor type incorrect for device"
  * ^property[0].code = #eventOrState
  * ^property[=].valueCode = #event
  * ^property[+].code = #source
  * ^property[=].valueCode = #measurement
  * ^property[+].code = #MDCCode
  * ^property[=].valueCoding = Mdc#8418060
* #8418060.3 "sensor-malfunction" "The sensor malfunctioned"
  * ^property[0].code = #eventOrState
  * ^property[=].valueCode = #event
  * ^property[+].code = #source
  * ^property[=].valueCode = #measurement
  * ^property[+].code = #MDCCode
  * ^property[=].valueCoding = Mdc#8418060
* #8418060.4 "device-specific-alert" "Device specific alert"
  * ^property[0].code = #eventOrState
  * ^property[=].valueCode = #event
  * ^property[+].code = #source
  * ^property[=].valueCode = #measurement
  * ^property[+].code = #MDCCode
  * ^property[=].valueCoding = Mdc#8418060
* #8418060.7 "sensor-calibration-not-allowed" "Calibrating the sensor is not allowed"
  * ^property[0].code = #eventOrState
  * ^property[=].valueCode = #event
  * ^property[+].code = #source
  * ^property[=].valueCode = #measurement
  * ^property[+].code = #MDCCode
  * ^property[=].valueCoding = Mdc#8418060
* #8418060.8 "sensor-calibration-recommended" "Calibrating the sensor is recommended"
  * ^property[0].code = #eventOrState
  * ^property[=].valueCode = #event
  * ^property[+].code = #source
  * ^property[=].valueCode = #measurement
  * ^property[+].code = #MDCCode
  * ^property[=].valueCoding = Mdc#8418060
* #8418060.9 "sensor-calibration-required" "Calibrating the sensor is required"
  * ^property[0].code = #eventOrState
  * ^property[=].valueCode = #event
  * ^property[+].code = #source
  * ^property[=].valueCode = #measurement
  * ^property[+].code = #MDCCode
  * ^property[=].valueCoding = Mdc#8418060
* #8418060.10 "sensor-temp-too-high" "Temperature is too high for a valid result"
  * ^property[0].code = #eventOrState
  * ^property[=].valueCode = #event
  * ^property[+].code = #source
  * ^property[=].valueCode = #measurement
  * ^property[+].code = #MDCCode
  * ^property[=].valueCoding = Mdc#8418060
* #8418060.11 "sensor-temp-too-low" "Temperature is too low for a valid result"
  * ^property[0].code = #eventOrState
  * ^property[=].valueCode = #event
  * ^property[+].code = #source
  * ^property[=].valueCode = #measurement
  * ^property[+].code = #MDCCode
  * ^property[=].valueCoding = Mdc#8418060
* #8418060.12 "sensor-result-below-patient-low" "Sensor result below the Patient Low level"
  * ^property[0].code = #eventOrState
  * ^property[=].valueCode = #event
  * ^property[+].code = #source
  * ^property[=].valueCode = #measurement
  * ^property[+].code = #MDCCode
  * ^property[=].valueCoding = Mdc#8418060
* #8418060.13 "sensor-result-above-patient-high" "Sensor result above the Patient High level"
  * ^property[0].code = #eventOrState
  * ^property[=].valueCode = #event
  * ^property[+].code = #source
  * ^property[=].valueCode = #measurement
  * ^property[+].code = #MDCCode
  * ^property[=].valueCoding = Mdc#8418060
* #8418060.14 "sensor-low-hypo" "Sensor result below level"
  * ^property[0].code = #eventOrState
  * ^property[=].valueCode = #event
  * ^property[+].code = #source
  * ^property[=].valueCode = #measurement
  * ^property[+].code = #MDCCode
  * ^property[=].valueCoding = Mdc#8418060
* #8418060.15 "sensor-high-hyper" "Sensor result above level"
  * ^property[0].code = #eventOrState
  * ^property[=].valueCode = #event
  * ^property[+].code = #source
  * ^property[=].valueCode = #measurement
  * ^property[+].code = #MDCCode
  * ^property[=].valueCoding = Mdc#8418060
* #8418060.16 "sensor-rate-decrease-exceeded" "The sensor rate of decrease has been exceeded"
  * ^property[0].code = #eventOrState
  * ^property[=].valueCode = #event
  * ^property[+].code = #source
  * ^property[=].valueCode = #measurement
  * ^property[+].code = #MDCCode
  * ^property[=].valueCoding = Mdc#8418060
* #8418060.17 "sensor-rate-increase-exceeded" "The sensor rate of increase has been exceeded"
  * ^property[0].code = #eventOrState
  * ^property[=].valueCode = #event
  * ^property[+].code = #source
  * ^property[=].valueCode = #measurement
  * ^property[+].code = #MDCCode
  * ^property[=].valueCoding = Mdc#8418060
* #8418060.18 "sensor-result-too-low" "Sensor result is lower than the device can process"
  * ^property[0].code = #eventOrState
  * ^property[=].valueCode = #event
  * ^property[+].code = #source
  * ^property[=].valueCode = #measurement
  * ^property[+].code = #MDCCode
  * ^property[=].valueCoding = Mdc#8418060
* #8418060.19 "sensor-result-too-high" "Sensor result is higher than the device can process"
  * ^property[0].code = #eventOrState
  * ^property[=].valueCode = #event
  * ^property[+].code = #source
  * ^property[=].valueCode = #measurement
  * ^property[+].code = #MDCCode
  * ^property[=].valueCoding = Mdc#8418060
* #8418060.20 "sensor-com-out-of-range" "The sensor communication is out of range"
  * ^property[0].code = #eventOrState
  * ^property[=].valueCode = #event
  * ^property[+].code = #source
  * ^property[=].valueCode = #measurement
  * ^property[+].code = #MDCCode
  * ^property[=].valueCoding = Mdc#8418060
* #8418512.0 "Battery-status-Undetermined" "The status of the battery is unknown"
  * ^property[0].code = #eventOrState
  * ^property[=].valueCode = #state
  * ^property[+].code = #source
  * ^property[=].valueCode = #measurement
  * ^property[+].code = #MDCCode
  * ^property[=].valueCoding = Mdc#8418512
* #8418512.1 "Battery-absent" "The battery is absent"
  * ^property[0].code = #eventOrState
  * ^property[=].valueCode = #state
  * ^property[+].code = #source
  * ^property[=].valueCode = #measurement
  * ^property[+].code = #MDCCode
  * ^property[=].valueCoding = Mdc#8418512
* #8418512.2 "Battery-active" "The battery is active in the system"
  * ^property[0].code = #eventOrState
  * ^property[=].valueCode = #state
  * ^property[+].code = #source
  * ^property[=].valueCode = #measurement
  * ^property[+].code = #MDCCode
  * ^property[=].valueCoding = Mdc#8418512
* #8418512.3 "Battery-charging" "The battery is charging"
  * ^property[0].code = #eventOrState
  * ^property[=].valueCode = #state
  * ^property[+].code = #source
  * ^property[=].valueCode = #measurement
  * ^property[+].code = #MDCCode
  * ^property[=].valueCoding = Mdc#8418512
* #8418512.4 "Battery-fullyCharged" "The battery is fully charged"
  * ^property[0].code = #eventOrState
  * ^property[=].valueCode = #state
  * ^property[+].code = #source
  * ^property[=].valueCode = #measurement
  * ^property[+].code = #MDCCode
  * ^property[=].valueCoding = Mdc#8418512
* #8418512.5 "Battery-disposable" "The battery is disposable"
  * ^property[0].code = #eventOrState
  * ^property[=].valueCode = #state
  * ^property[+].code = #source
  * ^property[=].valueCode = #measurement
  * ^property[+].code = #MDCCode
  * ^property[=].valueCoding = Mdc#8418512
* #8418512.6 "Battery-rechargeable" "The battery is rechargable"
  * ^property[0].code = #eventOrState
  * ^property[=].valueCode = #state
  * ^property[+].code = #source
  * ^property[=].valueCode = #measurement
  * ^property[+].code = #MDCCode
  * ^property[=].valueCoding = Mdc#8418512
* #8418512.7 "Battery-overTemperature" "The battery is too hot"
  * ^property[0].code = #eventOrState
  * ^property[=].valueCode = #event
  * ^property[+].code = #source
  * ^property[=].valueCode = #measurement
  * ^property[+].code = #MDCCode
  * ^property[=].valueCoding = Mdc#8418512
* #8418512.8 "Battery-faulty" "The battery is faulty"
  * ^property[0].code = #eventOrState
  * ^property[=].valueCode = #event
  * ^property[+].code = #source
  * ^property[=].valueCode = #measurement
  * ^property[+].code = #MDCCode
  * ^property[=].valueCoding = Mdc#8418512
* #8418512.9 "Battery-incompatible" "The battery is incompatible"
  * ^property[0].code = #eventOrState
  * ^property[=].valueCode = #event
  * ^property[+].code = #source
  * ^property[=].valueCode = #measurement
  * ^property[+].code = #MDCCode
  * ^property[=].valueCoding = Mdc#8418512
* #8410608.0 "body-movement" "Too much body movement"
  * ^property[0].code = #eventOrState
  * ^property[=].valueCode = #event
  * ^property[+].code = #source
  * ^property[=].valueCode = #measurement
  * ^property[+].code = #MDCCode
  * ^property[=].valueCoding = Mdc#8410608
* #8410608.1 "cuff-too-loose" "The cuff was too loose"
  * ^property[0].code = #eventOrState
  * ^property[=].valueCode = #event
  * ^property[+].code = #source
  * ^property[=].valueCode = #measurement
  * ^property[+].code = #MDCCode
  * ^property[=].valueCoding = Mdc#8410608
* #8410608.2 "irregular-pulse" "An irregular pulse was detected"
  * ^property[0].code = #eventOrState
  * ^property[=].valueCode = #event
  * ^property[+].code = #source
  * ^property[=].valueCode = #measurement
  * ^property[+].code = #MDCCode
  * ^property[=].valueCoding = Mdc#8410608
* #8410608.3 "pulse-over-range-limit" "The pulse was too high for sensor to work"
  * ^property[0].code = #eventOrState
  * ^property[=].valueCode = #event
  * ^property[+].code = #source
  * ^property[=].valueCode = #measurement
  * ^property[+].code = #MDCCode
  * ^property[=].valueCoding = Mdc#8410608
* #8410608.4 "pulse-under-range-limit" "The pulse was too low for sensor to work"
  * ^property[0].code = #eventOrState
  * ^property[=].valueCode = #event
  * ^property[+].code = #source
  * ^property[=].valueCode = #measurement
  * ^property[+].code = #MDCCode
  * ^property[=].valueCoding = Mdc#8410608
* #8410608.5 "improper-body-position" "The cuff was incorrectly placed with respect to the heart"
  * ^property[0].code = #eventOrState
  * ^property[=].valueCode = #event
  * ^property[+].code = #source
  * ^property[=].valueCode = #measurement
  * ^property[+].code = #MDCCode
  * ^property[=].valueCoding = Mdc#8410608
