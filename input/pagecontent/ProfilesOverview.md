<style>table, th, td {
border: 1px solid black;
border-collapse:collapse;
padding: 6px;}</style>

This IG defines the following profiles:

 - [Base Observation Profile](StructureDefinition-PhdBaseObservation.html): the abstract base observation profile with elements common to the observation profiles reporting measurement values in this IG:
   - [Numeric Observation Profile](StructureDefinition-PhdNumericObservation.html): reports a numeric value
   - [Coded Enumeration Observation Profile](StructureDefinition-PhdCodedEnumerationObservation.html): reports a coded value
   - [BITs Enumeration Observation Profile](StructureDefinition-PhdBitsEnumerationObservation.html): reports a set of codes, each with a boolean value
   - [Rtsa Observation Profile](StructureDefinition-PhdRtsaObservation.html): reports sampled data such as a waveform
   - [String Observation Profile](StructureDefinition-PhdStringObservation.html): reports a (human-readable) string
   - [Compound Observation Profile](StructureDefinition-PhdCompoundObservation.html): reports multiple related values
   - [Compound Numeric Observation Profile](StructureDefinition-PhdCompoundNumericObservation.html): reports multiple numeric values
 - [Coincident Timestamp Observation Profile](StructureDefinition-PhdCoincidentTimeStampObservation.html): reports the PHD device time as observed by the PHG for time auditing purposes
 - [Phd Device Profile](StructureDefinition-PhdDevice.html): reports the PHD features and properties
 - [Phg Device Profile](StructureDefinition-PhgDevice.html): reports the PHG properties
 - [Patient Profile](StructureDefinition-PhdPatient.html): reports the patient data
 
### Measurement Observation Profiles
The measurement observation profiles mirror more or less the measurement 'value-types' of what an IEEE 11073-10206 ACOM PHD can report. The measurement value-types and their mapping to FHIR Observation elements are shown in the following table:

|Measurement value-type |IEEE 11073-10206 ACOM Observation type|IG Profile                                                                                         |FHIR Observation element|
|---|---|---|---|
|scalar                 |Numeric                          |[Numeric Observation Profile](StructureDefinition-PhdNumericObservation.html)                      |valueQuantity|
|discrete               |Discrete                         |                                                                                                   ||
|                       |Single Event                     |[Coded Enumeration Observation Profile](StructureDefinition-PhdCodedEnumerationObservation.html)   |valueCodeableConcept|
|                       |Multiple Event                   |[Compound Observation Profile](StructureDefinition-PhdCompoundObservation.html)                    |component.valueCodeableConcept(s)|
|                       |Multiple Booleans (Bitstring)    |[BITs Enumeration Observation Profile](StructureDefinition-PhdBitsEnumerationObservation.html)     |component.code<br/>component.valueCodeableConcepts|
|string                 |String                |[String Observation Profile](StructureDefinition-PhdStringObservation.html) |valueString|
|peridoic samples       |Sample array                     |[Rtsa Observation Profile](StructureDefinition-PhdRtsaObservation.html)                            |valueSampledData|
|compound               |Compound                         |[Compound Observation Profile](StructureDefinition-PhdCompoundObservation.html)                    |component.value[x]|
|compoundNumeric        |Compound Numeric                 |[Compound Numeric Observation Profile](StructureDefinition-PhdCompoundNumericObservation.html)     |component.valueQuantity|

Further information on the mapping of the ACOM Observation types to FHIR Observation elements can be found in the [DIM to FHIR Mapping section](DIMtoFHIRMapping.html). An UML diagram of the Observation profiles for measurements is shown below:

<figure>
<img src="acom-observations.png" alt="IEEE 11073-10206 ACOM Observation classes" style="width:90%" class="center">
<figcaption><i>IEEE 11073-10206 ACOM Observation classes</i></figcaption>
</figure>

