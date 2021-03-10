The properties and specifications of the PHD are reported in the Device resource. These are the static fields of the attributes reported in the PHD MDS object or Bluetooth Low Energy Device Information Service. Dynamic and observational attributes such as the battery level, remaining battery time, and power status are reported using the Observation resource.

There are six MDS attributes that are reported. The Mds-Time-Info attribute has fields that are dynamic and static, and it is only the static entries which are required should the attribute be present. The following table summarizes these attributes and the Device elements to which they are mapped:

<style>table, th, td {
border: 1px solid black;
border-collapse:collapse;
padding: 6px;}</style>

|MDS attribute|Device element|
|-
|System-Id|identifier 1|
|*transport address*|identifier 2|
|*Friendly name*|deviceName|
|System-Type-Spec-List|specializations|
|Production-Specification|serialNumber<br>version<br>partNumber|
|Reg-Cert-Data-List|version<br>property|
|MdsTimeInfo|property|

The transport address and friendly name are not provided by the MDS but come from the transport protocols. They may not be available and are therefore optional. However, if the PHD does not report a System Id, which may happen if one needs to map non-certified and/or proprietary devices, a transport address should be reported. It is still strongly recommended that the transport address is reported as it is often beneficial to the data consumers. Transport addresses of wireless devices are often printed on the device or the device packaging whereas the system id is not. Most PHD transports provide a means of obtaining a transport address or an equivalent identifier such as a USB VID and PID.

There are several CodeableConcept data types in this mapping where the Coding data type has a 'display' element. It is recommended to put the MDC reference identifier as part of the display element if known. The coding system element is always set to "urn.iso.std.iso:11073:10101 when an MDC code".

The structure definition for the PHD Device Profile is given [here](StructureDefinition-PhdDevice.html)

### Meta Data Profile
The uploader shall populate the Device.meta.profile with http://hl7.org/fhir/uv/phd/StructureDefinition/PhdDevice indicating this resource is generated following the PHD Implementation Guide.

### System Identifier
All 11073 20601 PHDs are required to have a system identifier. It is an EUI-64 consisting of 8 bytes. The system id is mapped to the Device.identifier.value element as a sequence of 8 2-digit bytes as HEX separated by dashes without the '0x' prefix commonly used in programming languages. An example of such a string is FE-ED-AB-EE-DE-AD-77-C3. Though required for Continua compliance, it is not required in the Bluetooth Low Energy health device specifications. When a PHG encounters such a device it shall enter 00-00-00-00-00-00-00-00 and it is highly recommended to provide a transport address as a means of uniquely identifying the PHD.

In order to discriminate between an identifier that is a system id and that which is a transport address the identifier.type element is used. A Continua-defined CodeSystem [Device Identifier Codes](CodeSystem-ContinuaDeviceIdentifiers.html) has the codes one can use to populate the identifier.type.coding.code element.

The transport addresses are as follows:

|transport|format|example|
|-
|Bluetooth|EUI-48|00-E5-DE-AD-77-C3|
|ZigBee|EUI-64|36-ED-9A-EE-DE-AD-77-C3|
|USB|vid.pid|0043.F90D|

The identifier is encoded as follows:

|Source|Device Encoding|
|-
|System-Id.value|identifier.value=*formatted as above*<br>identifier.system="urn:oid:1.2.840.10004.1.1.1.0.0.1.0.0.1.2680"<br>identifier.type.coding.system="http://hl7.org/fhir/uv/phd/CodeSystem/ContinuaDeviceIdentifiers"<br>identifier.type.coding.code="SYSID"|
|Bluetooth Address|identifier.value=*formatted as above*<br>identifier.system="http://hl7.org/fhir/sid/eui-48/bluetooth"<br>identifier.type.coding.system="http://hl7.org/fhir/uv/phd/CodeSystem/ContinuaDeviceIdentifiers"<br>identifier.type.coding.code="BTMAC"|
|ZigBee Address|identifier.value=*formatted as above*<br>identifier.system="http://hl7.org/fhir/sid/eui-64/zigbee"<br>identifier.type.coding.system="http://hl7.org/fhir/uv/phd/CodeSystem/ContinuaDeviceIdentifiers"<br>identifier.type.coding.code="ZIGBEE"|
|USB Address|identifier.value=*formatted as above*<br>identifier.system="http://hl7.org/fhir/sid/usb"<br>identifier.type.coding.system="http://hl7.org/fhir/uv/phd/CodeSystem/ContinuaDeviceIdentifiers"<br>identifier.type.coding.code="USB"|

