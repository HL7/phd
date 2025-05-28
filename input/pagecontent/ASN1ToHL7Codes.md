The ASN1 to HL7 code system is the result of mapping IEEE 11073-20601 BITs measurements or values to codes. HL7 (in V2, V3, and FHIR) has no native support for BITs type values.

The following tables gives the codes, names, and event or state type for the currently specified BITs measurements and values. The HL7 ASN1 Code is the code entered into the FHIR code elements. The ASN1 name is standardized and is analogous to the reference identifier for the nomenclature codes. If the state type is an event, only the 'set' meaning is displayed.

<style>table, th, td {
border: 1px solid black;
border-collapse:collapse;
padding: 6px;}</style>

### MDS and other Non-Measurement Attributes

#### MDS Power Status Attribute
Partition:Term Code: 1:2389     32-bit value 67925

Reference identifier:  MDC_ATTR_POWER_STAT

|Mder Bit|HL7 ASN1 Code|ASN1 name|meaning when set|meaning when cleared|event or state|
|-
|0|67925.0|onMains|On mains power|Not on mains power|state|
|1|67925.1|onBattery|On battery|Not on battery|state|
|8|67925.8|chargingFull|Charging at full rate||event|
|9|67925.9|chargingTrickle|Trickle charging||event|
|10|67925.10|chargingOff|Not charging|charging|state|

#### MDS Regulation Status from the Reg-Cert-Data-List Attribute
Partition:Term Code: 8:8066     32-bit code 532354

Reference identifier: MDC_REG_CERT_DATA_CONTINUA_REG_STATUS

Note that the *cleared* state is the *regulated* state. This choice is probably not what one expects.

|Mder Bit|HL7 ASN1 Code|ASN1 name|meaning when set|meaning when cleared|event or state|
|-
|0|532354.0|regulation-status|Device is *unregulated*|Device is *regulated*|state|

#### MDS Time capabilities state from the Mds-Time-Info Attribute
Partition:Term Code 1:2683      32-bit code 68219
Reference Identifier: MDC_TIME_CAP_STATE

Only static settings, when present, are required to be reported.

|Mder Bit|HL7 ASN1 Code|ASN1 name|meaning when set|meaning when cleared|event or state|
|-
|0|68219.0|mds-time-capab-real-time-clock|real time clock supported||event|
|1|68219.1|mds-time-capab-set-clock|setting the time by PHG supported||event|
|2|68219.2|mds-time-capab-relative-time|relative time supported||event|
|3|68219.3|mds-time-capab-hi-res-relative-time|hi res relative time supported||event|
|4|68219.4|mds-time-capab-sync-abs-time|syncing absolute time supported||event|
|5|68219.5|mds-time-capab-sync-rel-time|syncing relative time supported||event|
|6|68219.6|mds-time-capab-sync-hi-res-relative-time|syncing hi res relative time supported||event|
|7|68219.7|mds-time-capab-bo-time|base offset time supported||event|
|8|68219.8|mds-time-state-abs-time-synced|absolute time synced||event (*dynamic*)|
|9|68219.9|mds-time-state-rel-time-synced|relative time synced||event (*dynamic*)|
|10|68219.10|mds-time-state-hi-res-relative-time-synced|hi-res relative time synced||event (*dynamic*)|
|11|68219.11|mds-time-mgr-set-time|PHG requested to set the time||event (*dynamic*)|
|12|68219.12|mds-time-capab-sync-bo-time|syncing base offset time supported||event|
|13|68219.13|mds-time-state-bo-time-synced|base offset time synced||event (*dynamic*)|
|14|68219.14|mds-time-state-bo-time-UTC-aligned|base offset time UTC aligned||event|
|15|68219.15|mds-time-dst-rules-enabled|Daylight Savings Time rules understood||event|

#### Alert Operational Status Attribute
This attribute is a metric descriptive attribute; it is not a measurement but an extra piece of information saying something about a measurement.

Partition:Term Code: 1:2310     32-bit code: 67846

Reference Identifier: MDC_ATTR_AL_OP_STAT

|Mder Bit|HL7 ASN1 Code|ASN1 name|meaning when set|meaning when cleared|event or state|
|-
|0|67846.0|lim-alert-off|all alerts (both high and low) are off|one of the high and low may be on|state|
|1|67846.1|lim-low-off|low-limit detection is off|low-limit detection is on|state|
|2|67846.2|lim-high-off|high-limit detection is off|high-limit detection is on|state|

### Enumeration Measurements
The following tables give the currently defined BITs measurements. These values are defined in the 11073-104xx specialization standards. The HL7 ASN1 codes for these and future values can be derived directly from the protocol exchange.

