<style>table, th, td {
border: 1px solid black;
border-collapse:collapse;
padding: 6px;}</style>

This Implementation Guide utilizes 10 profiles. The PHD Numeric, Compound Numeric, Coded Enumeration, BITs Enumeration, String Enumeration, and Rtsa Observation Profiles are used to report one of the six possible measurement types or classes sent by PHDs. The PHD Coincident Time Stamp Observation Profile is present for time auditing purposes. The PHD Device Profile is used to report the PHD features and properties. The PHG Device Profile is used to report the PHG properties and the PHD Patient Profile is used to report the patient data. In the Continua use case the Patient resource may contain only keys to identify the patient that only the health care provider can match to a person. It is also possible in the Continua architecture that the Patient resource is never sent on the wire by the uploader. In that case the logical id to a Patient resource on the destination server must be provided to the uploader by out-of-band means.

### Notes on Examples
The examples referenced in these profile sections are what is *uploaded*. These examples will differ slightly from similar examples in the Artifacts section. The reason is that the examples in the Artificats section are required to represent the resource *as it appears on the server*. However, when uploading, create operations either have no logical ids or temporary logical ids. Resources on the server, however, are required to have logical ids. 

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

### Some Notes for Implementers of Uploaders
One of the choices implementers have when uploading resources is to upload individual resources or upload a bundled set of resources. A challenge that implementers will have in either case as that the Observation resources have required references to Patient, PHD Device, and PHG Device resources, and often require references to a Coincident Time Stamp Observation resource and perhaps other Observation resources (when the PHD sends a source handle reference attribute). To obtain these references, one generally has to wait for the upload response from the server. When implementing a generic uploader that must be able to handle Coincident Time Stamps and source-handle-references, this wait can significantly complicate the code and place a burden upon memory requirements.

A transaction Bundle may prove useful in that case. A bundled upload will contain all or several of the resources, and resources within the Bundle that reference one another can be handled using temporary ids. In addition, one can use an update transaction for the Patient and Device resources that only need to be uploaded once. The update transaction allows one to specify the logical id thus one does not have to wait for a server response. The PHG can keep a record of the logical ids for these one-time uploads and use them in the Observation resources in subsequent Bundles that now only contain Observation resources. An example of a first-time upload of a transaction bundle is given [here](bundleExample.html). Alternatively, one can use conditional creates on the Patient and Device resources and include them in the Bundle every time. The conditional create assures no data duplication. However, that approach does put an extra burden on the server and does waste bandwidth. But platforms with limited hardware may have no other choice.

On the other hand, if the use case only involves PHDs that do not emit source-handle-references and do not need a Coincident Time Stamp, the single upload approach may prove to be much more efficient. It is also permissible to mix and match, using both single and Bundled uploads.

### The Profiles

 - [Base Observation Profile](BaseObservationProfile.html)
 - [Numeric Observation Profile](NumericObservationProfile.html)
 - [Compound Numeric Observation Profile](CompoundNumericObservationProfile.html)
 - [Coded Enumeration Observation Profile](CodedEnumerationObservationProfile.html)
 - [BITs Enumeration Observation Profile](BITsEnumerationObservationProfile.html)
 - [Rtsa Observation Profile](RtsaObservationProfile.html)
 - [String Enumeration Observation Profile](StringEnumerationObservationProfile.html)
 - [Coincident Time Stamp Observation Profile](CoincidentTimeStampObservationProfile.html)
 - [Phd Device Profile](PhdDeviceProfile.html)
 - [Phg Device Profile](PhgDeviceProfile.html)
 - [Patient Profile](PhdPatientProfile.html)




 
