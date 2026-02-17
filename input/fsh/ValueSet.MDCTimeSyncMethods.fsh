Alias: $Mdc = urn:iso:std:iso:11073:10101

ValueSet: MDCTimeSyncMethods
Id: MDCTimeSyncMethods
Title: "MDC Time Synchronization Methods"
Description: "ValueSet for the MDC codes representing time synchronization methods such as NTP, GPS, and others."
* ^meta.profile = "http://hl7.org/fhir/StructureDefinition/shareablevalueset"
* ^url = "http://hl7.org/fhir/uv/phd/ValueSet/MDCTimeSyncMethods"
* ^version = "current"
* ^experimental = false
* ^publisher = "Health Level Seven International (Devices Work Group)"
* $Mdc#532224  // MDC_TIME_SYNC_NONE
* $Mdc#532225  // MDC_TIME_SYNC_NTPV3
* $Mdc#532226  // MDC_TIME_SYNC_NTPV4
* $Mdc#532227  // MDC_TIME_SYNC_SNTPV4 (RFC2030)
* $Mdc#532228  // MDC_TIME_SYNC_SNTPV4330 (RFC4330)
* $Mdc#532229  // MDC_TIME_SYNC_BTV1
* $Mdc#532230  // MDC_TIME_SYNC_RADIO
* $Mdc#532231  // MDC_TIME_SYNC_HL7_NCK
* $Mdc#532232  // MDC_TIME_SYNC_CDMA
* $Mdc#532233  // MDC_TIME_SYNC_GSM
* $Mdc#532234  // MDC_TIME_SYNC_EBWW
* $Mdc#532235  // MDC_TIME_SYNC_USB_SOF
* $Mdc#532236  // MDC_TIME_SYNC_OTHER
* $Mdc#532237  // MDC_TIME_SYNC_OTHER_MOBILE
* $Mdc#532238  // MDC_TIME_SYNC_GPS

