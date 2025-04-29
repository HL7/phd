Alias: $DeviceTypes11073MDC = http://hl7.org/fhir/uv/phd/ValueSet/DeviceTypes11073MDC
Alias: $ASN1attribute = http://hl7.org/fhir/uv/phd/ValueSet/ASN1attribute
Alias: $Quantity11073MDC = http://hl7.org/fhir/uv/phd/ValueSet/Quantity11073MDC
Alias: $CodeableConcept11073MDC = http://hl7.org/fhir/uv/phd/ValueSet/CodeableConcept11073MDC

Profile: PhgDevice
Parent: Device
Id: PhgDevice
Description: "Profile for the Device Resource for a PHG"
* ^meta.lastUpdated = "2017-10-16T05:10:49.894-04:00"
* ^version = "1.0.0"
* ^date = "2017-07-07T11:39:51.3383228-04:00"
* ^purpose = "This resource describes the primary features of the Personal Health Gateway (PHG). A PHG does not have any 11073 Objects or attributes though it is required to have an IEEE EUI-64 system identifier. However, for the purposes of reporting the information about the PHG entity, it is treated as if it has an MDS with attributes. For PCHA, the quantities that are required to be reported is the EUI-64 system identifier, the time synchronization method, the manufacturer and model number (of the software, not necessarily the hardware on which the application resides), the regulation status, and the PCHA certified interfaces."
* . ^definition = "The characteristics, operational status and capabilities of the PHG."
* identifier ^slicing.discriminator[0].type = #value
  * ^slicing.discriminator[=].path = "type.coding.system"
  * ^slicing.discriminator[+].type = #value
  * ^slicing.discriminator[=].path = "type.coding.code"
  * ^slicing.rules = #open
  * ^short = "Information that uniquely describes the personal health device"
  * ^definition = "The assigned unique identification of the device that is semantically meaningful outside of the FHIR resource context. An example would be the IEEE EUI-64 System-Id or transport address. For PHDs the systemIdentifier is required and the transportAddressIdentifier is highly recommended as this is what most end users see and can obtain from the device itself or device packaging."
  * ^alias = "11073-10206 System id, transport address, etc."
* identifier contains
    systemIdIdentifier 1..1 and
    btmacAddressIdentifier 0..1 and
    macAddressIdentifier 0..1
* identifier[systemIdIdentifier] ^short = "System Id identifier"
  * ^definition = "This entry contains the IEEE EUI-64. If absent (bad device) set to all zeros."
  * ^alias = "11073-10206 System id"
  * type 1..
    * coding 1..1
      * ^short = "Indicates this is the IEEE 11073 System Id identifier"
      * system 1..
      * system = "http://hl7.org/fhir/uv/phd/CodeSystem/ContinuaDeviceIdentifiers" (exactly)
      * code 1..
      * code = #SYSID (exactly)
  * system 1..
  * system = "urn:oid:1.2.840.10004.1.1.1.0.0.1.0.0.1.2680" (exactly)
    * ^short = "EUI-64 system identifier"
    * ^definition = "Identifies the system as an IEEE EUI."
  * value 1..
    * ^short = "System id value from System-Id attribute"
    * ^definition = "The System id from the System-Id attribute as an 8-byte HEX string where each byte is separated by dashes, for example FE-ED-AB-EE-DE-AD-77-C3. "
    * ^comment = "The formatting is specified in the IEEE document Guidelines for 64-bit Global Identifier.\r\n\r\nTo allow the mapping of non-compliant proprietary devices that do not provide a system id, the value is set to all zeros in the same format, 00-00-00-00-00-00-00-00"
* identifier[btmacAddressIdentifier] ^short = "Bluetooth MAC Transport address identifier"
  * ^definition = "This entry contains the Bluetooth MAC transport address."
  * ^alias = "Bluetooth MAC Transport address"
  * type 1..
    * coding 1..1
      * ^short = "Indicates this is the Bluetooth Mac address identifier"
      * system 1..
      * system = "http://hl7.org/fhir/uv/phd/CodeSystem/ContinuaDeviceIdentifiers" (exactly)
      * code 1..
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
    * coding 1..1
      * ^short = "Indicates this is the Mac address identifier"
      * system 1..
      * system = "http://hl7.org/fhir/uv/phd/CodeSystem/ContinuaDeviceIdentifiers" (exactly)
      * code 1..
      * code = #ETHMAC (exactly)
  * system 1..
  * system = "http://hl7.org/fhir/sid/eui-48/ethernet" (exactly)
  * value 1..
    * ^definition = "The MAC as an EUI-48 such as 00-E5-DE-AD-77-C8. "
    * ^comment = "Transport addresses are supposed to be unique for a given device."
