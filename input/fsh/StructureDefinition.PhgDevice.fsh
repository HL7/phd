Alias: $DeviceTypes11073MDC = http://hl7.org/fhir/uv/phd/ValueSet/DeviceTypes11073MDC
Alias: $ASN1DeviceBits = http://hl7.org/fhir/uv/phd/ValueSet/ASN1DeviceBits
Alias: $Quantity11073MDC = http://hl7.org/fhir/uv/phd/ValueSet/Quantity11073MDC
Alias: $CodeableConcept11073MDC = http://hl7.org/fhir/uv/phd/ValueSet/CodeableConcept11073MDC

Profile: PhgDevice
Parent: Device
Id: PhgDevice
Description: "Profile for the Device Resource for a PHG"
* ^meta.lastUpdated = "2017-10-16T05:10:49.894-04:00"
* ^version = "1.0.0"
* ^date = "2017-07-07T11:39:51.3383228-04:00"
* ^purpose = "This resource describes the primary features of the Personal Health Gateway (PHG). A PHG does not have any IEEE 11073-10206 Objects or attributes though it is required to have a system identifier. However, for the purposes of reporting the information about the PHG entity, it is treated as if it can provide system information, clock and power source information. For compliance with this IG, the quantities that are required to be reported are the system identifier, the time synchronization method, the manufacturer and model number (of the software, not necessarily the hardware on which the application resides), and the PCHA certified interfaces."
* . ^definition = "The characteristics, operational status and capabilities of the PHG."
* identifier 1..
* identifier ^slicing.discriminator[0].type = #value
  * ^slicing.discriminator[=].path = "type"
  * ^slicing.rules = #open
  * ^short = "Information that uniquely describes the personal health device"
  * ^definition = "An assigned unique identification of the device that is semantically meaningful outside of the FHIR resource context. An example would be the IEEE EUI-64 System-Id or transport address."
  * ^alias = "11073-10206 System id, transport address, etc."
* identifier.type from http://hl7.org/fhir/uv/phd/ValueSet/MDCDeviceIdentifierTypes (extensible)
  * ^short = "The type of identifier"
* identifier contains
    systemIdIdentifier 0..1 and
    btmacAddressIdentifier 0..1 and
    macAddressIdentifier 0..1
* identifier[systemIdIdentifier] ^short = "System Id identifier"
  * ^definition = "This entry contains the IEEE EUI-64."
  * ^alias = "11073-10206 System id"
  * type 1..
  * type = http://hl7.org/fhir/uv/phd/CodeSystem/ContinuaDeviceIdentifiers#SYSID
    * ^short = "Required IEEE 11073-10206 System Id code system coding"
  * system 1..
  * system = "urn:oid:1.2.840.10004.1.1.1.0.0.1.0.0.1.2680" (exactly)
    * ^short = "EUI-64 system identifier"
    * ^definition = "Identifies the system as an IEEE EUI."
  * value 1..
    * ^short = "System id value from System-Id attribute"
    * ^definition = "The System id from the System-Id attribute as an 8-byte HEX string where each byte is separated by dashes, for example FE-ED-AB-EE-DE-AD-77-C3. "
    * ^comment = "The formatting is specified in the IEEE RA Guidelines for use of EUIs."
* identifier[btmacAddressIdentifier] ^short = "Bluetooth MAC Transport address identifier"
  * ^definition = "This entry contains the Bluetooth MAC transport address."
  * ^alias = "Bluetooth MAC Transport address"
  * type 1..
  * type = http://hl7.org/fhir/uv/phd/CodeSystem/ContinuaDeviceIdentifiers#BTMAC
    * ^short = "Required Bluetooth MAC address code system coding"
  * system 1..
  * system = "http://hl7.org/fhir/sid/eui-48/bluetooth" (exactly)
  * value 1..
    * ^definition = "The Bluetooth MAC as an EUI-48 such as 00-E5-DE-AD-77-C3. "
    * ^comment = "Transport addresses are supposed to be unique for a given device."
