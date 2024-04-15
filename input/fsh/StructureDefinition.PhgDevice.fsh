Alias: $ASN1attribute = http://hl7.org/fhir/uv/phd/ValueSet/ASN1attribute
Alias: $Quantity11073MDC = http://hl7.org/fhir/uv/phd/ValueSet/Quantity11073MDC
Alias: $CodeableConcept11073MDC = http://hl7.org/fhir/uv/phd/ValueSet/CodeableConcept11073MDC

Profile: PhgDevice
Parent: Device
Id: PhgDevice
Description: "Base StructureDefinition for the Device Resource for a PHG"
* ^meta.lastUpdated = "2017-10-16T05:10:49.894-04:00"
* ^url = "http://hl7.org/fhir/uv/phd/StructureDefinition/PhgDevice"
* ^status = #draft
* ^date = "2017-07-07T11:39:51.3383228-04:00"
* ^purpose = "This resource describes the primary features of the Personal Health Gateway (PHG). A PHG does not have any 11073 Objects or attributes though it is required to have an IEEE EUI-64 system identifier. However, for the purposes of reporting the information about the PHG entity, it is treated as if it has an MDS with attributes. For PCHA, the quantities that are required to be reported is the EUI-64 system identifier, the time synchronization method, the manufacturer and model number (of the software, not necessarily the hardware on which the application resides), the regulation status, and the PCHA certified interfaces."
* . ^definition = "The characteristics, operational status and capabilities of the PHG."
* meta 1..
* meta.profile ^slicing.discriminator[0].type = #value
* meta.profile ^slicing.discriminator[=].path = "value"
* meta.profile ^slicing.rules = #open
* meta.profile contains phdProfile 1..1
* meta.profile[phdProfile] = "http://hl7.org/fhir/uv/phd/StructureDefinition/PhgDevice" (exactly)
* identifier ^slicing.discriminator[0].type = #value
* identifier ^slicing.discriminator[=].path = "type.coding.system"
* identifier ^slicing.discriminator[+].type = #value
* identifier ^slicing.discriminator[=].path = "type.coding.code"
* identifier ^slicing.rules = #open
* identifier ^short = "Information that uniquely describes the personal health device"
* identifier ^definition = "The assigned unique identification of the device that is semantically meaningful outside of the FHIR resource context. An example would be the IEEE EUI-64 System-Id or transport address. For PHDs the systemIdentifier is required and the transportAddressIdentifier is highly recommended as this is what most end users see and can obtain from the device itself or device packaging."
* identifier ^alias = "11073-20601 System id, transport address, etc."
* identifier contains
    systemIdIdentifier 1..1 and
    btmacAddressIdentifier 0..1 and
    macAddressIdentifier 0..1