* manufacturer ^short = "Manufacturer name"
  * ^definition = "The manufacturer name."
* serialNumber ^short = "Serial number"
* modelNumber ^short = "Model number"
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
      * ^definition = "The code for a PHG indicating that this unit is a personal health device"
  * text ^definition = "A human readable display descrbing the meaning of the code."
    * ^comment = "It is suggested that this element contain the reference identifier for a PHG 'MDC_MOC_VMS_MDS_AHD'."
* specialization ^slicing.discriminator[0].type = #value
  * ^slicing.discriminator[=].path = "systemType.coding"
  * ^slicing.rules = #open
  * ^short = "This element contains an entry for each supported specialization or a generic representation."
* specialization contains MDCType 1..*
* specialization[MDCType] ^short = "The specialization(s) supported by the PHG."
  * ^definition = "The specialization(s) supported by the PHG. This element contains an entry for each supported specialization."
  * systemType ^short = "The specialization standard supported by the PHD."
    * coding 1..
    * coding from $DeviceTypes11073MDC (required)
  * version 1..
    * ^short = "The version of the specialization standard supported by the PHG."
* version 1..
  * ^short = "A firmware, hardware, software, internal protocol may be reported for a PHG. A Continua version shall be reported."
  * type 1..
    * coding ^slicing.discriminator[0].type = #value
      * ^slicing.discriminator[=].path = "system"
      * ^slicing.rules = #open
    * coding contains MDCType 1..1
    * coding[MDCType] ^short = "Required MDC code system entry"
      * system 1..
      * system = "urn:iso:std:iso:11073:10101" (exactly)
        * ^short = "Indicates the codes come from the MDC coding system"
      * code 1..
        * ^short = "A code indicating the type of version the Device.version.value refers to."
        * ^comment = "The currently defined version codes used in this element are as shown in the Table. More than one of these versions may be indicated for the PHG. Each version reported by the PHG shall be encoded.\r\n\r\n       Description                   CODE             Reference Identifier\r\n       ------------------------------------------------------------------------------------\r\n       Hardware revision            531974            MDC_ID_PROD_SPEC_HW\r\n       Software revision            531975            MDC_ID_PROD_SPEC_SW\r\n       Firmware revision            531976            MDC_ID_PROD_SPEC_FW\r\n       Protocol                     531977            MDC_ID_PROD_SPEC_PROTOCOL\r\n       Continua version             532352            MDC_REG_CERT_DATA_CONTINUA_VERSION\r\n       The Continua version comes from the Continua Reg-Cert-Data-List attribute\r\n"
  * value ^short = "The version"
* property 1..
  * ^slicing.discriminator[0].type = #value
  * ^slicing.discriminator[=].path = "type"
  * ^slicing.rules = #open
* property contains
    bitProperties 0..* and
    quantitiesProperty 0..* and
    codedListProperties 0..*
* property[bitProperties] ^short = "Properties reported in BITs fields"
  * ^definition = "For each bit setting reported a BITs value, a bitProperties element is used."
  * ^comment = "A BITs measurement is a 16 or 32-bit ASN1 BITs value where each bit means something. "
  * type from $ASN1attribute (required)
    * ^short = "Tells what the BITs item is"
    * ^definition = "One of the capabilities reported in the Mds-Time-Info.mds-time-caps-state or Reg-Cert-Data-List.regulation-status field."
    * ^comment = "Only set 'event' types need be reported. Both set and cleared 'state' types need to be reported. The regulation status is as state type. All time capabilities are event types"
    * coding 1..1
      * ^short = "Required ASN1 code system entry"
      * system 1..
      * system = "http://hl7.org/fhir/uv/phd/CodeSystem/ASN1ToHL7" (exactly)
      * code 1..
        * ^definition = "The ASN1 code made from the code and the Mder bit position"
        * ^comment = "The MDC code for the regulation status field is 532354, and only bit 0 is defined. However, the regulated status is when the bit is cleared and the unregulated status is when the bit is set. That choice can be confusing. One could enter some fields of the time capabilities attribute if desired."
    * text ^definition = "It is recommended to display at least the ASN1 name for the given bit meaning"
  * valueQuantity ..0
  * valueCode 1..1
    * coding ^slicing.discriminator[0].type = #value
      * ^slicing.discriminator[=].path = "system"
      * ^slicing.rules = #open
    * coding contains V2Binary 1..1
    * coding[V2Binary] ^short = "Required V2 Binary code system entry"
      * system 1..
      * system = "http://terminology.hl7.org/CodeSystem/v2-0136" (exactly)
      * code 1..
        * ^definition = "If bit is set, code contains Y if cleared, N"
