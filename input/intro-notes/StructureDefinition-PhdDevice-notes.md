### System Identifier
All IEEE 11073-10206 PHDs are required to have a system identifier. This usually is an EUI-64 consisting of 8 bytes. The EUI-64 is mapped to the Device.identifier.value element as a sequence of 8 2-digit bytes as HEX separated by dashes without the '0x' prefix commonly used in programming languages. An example of such a string is FE-ED-AB-EE-DE-AD-77-C3. Though required by IEEE 11073-10206, it is not required in the Bluetooth Low Energy health device specifications. When a PHG encounters such a device it shall provide a transport address as a means of uniquely identifying the PHD. Supported transport addresses are Bluetooth and ZigBee. The Bluetooth address is an EUI-48, and the ZigBee address is an EUI-64. These will be encoded as strings just as the EUI-64. Note that USB.vid (vendor id) and USB.pid (product id) are not unique and cannot be used as system identifiers. 

In order to discriminate between an identifier that is a system id and that which is a transport address the identifier.type element is used. A dedicated CodeSystem [Device Identifier Codes](CodeSystem-ContinuaDeviceIdentifiers.html) has the codes one can use to populate the identifier.type.coding.code element.

When in the future other system identifiers such as ETSI-ICCID (International Circuit Card Identifier) or other identifiers are used, this coding scheme will need to be extended.

The transport addresses are as follows:

<style>table, th, td {
border: 1px solid black;
border-collapse:collapse;
padding: 6px;}</style>

|transport|format|code|system|example|
|---|---|---|---|---|
|System Identifier|EUI-64|SYSID|urn:oid:1.2.840.10004.1.1.1.0.0.1.0.0.1.2680|FE-ED-AB-EE-DE-AD-77-C3|
|Bluetooth|EUI-48|BTMAC|http://hl7.org/fhir/sid/eui-48/bluetooth|00-E5-DE-AD-77-C3|
|ZigBee|EUI-64|ZIGBEE|http://hl7.org/fhir/sid/eui-64/zigbee|36-ED-9A-EE-DE-AD-77-C3|

An example of a system identifier is:
{% fragment Device/phd-74E8FFFEFF051C00.001C05FFE874 JSON EXCEPT:identifier %}

### Device.udiCarrier ###
The UDI is included as an optional attribute of a PHD in the IEEE 11073-10206 ACOM standard (and the older IEEE 11073-20601 standard). It is also supported in the Bluetooth SIG Device Information Service and the GHS Profile. The UDI elements supported are issuer, jurisdiction, Device Identifier, and the Human Readable Barcode String. The udiCarrier does have elements for each of these entries. There is no appropriate entryType code for this sourcing of the UDI in FHIR R4 and the code `unknown` should be used. In FHIR R5 the code `electronic-transmission` can be used.

The UDI of a device consists of a Device Identifier (DI) and a Production Identifier (PI). The DI is the part of the UDI that identifies the specific model of the device. The PI is used to identify the specific instance of the device, such as its serial number or lot number. When the PI includes a serial number it identifies a specific instance of the devices of the model as specified by the DI. 

### Device.type ###
The Device type is the same for all PHDs and it indicates that the device is a PHD. The details of what the PHD does is found in the Device.specializations element. The MDC code being used is 65573 (reference id MDC_MOC_VMS_MDS_SIMP). In IEEE 11073-10201 this code is described as indicating "a single-purpose medical device".

An example of a `Device.type` encoding is:
{% fragment Device/phd-74E8FFFEFF051C00.001C05FFE874 JSON EXCEPT:type %}

The display element is optional but is recommended.

### System Type Spec List
The System-Type-Spec-List attribute contains a list of specializations the PHD complies to. The elements in the list indicate not only what the PHD does, but that it does so in a manner specified in the specialization documents.  Each element in the list contains the specialization and its version. In most cases there is just one entry in the list.

The specialization is encoded as a 32-bit code, where the first 16 bits are the partition INFRA and the last 16 bits are the term code from System-Type-Spec-List.type. The version is encoded as a 16-bit number. The code and version are encoded in the Device.specialization element as follows:

{% fragment Device/phd-74E8FFFEFF051C00.001C05FFE874 JSON EXCEPT:specialization %}

The display element is optional but it is highly recommended that it be included and the reference id be in the description. 

The MDC_DEV_SPEC_PROFILE_GENERIC 'generic' device on the PHD side indicates that the device follows the IEEE 11073-10206 ACOM standard but not any specific specialization. On the PHG side it indicates that the PHG understands anything following the IEEE 11073-10206 standard. That would include all specializations since all specializations comply with the IEEE 11073-10206 standard.