### Device.udiCarrier ###
The UDI has recently been introduced into the IEEE 11073 20601 standard, however, no PHDs have implemented this feature and it is not yet present in Bluetooth Low Energy. For that reason, the mapping of this element is not specified in this version of the implementation guide. The IEEE 11073 20601 standard supports an issuer, jurisdiction, and the Human Readable interpretation of the barcode. The udiCarrier does have elements for each of these entries. On the other hand, there is no appropriate entryType code for this sourcing of the UDI as it is obtained electronically through protocol.

It is anticipated that all these issues will be resolved and that eventually PHDs will support it via protocol. At that time a mapping from the IEEE UDI to the Device.uidCarrier will be specified.

### Device.type ###
The Device type is the same for all PHDs and it indicates that the device is a PHD. The details of what the PHD does is found in the Device.specializations element. The MDC code being used is 65573 (reference id MDC_MOC_VMS_MDS_SIMP). In 11073-10201 this code is described as indicating "a single-purpose medical device". The code is also used in 11073-20601 to identify the MDS object, but there is no particular description as to its interpretation.

The Device.type shall be encoded as follows:

 - Device.type.coding.code="65573"
 - Device.type.coding.system="urn.iso.std.iso:11073:10101"
 - Device.type.text="MDC_MOC_VMS_MDS_SIMP: Continua Personal Health Device"

The display element is optional but highly recommended.

### System Type Spec List
The System-Type-Spec-List attribute contains a list of specializations the PHD complies to. The elements in the list indicate not only what the PHD does, but that it does so in a manner specified in the specialization documents.  Each element in the list contains the specialization and its version. The specialization is reported as a 16-bit MDC term code with an assumed partition of INFRA (8) and the version is an integer. In most cases there is just one entry in the list.

For each entry in the System-Type-Spec-List a specializations entry is encoded as follows: 

|System-Type-Spec-List entry|Device encoding|
|- 
|System-Type-Spec-List.type|specialization.systemType.coding.code="code"<br>specialization.systemType.coding.system="urn.iso.std.iso:11073:10101"<br>specialization.systemType.text="*reference-id plus additional text*" |
|System-Type-Spec-List.version|specialization.version="version" |

where "code" is the 32-bit nomenclature code computed from the partition INFRA and the term code from System-Type-Spec-List.type and "version" is the version from System-Type-Spec-List.version.

The display element is optional but it is highly recommended that it be included and the reference id be in the description. The table below gives a list of some of the most common specializations and their codes:

|Specialization|MDC Code partition:term code|Reference Identifier|
|-
|Generic 20601 Device|8::4169|MDC_DEV_SPEC_PROFILE_GENERIC|
|Pulse Oximeter|8::4100|MDC_DEV_SPEC_PROFILE_PULS_OXIM|
|Electro cardiograph|8::4102|MDC_DEV_SPEC_PROFILE_MIN_ECG|
|Blood Pressure Cuff|8::4103|MDC_DEV_SPEC_PROFILE_BP|
|Thermometer|8::4104|MDC_DEV_SPEC_PROFILE_TEMP|
|Respiration rate|8::4109|MDC_DEV_SPEC_PROFILE_RESP_RATE|
|Weight Scale|8::4111|MDC_DEV_SPEC_PROFILE_SCALE|
|Glucose Monitor|8::4113|MDC_DEV_SPEC_PROFILE_GLUCOSE|
|Coagulation meter |8::4114|MDC_DEV_SPEC_PROFILE_COAG|
|Insulin Pump|8::4115|MDC_DEV_SPEC_PROFILE_INSULIN_PUMP|
|Body Composition Analyzer|8::4116|MDC_DEV_SPEC_PROFILE_BCA|
|Peak Flow meter|8::4117|MDC_DEV_SPEC_PROFILE_PEAK_FLOW|
|Sleep Apnea Breathing Equipment|8::4120| MDC_DEV_SPEC_PROFILE_SABTE|
|Continuous Glucose Monitor|8::4121|MDC_DEV_SPEC_PROFILE_CGM|
|Cardiovascular Device|8::4137|MDC_DEV_SPEC_PROFILE_HF_CARDIO|
|Strength Equipment|8::4138|MDC_DEV_SPEC_PROFILE_HF_STRENGTH|
|Independent Activity/Living Hub|8::4167|MDC_DEV_SPEC_PROFILE_AI_ACTIVITY_HUB|
|Medication Monitor|8::4168|MDC_DEV_SPEC_PROFILE_AI_MED_MINDER|

