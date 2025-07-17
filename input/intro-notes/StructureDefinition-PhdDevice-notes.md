The section below describe the profiled elements in more detail.

### System Identifier → Device.identifier
All IEEE 11073-10206 PHDs are required to have a system identifier. This usually is an EUI-64 consisting of 8 bytes. The EUI-64 is mapped to the FHIR Device.identifier.value element as a sequence of 8 2-digit bytes as HEX separated by dashes without the '0x' prefix commonly used in programming languages. An example of such a string is FE-ED-AB-EE-DE-AD-77-C3. Though required by IEEE 11073-10206, it is not required in the Bluetooth Low Energy health device specifications. When a PHG encounters such a device it shall provide a transport address as a means of uniquely identifying the PHD. Supported transport addresses are Bluetooth and ZigBee. The Bluetooth address is an EUI-48, and the ZigBee address is an EUI-64. These will be encoded as strings just as the EUI-64. Note that USB.vid (vendor id) and USB.pid (product id) are not unique and cannot be used as system identifiers. 

In order to discriminate between an identifier that is a system id and that which is a transport address the identifier.type element is used. A dedicated CodeSystem [Device Identifier Codes](CodeSystem-ContinuaDeviceIdentifiers.html) has the codes one can use to populate the identifier.type.coding.code element.

When in the future other system identifiers such as ETSI-ICCID (International Circuit Card Identifier) are used, this coding scheme will need to be extended.

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

