In Continua uploads the patient information is the only content that is not provided by the PHD. The PHG must obtain this information out of band. In Remote Patient Monitoring, use cases range from the necessity to completely protect Patient Health Information (PHI) to that where no protection at all is deemed necessary. This profile supports all such options. One Continua upload option is that a Patient Resource is never generated and no patient information is present on the PHG. Instead, the health care provider gives the PHG the 'logical id' of a Patient Resource that may or may not exist on the destination server. The PHG uses this logical id in the Observation.subject element with the assumption that the server will understand the reference when the Observation is received.

If a Patient Resource is to be created, this profile only requires that the Patient.identifier.system, Patient.identifier.value, Patient.identifier.type.coding.code and Patient.identifier.type.coding.system be populated. The Patient.name element is optional. This approach still affords PHI protection since the values in the required fields cannot be associated to a person without some kind of dictionary, usually only available to the health care provider.

The minimum requirement does not prevent the use of the Patient.name or any other element in the Patient resource. There are also use cases where exposure of PHI is desired just out of convenience. For example, a cross country coach tracking of the miles run by members of a cross country team. The athletes all wear fitness devices. The data is uploaded to a server where the coach can keep track of the training regime to check development and plan future workouts given upcoming races. The information is accessible to all team  members who tend to be equally as interested in their mileage statistics. Protecting this type of fitness information is probably not worth the effort and inconvenience associated with such protection measures.

<style>table, th, td {
border: 1px solid black;
border-collapse:collapse;
padding: 6px;}</style>

The profile in the meta element shall be http://hl7.org/fhir/uv/phd/StructureDefinition/PhdPatient

The structure definition for the Phd Patient Profile is given [here](PhdPatient.html)

### Mapping
When a Patient resource for a known patient is to be created by the PHG the following mapping is used:

|patient information|FHIR mapping|Description|
|-
|patient identifier|Patient.identifier.value|Generally a code from the health care provider identifying the patient|
|health care provider identifier|Patient.identifier.system|Generally a code identifying the health care provider|
|code system|Patient.identifier.type.coding.system|"http://hl7.org/fhir/CodeSystem/v2-0203 "
|code system code|Patient.identifier.type.coding.code|The code system identifier code such as 'MR' (medical record) or 'L' (local)|

<br>
When a Patient is unknown the following mapping is used:

|patient information|FHIR mapping|Description|
|-
|patient identifier|Patient.identifier.value|'U'|
|health care provider identifier|Patient.identifier.system|"http://hl7.org/fhir/CodeSystem/v2-0004 "
|code system|Patient.identifier.type.coding.system|"http://hl7.org/fhir/CodeSystem/v2-0203 "
|code system code|Patient.identifier.type.coding.code|'U'|

### Examples:
An example of a PHD patient mapping is given [here](patientExample.html). The example contains an optional name element.

### The Other Profiles

 - [Profiles Overview](ProfilesOverview.html)
 - [Base Observation Profile](BaseObservationProfile.html)
 - [Numeric Observation Profile](NumericObservationProfile.html)
 - [Compound Numeric Observation Profile](CompoundNumericObservationProfile.html)
 - [Coded Enumeration Observation Profile](CodedEnumerationObservationProfile.html)
 - [BITs Enumeration Observation Profile](BITsEnumerationObservationProfile.html)
 - [Rtsa Observation Profile](RtsaObservationProfile.html)
 - [String Enumeration Observation Profile](StringEnumerationObservationProfile.html)
 - [Coincident Time Stamp Observation Profile](CoincidentTimeStampObservationProfile.html)
 - [Phd Device Profile](PhdDeviceProfile.html)
 - [Phg Device Profile](PhgDeviceProfile.html)
