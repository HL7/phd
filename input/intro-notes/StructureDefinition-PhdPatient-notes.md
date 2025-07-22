<style>table, th, td {
border: 1px solid black;
border-collapse:collapse;
padding: 6px;}</style>

### PHG created Patient Resource
A Patient resource for a known or an unknown patient shall be created by the PHG according to this profile. This implies:
- The Patient resource shall have a `Patient.identifier` element from a known [HL7 v2-0203](http://terminology.hl7.org/CodeSystem/v2-0203) coding system.
- As an example the `MR` (Medical Record) code from this coding system may be used.
- The `Patient.identifier.value` element shall contain a value that is unique for the patient in the context of the health care provider.


### Examples:
An example of a PHD generated patient for a known patient is given [here](Patient-patientExample-1.html). 
An example of a PHD generated patient for an unknown patient is given [here](Patient-patientExample-2.html). 
These examples contain an optional name element.

