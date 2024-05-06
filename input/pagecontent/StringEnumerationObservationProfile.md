The String Enumeration Observation Profile is used when the PHD metric measurement is a human readable string. These types of measurements have the disadvantage of being unprocessable by machine without out-of-band information. Codes are often used instead where the end user can display them appropriately based upon locale.

The measurement is a human reable string when the PHD metric measurement contains one of the following attributes:

<style>table, th, td {
border: 1px solid black;
border-collapse:collapse;
padding: 6px;}</style>

|Attribute|Value|
|-
|Enum-Observed-Value-Simple-Str|Human readable string|
|Enum-Observed-Value|Human readable string when indicated|

This measurement is just a human readable string and is not designed to support generic interpretation by machine. To date it is used in only the Cardiovascular specialization to report the name of some exercise program option.

Structure definition for this profile is defined [here](StructureDefinition-PhdStringEnumerationObservation.html)

### Mapping the Enumeration String to FHIR
The human readable string from the Enum-Observed-Value-Simple-Str attribute is mapped to the Observation.valueString element.

### Conditional Create Identifier Generation
For a general description of the PHD Observation Identifier see the "PHD Observation Identifier" section in [PHD Base Profile](BaseObservationProfile.html). The table below lists the items that make up the identifier.

|Entry|value|Additional information|
|-
|device|"PHD Device.identifier.value"|This value is the PHD IEEE EUI-64 system identifier|
|patient|"Patient.identifier.value-Patient.identifier.system" or<br/>provided logical id|The dashes are part of the identifier. <br/>When the service provider gives the PHG a pre-determined patient logical id the PHG creates no Patient resource and has no patient information. In that special case the provided logical id is used|
|type|"Observation.code.coding.code"|See [Obtaining the Observation.code](ObtainObservationCode.html)|
|value|"Observation.valueString" or <br/>"Observation.dataAbsentReason.coding.code"|The human readable string or <br/>the data absent reason code if needed|
|reported PHD timestamp|"timestamp"|See [Generating the PHD Reported Time Stamp](ObtainObservationCode.html)|
|supplemental types|"Supplemental-Types.*N*-"|A sequence of 32-bit MDC codes separated by a dash|

The final identifier is made by concatenating the entries above as follows:
 - "device-patient-type-value-reported PHD timestamp-supplemental types"

### Additional Enumeration Measurement Information
There are no additional descriptive attributes that are unique to the Enumeration type of measurement.

### Examples:

String enumeration measurements are very rare. This example shows an example from a glucose meter explaining why a measurement failed. There is no such measurement type defined in the Glucose specialization so this manufacturer used a private attribute. [Enumeration String measurement](EnumString.html).

### The Other Profiles

 - [Profiles Overview](ProfilesOverview.html)
 - [Base Observation Profile](BaseObservationProfile.html)
 - [Numeric Observation Profile](NumericObservationProfile.html)
 - [Compound Numeric Observation Profile](CompoundNumericObservationProfile.html)
 - [Coded Enumeration Observation Profile](CodedEnumerationObservationProfile.html)
 - [BITs Enumeration Observation Profile](BITsEnumerationObservationProfile.html)
 - [Rtsa Observation Profile](RtsaObservationProfile.html)
 - [Coincident Time Stamp Observation Profile](CoincidentTimeStampObservationProfile.html)
 - [Phd Device Profile](PhdDeviceProfile.html)
 - [Phg Device Profile](PhgDeviceProfile.html)
 - [Patient Profile](PhdPatientProfile.html)