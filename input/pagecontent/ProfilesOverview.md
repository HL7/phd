<style>table, th, td {
border: 1px solid black;
border-collapse:collapse;
padding: 6px;}</style>

This IG defines the following profiles:

 - [Base Observation Profile](StructureDefinition-PhdBaseObservation.html): the abstract base observation profile with elements common to the observation profiles reporting measurement values in this IG:
   - [Numeric Observation Profile](StructureDefinition-PhdNumericObservation.html): reports a numeric value
   - [Compound Numeric Observation Profile](StructureDefinition-PhdCompoundNumericObservation.html): reports multiple numeric values
   - [Coded Enumeration Observation Profile](StructureDefinition-PhdCodedEnumerationObservation.html): reports a coded value
   - [BITs Enumeration Observation Profile](StructureDefinition-PhdBitsEnumerationObservation.html): reports a set of codes, each with a boolean value
   - [Rtsa Observation Profile](StructureDefinition-PhdRtsaObservation.html): reports sampled data such as a waveform
   - [String Enumeration Observation Profile](StructureDefinition-PhdStringEnumerationObservation.html): reports a (human-readable) string
   - [Compound Observation Profile](StructureDefinition-PhdCompoundObservation.html): reports a number of related values
 - [Coincident Timestamp Observation Profile](StructureDefinition-PhdCoincidentTimeStampObservation.html): reports the PHD device time as observed by the PHG for time auditing purposes
 - [Phd Device Profile](StructureDefinition-PhdDevice.html): reports the PHD features and properties
 - [Phg Device Profile](StructureDefinition-PhgDevice.html): reports the PHG properties
 - [Patient Profile](StructureDefinition-PhdPatient.html): reports the patient data
 
### Measurement Observation Profiles
The measurement observation profiles mirror more or less the measurement 'value-types' of that a IEEE 11073-10206 PHD can report. The measurement value-types and their mapping to FHIR Observation elements are shown in the following table:

|Measurement value-type |IEEE 11073-10206 Observation type|IG Profile                                                                                         |FHIR Observation element|
|-
|scalar                 |Numeric                          |[Numeric Observation Profile](StructureDefinition-PhdNumericObservation.html)                      |valueQuantity|
|discrete               |Discrete                         |                                                                                                   ||
|                       |Single Event                     |[Coded Enumeration Observation Profile](StructureDefinition-PhdCodedEnumerationObservation.html)   |valueCodeableConcept|
|                       |Multiple Event                   |[Compound Observation Profile](StructureDefinition-PhdCompoundObservation.html)                    |component.valueCodeableConcept(s)|
|                       |Multiple Booleans (Bitstring)    |[BITs Enumeration Observation Profile](StructureDefinition-PhdBitsEnumerationObservation.html)     |component.code<br/>component.valueCodeableConcepts|
|string                 |String enumeration               |[String Enumeration Observation Profile](StructureDefinition-PhdStringEnumerationObservation.html) |valueString|
|peridoic samples       |Sample array                     |[Rtsa Observation Profile](StructureDefinition-PhdRtsaObservation.html)                            |valueSampledData|
|compoundNumeric        |Compound Numeric                 |[Compound Numeric Observation Profile](StructureDefinition-PhdCompoundNumericObservation.html)     |component.valueQuantity|
|compound               |Compound                         |[Compound Observation Profile](StructureDefinition-PhdCompoundObservation.html)                    |component.value[x]|

An UML diagram of the Observation profiles for measurements is shown below:

<figure>
{% include acom-observations.svg %}
<figcaption>IEEE 11073-10206 ACOM Observation classes</figcaption>
</figure>
<p>
The value-type of the measurement is the main difference between the observation-related profiles. The remaining attributes in the metric objects are common to all measurements and are thus mapped in the same way to FHIR.
</p>

### PHD Device Profile
The PHD Device profile for the IEEE 11073-10206 System Information object supports the static device information like manufacturer name, model number, serial number, time properties, device type (blood pressure cuff, pulse oximeter, etc.), system identifier, transport address, etc. There is also a udiCarrier element that can support the UDI attribute.  

### PHG Device Profile
A PHG is not part of IEEE 11073-10206, but it is still software on a device and to work with a PHD it must support certain time features. The PHG is also responsible for correcting measurement timestamp data from the PHD if necessary. Thus, reporting the properties of the PHG, especially those properties that may have an influence on the reported measurement data, are considered important for this IG. To accomplish this task, the PHG is treated as if it has similar system information attributes as a PHD. In this manner a PHG can report its equivalent values of the information that would be in the System-Id, System-Model, Production-Specification, etc. There is, however, no System-Type-Spec-List. It is clear that any measurement type a PHG decodes and maps it must support. Only the System id and time synchronization values are required to be reported for a PHG.

### Some Notes for Implementers of Uploaders
One of the choices implementers have when uploading resources is to upload individual resources or upload a bundled set of resources. A challenge that implementers will have in either case as that the Observation resources have required references to Patient, PHD Device, and PHG Device resources, and often require references to a Coincident Timestamp Observation resource and perhaps other Observation resources (when the PHD sends a source handle reference attribute). To obtain these references, one option is to upload the referenced resources first and to wait for the upload response from the server. When implementing a generic uploader that must be able to handle Coincident Timestamps and source-handle-references, this wait can significantly complicate the code and place a burden upon memory requirements.

A transaction Bundle may prove useful in that case. A bundled upload will contain all or several of the resources, and resources within the Bundle that reference one another can be handled using temporary ids. The uploader can use conditional creates on the Patient and Device resources and include them in the Bundle every time or at least until a response from the server gives one the logical ids. When the logical ids are obtained, the Patient and Device resources will no longer need to be included in the bundle. In the mean time, the conditional create assures no data duplication. The uploader also could refrain from ever checking the server response and always use conditional creates. However, that approach does put an extra burden on the server and does waste bandwidth. But platforms with limited hardware may have no other choice.

Another option for the PHG is to perform a FHIR server query to obtain the patient logical id using the provided patient information and to perform an initial upload of the PHD(s) and PHG device resources to obtain their logical ids. These logical ids can then be used in subsequent uploads by the PHG.

On the other hand, if the use case only involves PHDs that do not emit source-handle-references and do not need a Coincident Timestamp, the single upload approach may prove to be much more efficient. It is also permissible to mix and match, using both single and Bundled uploads.

### Patient Profile
The PHD Patient Profile is used to report the patient data. Dependent on the use case the Patient resource may contain only keys to identify the patient that only the health care provider can match to a person. It is also possible that the Patient resource is never uploaded by the PHG. In that case the logical id to a Patient resource on the FHIR server must be provided to the PHG by out-of-band means.


 