* property[quantitiesProperty] ^short = "The PHG properties represented by quantities such as time synchronization accuracy"
  * ^definition = "This element represents all those time properties that are a quantity such as the time synchronization accuracy."
  * ^comment = "For a PHG the synchronization accuracy should be reported if known."
  * type from $Quantity11073MDC (required)
    * ^short = "The type of time quantity"
    * coding 1..
      * ^short = "Required MDC code system entry"
      * system 1..
      * system = "urn:iso:std:iso:11073:10101" (exactly)
      * code 1..
        * ^definition = "The MDC code representing the property"
        * ^comment = "For PHG only the time sync accuracy is of interest.\r\n\r\n       Description                        CODE            Reference Identifier\r\n       ------------------------------------------------------------------------------------\r\n       Absolute clock resolution         68222            MDC_TIME_RES_ABS\r\n       Base-offset clock resolution      68226            MDC_TIME_RES_BO\r\n       Relative time resolution          68223            MDC_TIME_RES_REL\r\n       Hi Res relative time resolution   68224            MDC_TIME_RES_REL_HI_RES\r\n       Time sync accuracy                68221            MDC_TIME_SYNC_ACCURACY\r\n"
    * text ^definition = "It is recommended to display at least the MDC reference identifier for the code"
  * valueQuantity 1..1
    * ^definition = "The value of the reported quantity."
  * valueCode ..0
* property[codedListProperties] ^short = "The device properties represented by a list of codes such as the list of certified PHD or H-FS interfaces"
  * ^definition = "This element represents all those properties that are a list of codes. At the moment there is only certified PHD interfaces."
  * ^comment = "Continua certified PHDs are required to have these entries."
  * type from $CodeableConcept11073MDC (required)
    * ^short = "What the coded list is"
    * coding 1..
      * ^short = "Required MDC code system entry"
      * system 1..
      * system = "urn:iso:std:iso:11073:10101" (exactly)
      * code 1..
        * ^definition = "The MDC code representing the property"
        * ^comment = "Currently PHDs support the reporting of one of the coded lists as shown in the Table. More may be added in the future\r\n\r\n       Description                CODE    Reference Identifier                           Code System\r\n       -----------------------------------------------------------------------------------------------------------------------------------\r\n    Time synchronization      68220    MDC_TIME_SYNC_PROTOCOL\r       Certified PHD interfaces  532353   MDC_REG_CERT_DATA_CONTINUA_CERT_DEV_LIST       http://hl7.org/fhir/uv/phd/CodeSystem/ContinuaPHD\r\n       Certified HFS interfaces  532355   MDC_REG_CERT_DATA_CONTINUA_AHD_CERT_DEV_LIST   http://hl7.org/fhir/uv/phd/CodeSystem/ContinuaHFS\r\n"
    * text ^definition = "It is recommended to display at least the MDC reference identifier for the code"
  * valueQuantity ..0
  * valueCode 1..
    * ^short = "There shall be one valueCode entry for every item supported by the PHG in the list"
    * coding 1..
      * system 1..
        * ^definition = "Either the http://hl7.org/fhir/uv/phd/CodeSystem/ContinuaPHD or http://hl7.org/fhir/uv/phd/CodeSystem/ContinuaHFS or urn:iso:std:iso:11073:10101 code systems"
      * code 1..
        * ^definition = "One of the Continua interface certification codes"