### Manufacturer, System Model and Serial Number
The ACOM Manufacturer, System-Model and Serial Number attributes contains strings. The Device resource has stand-alone primitive elements for these fields to which these attributes are mapped. 

### Version or Revision information ###
The revision information provided by the PHD, such as the hardware-revision, is encoded in the Device.version element. The version information is provided as a list of versions, where each version has a type and a value. The type is encoded as an MDC code and the value is a string. The type codes are defined in the [MDC Device Version Type Codes ValueSet](ValueSet-MDCDeviceVersionTypes.html).

### Reg-Cert-Data-List ###
The Reg-Cert-Data-List can be provided by PHDs based on the IEEE 11073-20601 standard. It is not supported by the IEEE 11073-10206 ACOM standard. 
It contains the Continua version, list of certified PHD interfaces, and the regulation status. The Continua version is mapped to an additional Device.version element and the other two fields are mapped to a Device.property element.

#### Reg-Cert-Data-List Continua version
The Continua version code is reported using MDC code `532352` with reference Id `MDC_REG_CERT_DATA_CONTINUA_VERSION` and this is mapped to a Device.version element.

#### Reg-Cert-Data-List Continua Certified PHD interfaces
The Reg-Cert-Data-List attribute reports the list of Continua *certified* PHD (Personal Area Network) interfaces as a list of Continua-specified PHD interface codes. The Continua-specified certification codes obtained from the Reg-Cert-Data-List are a combination of a transport code and a device specialization code. See [the PHD Interface codes](CodeSystem-ContinuaPHDCS.html) for the list of possible codes.

The PHD interface codes are mapped to a list of properties where the property.valueCode element carries a single PHD interface code. The property.type element, which identifies the property, is given by the MDC code `532353`. Its reference id is `MDC_REG_CERT_DATA_CONTINUA_CERT_DEV_LIST`. 

#### Reg-Cert-Data-List Regulation Status
The regulation status element has MDC code `532354` and carries a 16-bit ASN1 BITs 'state' value (see [ASN1 To HL7 CodeSystem](CodeSystem-ASN1ToHL7.html)). Only bit 0 is defined. Being a state value, both set and cleared states are reported. In fact, it is the cleared state which represents that the device is regulated. The regulation status is mapped to an additional Device.property.valueCode element. 

A fragment:
{% fragment Device/phd-74E8FFFEFF051C00.001C05FFE874 JSON BASE:property.where(type.coding.code='532354') %}


### Mds-Time-Info
The Mds-Time-Info attribute is required on PHDs that support a real time clock of some type and report timestamps in their measurements. In Bluetooth Low Energy devices these properties must be inferred from other information like the Current Time Service. If the PHD does NOT report a timestamp in any of its measurements, there is no need to report the static time information ***EXCEPT*** that there is no time synchronization.

#### Time Capabilities
The Mds-Time-Info attribute has a 16-bit ASN1 BITs field for the time capabilities. They are mapped as follows:

|Mder Bit position	|IEEE.ASN1 Code	|ASN.1 name|static|Device.|
|-
|0  |68219.0	|mds-time-capab-real-time-clock|yes|property.type.coding.code="68219.0"|
|1	|68219.1	|mds-time-capab-set-clock|yes|property.type.coding.code="68219.1"|
|2	|68219.2	|mds-time-capab-relative-time|yes|property.type.coding.code="68219.2"|
|3	|68219.3	|mds-time-capab-high-res-relative-time|yes|property.type.coding.code="68219.3"|
|4	|68219.4	|mds-time-capab-sync-abs-time|yes|property.type.coding.code="68219.4"|
|5	|68219.5	|mds-time-capab-sync-rel-time|yes|property.type.coding.code="68219.5"|
|6	|68219.6	|mds-time-capab-sync-hi-res-relative-time|yes|property.type.coding.code="68219.6"|
|7	|68219.7	|mds-time-capab-bo-time|yes|property.type.coding.code="68219.7"|
|8	|68219.8	|mds-time-state-abs-time-synced|no||
|9	|68219.9	|mds-time-state-rel-time-synced|no||
|10	|68219.10	|mds-time-state-hi-res-relative-time-synced|no||
|11	|68219.11	|mds-time-mgr-set-time|no||
|12	|68219.12	|mds-time-capab-sync-bo-time|yes|property.type.coding.code="68219.12"|
|13	|68219.13	|mds-time-state-bo-time-synced|no||
|14	|68219.14	|mds-time-state-bo-time-UTC-aligned|yes|property.type.coding.code="68219.14"|
|15	|68219.15	|mds-time-dst-rules-enabled|yes|property.type.coding.code="68219.15"|

