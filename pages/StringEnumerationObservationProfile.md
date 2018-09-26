---
title: PHD String Enumeration Observation Profile
layout: default
active: StringEnumerationObservationProfile
---

The String Enumeration Observation Profile is used when the PHD metric measurement contains one of the following attributes:

|Attribute|Value|
|-
|Enum-Observed-Value-Simple-Str|Human readable string|
|Enum-Observed-Value|Human readable string when indicated|

This measurement is just a human readable string and is not designed to support generic interpretation by machine. To date it is used in only the Cardiovascular specialization to report the name of some exercise program option.

//TODO: Structure definition for this profile

### Mapping the Enumeration String to FHIR
The human readable string from the Enum-Observed-Value-Simple-Str attribute is mapped to the Observation.valueString element.

### Meta Data Profile
The uploader shall populate the Device.meta.profile with http://pchalliance.org/phdfhir/StructureDefinition/PhdStringEnumerationObservation indicating this resource is generated following the PHD Implementation Guide.

#### Conditional Create Identifier Generation
For a general description of the PHD Profile Identifier see the "PHD Profile Identifier" section in [PHD Base Profile]({{ output }}BaseObservationProfile.html). The table below lists the items that make up the identifier.

|Entry|value|Additional information|
|-
|device|"PHD Device.identifier.value"|This value is the PHD IEEE EUI-64 system identifier|
|patient|"Patient.identifier.value-Patient.identifier.system" or<br/>provided logical id|The dashes are part of the identifier. <br/>When the service provider gives the PHG a pre-determined patient logical id the PHG creates no Patient resource and has no patient information. In that special case the provided logical id is used|
|type|"Observation.code.coding.code"|See [Obtaining the Observation.code]({{ output }}ObtainObservationCode.html)|
|value|"Observation.valueString" or <br/>"Observation.dataAbsentReason.coding.code"|The human readable string or <br/>the data absent reason code if needed|
|reported PHD timestamp|"timestamp"|See [Generating the PHD Reported Time Stamp]({{ output }}ObtainObservationCode.html)|
|supplemental types|"Supplemental-Types.*N*-"|A sequence of 32-bit MDC codes separated by a dash|

The final identifier is made by concatenating the entries above as follows:
 - "device-patient-type-value-reported PHD timestamp-supplemental types"

### Additional Enumeration Measurement Information
There are no additional descriptive attributes that are unique to the Enumeration type of measurement.