<style>table, th, td {
border: 1px solid black;
border-collapse:collapse;
padding: 6px;}</style>

### PHG created Patient Resource
§The PHG SHALL use a `Patient.identifier` supplied by the server when one is provided.§ §If the server does not provide an identifier, the PHG SHALL generate an implementation-dependent identifier whose value is unique within its assigning system.§
- §The type for a PHG-generated patient identifier SHOULD use a suitable code from the [HL7 v2-0203](http://terminology.hl7.org/CodeSystem/v2-0203) coding system.§ The PHG could use `MR` when the patient's medical record number is known to the PHG, or `U` when it generates an implementation-dependent unique identifier.


### Examples:
An example of a PHD generated patient for a known patient is given [here](Patient-patientExample-1.html). 
An example of a PHD generated patient for an unknown patient is given [here](Patient-patientExample-2.html). 
These examples contain an optional `name` element.

