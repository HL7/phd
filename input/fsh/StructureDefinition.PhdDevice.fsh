Alias: $ASN1DeviceBits = http://hl7.org/fhir/uv/phd/ValueSet/ASN1DeviceBits
Alias: $Quantity11073MDC = http://hl7.org/fhir/uv/phd/ValueSet/Quantity11073MDC
Alias: $CodeableConcept11073MDC = http://hl7.org/fhir/uv/phd/ValueSet/CodeableConcept11073MDC

Profile: PhdDevice
Parent: Device
Id: PhdDevice
Description: "Profile for the Device Resource for a PHD"
* ^meta.lastUpdated = "2017-10-16T05:03:37.38-04:00"
* ^url = "http://hl7.org/fhir/uv/phd/StructureDefinition/PhdDevice"
// * ^status = #draft
* ^date = "2017-07-07T11:39:51.3383228-04:00"
* ^purpose = "This resource describes the primary features of a Personal Health Device (PHD). It contains the properties, production specification, specializations, and overall type of the PHD."
* . ^definition = "The characteristics, operational status and capabilities of a medical-related component of a medical device. A PHD is JUST the medical-related component."
  * ^comment = "This profile applies to PHDs that adhere to the IEEE 11073-10206 ACOM standard or that can be mapped to it. The profile is based on the Device resource and contains additional elements that are specific to PHDs."
* identifier 1..
* identifier ^slicing.discriminator[0].type = #value
  * ^slicing.discriminator[=].path = "type"
  * ^slicing.rules = #open
  * ^short = "Information that uniquely describes the personal health device"
  * ^definition = "The assigned unique identification of the device that is semantically meaningful outside of the FHIR resource context. An example would be the IEEE EUI-64 System-Id or transport address. For PHDs the systemIdentifier is highly recommended and also a transportAddressIdentifier is recommended as this is what most end users see and can obtain from the device itself or device packaging."
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
* manufacturer 1..
  * ^short = "Manufacturer name from SystemInfo.system-manufacturer"
  * ^definition = "The manufacturer name as reported in the IEEE 11073-10206 SystemInfo."
  * ^comment = "The system manufacturer attribute is required by the IEEE 11073-10206 specification"
* modelNumber 1..
  * ^short = "Model number from SystemInfo.model-number"
  * ^definition = "The model number as reported by the SystemInfo attribute."
  * ^comment = "The model number attribute is required by the IEEE 11073-10206 specification"
* udiCarrier ^slicing.discriminator[0].type = #value
  * ^slicing.discriminator[=].path = "entryType"
  * ^slicing.rules = #open
* udiCarrier contains PhdProvidedUdi 0..1
* udiCarrier[PhdProvidedUdi] ^short = "The UDI of the PHD as provided by protocol"
  * ^definition = "The UDI of the PHD as provided by protocol. The UDI is an optional attribute in the IEEE 11073-10206 standard and is also supported by Bluetooth Low Energy DIS and GHS specifications."
  * entryType = #electronic-transmission
  * carrierAIDC 0..0
  * carrierHRF 1..1
    * ^short = "The UDI Human Readable Barcode String form is supported in ACOM and GHS."
* type 1..
* type.coding ^slicing.discriminator[0].type = #value
  * ^slicing.discriminator[=].path = "$this"
  * ^slicing.rules = #open
* type.coding contains PhdCode 1..1
* type.coding[PhdCode] ^short = "Indicates the device is a PHD."
* type.coding[PhdCode] = Mdc#65573
* specialization 1..
* specialization ^slicing.discriminator[0].type = #value
  * ^slicing.discriminator[=].path = "systemType.coding"
  * ^slicing.rules = #open
* specialization contains MDCType 1..
* specialization[MDCType] ^short = "The specialization(s) of the PHD"
  * ^definition = "The specialization(s) of the PHD. This element contains an entry for each supported specialization."
  * ^short = "This element contains an entry for each supported specialization"
  * ^comment = "There shall be a specialization entry for each specialization reported in the required System-Type-Spec-List attribute. A specialization in this case defines not only what type of measurements the PHD reports but that the PHD reports these measurements according to one of the 11073-114xx specialization standards. Most PHDs support only a single specialization such as the Blood Pressure or Pulse Oximeter specialization."
  * systemType ^short = "The specialization standard supported by the PHD."
    * ^comment = "The IEEE 11073-10101 specialization code from a System-Type-Spec-List[i].type."
    * coding 1..
    * coding from http://hl7.org/fhir/uv/phd/ValueSet/DeviceTypes11073MDC (required)
  * version 1..
    * ^short = "The version of the specialization standard supported by the PHD from the System-Type-Spec-List[i].version"
    * ^comment = "The version of the specialization comes from the System-Type-Spec-List specialization entry. If a PHD supports multiple versions of the same specialization a separate Device.specialization entry is needed where the systemType elements are repeated. If the PHD reports a generic specialization (using MDC_DEV_SPEC_PROFILE_HYDRA or MDC_DEV_SPEC_PROFILE_GENERIC), the version is the 11073-10206 version."
