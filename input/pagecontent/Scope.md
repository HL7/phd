This Implementation Guide is utilized by the Continua design guidelines and by the IHE remote patient monitoring architecture. Continua defines design guidelines for Personal Health Device (PHD) to Personal Health Gateway (PHG) communications where the PHG uploads the device data using one of three data models that include either HL7 V2 PCD-01, HL7 V3 PHMR CDA, or FHIR. For each of these data models there are associated transport transactions (not to be confused with FHIR transactions such as creates, conditional creates, updates, etc.) and mappings from the base device standard, which is the IEEE 11073 PHD, to FHIR objects. This guide is concerned with the FHIR data model based upon FHIR version 4.0.0 (though it is consistent with versions 3.5.0 and up) and specifies how one maps PHD information into FHIR resources and defines profiles of the resources involved.

It is important to emphasize that the scope of this guide is limited to the mapping of physiological measurements and device data from *communicating* PHDs. Furthermore, these PHDs must communicate a sufficient amount of information in a manner that guarantees the generation of reliable measurement time stamps.

It is anticipated that this guide will be used in any scenario where physiological measurements from PHDs are needed. For example, a Patient Care profile that requires a patient take one or more measurements using appropriate PHDs and upload those measurements. The Patient Care profile could specify the use of this IG to perform the uploads. The Patient Care profile would then know what FHIR resources to read and how to extract the information of interest from those resources.


 - [Next: Use Cases](UseCases.html)
 - [Previous: Audience](Audience.html)