The required remaining property elements in each reported case are as follows:
 - property.type.coding.system="http://hl7.org/fhir/uv/phd/CodeSystem/ASN1ToHL7"
 - property.valueBoolean ="true" or "false" depending on the state of the Mder bit

Only the static fields shall be reported and all the static fields are treated as events thus they only need to be reported if set. Reporting cleared static states is optional.

#### Time Synchronization
The Mds-Time-Info.*time-sync-protocol* indicates the method of time synchronization which has one of the term code values in the following table:

|32-bit code|Reference identifier|	description	|partition:term code|
|-
|532224	|MDC_TIME_SYNC_NONE	|An uncalibrated and unsynchronized local clock source	|8::7936|
|532234	|MDC_TIME_SYNC_EBWW	|A manually set time, by ‘eyeball and wristwatch’	|8::7946|
|532225	|MDC_TIME_SYNC_NTPV3	|Network Time Protocol Version 3.0 (RFC 1305)	|8::7937|
|532226	|MDC_TIME_SYNC_NTPV4	|Network Time Protocol Version 4.0 (under dev)	|8::7938|
|532227	|MDC_TIME_SYNC_SNTPV4	|Simple Network Time Protocol v4 (RFC 2030)	|8::7939|
|532228	|MDC_TIME_SYNC_SNTPV4330	|Simple Network Time Protocol v4 (RFC 4330)	|8::7940|
|532229	|MDC_TIME_SYNC_BTV1	|Bluetooth Medical Device Profile	|8::7941|
|532235	|MDC_TIME_SYNC_USB_SOF	|Synced to the 1kHz USB "start-of-frame" clock|8::7947|
|532230	|MDC_TIME_SYNC_RADIO	|Atomic Clock synchronization through RF	|8::7942|
|532231	|MDC_TIME_SYNC_HL7_NCK	|Synchronized via Health Level 7 NCK (network clock)|8::7943|
|532232	|MDC_TIME_SYNC_CDMA	CDMA |mobile telecommunications synchronization	|8::7944|
|532233	|MDC_TIME_SYNC_GSM	|GSM - Network Identity and Time Zone (NITZ)	|8::7945|
|532236	|MDC_TIME_SYNC_OTHER	|A time sync method that has no known MDC code	|8::7948|
|532237	|MDC_TIME_SYNC_OTHER_MOBILE	|A time sync method based on other mobile network technology that is not listed above	|8::7949|
|532238	|MDC_TIME_SYNC_GPS	|A time sync method based on GPS information	|8::7950|

If the Mds-Time-Info.*time-sync-protocol* indicates some other value besides 7936 (no time synchronization) the uploader must look at the time capabilities bits 8, 9, 10, or 13 to see if the PHD actually *is* synchronized. If the time capabilities bits indicate that the PHD is synchronized, then the time synchronization method in Mds-Time-Info.*time-sync-protocol* is reported in the Device.property element. Otherwise the uploader reports that the PHD is unsynchronized.

The uploader maps the state of synchronization to the Device.property as follows:

 - Device.property.type.coding.code="68220"
 - Device.property.type.coding.system="urn.iso.std.iso:11073:10101"
 - Device.property.type.text="MDC_TIME_SYNC_PROTOCOL" *(optional)*
 - Device.property.valueCode.coding.code="*32-bit code for sync method*"
 - Device.property.valueCode.coding.system="urn.iso.std.iso:11073:10101"
 - Device.property.valueCode.text="*the ref id*"  *(optional)*

To date there are no PHDs that support an external time synchronization. However, many PHDs have the PHG set its time and PHGs are required to support an external time synchronization. The IEEE PHD WG is working on providing some means to indicate synchronization by the PHG. In lieu of that, a consumer can only infer that the PHG probably set the time on the PHG if 
 - the PHD indicates that set time is supported
 - the current time clock differences between the PHG and PHD are about 0.