The 'generic' device on the PHD side indicates that the device follows 20601 but not any specialization. On the PHG side it indicates that the PHG understands anything following the 20601 standard. That would include all specializations since all specializations are a subset of the 20601 standard.

The table below gives the set of 32-bit MDC codes and reference identifiers used in the subsequent mappings.

|11073 Attribute|description|MDC code|MDC reference identifier|
|-
|System-Model|Model number|531969|MDC_ID_MODEL_NUMBER|
|System-Model|Manufacturer name|531970|MDC_ID_MODEL_MANUFACTURER|
|Production-Specification|Unspecified|	531971|MDC_ID_PROD_SPEC_UNSPECIFIED|
|Production-Specification|Serial number|	531972|MDC_ID_PROD_SPEC_SERIAL|
|Production-Specification|Part number|	531973|MDC_ID_PROD_SPEC_PART|
|Production-Specification|Hardware revision|	531974|MDC_ID_PROD_SPEC_HW|
|Production-Specification|Software revision|	531975|MDC_ID_PROD_SPEC_SW|
|Production-Specification|Firmware revision|	531976|MDC_ID_PROD_SPEC_FW|
|Production-Specification|Protocol revision|	531977|MDC_ID_PROD_SPEC_PROTOCOL|
|Production-Specification|Global Medical Device Nomenclature (GMDN)|	531978|MDC_ID_PROD_SPEC_GMDN|
|Reg-Cert-Data-List|Continua version|532352|MDC_REG_CERT_DATA_CONTINUA_VERSION|
|Reg-Cert-Data-List|Continua Certified Device List|532353|MDC_REG_CERT_DATA_CONTINUA_CERT_DEV_LIST|
|Reg-Cert-Data-List|Regulation status|532354|MDC_REG_CERT_DATA_CONTINUA_REG_STATUS |
|*PHG only*|Continua Certified H&FS List|532355|MDC_REG_CERT_DATA_CONTINUA_AHD_CERT_LIST|
|Mds-Time-Info|Synchronization method|68220|MDC_TIME_SYNC_PROTOCOL|
|Mds-Time-Info|Time capabilities|68219|MDC_TIME_CAP_STATE|
|Mds-Time-Info|High resolution relative time resolution|68224|MDC_TIME_RES_REL_HI_RES|
|Mds-Time-Info|Relative time resolution|68223|MDC_TIME_RES_REL|
|Mds-Time-Info|Absolute Time time resolution|68222|MDC_TIME_RES_ABS|
|Mds-Time-Info|Base offset time resolution|68226|MDC_TIME_RES_BO|
|Mds-Time-Info|Time synchronization accuracy|68221|MDC_TIME_SYNC_ACCURACY|

### System Model
The System-Model attribute contains two strings, the manufacturer name and the model number. The Device resource has stand-alone primitive elements for these two fields. The mapping is straight forward:

|System-Model|Device encoding|
|- 
|System-Model.manufacturer|manufacturer="System-Model.manufacturer" |
|System-Model.model-number|modelNumber="System-Model.model-number" |