#### Pulse Oximeter Device and Sensor status
Partition:Term Code:  2:19532   32-bit code: 150604

Reference Identifier:   MDC_PULS_OXIM_DEV_STATUS

|Mder Bit|HL7 ASN1 Code|ASN1 name|meaning when set|meaning when cleared|event or state|
|-
|0|150604.0|sensor-disconnected|Device not connected to sensor||event|
|1|150604.1|sensor-malfunction|Sensor has malfunctioned||event|
|2|150604.2|sensor-displaced|Sensor is incorrectly placed on user||event|
|3|150604.3|sensor-unsupported|Device connected to unsupported sensor||event|
|4|150604.4|sensor-off|Sensor not connected to user||event|
|5|150604.5|sensor-interference|Sensor experiencing interference||event|
|6|150604.6|signal-searching|Searching for a signal||event|
|7|150604.7|signal-pulse-questionable|Questionable pulse detected||event|
|8|150604.8|signal-non-pulsatile|Non pulsatile signal detected||event|
|9|150604.9|signal-erratic|Signal is erratic||event|
|10|150604.10|signal-low-perfusion|Signal experiencing low perfusion||event|
|11|150604.11|signal-poor|Signal is poor"||event|
|12|150604.12|signal-inadequate|Signal is inadequate||event|
|13|150604.13|signal-processing-irregularity|Signal processing experiencing irregularity||event|
|14|150604.14|device-equipment-malfunction|Device malfunction has occurred||event|
|15|150604.15|device-extended-update|Extended display update in progress||event|

#### Pulse Oximeter Pulsatile characteristics
Partition:Term Code:  2:19533   32-bit code: 150605

Reference Identifier:   MDC_PULS_OXIM_PULS_CHAR

|Mder Bit|HL7 ASN1 Code|ASN1 name|meaning when set|meaning when cleared|event or state|
|-
|0|150605.0|pulse-qual-nominal|No abnormalities detected||event|
|1|150605.1|pulse-qual-marginal|Pulse perfusion or quality marginal||event|
|2|150605.2|pulse-qual-minimal|Pulse perfusion or quality minimal||event|
|3|150605.3|pulse-qual-unacceptable|Pulse perfusion or quality unacceptable||event|

#### ECG Device and Sensor status
Partition:Term Code: 128:21976   32-bit code: 8410584

Reference Identifier: MDC_ECG_DEV_STAT

|Mder Bit|HL7 ASN1 Code|ASN1 name|meaning when set|meaning when cleared|event or state|
|-
|0|8410584.0|leadwire-loss|loss of unspecified lead wire or electrode connection||event|
|1|8410584.1|leadsignal-loss|loss of unspecified lead signal||event|
|2|8410584.2|leadwire-loss-first-lead|loss of 1st lead wire or electrode connection||event|
|3|8410584.3|leadsignal-loss-first-lead|loss of 1st lead signal||event|
|4|8410584.4|leadwire-loss-second-lead|loss of 2nd lead wire or electrode connection||event|
|5|8410584.5|leadsignal-loss-second-lead|loss of 2nd lead signal||event|
|6|8410584.6|leadwire-loss-third-lead|loss of 3rd lead wire or electrode connection||event|
|7|8410584.7|leadsignal-loss-third-lead|loss of 3rd lead signal||event|

#### Glucose Meter Device and Sensor status
Partition:Term Code: 128:29144   32-bit code: 8417752

Reference Identifier: MDC_GLU_METER_DEV_STATUS

|Mder Bit|HL7 ASN1 Code|ASN1 name|meaning when set|meaning when cleared|event or state|
|-
|0|8417752.0|device-battery-low|Battery low||event|
|1|8417752.1|sensor-malfunction|Sensor has malfunctioned||event|
|2|8417752.2|sensor-sample-size-insufficient|Not enough blood in sample||event|
|3|8417752.3|sensor-strip-insertion|Strip inserted incorrectly||event|
|4|8417752.4|sensor-strip-type-incorrect|Strip not correct type||event|
|5|8417752.5|sensor-result-too-high|Value too high||event|
|6|8417752.6|sensor-result-too-low|Value too low||event|
|7|8417752.7|sensor-temp-too-high|Temperature too high||event|
|8|8417752.8|sensor-temp-too-low|Temperature too low||event|
|9|8417752.9|sensor-read-interrupt|Process interrupted||event|
|10|8417752.10|device-gen-fault|General device fault||event|
|11|8417752.11|sensor-temp-out-of-range|Temperature out of range||event|

