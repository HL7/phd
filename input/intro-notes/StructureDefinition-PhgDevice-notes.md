### **System Identifier**
All IEEE 11073-20601 PHGs are required to have a system identifier.  It is an EUI-64 consisting of 8 bytes. The system id is mapped to the Device.identifier.value element as a sequence of 8 2-digit bytes as HEX separated by dashes without the '0x' prefix commonly used in programming languages. An example of such a string is FE-ED-AB-EE-DE-AD-77-C3. It shall be reported.

It is strongly encouraged to also report the PHG PHD and H&FS transport addresses in a second and third identifier element. The transport addresses are as follows:

<style>table, th, td {
border: 1px solid black;
border-collapse:collapse;
padding: 6px;}</style>

|transport|format|example|
|-
|Bluetooth|EUI-48|00-E5-DE-AD-77-C3|
|ZigBee|EUI-64|36-ED-9A-EE-DE-AD-77-C3|
|USB|vid.pid|0043.F90D|
|MAC|EUI-48|EE-FF-DE-AD-77-01|

The identifier for the system id:

 - identifier.value=*system id formatted as above*
 - identifier.system="urn:oid:1.2.840.10004.1.1.1.0.0.1.0.0.1.2680"
 - identifier.type.coding.system="http://hl7.org/fhir/uv/phd/CodeSystem/ContinuaDeviceIdentifiers
 - identifier.type.coding.code="SYSID"

The identifier for the Bluetooth Address: 

 - identifier.value=*formatted as above*
 - identifier.system="http://hl7.org/fhir/sid/eui-48/bluetooth"
 - identifier.type.coding.system="http://hl7.org/fhir/uv/phd/CodeSystem/ContinuaDeviceIdentifiers
 - identifier.type.coding.code="BTMAC"
 
 
 An example of a gateway reporting both its Bluetooth and MAC addresses is shown [here](Device-phg-ecde3d4e58532d31.000000000000.html)

#### **Device type**
The PHG Device.type is given by the MDC code 531981. The reference identifier for this code is MDC_MOC_VMS_MDS_AHD. "AHD" is the previous name Continua gave to what is now known as the PHG. However, reference identifiers are normative and once accepted, they cannot change. It shall be encoded as follows:

 - Device.type.coding.code="531981"
 - Device.type.coding.system="urn.iso.std.iso:11073:10101"
 - Device.type.text="MDC_MOC_VMS_MDS_AHD: Continua Personal Health Gateway"

Here the text element is optional but highly recommended.

#### **Time synchronization**
The time synchronization is mapped as follows:

 - Device.property.type.coding.code="68220"
 - Device.property.type.coding.system="urn.iso.std.iso:11073:10101"
 - Device.property.type.text="MDC_TIME_SYNC_PROTOCOL" *(optional)*
 - Device.property.valueCode.coding.code="*32-bit code for sync method*"
 - Device.property.valueCode.coding.system="urn.iso.std.iso:11073:10101"
 - Device.property.valueCode.text="*the ref id*"  *(optional)*

 The 32-bit code for the time synchronization method is given by one of the following values:

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

### **Remaining Optional Data**
The treatment of fields that would be in mock System-Model, Production-Specification, Reg-Cert-Data-List, and Mds-Time-Info attributes is the same as in the Phd Device Profile. However, there is an extra set of information in the mock Reg-Cert-Data-List regarding the certified Health & Fitness Service (H&FS) interfaces. A PHG has both PHD and H&FS interfaces.

Text elements are always optional.

If these fields are encoded they shall be encoded as follows:

### **Specializations**</a>
The specializations supported by the PHG may be reported. If reported, they shall be reported in the Device.specializations element for each specialization as follows:

 - specialization.systemType.coding.code="*32-bit specialization code*"
 - specialization.systemType.coding.system="urn.iso.std.iso:11073:10101"
 - specialization.systemType.text"*reference-id plus additional text*"
 - specialization.version="*specialization version*"

If the PHG supports multiple versions of the specialization and the uploader wants to report this information, additional specializations entries for the additional versions are made. Alternatively the uploader can leave the version field empty.

A PHG is often designed to support all current and future PHDs that support a given version of the 11073-20601 standard. Instead of listing all the specializations individually (which could greatly increase the size of the message) one can use the 'generic' device code. In this case, the specialization.version element, if populated, indicates the version of the 20601 standard. If multiple versions of the 20601 standard are supported and the uploader wants to report this information, a separate 'generic' entries for each version are reported. Alternatively, the version element can be left empty.

An example of generic code use would be as follows

 - specialization.systemType.coding.code="528385"
 - specialization.systemType.coding.system="urn.iso.std.iso:11073:10101"
 - specialization.systemType.text="MDC_DEV_SPEC_PROFILE_GENERIC: supports all 20601 devices"
 - specialization.version="2"

The following table gives a list of the more common specialization codes:

|Specialization|MDC Code partition:term code|Reference Identifier|
|-
|Generic 20601|8::4169|MDC_DEV_SPEC_PROFILE_GENERIC|
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

In some sense, reporting specialization information about a PHG is superfluous as clearly, if the PHG uploads data from a given device, it supports that device.

### **PHG Product Information**
The table blow provides codes and reference identifiers used in mapping the product information:

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

#### **Primitives**

 - manufacturer="*PHG manufacturer*"
 - modelNumber="*PHG model number*"
 - serialNumber="*serial number*"
 - partNumber="*part number*"

