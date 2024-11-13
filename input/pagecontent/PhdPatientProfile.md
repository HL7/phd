The PHD Patient Profile may or may not include patient identifiable information depending on a particular need. In a typical upload, the PHD will not provide patient information, and the PHG may need to obtain patient information out-of-band through means other the PHD Patient Profile. In Remote Patient Monitoring, use cases range from the necessity to completely protect Patient Health Information (PHI) to that where no protection at all is deemed necessary. This profile supports all such options. One upload option is that a Patient Resource is never generated and no patient information is present on the PHG. Instead, the health care provider gives the PHG the ‘logical id’ of a Patient Resource that may or may not exist on the destination server. The PHG uses this logical id in the Observation.subject element with the assumption that the server will understand the reference when the Observation is received.

If a Patient Resource is to be created, this profile only requires that the Patient.identifier.system, Patient.identifier.value, Patient.identifier.type.coding.code and Patient.identifier.type.coding.system be populated. The Patient.name element is optional. This approach still affords PHI protection since the values in the required fields cannot be associated to a person without some kind of dictionary, usually only available to the health care provider.

The minimum requirement does not prevent the use of the Patient.name or any other element in the Patient resource. There are also use cases where exposure of PHI is desired just out of convenience. For example, a cross country coach tracking of the miles run by members of a cross country team. The athletes all wear fitness devices. The data is uploaded to a server where the coach can keep track of the training regime to check development and plan future workouts given upcoming races. The information is accessible to all team  members who tend to be equally as interested in their mileage statistics. Protecting this type of fitness information is probably not worth the effort and inconvenience associated with such protection measures.

<style>table, th, td {
border: 1px solid black;
border-collapse:collapse;
padding: 6px;}</style>

The structure definition for the Phd Patient Profile is given [here](StructureDefinition-PhdPatient.html).

### Mapping
A Patient resource for a known or an unknown patient shall be  created by the PHG according to the following mapping:

|patient information|FHIR mapping|Value for a known patient|Value for an unknown patient|
|-
|patient identifier|Patient.identifier.value|Generally a code from the health care provider identifying the patient|'U'|
|health care provider identifier|Patient.identifier.system|Generally a code identifying the health care provider|[http://terminology.hl7.org/CodeSystem/v2-0004](http://terminology.hl7.org/CodeSystem/v2-0004)|
|fixed coding system|Patient.identifier.type.coding.system|[http://terminology.hl7.org/CodeSystem/v2-0203](http://terminology.hl7.org/CodeSystem/v2-0203)|[http://terminology.hl7.org/CodeSystem/v2-0203](http://terminology.hl7.org/CodeSystem/v2-0203)|
|code |Patient.identifier.type.coding.code|A code such as 'MR' (medical record) or 'LR' (local registry) from the above coding system|'U'|


### Examples:
An example of a PHD patient mapping for a known patient is given [here](Patient-patientExample-1.html). The example contains an optional name element.<br>
An example of a PHD patient mapping for an unknown patient is given [here](Patient-patientExample-2.html). The example contains an optional name element.

