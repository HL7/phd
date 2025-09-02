Alias: $DeviceTypes11073MDC = http://hl7.org/fhir/uv/phd/ValueSet/DeviceTypes11073MDC
Alias: $ASN1DeviceBits = http://hl7.org/fhir/uv/phd/ValueSet/ASN1DeviceBits

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
  * type = http://terminology.hl7.org/CodeSystem/ContinuaDeviceIdentifiers#SYSID
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
  * type = http://terminology.hl7.org/CodeSystem/ContinuaDeviceIdentifiers#BTMAC
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
  * type = http://terminology.hl7.org/CodeSystem/ContinuaDeviceIdentifiers#ETHMAC
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
    * ^definition = "The MDC code for the PHG"
    * system 1..
    * system = "urn:iso:std:iso:11073:10101" (exactly)
      * ^short = "Identifies IEEE 11073-10101 coding system"
      * ^definition = "This value identifies the IEEE 11073-10101 coding system"
    * code 1..
    * code = #531981 (exactly)
      * ^short = "Indicates PHG"
      * ^definition = "MDC code indicating that this unit is a personal health gateway (PHG)."
* conformsTo ^slicing.discriminator[0].type = #value
  * ^slicing.discriminator[=].path = "systemType.coding"
  * ^slicing.rules = #open
  * ^short = "This element contains an entry for each supported specialization or a generic representation."
* conformsTo contains MDCType 1..*
* conformsTo[MDCType] ^short = "The specialization(s) supported by the PHG."
  * ^definition = "The specialization(s) supported by the PHG. This element contains an entry for each supported specialization."
  * specification ^short = "The specialization standard supported by the PHG."
    * coding 1..
    * coding from $DeviceTypes11073MDC (required)
* deviceVersion ^short = "A PHG may report firmware, hardware, software, internal protocol, nomenclature and ACOM versions."
  * ^comment = "There are several versions that may be reported by a PHG. PHGs compliant to this IG report at least one of these versions. A separate version entry is needed for each of the versions reported by the PHG."
* deviceVersion ^slicing.discriminator[0].type = #value
  * ^slicing.discriminator[=].path = "type.coding"
  * ^slicing.rules = #open
* deviceVersion contains MDCType 1..*
* deviceVersion[MDCType] ^short = "Required MDC device version type entry"
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
  * valueCodeableConcept ..1
    * coding 1..*
    * coding from http://hl7.org/fhir/uv/phd/ValueSet/MDCTimeSyncMethods (extensible)

* property[continuaCertPHDProperty] ^short = "Continua certified PHD interfaces (from IEEE 11073-20601)"
  * ^definition = "This element represents a Continua certified PHD interface that is supported by the PHG. It is an MDC coded value."
  * type = Mdc#532353 // MDC_REG_CERT_DATA_CONTINUA_CERT_DEV_LIST
  * valueCodeableConcept ..1
  * valueCodeableConcept from http://hl7.org/fhir/uv/phd/ValueSet/ContinuaPHDInterfaces (extensible)

* property[continuaCertPHGProperty] ^short = "Continua certified PHG interfaces"
  * ^definition = "This element represents a Continua certified PHG to HFS interface that is supported by the PHG. It is an MDC coded value."
  * type = Mdc#532355 // MDC_REG_CERT_DATA_CONTINUA_AHD_CERT_DEV_LIST
  * valueCodeableConcept ..1
  * valueCodeableConcept from http://hl7.org/fhir/uv/phd/ValueSet/ContinuaPHGInterfaces (extensible)

* property[clockBitProperty] ^short = "Boolean Properties reported by the Clock"
  * ^definition = "For each Boolean clock capability reported a `property` element is used."
  * type from ASN1ClockBits (required)
    * ^short = "Tells what the clock capability item is"
    * ^definition = "One of the capabilities of the clock as reportedD."
  * valueCodeableConcept 1..1
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
  * valueBoolean 1..1
    * ^definition = "If true, the device is not regulated. If false, the device is regulated."