### Production-Specification ###
The Production-Specification attribute values are mapped to three separate elements in the Device, the Device.serialNumber, Device.partNumber, and Device.version. The serialNumber and partNumber elements are string primitives, thus it is not possible to map the PrivateOid of those two values without extensions. The version element, on the other hand, is a Backbone element which will allow such a mapping without the use of extensions.

The mapping is as follows:

|Production-Specification entry|Device encoding|
|- 
|Production-Specification.spec-type = 1 (*serial number*)<br>Production-Specification.value|serialNumber="Production-Specification.value" |
|Production-Specification.spec-type = 2 (*part number*)<br>Production-Specification.value|partNumber="Production-Specification.value" |
|Production-Specification.spec-type = 3 (*hardware version*)<br>Production-Specification.PrivateOid<br>Production-Specification.value|version.type.coding.code="531974"<br>version.type.coding.system="urn.iso.std.iso:11073:10101"<br>version.type.text="MDC_ID_PROD_SPEC_HW + optional text"\*\*<br>version.value="Production-Specification.value"<br>version.component.system="system id formatted as above"\*<br> version.component.value="Production-Specification.PrivateOid"\*|
|Production-Specification.spec-type = 4 (*software version*)<br>Production-Specification.PrivateOid<br>Production-Specification.value|version.type.coding.code="531975"<br>version.type.coding.system="urn.iso.std.iso:11073:10101"<br>version.type.text="MDC_ID_PROD_SPEC_SW + optional text"\*\*<br>version.value="Production-Specification.value"<br>version.component.system="system id formatted as above"\*<br> version.component.value="Production-Specification.PrivateOid"\*|
|Production-Specification.spec-type = 5 (*firmware version*)<br>Production-Specification.PrivateOid<br>Production-Specification.value|version.type.coding.code="531976"<br>version.type.coding.system="urn.iso.std.iso:11073:10101"<br>version.type.text="MDC_ID_PROD_SPEC_FW + optional text"\*\*<br>version.value="Production-Specification.value"<br>version.component.system="system id formatted as above"\*<br> version.component.value="Production-Specification.PrivateOid"\*|
|Production-Specification.spec-type = 6 (*protocol version*)<br>Production-Specification.PrivateOid<br>Production-Specification.value|version.type.coding.code="531977"<br>version.type.coding.system="urn.iso.std.iso:11073:10101"<br>version.type.text="MDC_ID_PROD_SPEC_PROTOCOL + optional text"\*\*<br>version.value="Production-Specification.value"<br>version.component.system="system id formatted as above"\*<br> version.component.value="Production-Specification.PrivateOid"\*|

*The PrivateOid is only a 16-bit unsigned number. To give it some meaning, the system-id of the device is placed in the Identifier 'system' value to link the PrivateOid to this physical device in the presence of some other possible identifiers.

**The text elements are optional but it is encouraged to include them and populate them with at least the reference identifier.

### Reg-Cert-Data-List ###
The Reg-Cert-Data-List contains the Continua version, list of certified PHD interfaces, and the regulation status. The Continua version is mapped to an additional Device.version element and the other two fields are mapped to a Device.property element.

#### Reg-Cert-Data-List Continua version

The Continua version has a major and minor component which are 8-bit unsigned integers. The code reported in the Device.versions element is obtained by concatenating the major-version, a dot (.), and the minor version. For example, "6.1" where "6" is the major version and "1" is the minor version. 

The Continua version code is mapped to a Device.version element.

#### Reg-Cert-Data-List Continua Certified PHD interfaces
The Reg-Cert-Data-List attribute reports the list of Continua *certified* PHD (Personal Area Network) interfaces as a list of Continua-specified 'PHD' codes. Note there is a difference between certified PHD interfaces and supported PHD interfaces. The Continua-specified certification codes obtained from the Reg-Cert-Data-List are a combination of a transport code, Tcode, and a specialization code which is based on the 16-bit term code of the MDC code for the specialization. See [generating the PHDCodes](ContinuaPersonalAreaNetworkCodes.html)

The PHDCodes are mapped to a list of property.valueCode elements. The property.type element, which identifies the property, is given by the MDC 32-bit code 532353. Its reference id is MDC_REG_CERT_DATA_CONTINUA_CERT_DEV_LIST. 