#### Time Synchronization Accuracy
The time synchronization accuracy is given by the Mds-Time-Info.*time-sync-accuracy* field. *This value shall not be reported if the PHD reports a value of 0xFFFFFFFF which indicates unknown.* Otherwise the value reported is in units of 1/8<sup>th</sup> millisecond. When reported in the Device.property element it is scaled to microseconds. The mapping is as follows:
 - Device.property.type.coding.code="68221"
 - Device.property.type.coding.system="urn.iso.std.iso:11073:10101"
 - Device.property.type.text="MDC_TIME_SYNC_ACCURACY" *(optional)*
 - Device.property.valueQuantity.value="125 x Mds-Time-Info.*time-sync-accuracy*"
 - Device.property.valueQuantity.system="http://unitsofmeasure.org"
 - Device.property.valueQuantity.code="us"  (UCUM code for microseconds)

#### Time Resolution
The Mds-Time-Info attribute has three fields that report the resolution of its time clocks. 

The Mds-Time-Info.time-resolution-abs-time represents the resolution of the absolute-time clock when the sensor supports an absolute time clock. If the sensor supports a base-offset time clock it represents the resolution of the base-offset time clock. The sensor is not allowed to support both time clocks simultaneously during an association. Which time clock is supported is indicated by the settings of the Mder 0 and 7 bits of the time capabilities (Mds-Time-Info.mds-time-caps-state).

The sensor may additionally support both relative time clocks or just one or both of the relative time clocks without any ‘wall time’ clock. In practice, support of more than one real time clock at the same time is rare.

*If the respective time resolution has a value of 0, it indicates that the resolution is unknown and it shall not be reported.* In all other cases, the resolutions are reported.

All time resolution values shall be scaled to units of microseconds. When supporting absolute time, the Mds-Time-Info.time-resolution-abs-time is in units of 1/100th of a second. When supporting base-offset time, the Mds-Time-Info.time-resolution-abs-time is in units of 1/65536th of a second. In the base-offset case, the special value of 0xFFFF means one second. The Mds-Time-Info.time-resolution-rel-time is in units of 1/8th millisecond and the Mds-Time-Info.time-resolution-hi-res-relative-time is in units of microseconds.

Though not a part of the MdsTimeInfo attribute the Tick resolution attribute used for RR-intervals in the ECG specialization is also encoded as a property in this group. However its units are in cycles per second, such that a value as 1024 indicates 1024 cycles per second.

|Device.property element|value|
|-
|Device.property.type.coding.code|"68229" (Tick Resolution)|
|Device.property.type.coding.system|"urn.iso.std.iso:11073:10101"|
Device.property.type.text (*optional*)|"MDC_ATTR_TICK_RES"|
|Device.property.valueQuantity.value|Tick-Resolution.*value*|
|Device.property.valueQuantity.system|"http://unitsofmeasure.org" |
|Device.property.valueQuantity.code|"Hz"  (UCUM code for Hertz)|

The encoding for the resolution values is as follows:

|Device.property element|value|
|-
|Device.property.type.coding.code|"68222" (absolute time)<br/>"68226" (base-offset time)<br/>"68223" (relative time)<br/>"68224" (hi-res relative time)|
|Device.property.type.coding.system|"urn.iso.std.iso:11073:10101"|
|Device.property.type.text (*optional*)|"MDC_TIME_RES_ABS"<br/>"MDC_TIME_RES_BO"<br/>"MDC_TIME_RES_REL"<br/>"MDC_TIME_RES_REL_HI_RES"|
|Device.property.valueQuantity.value|"10000 x Mds-Time-Info.*time-resolution-abs-time*"<br/>"1000000 x Mds-Time-Info.*time-resolution-abs-time*/65536"<br/>"125 x Mds-Time-Info.*time-resolution-rel-time*"<br/>"Mds-Time-Info.*time-resolution-hi-res-relative-time*"<br/>|
|Device.property.valueQuantity.system|"http://unitsofmeasure.org" |
|Device.property.valueQuantity.code|"us"  (UCUM code for microseconds)|

### Examples:
An example of a PHD Blood Pressure cuff Device mapping is given [here](Device-phd-711000FEFF5F49B0.B0495F001071.html)

### Consumer of the PHD Device Profile
For the Consumer of this profile the following table gives a quick guide to the main features

|item|Location in Device resource|
|-
|Type of Device|specializations.systemType.coding.code="*MDC 32-bit code for device specialization*"|
|Manufacturer name|manufacturer|
|Model number|modelNumber|
|serial number|serialNumber|
|system identifier|identifier.system="urn:oid:1.2.840.10004.1.1.1.0.0.1.0.0.1.2680"<br>identifier.value="*system id as 8 2-digit HEX values separated by dashes*"|
|time synchronization|property.type.coding.code="68220"<br/> property.valueCode.coding.code="*code for time synchronization*"|
