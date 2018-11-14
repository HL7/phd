The Numeric Observation Profile is used when the PHD metric measurement contains one of the following attributes:

<style>table, th, td {
border: 1px solid black;
border-collapse:collapse;
padding: 6px;}</style>

|Attribute|Value|Additional Information|
|-
|Basic-Nu-Observed-Value|16-bit Mder SFLOAT|12-bit mantissa|
|Simple-Nu-Observed-Value|32-bit Mder FLOAT|24-bit mantissa|
|Nu-Observed-Value|32-bit Mder FLOAT|Complex attribute. Also contains<br/> metric-id<br/> measurement status<br/> unit-code|

These attributes contain a measurement value that is a single number. The Mder SFLOAT and FLOAT encodings indicate both precision and the number of significant figures. The Observation.valueQuantity.value element is required to honor the reported precision. See the section [Mder FLOATs and SFLOATs](MderFLOATsandSFLOATs.html) for instructions on handling Mder S/FLOATs and their encoding to the valueQuantity .

The structure definition for this profile is given [here](PhdNumericObservation.html)

### Mapping Numerics to FHIR
The following table shows how the numeric attributes are mapped to FHIR. Since the FHIR Quantity also contains the units the Unit-Code attribute value is required to complete the picture. The MDC unit code needs to be mapped to UCUM.

|Attribute|FHIR coding|
|-
|Basic-Nu-Observed-Value.*value*<br/>Unit-Code.*code*|Observation.valueQuantity.value<br/>Observation.valueQuantity.code (as UCUM)|
|Simple-Nu-Observed-Value.*value*<br/>Unit-Code.*code*|Observation.valueQuantity.value<br/>Observation.valueQuantity.code (as UCUM)|
|Nu-Observed-Value.*value*<br/>Nu-Observed-Value.*unit*<br/>Nu-Observed-Value.*metric-id*<br/>Nu-Observed-Value.*status*|Observation.valueQuantity.value<br/>Observation.valueQuantity.code<br/>effects Observation.code see [Obtaining the Observation.code](ObtainObservationCode.html) <br/>handle measurement status see [PHD Base Observation Profile](BaseObservationProfile.html) |

### Meta Data Profile
The uploader shall populate the Device.meta.profile with http://hl7.org/fhir/uv/phd/StructureDefinition/PhdNumericObservation indicating this resource is generated following the PHD Implementation Guide.

### Conditional Create Identifier Generation
For a general description of the PHD Observation Identifier see the "PHD Observation Identifier" section in [PHD Base Observation Profile](BaseObservationProfile.html). The table below lists the items that make up the identifier.

|Entry|value|Additional information|
|-
|device|"PhdDevice.identifier.value"|This value is the PHD IEEE EUI-64 system identifier|
|patient|"Patient.identifier.value-Patient.identifier.system" or<br/>provided logical id|The dashes are part of the identifier. <br/>When the service provider gives the PHG a pre-determined patient logical id the PHG creates no Patient resource and has no patient information. In that special case the provided logical id is used|
|type|"Observation.code.coding.code"|See [Obtaining the Observation Code](ObtainingtheObservation-code.html)|
|value|"Observation.valueQuantity.value" or <br/> "Observation.dataAbsentReason.coding.code|The numerical value of the measurement or <br/> the data absent reason if the value is not present|
|units|"Observation.valueQuantity.code"|The UCUM code for the units|
|reported PHD timestamp|"timestamp"|See [Generating the PHD Reported Time Stamp](GeneratingtheReportedTimeStampIdentifier.html)|
|supplemental types|"Supplemental-Types.*N*-"|A sequence of 32-bit MDC codes separated by a dash|

The final identifier is made by concatenating the entries above as follows:
 - "device-patient-type-value-units-reported PHD timestamp-supplemental types"