#### Reg-Cert-Data-List Regulation Status
The regulation status element is a 16-bit ASN1 BITs 'state' value (see [ASN1 Coding Description](ASN1BITsCodeSystem.html)). At the current time only Mder bit 0 is defined. Being a state value, both set and cleared states are reported. In fact, it is the cleared state which represents that the device is regulated. 

The regulation status is mapped to an additional Device.property.valueCode element. The Device.property.type element, which identifies the property, is given by 532354.0 following the ASN1 BITs mapping where the code 532354 is the MDC code for the regulation status. Its reference identifier is MDC_REG_CERT_DATA_CONTINUA_REG_STATUS. The '0' appended to the regulation status code indicates Mder bit 0. The Device.property.valueCode will indicate either "Y" (set) or "N" (cleared).

The following table summarizes the mapping of the Reg-Cert-Data-List information to FHIR:


|Reg-Cert-Data-List|Device Mapping|
|-
|Reg-Cert-Data-List: continuaVersion|version.type.coding.code="532352"<br>version.type.coding.system="urn.iso.std.iso:11073:10101"<br>version.type.text="MDC_REG_CERT_DATA_CONTINUA_VERSION + text"<br>version.value="Continua version code"<br><br>|
|Reg-Cert-Data-List: certified PHD interfaces|property.type.coding.code="532353"<br>property.type.coding.system="urn.iso.std.iso:11073:10101"<br>property.type.text="MDC_REG_CERT_DATA_CONTINUA_CERT_DEV_LIST + text"<br>property.valueCode*N*.coding.code="PHDCode*N*"<br>property.valueCode*N*.coding.system="http://hl7.org/fhir/uv/phd/CodeSystem/ContinuaPHD"<br><br>|
|Reg-Cert-Data-List: regulation status|property.type.coding.code="532354.0"<br>property.type.coding.system="http://hl7.org/fhir/uv/phd/CodeSystem/ASN1ToHL7"<br>property.type.text="regulation-status"<br>property.valueCode.coding.code="Y/N"<br>property.valueCode.coding.system="http://terminology.hl7.org/CodeSystem/v2-0136 "<br>property.valueCode.text="Y=unregulated N=regulated"|

Text elements are recommended but optional.

### Mds-Time-Info
The Mds-Time-Info attribute is required on PHDs that support a real time clock of some type and report time stamps in their measurements. In Bluetooth Low Energy devices these properties must be inferred from other information like the Current Time Service. If the PHD does NOT report a time stamp in any of its measurements, there is no need to report the static time information ***EXCEPT*** that there is no time synchronization.

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
 - property.valueCode.coding.code="Y/N"
 - property.valueCode.coding.system="http://terminology.hl7.org/CodeSystem/v2-0136 "

 An optional text element containing at least the ASN.1 name from the above table is encouraged:
 - property.type.text="ASN.1 name + any additional text"

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
|532236	|MDC_TIME_SYNC_OTHER	|A time sync method that is out of scope for IEEE 11073	|8::7948|
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
An example of a PHD Blood Pressure cuff Device mapping is given [here](phdExample.html)

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

### The Other Profiles

 - [Profiles Overview](ProfilesOverview.html)
 - [Base Observation Profile](BaseObservationProfile.html)
 - [Numeric Observation Profile](NumericObservationProfile.html)
 - [Compound Numeric Observation Profile](CompoundNumericObservationProfile.html)
 - [Coded Enumeration Observation Profile](CodedEnumerationObservationProfile.html)
 - [BITs Enumeration Observation Profile](BITsEnumerationObservationProfile.html)
 - [Rtsa Observation Profile](RtsaObservationProfile.html)
 - [String Enumeration Observation Profile](StringEnumerationObservationProfile.html)
 - [Coincident Time Stamp Observation Profile](CoincidentTimeStampObservationProfile.html)
 - [Phg Device Profile](PhgDeviceProfile.html)
 - [Patient Profile](PhdPatientProfile.html)







