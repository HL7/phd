The properties and specifications of the Personal Health Gateway (PHG) are reported in a Device resource. One of the main reasons the PHG information is included at all in this guide is that it plays a critical role in handling the measurement timestamps of PHDs. PHDs tend to have no time synchronization capabilities. They rely on either the PHG or user to set their time or use a default factory setting. The PHG, on the other hand, is required to have time synchronization capability to NTP and local offset. In this manner the PHG can correct any timestamps provided by the PHD *if* the PHD provides its sense of current time.

PHGs may be implemented on a mobile phone, a personal computer, or in a dedicated set-top box. PHGs may be headless (provide no direct user interface).

A PHG does not have an MDS object, but for the purposes of reporting the PHG information, like its system identifier, time synchronization, and serial number, these values are treated *as if* they came from MDS-attributes in an MDS object. These 'mock' attributes and object are not required to exist on the PHG. 

Unlike the PHD where one reports the information if delivered, in the PHG case far fewer fields are required to be reported. The following table summarizes the required 'MDS' fields and their mappings:

<style>table, th, td {
border: 1px solid black;
border-collapse:collapse;
padding: 6px;}</style>

|'PHG MDS' field|Device element|
|-
|System Identifier|identifier|
|Time sync protocol|property|

For Continua compliance, the values in the mock Reg-Cert-Data-List shall be included:

|'Continua PHG MDS' field|Device element|
|-
|Continua Version|version|
|Certified PHD Interfaces|property|
|Certified H&FS Interfaces|property|
|Regulation status|property|

A transport address is not required. It is still strongly recommended that the transport address is reported as it is often beneficial to consumers. Most PHD-PHG transports provide a means of obtaining a transport address or an equivalent identifier such as a USB VID and PID. In addition, it may be beneficial to report the transport address of the H&FS interface as well, such as the MAC address.

Similar to the PHD case, when CodeableConcept data types are used it is recommended to put the MDC reference identifier as part of the text element when the system element indicates the MDC coding system "urn.iso.std.iso:11073:10101".