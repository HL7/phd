This Implementation Guide utilizes 10 profiles. The PHD Numeric, Compound Numeric, Coded Enumeration, BITs Enumeration, String Enumeration, and Rtsa Observation Profiles are used to report one of the six possible measurement types or classes sent by PHDs. The PHD Coincident Time Stamp Observation Profile is present for time auditing purposes. The PHD Device Profile is used to report the PHD features and properties. The PHG Device Profile is used to report the PHG properties and the PHD Patient Profile is used to report the patient data. In the Continua use case the Patient resource may contain only keys to identify the patient that only the health care provider can match to a person. It is also possible in the Continua architecture that the Patient resource is never sent on the wire by the uploader. In that case the logical id to a Patient resource on the destination server must be provided to the uploader by out-of-band means.

### Measurement Observation Profiles
The six measurement observation profiles mirror the six measurement 'value-types' of that a 11073 20601 PHD can report. The measurement value-types and their mapping to FHIR Observation elements are shown in the following table:

|Measurement value-type|IEEE attribute type|FHIR Observation element|
|-
|scalar |single numeric|valueQuantity|
|vector |compound numeric|component.valueQuantity|
|code |coded enumeration|valueCodeableConcept|
|bits (events or states) |BITs enumeration|component.code<br/>component.valueCodeableConcept|
|string |string enumeration|valueString|
|peridoic samples |sample array|valueSampledData|

The value-type of measurement is the main difference between the observation-related profiles. The remaining attributes in the metric objects are common to all measurements and are thus mapped in the same way to FHIR.

### PHD Device Profile
The PHD Device profile for the 11073 20601 MDS object is for the device information like manufacturer name, model number, serial number, time properties, device type (blood pressure cuff, pulse oximeter, etc.), system identifier, transport address, etc. The Device resource in FHIR has just undergone major changes. The DeviceComponent resource, used in a preliminary version of this IG has been merged into the Device and the DeviceComponent no longer exists. The productionSpecification element no longer exists as a backbone element but has been broken up into its concomitant parts. A new specializations field has been added. There is also a udiCarrier element which will support the new 20601 MDS Udi attribute. Though the changes in the Device related resources have been radical, the changes are much more suitable for PHDs.

|MDS Attribute|FHIR Device element|
|-
|System-Id<br/>Transport Address (*not an attribute*)|identifier|
|System-Type-Spec-List|specializations|
|device friendly name (*not an attribute <br>but often available from transports*)|deviceName|
|Udi|udiCarrier|
|System-Model|manufacturer<br>modelNumber|
|Production-Specification|serialNumber<br>version<br>partNumber|
|Reg-Cert-Data-List.continua_version|version|
|Mds-Time-Info<br/>Reg-Cert-Data-List.continua-certified-device-list<br/>Reg-Cert-Data-List.regulation_status|property|

### PHG Device Profile
A PHG does not have an MDS object but it is still software on a device and to work with a PHD it must support certain time features. The PHG is also responsible for correcting measurement time stamp data from the PHD if necessary. Thus, reporting the properties of the PHG, especially those properties that may have an influence on the reported measurement data, has been considered important in the Continua architecture. To accomplish this task, the PHG is treated as if it has an MDS object with potentially all the attributes a PHD might have in its MDS. In this manner a PHG can report its equivalent values of the information that would be in the System-Id, System-Model, Production-Specification, Reg-Cert-Data-List, etc. There is, however, no System-Type-Spec-List. It is clear that any measurement type a PHG decodes and maps it must support. Using the 'MDS' concept, the PHG information is mapped to the PHG Device in the same manner as a PHD is mapped to the Device. However, only the System id and time synchronization values are required to be reported.





 