* identifier[macAddressIdentifier] ^short = "MAC Transport address identifier"
  * ^definition = "This entry contains the MAC transport address."
  * ^alias = "MAC Transport address"
  * type 1..
  * type = http://hl7.org/fhir/uv/phd/CodeSystem/ContinuaDeviceIdentifiers#ETHMAC
    * ^short = "Required Ethernet MAC address code system coding"
  * system 1..
  * system = "http://hl7.org/fhir/sid/eui-48/ethernet" (exactly)
  * value 1..
    * ^definition = "The MAC as an EUI-48 such as 00-E5-DE-AD-77-C8. "
    * ^comment = "Transport addresses are supposed to be unique for a given device."
* type 1..
  * ^short = "Indicates the device is a PHG."
  * coding ^slicing.discriminator[0].type = #value
    * ^slicing.discriminator[=].path = "system"
    * ^slicing.rules = #open
  * coding contains MDCType 1..1
  * coding[MDCType] ^short = "Required MDC code system entry"
    * ^definition = "The MDC code for the PHG is a special value defined for V2 PCD-01."
    * system 1..
    * system = "urn:iso:std:iso:11073:10101" (exactly)
      * ^short = "Identifies IEEE 11073-10101 coding system"
      * ^definition = "This value identifies the IEEE 11073-10101 coding system"
    * code 1..
    * code = #531981 (exactly)
      * ^short = "Indicates PHG"
      * ^definition = "MDC code indicating that this unit is a personal health gateway (PHG)."
* specialization ^slicing.discriminator[0].type = #value
  * ^slicing.discriminator[=].path = "systemType.coding"
  * ^slicing.rules = #open
  * ^short = "This element contains an entry for each supported specialization or a generic representation."
* specialization contains MDCType 1..*
* specialization[MDCType] ^short = "The specialization(s) supported by the PHG."
  * ^definition = "The specialization(s) supported by the PHG. This element contains an entry for each supported specialization."
  * systemType ^short = "The specialization standard supported by the PHG."
    * coding 1..
    * coding from $DeviceTypes11073MDC (required)
* version ^short = "A PHG may report firmware, hardware, software, internal protocol, nomenclature and ACOM versions."
  * ^comment = "There are several versions that may be reported by a PHG. PHGs compliant to this IG report at least one of these versions. A separate version entry is needed for each of the versions reported by the PHG."
* version ^slicing.discriminator[0].type = #value
  * ^slicing.discriminator[=].path = "type.coding"
  * ^slicing.rules = #open
* version contains MDCType 1..*
* version[MDCType] ^short = "Required MDC device version type entry"
  * type.coding from MDCDeviceVersionTypes
  * value ^short = "The version"
  * component ..0
* parent ..0
  * ^short = "No reference to a parent device in PHG. PHGs are not part of a device hierarchy."

* property ^slicing.discriminator[0].type = #value
  // * ^slicing.discriminator[=].path = "type.coding.code"
  * ^slicing.discriminator[=].path = "type"
  * ^slicing.rules = #open
* property contains
    timeSyncProperty 0..1 and
    continuaCertPHDProperty 0..* and
    continuaCertPHGProperty 0..* and
    clockBitProperty 0..* and
    isRegulatedProperty 0..1 and
    clockResolutionProperty 0..1 and
    timeSyncAccuracyProperty 0..1 // and
    //clockTypeProperty 0..1 and
    //powerSourceProperty 0..1 and

* property[timeSyncProperty] ^short = "Time synchronization method"
  * ^definition = "This element represents the time synchronization method used by the PHG. It is an MDC coded value."
  * ^comment = "This element reflects the time synchronization method used to set the PHG's clock."
  * type = Mdc#68220 // MDC_TIME_SYNC_PROTOCOL
  * valueCode ..1
    * coding 1..*
    * coding from http://hl7.org/fhir/uv/phd/ValueSet/MDCTimeSyncMethods (extensible)

* property[continuaCertPHDProperty] ^short = "Continua certified PHD interfaces (from IEEE 11073-20601)"
  * ^definition = "This element represents a Continua certified PHD interface that is supported by the PHG. It is an MDC coded value."
  * type = Mdc#532353 // MDC_REG_CERT_DATA_CONTINUA_CERT_DEV_LIST
  * valueCode ..1
  * valueCode from http://hl7.org/fhir/uv/phd/ValueSet/ContinuaPHDInterfaces (extensible)

