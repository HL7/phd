<style>table, th, td {
border: 1px solid black;
border-collapse:collapse;
padding: 6px;}</style>

This Implementation Guide defines a base measurement profile with the elements common to all measurement profiles. The PHD Numeric, Compound Numeric, Coded Enumeration, BITs Enumeration, String Enumeration, and Rtsa Observation Profiles are used to report one of the six possible measurement types or classes sent by PHDs. 

The PHD Coincident Time Stamp Observation Profile is present for time auditing purposes. 

The PHD Device Profile is used to report the PHD features and properties. 

The PHG Device Profile is used to report the PHG properties.  

The PHD Patient Profile is used to report the patient data. Dependent on the use case the Patient resource may contain only keys to identify the patient that only the health care provider can match to a person. It is also possible that the Patient resource is never uploaded by the PHG. In that case the logical id to a Patient resource on the FHIR server must be provided to the PHG by out-of-band means.

### Notes on Examples
The examples referenced in these profile sections are what is *uploaded*. These examples will differ slightly from similar examples in the Artifacts section. The reason is that the examples in the Artifacts section are required to represent the resource *as it appears on the server*. However, when uploading, create operations either have no logical ids or temporary logical ids. Resources on the server, however, are required to have logical ids.

### Measurement Observation Profiles
The measurement observation profiles mirror the  measurement 'value-types' of that a IEEE 11073-10206 PHD can report. The measurement value-types and their mapping to FHIR Observation elements are shown in the following table:

|Measurement value-type|IEEE 11073-10206 Observation type|FHIR Observation element|
|-
|scalar |Numeric|valueQuantity|
|discrete | Discrete | valueCodeableConcept(s)
| |Single Event |valueCodeableConcept|
| |Multiple Event |component.valueCodeableConcept(s)|
| |Multiple Boolean State (Bitstring)|component.code<br/>component.valueCodeableConcepts|
|string |string enumeration|valueString|
|periodic samples |sample array|valueSampledData|
|compound |Compound |component.value[x]]|

An UML diagram is shown below:

<figure>
{% include acom-observations.svg %}
<figcaption>IEEE 11073-10206 ACOM Observation classes</figcaption>
</figure>

The value-type of measurement is the main difference between the observation-related profiles. The remaining attributes in the metric objects are common to all measurements and are thus mapped in the same way to FHIR.

### PHD Device Profile
The PHD Device profile for the IEEE 11073-20601 MDS object is for the device information like manufacturer name, model number, serial number, time properties, device type (blood pressure cuff, pulse oximeter, etc.), system identifier, transport address, etc. There is also a udiCarrier element that can support the UDI attribute.  

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

A transaction Bundle may prove useful in that case. A bundled upload will contain all or several of the resources, and resources within the Bundle that reference one another can be handled using temporary ids. One can use conditional creates on the Patient and Device resources and include them in the Bundle every time or at least until a response from the server gives one the logical ids. When the logical ids are obtained, the Patient and Device resources will no longer need to be included in the bundle. In the mean time, the conditional create assures no data duplication. One could refrain from ever checking the server response and always use conditional creates. However, that approach does put an extra burden on the server and does waste bandwidth. But platforms with limited hardware may have no other choice.

On the other hand, if the use case only involves PHDs that do not emit source-handle-references and do not need a Coincident Time Stamp, the single upload approach may prove to be much more efficient. It is also permissible to mix and match, using both single and Bundled uploads.

### The PHD IG Profiles

 - [Base Observation Profile](StructureDefinition-PhdBaseObservation.html)
   - [Numeric Observation Profile](StructureDefinition-PhdNumericObservation.html)
   - [Compound Numeric Observation Profile](CompoundNumericObservationProfile.html)
   - [Coded Enumeration Observation Profile](StructureDefinition-PhdCodedEnumerationObservation.html)
   - [BITs Enumeration Observation Profile](BITsEnumerationObservationProfile.html)
   - [Rtsa Observation Profile](RtsaObservationProfile.html)
   - [String Enumeration Observation Profile](StructureDefinition-PhdStringEnumerationObservation.html)
 - [Coincident Time Stamp Observation Profile](CoincidentTimeStampObservationProfile.html)
 - [Phd Device Profile](PhdDeviceProfile.html)
 - [Phg Device Profile](PhgDeviceProfile.html)
 - [Patient Profile](PhdPatientProfile.html)




 
