---
title: PHD Patient Observation Profile
layout: default
active: PatientProfile
---

In Continua uploads the patient information is the only content that is not provided by the PHD. The PHG must obtain this information out of band. In Remote Patient Monitoring there is also a concern about protecting Patient Health Information. Thus one Continua upload option is that a Patient Resource is never generated and no patient information is present on the PHG. Instead, the health care provider gives the PHG the 'logical id' of a Patient Resource that may or may not exist on the destination server. The PHG uses this logical id in the Observation.subject element with the assumption that the server will understand the reference when the Observation is received.

Otherwise, if the PHG is to create the Patient Resource, this profile requires that only the Patient.identifier.system, Patient.identifier.value, Patient.identifier.type.coding.code and Patient.identifier.type.coding.system be populated. The Patient.name element is optional. This approach still affords Patient Health Information protection since the values in the required fields cannot be associated to a person without some kind of dictionary.

The structure definition for the Phd Patient Profile is shown below:
{{tree:phd/Patient}} 

### Mapping
When a Patient resource for a known patient is to be created by the PHG the following mapping is used:

|patient information|FHIR mapping|Description|
|-
|patient identifier|Patient.identifier.value|Generally a code from the health care provider identifying the patient|
|health care provider identifier|Patient.identifier.system|Generally a code identifying the health care provider|
|code system|Patient.identifier.type.coding.system|"http://hl7.org/fhir/v2/0203 "
|code system code|Patient.identifier.type.coding.code|The code system identifier code such as 'MR' (medical record) or 'L' (local)|

<br>
When a Patient is unknown the following mapping is used:

|patient information|FHIR mapping|Description|
|-
|patient identifier|Patient.identifier.value|'U'|
|health care provider identifier|Patient.identifier.system|"http://hl7.org/fhir/v2/0004 "
|code system|Patient.identifier.type.coding.system|"http://hl7.org/fhir/v2/0203 "
|code system code|Patient.identifier.type.coding.code|'U'|

