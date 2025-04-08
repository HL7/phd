<style>table, th, td {
border: 1px solid black;
border-collapse:collapse;
padding: 6px;}</style>

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