* identifier[systemIdIdentifier] ^short = "System Id identifier"
* identifier[systemIdIdentifier] ^definition = "This entry contains the IEEE EUI-64. If absent (bad device) set to all zeros."
* identifier[systemIdIdentifier] ^alias = "11073-20601 System id"
* identifier[systemIdIdentifier].type 1..
* identifier[systemIdIdentifier].type.coding 1..1
* identifier[systemIdIdentifier].type.coding ^short = "Indicates this is the IEEE 11073 System Id identifier"
* identifier[systemIdIdentifier].type.coding.system 1..
* identifier[systemIdIdentifier].type.coding.system = "http://hl7.org/fhir/uv/phd/CodeSystem/ContinuaDeviceIdentifiers" (exactly)
* identifier[systemIdIdentifier].type.coding.code 1..
* identifier[systemIdIdentifier].type.coding.code = #SYSID (exactly)
* identifier[systemIdIdentifier].system 1..
* identifier[systemIdIdentifier].system = "urn:oid:1.2.840.10004.1.1.1.0.0.1.0.0.1.2680" (exactly)
* identifier[systemIdIdentifier].system ^short = "EUI-64 system identifier"
* identifier[systemIdIdentifier].system ^definition = "Identifies the system as an IEEE EUI."
* identifier[systemIdIdentifier].value 1..
* identifier[systemIdIdentifier].value ^short = "System id value from System-Id attribute"
* identifier[systemIdIdentifier].value ^definition = "The System id from the System-Id attribute as an 8-byte HEX string where each byte is separated by dashes, for example FE-ED-AB-EE-DE-AD-77-C3. "
* identifier[systemIdIdentifier].value ^comment = "The formatting is specified in the IEEE document Guidelines for 64-bit Global Identifier.\r\n\r\nTo allow the mapping of non-compliant proprietary devices that do not provide a system id, the value is set to all zeros in the same format, 00-00-00-00-00-00-00-00"
* identifier[btmacAddressIdentifier] ^short = "Bluetooth MAC Transport address identifier"
* identifier[btmacAddressIdentifier] ^definition = "This entry contains the Bluetooth MAC transport address."
* identifier[btmacAddressIdentifier] ^alias = "Bluetooth MAC Transport address"
* identifier[btmacAddressIdentifier].type 1..
* identifier[btmacAddressIdentifier].type.coding 1..1
* identifier[btmacAddressIdentifier].type.coding ^short = "Indicates this is the Bluetooth Mac address identifier"
* identifier[btmacAddressIdentifier].type.coding.system 1..
* identifier[btmacAddressIdentifier].type.coding.system = "http://hl7.org/fhir/uv/phd/CodeSystem/ContinuaDeviceIdentifiers" (exactly)
* identifier[btmacAddressIdentifier].type.coding.code 1..
* identifier[btmacAddressIdentifier].type.coding.code = #BTMAC (exactly)
* identifier[btmacAddressIdentifier].system 1..
* identifier[btmacAddressIdentifier].system = "http://hl7.org/fhir/sid/eui-48/bluetooth" (exactly)
* identifier[btmacAddressIdentifier].value 1..
* identifier[btmacAddressIdentifier].value ^definition = "The Bluetooth MAC as an EUI-48 such as 00-E5-DE-AD-77-C3. "
* identifier[btmacAddressIdentifier].value ^comment = "Transport addresses are supposed to be unique for a given device."
* identifier[macAddressIdentifier] ^short = "MAC Transport address identifier"
* identifier[macAddressIdentifier] ^definition = "This entry contains the MAC transport address."
* identifier[macAddressIdentifier] ^alias = "MAC Transport address"
* identifier[macAddressIdentifier].type 1..
* identifier[macAddressIdentifier].type.coding 1..1
* identifier[macAddressIdentifier].type.coding ^short = "Indicates this is the Mac address identifier"
* identifier[macAddressIdentifier].type.coding.system 1..
* identifier[macAddressIdentifier].type.coding.system = "http://hl7.org/fhir/uv/phd/CodeSystem/ContinuaDeviceIdentifiers" (exactly)
* identifier[macAddressIdentifier].type.coding.code 1..
* identifier[macAddressIdentifier].type.coding.code = #ETHMAC (exactly)
* identifier[macAddressIdentifier].system 1..
* identifier[macAddressIdentifier].system = "http://hl7.org/fhir/sid/eui-48/ethernet" (exactly)
* identifier[macAddressIdentifier].value 1..
* identifier[macAddressIdentifier].value ^definition = "The MAC as an EUI-48 such as 00-E5-DE-AD-77-C8. "
* identifier[macAddressIdentifier].value ^comment = "Transport addresses are supposed to be unique for a given device."
* manufacturer ^short = "Manufacturer name"
* manufacturer ^definition = "The manufacturer name."
* serialNumber ^short = "Serial number"
* modelNumber ^short = "Model number"
* type 1..
* type ^short = "Indicates the device is a PHG."
* type.coding ^slicing.discriminator[0].type = #value
* type.coding ^slicing.discriminator[=].path = "system"
* type.coding ^slicing.rules = #open
* type.coding contains MDCType 1..1
* type.coding[MDCType] ^short = "Required MDC code system entry"
* type.coding[MDCType] ^definition = "The MDC code for the PHG is a special value defined for V2 PCD-01."
* type.coding[MDCType].system 1..
* type.coding[MDCType].system = "urn:iso:std:iso:11073:10101" (exactly)
* type.coding[MDCType].system ^short = "Identifies IEEE 11073-10101 coding system"
* type.coding[MDCType].system ^definition = "This value identifies the IEEE 11073-10101 coding system"
* type.coding[MDCType].code 1..
* type.coding[MDCType].code = #531981 (exactly)
* type.coding[MDCType].code ^short = "Indicates PHG"
* type.coding[MDCType].code ^definition = "The code for a PHG indicating that this unit is a personal health device"
* type.text ^definition = "A human readable display descrbing the meaning of the code."
* type.text ^comment = "It is suggested that this element contain the reference identifier for a PHG 'MDC_MOC_VMS_MDS_AHD'."
* specialization ^short = "This element contains an entry for each supported specialization or a generic representation"
* specialization ^comment = "The significance of this entry is questionable. Clearly if the PHG encodes data from a PHD, it supports the specialization of that PHD."
* specialization.systemType ^short = "The specialization standard supported by the PHG."
* specialization.systemType.coding ^slicing.discriminator[0].type = #value
* specialization.systemType.coding ^slicing.discriminator[=].path = "system"
* specialization.systemType.coding ^slicing.rules = #open
* specialization.systemType.coding contains MDCType 1..1
* specialization.systemType.coding[MDCType] ^short = "Required MDC code system entry for specializations"
* specialization.systemType.coding[MDCType].system 1..
* specialization.systemType.coding[MDCType].system = "urn:iso:std:iso:11073:10101" (exactly)
* specialization.systemType.coding[MDCType].system ^short = "The 11073-10101 system identifier"
* specialization.systemType.coding[MDCType].code 1..
* specialization.systemType.coding[MDCType].code ^short = "The 11073-10101 specialization code. Generic indicates it supports all."
* specialization.version ^short = "The version of the specialization standard supported by the PHG"
* version 1..
* version ^short = "A firmware, hardware, software, internal protocol may be reported for a PHG. A Continua version shall be reported."
* version.type 1..
* version.type.coding ^slicing.discriminator[0].type = #value
* version.type.coding ^slicing.discriminator[=].path = "system"
* version.type.coding ^slicing.rules = #open
* version.type.coding contains MDCType 1..1
* version.type.coding[MDCType] ^short = "Required MDC code system entry"
* version.type.coding[MDCType].system 1..
* version.type.coding[MDCType].system = "urn:iso:std:iso:11073:10101" (exactly)
* version.type.coding[MDCType].system ^short = "Indicates the codes come from the MDC coding system"
* version.type.coding[MDCType].code 1..
* version.type.coding[MDCType].code ^short = "A code indicating the type of version the Device.version.value refers to."
* version.type.coding[MDCType].code ^comment = "The currently defined version codes used in this element are as shown in the Table. More than one of these versions may be indicated for the PHG. Each version reported by the PHG shall be encoded.\r\n\r\n       Description                   CODE             Reference Identifier\r\n       ------------------------------------------------------------------------------------\r\n       Hardware revision            531974            MDC_ID_PROD_SPEC_HW\r\n       Software revision            531975            MDC_ID_PROD_SPEC_SW\r\n       Firmware revision            531976            MDC_ID_PROD_SPEC_FW\r\n       Protocol                     531977            MDC_ID_PROD_SPEC_PROTOCOL\r\n       Continua version             532352            MDC_REG_CERT_DATA_CONTINUA_VERSION\r\n       The Continua version comes from the Continua Reg-Cert-Data-List attribute\r\n"
* version.value ^short = "The version"
* property 1..
* property ^slicing.discriminator[0].type = #value
* property ^slicing.discriminator[=].path = "type"
* property ^slicing.rules = #open
* property contains
    bitProperties 0..* and
    quantitiesProperty 0..* and
    codedListProperties 0..*