#### Coagulation Meter Device and Sensor status
Partition:Term Code: 128:29301     32-bit code: 8417909

Reference Identifier:   MDC_INR_METER_DEV_STATUS

|Mder Bit|HL7 ASN1 Code|ASN1 name|meaning when set|meaning when cleared|event or state|
|-
|0|8417909.0|inr-device-battery-low|Battery low||event|
|1|8417909.1|inr-sensor-malfunction|Sensor has malfunctioned||event|
|2|8417909.2|inr-sensor-sample-size-insufficient|Not enough blood in sample||event|
|3|8417909.3|inr-sensor-strip-insertion|Strip inserted incorrectly||event|
|4|8417909.4|inr-sensor-strip-type-incorrect|Strip not correct type||event|
|5|8417909.5|inr-sensor-result-too-high|Value too high||event|
|6|8417909.6|inr-sensor-result-too-low|Value too low||event|
|7|8417909.7|inr-sensor-temp-too-high|Temperature too high||event|
|8|8417909.8|inr-sensor-temp-too-low|Temperature too low||event|
|9|8417909.9|inr-sensor-read-interrupt|Process interrupted||event|
|10|8417909.10|inr-device-gen-fault|General device fault||event|
|11|8417909.11|inr-sensor-calibration-due|Calibration is due||event|

#### Generic 20601 Device and Sensor status
Partition:Term Code: 128:20000     32-bit code: 8408608

Reference Identifier:   MDC_PHD_DM_DEV_STAT

|Mder Bit|HL7 ASN1 Code|ASN1 name|meaning when set|meaning when cleared|event or state|
|-
|0|8408608.0|device-status-undetermined|Undetermined device status event||event|
|1|8408608.1|device-status-reset|Device reset||event|
|5|8408608.5|device-status-error|Device error||event|
|6|8408608.6|device-status-error-mechanical|Mechanical error||event|
|7|8408608.7|device-status-error-electronic|Electronic error||event|
|8|8408608.8|device-status-error-software|Software error||event|
|9|8408608.9|device-status-error-battery|Battery error||event|
|15|8408608.15|device-status-service|"Service required||event|
|16|8408608.16|device-status-service-time-sync-required|Time-sync service required||event|
|17|8408608.17|device-status-service-calibration-required|Calibration required||event|
|18|8408608.18|device-status-service-replenishment-required|Replentishment required||event|
|25|8408608.25|device-status-battery-low|Battery too low||event|
|26|8408608.26|device-status-battery-depleted|Battery depleted||event|
|27|8408608.27|device-status-battery-replaced|Battery replaced||event|
|28|8408608.28|device-status-battery-interrupted|Battery interrupted||event|

#### Continuous Glucose Monitor Device and Sensor status
Partition:Term Code: 128:29452     32-bit code: 8418060

Reference Identifier:   MDC_CGM_DEV_STAT

|Mder Bit|HL7 ASN1 Code|ASN1 name|meaning when set|meaning when cleared|event or state|
|-
|0|8418060.0|sensor-session-stopped|Session stopped||event|
|2|8418060.2|sensor-type-incorrect|Sensor type incorrect for device||event|
|3|8418060.3|sensor-malfunction|Sensor malfunction||event|
|4|8418060.4|device-specific-alert|Device Specific Alert||event|
|7|8418060.7|sensor-calibration-not-allowed|Calibration not allowed||event|
|8|8418060.8|sensor-calibration-recommended|Calibration recommended||event|
|9|8418060.9|sensor-calibration-required|Calibration required||event|
|10|8418060.10|sensor-temp-too-high|Temperature too high for valid result||event|
|11|8418060.11|sensor-temp-too-low|Temperature too low for valid result||event|
|12|8418060.12|sensor-result-below-patient-low|Sensor result below the Patient Low level||event|
|13|8418060.13|sensor-result-above-patient-high|Sensor result above the Patient High level||event|
|14|8418060.14|sensor-low-hypo|Sensor result below the Hypo level||event|
|15|8418060.15|sensor-high-hyper|Sensor result above the Hyper level||event|
|16|8418060.16|sensor-rate-decrease-exceeded|Sensor rate of decrease exceeded||event|
|17|8418060.17|sensor-rate-increase-exceeded|Sensor rate of increase exceeded||event|
|18|8418060.18|sensor-result-too-low|Sensor result lower than the device can process||event|
|19|8418060.19|sensor-result-too-high|Sensor result higher than the device can process||event|
|20|8418060.20|sensor-com-out-of-range|Sensor communication is out of range||event|





