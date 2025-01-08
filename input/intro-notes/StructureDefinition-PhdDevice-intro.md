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