### Additional Numerical Measurement Information
11073 20601 numeric metric measurements have some additional optional attributes that are used only for numerics. When they occur, these additional attributes provide further information about the measurement. An example of such a numeric-only additional attribute is one that describes the accuracy of the measurement. The accuracy is a measure of the deviation of the actual measurement from the reported measurement. Consequently, 'accuracy' is not a concept that makes any sense in the context of a measurement which is one or more of a finite set of enumerated codes such as a glucose-monitor meal association (breakfast, snack, fasting, etc.), and thus the attribute is not used in Enumeration metrics.

As in the PhdBaseObservation profile, an Observation.component element is used to contain the additional information. There are five metric attributes that give extra information about numeric-only measurements.

#### Accuracy
The Accuracy attribute gives the maximum deviation as an absolute value of the reported measurement from the actual measurement *over the entire range of the measurement*. The reported accuracy is, thus, static and does not vary over the range of the measurement. It shall be reported if the PHD provides it and it is not corrupted. It is in the units of the measurement itself. The entries are as populated as follows:

|Observation.component element|entry|Additional Information|
|-
|code.coding.code|67914|This is the MDC code for the Accuracy attribute|
|code.coding.system|urn:iso:std:iso:11073:10101|Indicates the MDC coding system|
|code.text|optional but|Should contain the reference id MDC_ATTR_NU_ACCUR_MSMT along with any other additional text|
|valueQuantity.value|the value|This is accuracy value|
|valueQuantity.system|http://unitsofmeasure.org |Indicates the UCUM coding system|
|valueQuantity.code|shall be the code of the primary measurement|The code shall be the UCUM unit code|

#### Alert Operational State
The Alert Operational State is currently only used in the Pulse Oximeter specialization. This attribute uses an ASN1-BITs field to indicate whether the alerts on a given limit (upper or lower) are on or off. When SET, the alerts are off. This is a state-type measurement and when this attribute is present, both the set and cleared states are reported. Three bits are defined thus there will be three component entries for each of the bits.

|Observation.component element|entry|Additional Information|
|-
|.code.coding.code|68746.n|68746 is the MDC code for the Alert Operational State. 'n' is 0, 1, or 2 depending upon which bit is being reported.|
|code.coding.system|http://hl7.org/fhir/uv/phd/CodeSystem/ASN1ToHL7 |Indicates the ASN-1 coding system|
|code.text|optional but|Should contain the ASN1 name 'lim-alert-off', 'lim-low-off', or 'lim-high-off' for bits 0-2, respectively, along with any other additional text|
|valueCodeableConcept.coding.code|'Y' or 'N'|'Y' for bit set, 'N' for bit cleared|
|valueCodeableConcept.coding.system|http://terminology.hl7.org/CodeSystem/v2-0203 |Indicates the V2 binary coding system|

#### Alert Operational Text String
This attributes provides a human readable string describing the lower and upper threshold limits. It is currently used only in the Pulse Oximeter specialization.

|Observation.component element|entry|Additional Information|
|-
|code.coding.code|68104|This is the MDC code for the Alert-Operational-Text_string attribute|
|code.coding.system|urn:iso:std:iso:11073:10101|Indicates the MDC coding system|
|code.text|optional but|Should contain the reference id MDC_ATTR_AL_OP_TEXT_STRING along with any other additional text|
|valueString|the strings|These are the lower and upper limit strings|

#### Current Limits
The Current-Limits attribute is currently only used in the Pulse Oximeter specialization. It gives the lower and upper threshold limits of whatever measurement is being monitored.

|Observation.component element|entry|Additional Information|
|-
|code.coding.code|67892|This is the MDC code for the Current-Limits attribute|
|code.coding.system|urn:iso:std:iso:11073:10101|Indicates the MDC coding system|
|code.text|optional but|Should contain the reference id MDC_ATTR_LIMIT_CURR along with any other additional text|
|valueRange.low.value|the value|This is the lower limit|
|valueRange.low.unit|optional||
|valueRange.low.system|http://unitsofmeasure.org |Indicates the UCUM coding system|
|valueRange.low.code|shall be the code of the primary measurement|The code shall be the MDC unit code|
|valueRange.high.value|the value|This is the upper limit|
|valueRange.high.unit|optional ||
|valueRange.high.system|http://unitsofmeasure.org |Indicates the UCUM coding system|
|valueRange.high.code|shall be the code of the primary measurement|The code shall be the UCUM unit code|

