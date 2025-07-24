
These sections provide background on the concepts behind the technical mapping approach and how the PHD's IEEE 11073-10206 ACOM Objects, which represent the measurements and device data, are related to FHIR Observation and Device resources. The normative details of the mapping are given in the Profiles sections. Implementers who are familiar with the concepts behind the IEEE 11073-10206 model can skip these sections and proceed directly to the [Profile Details sections](ProfilesOverview.html) or the [artifacts chapter](artifacts.html) which lists all the Structure Definitions, Code Systems, Value Sets, Capability Statements, and Examples included in this guide. It should be noted that the non-Bundle examples illustrate the resources once on the FHIR server. These examples will always have logical ids, but in many cases, the uploaded example should NOT have logical ids.
The mapping sections require knowledge of the IEEE 11073-10206 model and are intended for implementers of Personal Health Gateways (PHGs).

 - [Remote Patient Monitoring Considerations](RemotePatientMonitoringConsiderations.html)
 - [Generic and Extensible Modelling Approach](GenericModel.html)
 - [DIM to FHIR Mapping](DIMtoFHIRMapping.html)
   - [IEEE 11073 FLOATs and SFLOATs](FLOATS.html)
   - [IEEE 11073-10101 Nomenclature Codes](Nomenclaturecodes.html)
   - [Generating the Timestamp part of the Observation Identifier](GeneratingtheTimeStampPartIdentifier.html)
 - [Non-IEEE 11073-10206 PHD Devices](Non11073PHDDevices.html)