* property[continuaCertPHGProperty] ^short = "Continua certified PHG interfaces"
  * ^definition = "This element represents a Continua certified PHG to HFS interface that is supported by the PHG. It is an MDC coded value."
  * type = Mdc#532355 // MDC_REG_CERT_DATA_CONTINUA_AHD_CERT_DEV_LIST
  * valueCode ..1
  * valueCode from http://hl7.org/fhir/uv/phd/ValueSet/ContinuaPHGInterfaces (extensible)

* property[clockBitProperty] ^short = "Boolean Properties reported by the Clock"
  * ^definition = "For each Boolean clock capability reported a property element is used."
  * type from ASN1ClockBits (required)
    * ^short = "Tells what the clock capability item is"
    * ^definition = "One of the capabilities of the clock as reportedD."
  * valueQuantity ..0
  * valueCode 1..1
    * coding // from http://terminology.hl7.org/ValueSet/v2-0136 (required)
      * system 1..
      * system = "http://terminology.hl7.org/CodeSystem/v2-0136" (exactly)
      * code 1..
        * ^definition = "If bit is set, code contains Y if cleared, N"

* property[clockResolutionProperty] ^short = "Clock Resolution as reported"
  * ^definition = "The clock resolution in microseconds."
  * type from MDCClockResolutionTypes (required)
    * ^short = "Tells what the clock resolution type is"
    * ^definition = "The resolution of the clock as reported."
  * valueQuantity 1..1
    * ^definition = "The value. All the time fields are scaled to microseconds"
    * system 1..
    * system = "http://unitsofmeasure.org" (exactly)
    * code = UCUM#us
      * ^definition = "The UCUM code for microseconds is 'us'."

* property[timeSyncAccuracyProperty] ^short = "Time Synchronization Accuracy"
  * ^definition = "The time synchronization accuracy in microseconds."
  * type = Mdc#68221 // MDC_TIME_SYNC_ACCURACY
    * ^short = "Tells what the time synchronization accuracy is"
    * ^definition = "The time synchronization accuracy of the clock."
  * valueQuantity 1..1
    * ^definition = "The value. All the time fields are scaled to microseconds"
    * system 1..
    * system = "http://unitsofmeasure.org" (exactly)
    * code = UCUM#us
      * ^definition = "The UCUM code for microseconds is 'us'."

* property[isRegulatedProperty] ^short = "Regulatory status of the PHG"
  * ^definition = "This element represents the regulatory status of the PHG."
  * type = ASN1ToHL7#532354.0
    * ^short = "Negated regulatory status of the PHG"
    * ^definition = "This element represents the negated regulatory status of the PHG."
  * valueQuantity ..0
  * valueCode 1..1
    * coding // from http://terminology.hl7.org/ValueSet/v2-0136 (required)
      * system 1..
      * system = "http://terminology.hl7.org/CodeSystem/v2-0136" (exactly)
      * code 1..
        * ^definition = "If bit is set, the device is not regulated. If cleared, the device is regulated."


