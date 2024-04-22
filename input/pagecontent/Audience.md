This Implementation Guide is meant for developers of both PHD data uploaders and of readers of FHIR resources that process measurement data provided by PHDs. Specifically, the implementers of Continua-certified Personal Health Gateways (PHGs) can use this Implementation Guide to encode PHD information into FHIR resources that can be stored on FHIR servers for further processing or analysis. 95% of this guide is dedicated to the uploader which has to work with the complexities of IEEE 11073-20601. Consumers needing PHD information will use this guide to ascertain what resources to access and what elements in those resources has the desired information. Ultimately, the Implementation Guide will help personal health device manufacturers and service providers to map measurement and device data into a FHIR-based information system.

It is not necessary that the data model specified by this Implementation Guide be used solely in the context of RESTful FHIR servers. The *Continua H.812.5 FHIR Observation Upload Guidelines* define two upload scenarios and their security and authentication requirements. One is for the upload to a FHIR server using RESTful FHIR while the second is to non-persisting servers for those endpoints that are interested in receiving the data in the form of FHIR resources but are not interested in supporting the rest of the FHIR infrastructure.

This guide will be of use to anyone who wishes to work with IEEE 11073-20601 PHD data in FHIR format. 

 - [Next: Scope](Scope.html)
 - [Previous: Purpose](Purpose.html)
