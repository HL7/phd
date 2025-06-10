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
  * ^comment = "This profile applies to PHDs that adhere to the IEEE 11073-10206 standard or that can be mapped to it. The profile is based on the Device resource and contains additional elements that are specific to PHDs."
* identifier 1..
* identifier ^slicing.discriminator[0].type = #value
  * ^slicing.discriminator[=].path = "type.coding.system"
  * ^slicing.discriminator[+].type = #value
  * ^slicing.discriminator[=].path = "type.coding.code"
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
    * coding ^slicing.discriminator[0].type = #value
      * ^slicing.discriminator[=].path = "system"
      * ^slicing.discriminator[+].type = #value
      * ^slicing.discriminator[=].path = "code"
      * ^slicing.rules = #open
    * coding contains SYSID 1..1
    * coding[SYSID] ^short = "IEEE 11073-10206 System Id code system"
      * ^definition = "The IEEE 11073-10206 System Id code system coding"
      * system 1..
      * system = "http://hl7.org/fhir/uv/phd/CodeSystem/ContinuaDeviceIdentifiers" (exactly)
      * code = #SYSID (exactly)
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
    * coding ^slicing.discriminator[0].type = #value
      * ^slicing.discriminator[=].path = "system"
      * ^slicing.discriminator[+].type = #value
      * ^slicing.discriminator[=].path = "code"
      * ^slicing.rules = #open
    * coding contains BTMAC 1..1
    * coding[BTMAC] ^short = "Bluetooth MAC address code system"
      * ^definition = "The Bluetooth Mac address code system coding"
      * system = "http://hl7.org/fhir/uv/phd/CodeSystem/ContinuaDeviceIdentifiers" (exactly)
      * code = #BTMAC (exactly)
  * system 1..
  * system = "http://hl7.org/fhir/sid/eui-48/bluetooth" (exactly)
  * value 1..
    * ^definition = "The Bluetooth MAC as an EUI-48 such as 00-E5-DE-AD-77-C3. "
    * ^comment = "Transport addresses are supposed to be unique for a given device."
* identifier[macAddressIdentifier] ^short = "MAC Transport address identifier"
  * ^definition = "This entry contains the MAC transport address."
  * ^alias = "MAC Transport address"
  * type 1..
    * coding ^slicing.discriminator[0].type = #value
      * ^slicing.discriminator[=].path = "system"
      * ^slicing.discriminator[+].type = #value
      * ^slicing.discriminator[=].path = "code"      
      * ^slicing.rules = #open
    * coding contains ETHMAC 1..1
    * coding[ETHMAC] ^short = "Ethernet MAC address code system"
      * ^definition = "The Ethernet MAC address code system coding"
      * system = "http://hl7.org/fhir/uv/phd/CodeSystem/ContinuaDeviceIdentifiers" (exactly)
      * code = #ETHMAC (exactly)
  * system 1..
  * system = "http://hl7.org/fhir/sid/eui-48/ethernet" (exactly)
  * value 1..
    * ^definition = "The MAC as an EUI-48 such as 00-E5-DE-AD-77-C8. "
    * ^comment = "Transport addresses are supposed to be unique for a given device."
* manufacturer 1..
  * ^short = "Manufacturer name from SystemInfo.system-manufacturer"
  * ^definition = "The manufacturer name as reported in the IEEE 11073-10206 SystemInfo."
  * ^comment = "The system manufacturer attribute is required by the IEEE 11073-10206 specification"
* serialNumber ^short = "Serial number from the SystemInfo.serial-number"
  * ^definition = "The serial number as reported by the IEEE 11073-10206 SystemInfo."
  * ^comment = "The serial number is optional in the 11073-10206 specification. The serial number shall be present if the PHD reports it."
* modelNumber 1..
  * ^short = "Model number from SystemInfo.model-number"
  * ^definition = "The model number as reported by the SystemInfo attribute."
  * ^comment = "The model number attribute is required by the IEEE 11073-10206 specification"
* type 1..
  * ^short = "Indicates the device is a PHD."
  * coding ^slicing.discriminator[0].type = #value
    * ^slicing.discriminator[=].path = "system"
    * ^slicing.rules = #open
  * coding contains MDCType 1..1
  * coding[MDCType] ^short = "Required MDC code system entry"
    * ^definition = "The IEEE 11073-10101 code for the PHD simple MDS."
    * system = "urn:iso:std:iso:11073:10101" (exactly)
      * ^short = "Identifies IEEE 11073-10101 coding system"
      * ^definition = "This value identifies the IEEE 11073-10101 coding system"
    * code = #65573 (exactly)
      * ^short = "Indicates PHD"
      * ^definition = "The code for a Simple MDS indicating that this unit is a personal health device"
    * ^comment = "It is suggested that the display element contains the reference identfier for Simple MDS 'MDC_MOC_VMS_MDS_SIMP'."
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
    * ^comment = "The 11073-10101 specialization code from a System-Type-Spec-List[i].type."
    * coding 1..
    * coding from http://hl7.org/fhir/uv/phd/ValueSet/DeviceTypes11073MDC (required)
  * version 1..
    * ^short = "The version of the specialization standard supported by the PHD from the System-Type-Spec-List[i].version"
    * ^comment = "The version of the specialization comes from the System-Type-Spec-List specialization entry. If a PHD supports multiple versions of the same specialization a separate Device.specialization entry is needed where the systemType elements are repeated. If the PHD reports a generic specialization (using MDC_DEV_SPEC_PROFILE_HYDRA or MDC_DEV_SPEC_PROFILE_GENERIC), the version is the 11073-10206 version."