* property[bitProperties] ^short = "Properties reported in BITs fields"
* property[bitProperties] ^definition = "For each bit setting reported a BITs value, a bitProperties element is used."
* property[bitProperties] ^comment = "A BITs measurement is a 16 or 32-bit ASN1 BITs value where each bit means something. "
* property[bitProperties].type from $ASN1attribute (required)
* property[bitProperties].type ^short = "Tells what the BITs item is"
* property[bitProperties].type ^definition = "One of the capabilities reported in the Mds-Time-Info.mds-time-caps-state or Reg-Cert-Data-List.regulation-status field."
* property[bitProperties].type ^comment = "Only set 'event' types need be reported. Both set and cleared 'state' types need to be reported. The regulation status is as state type. All time capabilities are event types"
* property[bitProperties].type.coding 1..1
* property[bitProperties].type.coding ^short = "Required ASN1 code system entry"
* property[bitProperties].type.coding.system 1..
* property[bitProperties].type.coding.system = "http://hl7.org/fhir/uv/phd/CodeSystem/ASN1ToHL7" (exactly)
* property[bitProperties].type.coding.code 1..
* property[bitProperties].type.coding.code ^definition = "The ASN1 code made from the code and the Mder bit position"
* property[bitProperties].type.coding.code ^comment = "The MDC code for the regulation status field is 532354, and only bit 0 is defined. However, the regulated status is when the bit is cleared and the unregulated status is when the bit is set. That choice can be confusing. One could enter some fields of the time capabilities attribute if desired."
* property[bitProperties].type.text ^definition = "It is recommended to display at least the ASN1 name for the given bit meaning"
* property[bitProperties].valueQuantity ..0
* property[bitProperties].valueCode 1..1
* property[bitProperties].valueCode.coding ^slicing.discriminator[0].type = #value
* property[bitProperties].valueCode.coding ^slicing.discriminator[=].path = "system"
* property[bitProperties].valueCode.coding ^slicing.rules = #open
* property[bitProperties].valueCode.coding contains V2Binary 1..1
* property[bitProperties].valueCode.coding[V2Binary] ^short = "Required V2 Binary code system entry"
* property[bitProperties].valueCode.coding[V2Binary].system 1..
* property[bitProperties].valueCode.coding[V2Binary].system = "http://terminology.hl7.org/CodeSystem/v2-0136" (exactly)
* property[bitProperties].valueCode.coding[V2Binary].code 1..
* property[bitProperties].valueCode.coding[V2Binary].code ^definition = "If bit is set, code contains Y if cleared, N"
* property[quantitiesProperty] ^short = "The PHG properties represented by quantities such as time synchronization accuracy"
* property[quantitiesProperty] ^definition = "This element represents all those time properties that are a quantity such as the time synchronization accuracy."
* property[quantitiesProperty] ^comment = "For a PHG the synchronization accuracy should be reported if known."
* property[quantitiesProperty].type from $Quantity11073MDC (required)
* property[quantitiesProperty].type ^short = "The type of time quantity"
* property[quantitiesProperty].type.coding 1..
* property[quantitiesProperty].type.coding ^short = "Required MDC code system entry"
* property[quantitiesProperty].type.coding.system 1..
* property[quantitiesProperty].type.coding.system = "urn:iso:std:iso:11073:10101" (exactly)
* property[quantitiesProperty].type.coding.code 1..
* property[quantitiesProperty].type.coding.code ^definition = "The MDC code representing the property"
* property[quantitiesProperty].type.coding.code ^comment = "For PHG only the time sync accuracy is of interest.\r\n\r\n       Description                        CODE            Reference Identifier\r\n       ------------------------------------------------------------------------------------\r\n       Absolute clock resolution         68222            MDC_TIME_RES_ABS\r\n       Base-offset clock resolution      68226            MDC_TIME_RES_BO\r\n       Relative time resolution          68223            MDC_TIME_RES_REL\r\n       Hi Res relative time resolution   68224            MDC_TIME_RES_REL_HI_RES\r\n       Time sync accuracy                68221            MDC_TIME_SYNC_ACCURACY\r\n"
* property[quantitiesProperty].type.text ^definition = "It is recommended to display at least the MDC reference identifier for the code"
* property[quantitiesProperty].valueQuantity 1..1
* property[quantitiesProperty].valueQuantity ^definition = "The value of the reported quantity."
* property[quantitiesProperty].valueCode ..0
* property[codedListProperties] ^short = "The device properties represented by a list of codes such as the list of certified PHD or H-FS interfaces"
* property[codedListProperties] ^definition = "This element represents all those properties that are a list of codes. At the moment there is only certified PHD interfaces."
* property[codedListProperties] ^comment = "Continua certified PHDs are required to have these entries."
* property[codedListProperties].type from $CodeableConcept11073MDC (required)
* property[codedListProperties].type ^short = "What the coded list is"
* property[codedListProperties].type.coding 1..
* property[codedListProperties].type.coding ^short = "Required MDC code system entry"
* property[codedListProperties].type.coding.system 1..
* property[codedListProperties].type.coding.system = "urn:iso:std:iso:11073:10101" (exactly)
* property[codedListProperties].type.coding.code 1..
* property[codedListProperties].type.coding.code ^definition = "The MDC code representing the property"
* property[codedListProperties].type.coding.code ^comment = "Currently PHDs support the reporting of one of the coded lists as shown in the Table. More may be added in the future\r\n\r\n       Description                CODE    Reference Identifier                           Code System\r\n       -----------------------------------------------------------------------------------------------------------------------------------\r\n    Time synchronization      68220    MDC_TIME_SYNC_PROTOCOL\r       Certified PHD interfaces  532353   MDC_REG_CERT_DATA_CONTINUA_CERT_DEV_LIST       http://hl7.org/fhir/uv/phd/CodeSystem/ContinuaPHD\r\n       Certified HFS interfaces  532355   MDC_REG_CERT_DATA_CONTINUA_AHD_CERT_DEV_LIST   http://hl7.org/fhir/uv/phd/CodeSystem/ContinuaHFS\r\n"
* property[codedListProperties].type.text ^definition = "It is recommended to display at least the MDC reference identifier for the code"
* property[codedListProperties].valueQuantity ..0
* property[codedListProperties].valueCode 1..
* property[codedListProperties].valueCode ^short = "There shall be one valueCode entry for every item supported by the PHG in the list"
* property[codedListProperties].valueCode.coding 1..
* property[codedListProperties].valueCode.coding.system 1..
* property[codedListProperties].valueCode.coding.system ^definition = "Either the http://hl7.org/fhir/uv/phd/CodeSystem/ContinuaPHD or http://hl7.org/fhir/uv/phd/CodeSystem/ContinuaHFS or urn:iso:std:iso:11073:10101 code systems"
* property[codedListProperties].valueCode.coding.code 1..
* property[codedListProperties].valueCode.coding.code ^definition = "One of the Continua interface certification codes"