The URIs used for the system can be found in the [External Identifier Systems](https://terminology.hl7.org/identifiers.html).

An example of a system identifier is:
{% fragment Device/phd-74E8FFFEFF051C00.001C05FFE874 JSON EXCEPT:identifier %}

### UDI &rarr; Device.udiCarrier
The UDI is included as an optional attribute of a PHD in the IEEE 11073-10206 ACOM standard (and the older IEEE 11073-20601 standard). It is also supported in the Bluetooth SIG Device Information Service and the GHS Profile. The UDI elements supported are issuer, jurisdiction, Device Identifier, and the Human Readable Barcode String. The udiCarrier does have elements for each of these entries. There is no appropriate entryType code for this sourcing of the UDI in FHIR R4 and the code `unknown` should be used. In FHIR R5 the code `electronic-transmission` can be used.

The UDI of a device consists of a Device Identifier (DI) and a Production Identifier (PI). The DI is the part of the UDI that identifies the specific model of the device. The PI is used to identify the specific instance of the device, such as its serial number or lot number. When the PI includes a serial number it identifies a specific instance of the devices of the model as specified by the DI. 

### Device.type
The Device type is the same for all PHDs and it indicates that the device is a PHD. The details of what the PHD does is found in the Device.specializations element. The MDC code being used is 65573 (reference id MDC_MOC_VMS_MDS_SIMP). In IEEE 11073-10201 this code is described as indicating "a single-purpose medical device".

An example of a `Device.type` encoding is:
{% fragment Device/phd-74E8FFFEFF051C00.001C05FFE874 JSON EXCEPT:type %}

The display element is optional but is recommended.

### System Type Spec List &rarr; Device.specialization
The System-Type-Spec-List attribute contains a list of specializations the PHD complies to. The elements in the list indicate not only what the PHD does, but that it does so in a manner specified in the specialization documents.  Each element in the list contains the specialization and its version. In most cases there is just one entry in the list.

The specialization is encoded as a 32-bit code, where the first 16 bits are the partition INFRA and the last 16 bits are the term code from System-Type-Spec-List.type. The version is encoded as a 16-bit number. The code and version are encoded in the Device.specialization element as follows:

{% fragment Device/phd-74E8FFFEFF051C00.001C05FFE874 JSON EXCEPT:specialization %}

The display element is optional but it is highly recommended that it be included and the reference id be in the description. 

The MDC_DEV_SPEC_PROFILE_GENERIC 'generic' device on the PHD side indicates that the device follows the IEEE 11073-10206 ACOM standard but not any specific specialization. On the PHG side it indicates that the PHG understands anything following the IEEE 11073-10206 standard. That would include all specializations since all specializations comply with the IEEE 11073-10206 standard.

### Manufacturer, System Model and Serial Number
The ACOM Manufacturer, System-Model and Serial Number attributes contains strings. The Device resource has stand-alone primitive elements for these fields to which these attributes are mapped. 

### Revision information &rarr; Device.version
The revision information provided by the PHD, such as the hardware-revision, is encoded in the Device.version element. The version information is provided as a list of versions, where each version has a type and a value. The type is encoded as an MDC code and the value is a string. The type codes are defined in the [MDC Device Version Type Codes ValueSet](ValueSet-MDCDeviceVersionTypes.html).

### Reg-Cert-Data-List 
The Reg-Cert-Data-List can be provided by PHDs based on the IEEE 11073-20601 standard. It is not supported by the IEEE 11073-10206 ACOM standard. 
It contains the Continua version, list of certified PHD interfaces, and the regulation status. The Continua version is mapped to an additional Device.version element and the other two fields are mapped to a Device.property element.

#### Reg-Cert-Data-List Certified PHD interfaces &rarr; Device.property
The Reg-Cert-Data-List attribute reports the list of Continua certified PHD (Personal Area Network) interfaces as a list interface codes. The codes obtained from the Reg-Cert-Data-List are a combination of a transport code and a device specialization code. See [the PHD Interface codes](CodeSystem-ContinuaPHDInterfaceIDs.html) for the list of possible codes.

The interface codes are mapped to a list of properties where the property.valueCode element carries a single PHD interface code. The property.type element, which identifies the property, is given by the MDC code `532353`. Its reference id is `MDC_REG_CERT_DATA_CONTINUA_CERT_DEV_LIST`. 

#### Reg-Cert-Data-List Regulation Status
The regulation status element has MDC code `532354` and carries a 16-bit ASN1 BITs 'state' value (see [ASN1 To HL7 CodeSystem](CodeSystem-ASN1ToHL7.html)). Only bit 0 is defined. Being a state value, both set and cleared states are reported. In fact, it is the cleared state which represents that the device is regulated. The regulation status is mapped to an additional Device.property.valueCode element. 

A fragment:
{% fragment Device/phd-74E8FFFEFF051C00.001C05FFE874 JSON BASE:property.where(type.coding.code='532354') %}


### Clock information 
The ACOM clock information is encoded in a set of Device.property elements. 

#### Clock resolution &rarr; Device.property
The ACOM clock type and resolution is encoded as a Device.property element with the type code indicating the type of the clock. This is a code from [MDCClockResolutionTypes](ValueSet-MDCClockResolutionTypes.html). The value is scaled to a valueQuantity with microseconds `us` as unit. The system is `http://unitsofmeasure.org` (UCUM).

The table below shows the types of clocks that ACOM supports and the codes used to indicate them. 
|Clock Type|MDC Code|
|---|---|
|Wall Clock with DST and Time Zone offset (Base Offset Time)|68226|
|Wall Clock without DST and Time Zone offset (Absolute Time)|68222|
|Time Counter (Relative Time)|68223|

In devices implementing the Bluetooth GHS profile specification the clock information is provided in the Elapsed Time characteristic. In other Bluetooth Low Energy devices the clock information may be inferred from the Current Time Service. 

#### Time Capabilities  &rarr; Device.property
ACOM supports the following Boolean time capabilities that are mapped to Boolean Device.property elements using a code from the valueSet [ASN1 Clock Bits](ValueSet-ASN1ClockBits.html). 

|ACOM time capability|Device.property.type.coding.code|
|---|---|
|Set Clock is supported|68219.1|
|Base Offset Time is supported|68219.7|
|DST Rules are supported|68219.15|

Other codes from the valueSet are not used in ACOM, but are present to support the older IEEE 1103-20601 model. The value of the property is a Boolean value indicating whether the capability is supported or not.

#### Time Synchronization
In ACOM the time synchronization used by the PHG that set the PHD's clock is present in the timestamp. This is mapped to a component of the [Coincident Timestamp Observation](StructureDefinition-PhdCoincidentTimeStampObservation.html) resource. The component is a CodeableConcept with a code from the valueSet [MDC Time Synchronization Methods](ValueSet-MDCTimeSyncMethods.html). The code indicates the method used to synchronize the PHD's clock.

In IEEE 11073-20601 the external time synchronization method supported by the PHD itself may be indicated in the Mds-Time-Info attribute. In this case it can be mapped to a Device property.

#### Time Synchronization Accuracy
This information is not supported in ACOM. In IEEE 11073-20601 the Mds-Time-Info attribute has a field that indicates the accuracy of the time synchronization. This can be mapped to a Device.property element with code Mdc#68221 (MDC_TIME_SYNC_ACCURACY). The value is a Quantity with units of microseconds `us` and the system is `http://unitsofmeasure.org` (UCUM).

### Consumer of the PHD Device Profile
For the Consumer of this profile the following table gives a quick guide to the main features.

|item|Device resource element|value
|---|---|---|
|Type of device|specialization.systemType.coding.code|MDC code for device specialization|
|Manufacturer name|manufacturer|string
|Model number|modelNumber|string
|Serial number|serialNumber|string
|System identifier|identifier.value|EUI-64 system id or unique transport address as a series of 2-digit HEX values separated by dashes|