#### Measurement Confidence 95
The Measurement-Confidence-95 attribute is currently used only in the Continuous Glucose specialization. The attribute gives a lower and upper bound with which the manufacturer is 95%confident that the actual reported measurement is within that bounds.

|Observation.component element|entry|Additional Information|
|-
|code.coding.code|526998|This is the MDC code for the Measurement-Confidence-95 attribute|
|code.coding.system|urn:iso:std:iso:11073:10101|Indicates the MDC coding system|
|code.text|optional but|Should contain the reference id MDC_ATTR_MSMT_CONFIDENCE_95 along with any other additional text|
|valueRange.low.value|the value|This is the lower limit|
|valueRange.low.unit|optional||
|valueRange.low.system|http://unitsofmeasure.org |Indicates the UCUM coding system|
|valueRange.low.code|shall be the code of the primary measurement|The code shall be the UCUM unit code|
|valueRange.high.value|the value|This is the upper limit|
|valueRange.high.unit|optional ||
|valueRange.high.system|http://unitsofmeasure.org |Indicates the UCUM coding system|
|valueRange.high.code|shall be the code of the primary measurement|The code shall be the UCUM unit code|

#### Threshold Notification Text String
The Threshold-Notification-Text-String attribute is currently used only in the Continuous Glucose specialization. It provides a human readable string describing the thresholds. There are separate measurement objects that actually give the thresholds.

|Observation.component element|entry|Additional Information|
|-
|code.coding.code|68232|This is the MDC code for the Alert-Operational-Text_string attribute|
|code.coding.system|urn:iso:std:iso:11073:10101|Indicates the MDC coding system|
|code.text|optional but|Should contain the reference id MDC_ATTR_THRES_NOTIF_TEXT_STRING along with any other additional text|
|valueString|the string|This is a textual description of the thresholds for the given measurement|

### Examples:

A basic simple numeric observation with a time stamp and a supplemental types attribute is shown in [Pulse Rate Spot Measurement](spotNumeric.html). Simple numeric measurements are common in PHDs.

An example of a NaN (not a number) measurement is shown in [NaN Example](NumericNaN.html). Note that the value element is absent and replaced by a dataAbsentReason element.

### Consumer of the PHD Numeric Observation Profile
The consumer of this profile does not need to concern itself with the mapping complexities or the PHD-related entry for the Observation.identifier which is used by the uploader to prevent data duplication. There are no extensions introduced by this profile so the resource is consumable by any reader that understands the Observation resource. The following table summarizes the elements used describing the measurement:

|Measurement item|element|Additional Information|
|-
|measurement type|Observation.code.coding.code|There shall be one coding element using the MDC coding system<br>If a vital sign, there will be an additional coding element using one of the LOINC 'magic' codes.|
|measurement value|Observation.valueQuantity.value|Value has precision of original measurement|
|measurement units|Observation.valueQuantity.code|Uses UCUM coding system.|
|error|Observation.dataAbsentReason|Contains error code. If present no Observation.valueQuantity is present |
|time stamp|Observation.dateTimeEffective<br/><br/>Observation.period|If the measurement is a point in time.<br/><br/>If the measurement has a duration.|
|coincident time stamp|Observation.derivedFrom|Points to Observation following the Coincident Time Stamp Observation profile. For time quality auditing purposes. Not present if the sensor provides NO time stamp |
|related measurement|Observation.derivedFrom|Points to a PHD Observation that is related to this Observation such as a cardio session. Not present if the device did not reference an additional measurement.|
|additional descriptions|Observation.component|If a component element exists it contains additional information about the measurement|
|patient|Observation.subject|Points to the Patient resource|
|sensor device|Observation.device|Points to the Device resource|