* version ^short = "A PHD may report firmware, hardware, software, internal protocol, nomenclature and ACOM versions."
  * ^comment = "There are several versions that are reported from a PHD. Firmware, Hardware, Protocol (internal, not 11073-10206), and Software versions come from the System Information object. The nomenclature and ACOM version comes from the ACOM base class. PHDs compliant to this IG report at least one of these versions. A separate version entry is needed for each of the versions reported by the PHD."
* version ^slicing.discriminator[0].type = #value
  * ^slicing.discriminator[=].path = "type.coding"
  * ^slicing.rules = #open
* version contains MDCType 1..*
* version[MDCType] ^short = "Required MDC device version type entry"
  * type.coding from MDCDeviceVersionTypes
  * value ^short = "The version"
  * component ..0
* property ^slicing.discriminator[0].type = #value
  * ^slicing.discriminator[=].path = "type.coding.code"
  * ^slicing.rules = #open
* property contains
    timeSyncProperty 0..1 and
    continuaCertProperty 0..* and
    bitProperty 0..* //and
    //clockResolutionProperty 0..1 and
    //clockTypeProperty 0..1 and
    //powerSourceProperty 0..1 and
* property[timeSyncProperty] ^short = "Time synchronization method"
  * ^definition = "This element represents the time synchronization method used by the PHD. It is an MDC coded value."
  * type.coding 1..1
    * system = "urn:iso:std:iso:11073:10101" (exactly)
    * code = Mdc#68220 (exactly) // MDC_TIME_SYNC_PROTOCOL
  * valueCode ..1
    * coding 1..*
    * coding from http://hl7.org/fhir/uv/phd/ValueSet/MDCTimeSyncMethods (extensible)

* property[continuaCertProperty] ^short = "Time synchronization method"
  * ^definition = "This element represents the time synchronization method used by the PHD. It is an MDC coded value."
  * type.coding 1..1
    * system = "urn:iso:std:iso:11073:10101" (exactly)
    * code = Mdc#532353 (exactly) // MDC_REG_CERT_DATA_CONTINUA_CERT_DEV_LIST
  * valueCode ..1
    * coding 1..*
    * coding from http://hl7.org/fhir/uv/phd/ValueSet/ContinuaPHDInterfaces (extensible)

* property[bitProperty] ^short = "Properties reported in BITs fields"
  * ^definition = "For each bit setting reported by a PHD a bitProperties element is used."
  * type from $ASN1DeviceBits (required)
    * ^short = "Tells what the BITs item is"
    * ^definition = "One of the capabilities reported in the Mds-Time-Info.mds-time-caps-state or Reg-Cert-Data-List.regulation-status field."
    * coding 1..1
      * ^short = "Required ASN1 code system entry"
      * system 1..
      * system = "http://hl7.org/fhir/uv/phd/CodeSystem/ASN1ToHL7" (exactly)
      * code 1..
      * code from $ASN1DeviceBits (required)
        * ^definition = "The ASN1 code made from the MDC code and the Mder bit position"
        * ^comment = "The MDC code for the mds-time-caps-state field is 68219. Thus the ASN1 code for the case 'device supports a relative time clock', Mder bit 2, would be 68219.2. For the regulation status field the MDC code is 532354, and only bit 0 is defined. However, the regulated status is when the bit is cleared and the unregulated status is when the bit is set. That choice can be confusing."
    * text ^definition = "It is recommended to display at least the ASN1 name for the given bit meaning"
  * valueQuantity ..0
  * valueCode 1..1
    * coding // from http://terminology.hl7.org/ValueSet/v2-0136 (required)
      * system 1..
      * system = "http://terminology.hl7.org/CodeSystem/v2-0136" (exactly)
      * code 1..
        * ^definition = "If bit is set, code contains Y if cleared, N"

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
* version[MDCType].type -> "Firmware-, Hardware-, Software-, ACOM-version (MDC Device Version Type)"
* version[MDCType].value -> "SystemInfo.firmware-, hardware-, software-revision, ACOM-version"