#### **Hardware, Software, Firmware, Protocol, and Continua Versions**
 - hardware 
 - version.type.coding.code="531974"
 - version.type.coding.system="urn.iso.std.iso:11073:10101"
 - version.type.text="MDC_ID_PROD_SPEC_HW + optional text"
 - version.value="*hardware-version*"

 - software
 - version.type.coding.code="531975"
 - version.type.coding.system="urn.iso.std.iso:11073:10101"
 - version.type.text="MDC_ID_PROD_SPEC_SW + optional text"
 - version.value="*software-version*"

 - firmware
 - version.type.coding.code="531976"
 - version.type.coding.system="urn.iso.std.iso:11073:10101"
 - version.type.text="MDC_ID_PROD_SPEC_FW + optional text"
 - version.value="*firmware-version*"
 
 - protocol
 - version.type.coding.code="531977"
 - version.type.coding.system="urn.iso.std.iso:11073:10101"
 - version.type.text="MDC_ID_PROD_SPEC_PROTOCOL + optional text"
 - version.value="*protocol-version*" (Not 11073-20601 protocol!)

 - Continua
 - version.type.coding.code="532352"
 - version.type.coding.system="urn.iso.std.iso:11073:10101"
 - version.type.text="MDC_REG_CERT_DATA_CONTINUA_VERSION + optional text"
 - version.value="*Continua Version*"

The Continua version has a major and minor component separated by a dot (.). For example, "6.1" where "6" is the major version and "1" is the minor version. 

#### **Continua Certified PHD interfaces**
The Continua *certified* PHD (Personal Area Network) interfaces are represented as a list of Continua-specified 'PHD' codes. Note there is a difference between certified PHD interfaces and supported PHD interfaces. The Continua-specified certification codes are a combination of a transport 'Tcode' and a specialization code which is based on the 16-bit term code of the MDC code for the specialization. The PHD code is generated by
  - PHDCode = Tcode * 8192 + (specialization term code - 4096)

The transport 'Tcodes' are as follows:

|Tcode|Transport|
|-
|0|Continua version 1.0|
|1|USB|
|2|Bluetooth HDP|
|3|ZigBee|
|4|Bluetooth Low Energy|
|5|NFC|

The special Tcode of 0 is for Continua version 1.0 when there was no transport component in the reported certified PHD interface codes.

The PHDCodes are mapped to a list of property.valueCode elements. The property.type element, which identifies the property, is given by the MDC 32-bit code 532353. Its reference id is MDC_REG_CERT_DATA_CONTINUA_CERT_DEV_LIST. 

 - property.type.coding.code="532353"
 - property.type.coding.system="urn.iso.std.iso:11073:10101"
 - property.type.text="MDC_REG_CERT_DATA_CONTINUA_CERT_DEV_LIST + text"
 - property.valueCode*N*.coding.code="PHDCode*N*"
 - property.valueCode*N*.coding.system="http://hl7.org/fhir/uv/phd/CodeSystem/ContinuaPHD "

Note that the property.valueCode element is an array and one can have many of these in a single property element.

#### **Continua Certified Health & Fitness interfaces**
The Continua *certified* Health and Fitness interfaces are represented as a list of Continua-specified 'H&FS' codes as follows:

|Health & Fitness Interface|H&FS code|	Reference name|
|-
|PCD-01 web services|	0	|observation-upload-soap|
|Consent enabled PCD-01 web service|	1	|consent-enabled-soap|
|Capability exchange|	2	|capabilities|
|PCD-01 upload using hData|	3	|observation-upload-hdata|
|Consent enabled PCD-01 using hData|	4|	consent-enabled-hdata|
|Questionnaire CDA|	5|	questionnaire|
|Authenticated Persistent Sessions|	6|	aps|
|FHIR resource upload|	7|	observation-upload-fhir|

The Health and Fitness codes are mapped to a list of property.valueCode elements. The property.type element, which identifies the property, is given by the MDC 32-bit code 532355. Its reference id is MDC_REG_CERT_DATA_CONTINUA_AHD_CERT_DEV_LIST. 

 - property.type.coding.code="532355"
 - property.type.coding.system="urn.iso.std.iso:11073:10101"
 - property.type.text="MDC_REG_CERT_DATA_CONTINUA_AHD_CERT_DEV_LIST + text"
 - property.valueCode*N*.coding.code="H&FSCode*N*"
 - property.valueCode*N*.coding.system="http://hl7.org/fhir/uv/phd/CodeSystem/ContinuaHFS "

#### **Regulation Status**
The PHG regulation status is reported as follows:

 - property.type.coding.code="532354.0"
 - property.type.coding.system="http://hl7.org/fhir/uv/phd/CodeSystem/ASN1ToHL7"
 - property.type.text="regulation-status"
 - property.valueCode.coding.code="Y/N"
 - property.valueCode.coding.system="http://terminology.hl7.org/CodeSystem/v2-0136 "
 - property.valueCode.text="Y=unregulated N=regulated"
 
One could enter some time capabilities as additional 'bits' components if desired.

#### **Time Synchronization Accuracy**
The time synchronization accuracy is reported in microseconds as follows:

 - Device.property.type.coding.code="68221"
 - Device.property.type.coding.system="urn.iso.std.iso:11073:10101"
 - Device.property.type.text="MDC_TIME_SYNC_ACCURACY" *(optional)*
 - Device.property.valueQuantity.value="*time-sync-accuracy*"
 - Device.property.valueQuantity.system="http://unitsofmeasure.org"
 - Device.property.valueQuantity.code="us"  (UCUM code for microseconds)
 
### Examples:
An example of an Android PHG mapping is given [here](Device-phg-example.html)