* version ^short = "A PHD may report firmware, hardware, software, internal protocol, nomenclature and ACOM versions."
  * ^comment = "There are several versions that are reported from a PHD. Firmware, Hardware, Protocol (internal, not IEEE 11073-10206), and Software versions come from the System Information object. The nomenclature and ACOM version comes from the ACOM base class. PHDs compliant to this IG report at least one of these versions. A separate version entry is needed for each of the versions reported by the PHD."
* version ^slicing.discriminator[0].type = #value
  * ^slicing.discriminator[=].path = "type"
  * ^slicing.rules = #open
* version contains MDCType 1..*
* version[MDCType] ^short = "Required MDC device version type entry"
  * type from MDCDeviceVersionTypes (required)
  * value ^short = "The version"
  * component ..0
* property ^slicing.discriminator[0].type = #value
  // * ^slicing.discriminator[=].path = "type.coding.code"
  * ^slicing.discriminator[=].path = "type"
  * ^slicing.rules = #open
* property contains
    timeSyncProperty 0..1 and
    continuaCertProperty 0..* and
    clockBitProperty 0..* and
    isRegulatedProperty 0..1 and
    clockResolutionProperty 0..1 //and
    //clockTypeProperty 0..1 and
    //powerSourceProperty 0..1 and

* property[timeSyncProperty] ^short = "Time synchronization method"
  * ^definition = "This element represents the time synchronization method used by the PHD. It is an MDC coded value."
  * ^comment = "The clock set method is a required attribute in the IEEE 11073-10206 standard. It is also supported by Bluetooth Low Energy ETS and GHS specifications. Strictly speaking, the time synchronization method is not a property of the PHD but rather a property of the PHG. However, it is included here as it is a required attribute in the IEEE 11073-10206 standard and is often used by the PHG to determine how to set the time on the PHD. In most cases it reflects the time synchronization method used to set the PHG's clock and strictly speaking it should not be reported as a static device property, but as part of a coincident timestamp."
  * type = Mdc#68220 // MDC_TIME_SYNC_PROTOCOL
  * valueCode ..1
    * coding 1..*
    * coding from http://hl7.org/fhir/uv/phd/ValueSet/MDCTimeSyncMethods (extensible)

* property[continuaCertProperty] ^short = "Continua certified PHD interfaces (from IEEE 11073-20601)"
  * ^definition = "This element represents a Continua certified interface that is supported by the PHD. It is an MDC coded value."
  * type = Mdc#532353 // MDC_REG_CERT_DATA_CONTINUA_CERT_DEV_LIST
  * valueCode ..1
  * valueCode from http://hl7.org/fhir/uv/phd/ValueSet/ContinuaPHDInterfaces (extensible)

* property[clockBitProperty] ^short = "Boolean Properties reported by the Clock"
  * ^definition = "For each Boolean clock capability reported by a PHD a property element is used."
  * type from ASN1ClockBits (required)
    * ^short = "Tells what the clock capability item is"
    * ^definition = "One of the capabilities of the clock as reported by the PHD."
  * valueQuantity ..0
  * valueCode 1..1
    * coding // from http://terminology.hl7.org/ValueSet/v2-0136 (required)
      * system 1..
      * system = "http://terminology.hl7.org/CodeSystem/v2-0136" (exactly)
      * code 1..
        * ^definition = "If bit is set, code contains Y if cleared, N"

* property[clockResolutionProperty] ^short = "Clock Resolution as reported by the PHD"
  * ^definition = "For each Boolean clock capability reported by a PHD a property element is used."
  * type from MDCClockResolutionTypes (required)
    * ^short = "Tells what the clock resolution type is"
    * ^definition = "The resolution of the clock as reported by the PHD."
  * valueQuantity 1..1
    * ^definition = "The value. All the time fields are scaled to microseconds"
    * system 1..
    * system = "http://unitsofmeasure.org" (exactly)
    * code = UCUM#us
      * ^definition = "The UCUM code (for microseconds it is 'us')"

* property[isRegulatedProperty] ^short = "Regulatory status of the PHD"
  * ^definition = "This element represents the regulatory status of the PHD."
  * type = ASN1ToHL7#532354.0
    * ^short = "Negated regulatory status of the PHD"
    * ^definition = "This element represents the negated regulatory status of the PHD."
  * valueQuantity ..0
  * valueCode 1..1
    * coding // from http://terminology.hl7.org/ValueSet/v2-0136 (required)
      * system 1..
      * system = "http://terminology.hl7.org/CodeSystem/v2-0136" (exactly)
      * code 1..
        * ^definition = "If bit is set, the device is not regulated. If cleared, the device is regulated."