// * property 1..
//   * ^slicing.discriminator[0].type = #value
//   * ^slicing.discriminator[=].path = "type"
//   * ^slicing.rules = #open
// * property contains
//     bitProperties 0..* and
//     quantitiesProperty 0..* and
//     codedListProperties 0..*
// * property[bitProperties] ^short = "Properties reported in BITs fields"
//   * ^definition = "For each bit setting reported a BITs value, a bitProperties element is used."
//   * ^comment = "A BITs measurement is a 16 or 32-bit ASN1 BITs value where each bit means something. "
//   * type from $ASN1DeviceBits (required)
//     * ^short = "Tells what the BITs item is"
//     * ^definition = "One of the capabilities reported in the Mds-Time-Info.mds-time-caps-state or Reg-Cert-Data-List.regulation-status field."
//     * ^comment = "Only set 'event' types need be reported. Both set and cleared 'state' types need to be reported. The regulation status is as state type. All time capabilities are event types"
//     * coding 1..1
//       * ^short = "Required ASN1 code system entry"
//       * system 1..
//       * system = "http://hl7.org/fhir/uv/phd/CodeSystem/ASN1ToHL7" (exactly)
//       * code 1..
//         * ^definition = "The ASN1 code made from the code and the Mder bit position"
//         * ^comment = "The MDC code for the regulation status field is 532354, and only bit 0 is defined. However, the regulated status is when the bit is cleared and the unregulated status is when the bit is set. That choice can be confusing. One could enter some fields of the time capabilities attribute if desired."
//     * text ^definition = "It is recommended to display at least the ASN1 name for the given bit meaning"
//   * valueQuantity ..0
//   * valueCode 1..1
//     * coding ^slicing.discriminator[0].type = #value
//       * ^slicing.discriminator[=].path = "system"
//       * ^slicing.rules = #open
//     * coding contains V2Binary 1..1
//     * coding[V2Binary] ^short = "Required V2 Binary code system entry"
//       * system 1..
//       * system = "http://terminology.hl7.org/CodeSystem/v2-0136" (exactly)
//       * code 1..
//         * ^definition = "If bit is set, code contains Y if cleared, N"
// * property[quantitiesProperty] ^short = "The PHG properties represented by quantities such as time synchronization accuracy"
//   * ^definition = "This element represents all those time properties that are a quantity such as the time synchronization accuracy."
//   * ^comment = "For a PHG the synchronization accuracy should be reported if known."
//   * type from $Quantity11073MDC (required)
//     * ^short = "The type of time quantity"
//     * coding 1..
//       * ^short = "Required MDC code system entry"
//       * system 1..
//       * system = "urn:iso:std:iso:11073:10101" (exactly)
//       * code 1..
//         * ^definition = "The MDC code representing the property"
//         * ^comment = "For PHG only the time sync accuracy is of interest.\r\n\r\n       Description                        CODE            Reference Identifier\r\n       ------------------------------------------------------------------------------------\r\n       Absolute clock resolution         68222            MDC_TIME_RES_ABS\r\n       Base-offset clock resolution      68226            MDC_TIME_RES_BO\r\n       Relative time resolution          68223            MDC_TIME_RES_REL\r\n       Hi Res relative time resolution   68224            MDC_TIME_RES_REL_HI_RES\r\n       Time sync accuracy                68221            MDC_TIME_SYNC_ACCURACY\r\n"
//     * text ^definition = "It is recommended to display at least the MDC reference identifier for the code"
//   * valueQuantity 1..1
//     * ^definition = "The value of the reported quantity."
//   * valueCode ..0
// * property[codedListProperties] ^short = "The device properties represented by a list of codes such as the list of certified PHD or H-FS interfaces"
//   * ^definition = "This element represents all those properties that are a list of codes. At the moment there is only certified PHD interfaces."
//   * ^comment = "Continua certified PHDs are required to have these entries."
//   * type from $CodeableConcept11073MDC (required)
//     * ^short = "What the coded list is"
//     * coding 1..
//       * ^short = "Required MDC code system entry"
//       * system 1..
//       * system = "urn:iso:std:iso:11073:10101" (exactly)
//       * code 1..
//         * ^definition = "The MDC code representing the property"
//         * ^comment = "Currently PHDs support the reporting of one of the coded lists as shown in the Table. More may be added in the future\r\n\r\n       Description                CODE    Reference Identifier                           Code System\r\n       -----------------------------------------------------------------------------------------------------------------------------------\r\n    Time synchronization      68220    MDC_TIME_SYNC_PROTOCOL\r       Certified PHD interfaces  532353   MDC_REG_CERT_DATA_CONTINUA_CERT_DEV_LIST       http://hl7.org/fhir/uv/phd/CodeSystem/ContinuaPHDInterfaceIDs\r\n       Certified HFS interfaces  532355   MDC_REG_CERT_DATA_CONTINUA_AHD_CERT_DEV_LIST   http://hl7.org/fhir/uv/phd/CodeSystem/ContinuaHFS\r\n"
//     * text ^definition = "It is recommended to display at least the MDC reference identifier for the code"
//   * valueQuantity ..0
//   * valueCode 1..
//     * ^short = "There shall be one valueCode entry for every item supported by the PHG in the list"
//     * coding 1..
//       * system 1..
//         * ^definition = "Either the http://hl7.org/fhir/uv/phd/CodeSystem/ContinuaPHDInterfaceIDs or http://hl7.org/fhir/uv/phd/CodeSystem/ContinuaHFS or urn:iso:std:iso:11073:10101 code systems"
//       * code 1..
//         * ^definition = "One of the Continua interface certification codes"