The value-type of the measurement is the main difference between the observation-related profiles. The remaining attributes in the metric objects are common to all measurements and are thus mapped in the same way to FHIR.

### PHD Device Profile
The PHD Device profile for the IEEE 11073-10206 ACOM System Information object supports the static device information like manufacturer name, model number, serial number, time properties, device type (blood pressure cuff, pulse oximeter, etc.), system identifier, transport address, etc. There is also a udiCarrier element that can support the UDI attribute.  

### PHG Device Profile
A PHG is not part of IEEE 11073-10206 ACOM, but it is still software on a device and to work with a PHD it must support certain time features. The PHG is also responsible for correcting measurement timestamp data from the PHD if necessary. Thus, reporting the properties of the PHG, especially those properties that may have an influence on the reported measurement data, are considered important for this IG. To accomplish this task, the PHG is treated as if it has similar system information attributes as a PHD. In this manner a PHG can report its equivalent values of the information that would be in the PHD System Information. There is, however, no System-Type-Spec-List. It is clear that any measurement type a PHG decodes and maps it must support. Only the system-identifier and time synchronization values are required to be reported for a PHG.

### Some Notes for Implementers of Uploaders
One of the choices implementers have when uploading resources is to upload individual resources or upload a bundled set of resources. A challenge that implementers will have in either case as that the Observation resources have required references to Patient, PHD Device, and PHG Device resources, and often require references to a Coincident Timestamp Observation resource and perhaps other Observation resources. To obtain these references, one option is to upload the referenced resources first and to wait for the upload response from the server. When implementing a generic uploader that must be able to handle Coincident Timestamps and Observation references, this wait can significantly complicate the code and place a burden upon memory requirements.

A transaction Bundle may prove useful in that case. A bundled upload will contain all or several of the resources, and resources within the Bundle that reference one another can be handled using temporary ids. The uploader can use conditional creates on the Patient and Device resources and include them in the Bundle every time or at least until a response from the server gives one the logical ids. When the logical ids are obtained, the Patient and Device resources will no longer need to be included in the bundle. In the mean time, the conditional create assures no data duplication. The uploader also could refrain from ever checking the server response and always use conditional creates. However, that approach does put an extra burden on the server and does waste bandwidth. But platforms with limited hardware may have no other choice.

Another option for the PHG is to perform a FHIR server query to obtain the patient logical id using the provided patient information and to perform an initial upload of the PHD(s) and PHG device resources to obtain their logical ids. These logical ids can then be used in subsequent uploads by the PHG.

On the other hand, if the use case only involves PHDs that do not emit Observations referencing other Observations and do not need a Coincident Timestamp, the single upload approach may prove to be more efficient. It is also permissible to mix and match, using both single and Bundled uploads.

### Patient Profile
The PHD Patient Profile is used to report the patient data. Dependent on the use case the Patient resource may contain only keys to identify the patient that only the health care provider can match to a person. It is also possible that the Patient resource is never uploaded by the PHG. In that case the logical id to a Patient resource on the FHIR server must be provided to the PHG by out-of-band means.

### PII/PHI protection
Patient information, such as demographic and administrative information, is considered sensitive and must be properly protected. PHDs are typically used in home-care contexts, and the information they provide is often transmitted over public networks. Therefore, it is essential to protect Personally Identifiable Information (PII) and Personal Health Information (PHI).

Normally PHDs do not need to store any patient information, and the PHDs themselves do not provide any patient information through standardized protocols. Therefore, the PHDs do not need to be concerned with PII/PHI protection. However, the Personal Health Gateway (PHG) needs some patient information to upload data, and it must handle this information appropriately.

Implementations are also free to populate any of the other fields of the Patient resource. A common case where PII/PHI may be of little concern is in the handling of fitness data from activity monitors and related fitness devices. 

This IG does not specify protections for PII. Implementers are expected to ensure adequate protections based on risk, jurisdiction and other factors.
 