// * property[quantitiesProperty] ^short = "The device properties represented by quantities such as clock resolution"
//   * ^definition = "This element represents all those time properties that are a quantity such as the various clock resolutions and synchronization accuracy."
//   * ^comment = "If the PHD reports that one of these given properties are unknown, this element shall not be populated for that property."
//   * type from $Quantity11073MDC (required)
//     * ^short = "The type of time quantity"
//     * coding ^slicing.discriminator[0].type = #value
//       * ^slicing.discriminator[=].path = "system"
//       * ^slicing.rules = #open
//     * coding contains MDCType 1..1
//     * coding[MDCType] ^short = "The 11073-10101 MDC code for the type"
//       * system 1..
//       * system = "urn:iso:std:iso:11073:10101" (exactly)
//       * code 1..
//         * ^definition = "The MDC code representing the property"
//         * ^comment = "Currently PHDs support the reporting of the time quantities as shown in the Table. More may be added in the future\r\n\r\n       Description                        CODE            Reference Identifier\r\n       ------------------------------------------------------------------------------------\r\n       Absolute clock resolution         68222            MDC_TIME_RES_ABS\r\n       Base-offset clock resolution      68226            MDC_TIME_RES_BO\r\n       Relative time resolution          68223            MDC_TIME_RES_REL\r\n       Hi Res relative time resolution   68224            MDC_TIME_RES_REL_HI_RES\r\n       Time sync accuracy                68221            MDC_TIME_SYNC_ACCURACY\r\n       Tick Resolution                   68229            MDC_ATTR_TICK_RES\r\n"
//     * text ^definition = "It is recommended to display at least the MDC reference identifier for the MDC code"
//   * valueQuantity 1..1
//     * ^definition = "The value. All the time fields are scaled to microseconds"
//     * system 1..
//     * system = "http://unitsofmeasure.org" (exactly)
//       * ^definition = "The unit code shall use the UCUM system"
//     * code 1..
//     * code = #us (exactly)
//       * ^definition = "The UCUM code (for microseconds it is 'us')"
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
//         * ^comment = "Currently PHDs support the reporting of one of the coded lists as shown in the Table. More may be added in the future\r\n\r\n       Description                CODE    Reference Identifier                           Code System\r\n       -----------------------------------------------------------------------------------------------------------------------------------\r\n    Time synchronization      68220    MDC_TIME_SYNC_PROTOCOL\r       Certified PHD interfaces  532353   MDC_REG_CERT_DATA_CONTINUA_CERT_DEV_LIST       http://hl7.org/fhir/uv/phd/CodeSystem/ContinuaPHDCS\r\n"
//     * text ^definition = "It is recommended to display at least the MDC reference identifier for the code"
//   * valueQuantity ..0
//   * valueCode 1..
//     * ^short = "There shall be one valueCode entry for every item supported by the PHG in the list"
//     * coding 1..
//       * system 1..
//         * ^definition = "Either the http://hl7.org/fhir/uv/phd/CodeSystem/ContinuaPHDCS or urn:iso:std:iso:11073:10101 code systems"
//       * code 1..
//         * ^definition = "One of the Continua interface certification codes"

Mapping: IEEE-11073-10206-PhdDevice
Id: IEEE-11073-10206-PhdDevice
Title: "IEEE-11073-10206 ACOM PHD to FHIR Device"
Source: PhdDevice
Target: "https://sagroups.ieee.org/11073/phd-wg"
* -> "ACOM PHD"
* identifier.value -> "SystemInfo.system-identifier"
* specialization[MDCType].systemType.coding.code -> "System-Type-Spec-List[i].type"
* specialization[MDCType].version -> "System-Type-Spec-List[i].version"
* manufacturer -> "SystemInfo.system-manufacturer"
* serialNumber -> "SystemInfo.serial-number"
* modelNumber -> "SystemInfo.system-model-number"
* version[MDCType].type -> "MDC Device Version Type code for Firmware-, Hardware-, Software-, Continua-version"
* version[MDCType].value -> "SystemInfo.firmware-, hardware-, software-revision, Continua-version"
* property[timeSyncProperty].valueCode.coding.code -> "Clock.clock-set-method"
* property[continuaCertProperty].valueCode.coding.code -> "Continua-cert-dev-list (from IEEE 11073-20601)"
* property[clockBitProperty].type -> "clock-capability as ASN1ToHL7 code"
* property[clockBitProperty].valueCode.coding.code -> "Y if supported, N if not supported"
* udiCarrier[PhdProvidedUdi].carrierHRF -> "SystemInfo.udi-label"

