The properties and specifications of the PHD are reported in the Device resource. These are the static fields of the attributes reported in the System Information object or Bluetooth Low Energy Device Information Service. Dynamic and observational power-source attributes such as the battery level, remaining battery time, and power status are reported using the Observation resource. Static attributes of the PHD clock are reported here as well.

The following table summarizes these static PHD SystemInfo, Power and Clock attributes and the Device elements to which they are mapped:

<style>table, th, td {
border: 1px solid black;
border-collapse:collapse;
padding: 6px;}</style>

|ACOM PHD attribute|FHIR Device element|
|---|---|
|SystemInfo.System-identifier and/or *transport address* |identifier|
|*Friendly name*|deviceName|
|System-Type-Spec-List|specializations|
|SystemInfo.serial-number|serialNumber|
|SystemInfo.firmware-revision| version.value, version.type = MDC_ID_PROD_SPEC_FW|
|SystemInfo.hardware-revision| version.value, version.type = MDC_ID_PROD_SPEC_HW|
|SystemInfo.software-revision| version.value, version.type = MDC_ID_PROD_SPEC_SW|
|Clock attributes|properties|
|Power source attributes|properties|

The transport address and friendly name are not provided by the SystemInfo but come from the transport protocols. They may not be available and are therefore optional. However, if the PHD does not report a System-identifier, which may happen if one needs to map non-certified and/or proprietary devices, a transport address should be reported. It is still strongly recommended that the transport address is reported as it is often beneficial to the data consumers. Transport addresses of wireless devices are often printed on the device or the device packaging whereas the System-identifier is not. Most PHD transports provide a means of obtaining a transport address or an equivalent identifier such as a Bluetooth device address. 

