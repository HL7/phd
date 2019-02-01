The Coded Enumeration Observation Profile is used when the PHD metric measurement contains one of the following attributes:

<style>table, th, td {
border: 1px solid black;
border-collapse:collapse;
padding: 6px;}</style>

|Attribute|Value|Additional Information|
|-
|Enum-Observed-Value-Simple-OID|16-bit term code|The partition is obtained from the Type attribute or the Enum-Observed-Value-Partition attribute|
|Enum-Observed-Value|16-bit term code when an OID|The partition is obtained from the Type attribute or the Enum-Observed-Value-Partition attribute|

The Enum-Observed-Value-Simple-OID attribute is used when the measurement is itself an MDC code. This type of measurement is most common when reporting the context of another measurement, for example the meal context of a glucose measurement and/or the current state of health. Enumeration measurements are used when there is a finite set of fixed possibilities for the measurement to take. The attribute contains only the 16-bit term code. The partition typically comes from the Type attribute or, in special cases, the Enum-Observed-Value-Partition attribute.

The Enum-Observed-Value attribute is a complex attribute and can be any one of the three possible enumeration measurements. There is an element in the structure which indicates which type of enumeration it is. If it is an 'OID' type it has an MDC term code. The attribute also has its own metric-id value telling what it is and status value. The metric-id value replaces the term code given by the Type attribute for the *type* of measurement (*not the measurement!*) and the status value replaces the Measurement-Status attribute.

The structure definition for this profile is given [here](PhdCodedEnumerationObservation.html)

### Mapping Coded Enumerations to FHIR
The following table shows how the coded enumeration attributes are mapped to FHIR.

|Attribute|FHIR coding|
|-
|Enum-Observed-Value-Simple-OID.*value*|Observation.valueCodeableConcept.coding.code|
|Enum-Observed-Value.*value*<br/>Enum-Observed-Value.*metric-id*<br/>Enum-Observed-Value.*status*|Observation.valueCodeableConcept.coding.code<br/>effects Observation.code see [Obtaining the Observation.code](ObtainObservationCode.html) <br/>see Measurement Status in [PHD Base Observation Profile](BaseObservationProfile.html) |

### Meta Data Profile
The uploader shall populate the Device.meta.profile with http://hl7.org/fhir/uv/phd/StructureDefinition/PhdCodedEnumerationObservation indicating this resource is generated following the PHD Implementation Guide.

### Conditional Create Identifier Generation
For a general description of the PHD Observation Identifier see the "PHD Observation Identifier" section in [PHD Base Observation Profile](BaseObservationProfile.html The table below lists the items that make up the identifier.

|Entry|value|Additional information|
|-
|device|"PHD Device.identifier.value"|This value is the PHD IEEE EUI-64 system identifier|
|patient|"Patient.identifier.value-Patient.identifier.system" or<br/>provided logical id|The dashes are part of the identifier. <br/>When the service provider gives the PHG a pre-determined patient logical id the PHG creates no Patient resource and has no patient information. In that special case the provided logical id is used|
|type|"Observation.code.coding.code"|See [Obtaining the Observation.code](ObtainObservationCode.html)|
|value|"Observation.valueCodeableConcept.coding.code" or <br/>"Observation.dataAbsentReason.coding.code"|The enumeration 32-bit MDC code of the measurement or <br/>the data absent reason code if there is no value|
|reported PHD timestamp|"timestamp"|See [Generating the PHD Reported Time Stamp](GeneratingtheReportedTimeStampIdentifier.html)|
|supplemental types|"Supplemental-Types.*N*-"|A sequence of 32-bit MDC codes separated by a dash|

The final identifier is made by concatenating the entries above as follows:
 - "device-patient-type-value-reported PHD timestamp-supplemental types"

### Additional Enumeration Measurement Information
There are no additional descriptive attributes that are unique to the Enumeration type of measurement.

### Examples:
The [Glucose Meal Context](glucoseEnum.html) example shows a glucose meal context measurement. The meal context is a limited set of coded values indicating when the measurement was taken relative to a meal. The measurement SHOULD have an Observation.derivedFrom entry pointing to the glucose concentration measurement to which it refers. The fact it does not was a miss in the Glucose specialization standard and has since been corrected, but the device that reported this measurement was made before the change in the standard.

### The Other Profiles

 - [Profiles Overview](ProfilesOverview.html)
 - [Base Observation Profile](BaseObservationProfile.html)
 - [Numeric Observation Profile](NumericObservationProfile.html)
 - [Compound Numeric Observation Profile](CompoundNumericObservationProfile.html)
 - [BITs Enumeration Observation Profile](BITsEnumerationObservationProfile.html)
 - [Rtsa Observation Profile](RtsaObservationProfile.html)
 - [String Enumeration Observation Profile](StringEnumerationObservationProfile.html)
 - [Coincident Time Stamp Observation Profile](CoincidentTimeStampObservationProfile.html)
 - [Phd Device Profile](PhdDeviceProfile.html)
 - [Phg Device Profile](PhgDeviceProfile.html)
 - [Patient Profile](PhdPatientProfile.html)

