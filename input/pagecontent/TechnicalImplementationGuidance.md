
These sections provide background on the concepts behind the technical mapping approach and how the PHD's IEEE 11073-10206 ACOM Objects, which represent the measurements and device data, are related to FHIR Observation and Device resources. The normative details of the mapping are given in the Profiles sections. Implementers who are familiar with the concepts behind the IEEE 11073-10206 model can skip these sections and proceed directly to the [Profile Details sections](ProfilesOverview.html) or the [artifacts chapter](artifacts.html) which lists all the Structure Definitions, Code Systems, Value Sets, Capability Statements, and Examples included in this guide. It should be noted that the non-Bundle examples illustrate the resources once on the FHIR server. These examples will always have logical ids, but in many cases, the uploaded example should NOT have logical ids.
The mapping sections require knowledge of the IEEE 11073-10206 model and are intended for implementers of Personal Health Gateways (PHGs).

 - [Remote Patient Monitoring Considerations](RemotePatientMonitoringConsiderations.html)
 - [Generic and Extensible Modelling Approach](GenericModel.html)
 - [DIM to FHIR Mapping Basics](DIMtoFHIRMapping.html)
 - [DIM to FHIR Mapping Details](DIMtoFHIRMappingDetails.html)
   - [Definition of a Metric Measurement](DefinitionMetricMsmt.html)
   - [Protocol Only Metric Attributes](MetricAttributesofNoInterest.html)
   - [Mder FLOATs and SFLOATs](MderFLOATsandSFLOATs.html)
   - [Nomenclature Codes](Nomenclaturecodes.html)
   - [FHIR's Codeable Concepts](CodeableConcepts.html)
   - [Obtaining the Observation.code](ObtainObservationCode.html)
   - [Obtaining the Unit code](ObtainUnitCode.html)
   - [The Observation Identifier](ObservationIdentifier.html)
   - [Generating the Reported Timestamp Observation Identifier](GeneratingtheReportedTimeStampIdentifier.html)
 - [Coincident Timestamp](CoincidentTimeStamp.html) 
 - [Non-IEEE 11073-10206 PHD Devices](Non11073PHDDevices.html)
