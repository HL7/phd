The Compound Numeric Observation Profile is used when the PHD metric measurement contains one of the following attributes:

<style>table, th, td {
border: 1px solid black;
border-collapse:collapse;
padding: 6px;}</style>

|Attribute|Value|Additional Information|
|-
|Compound-Basic-Nu-Observed-Value|set of 16-bit Mder SFLOATs|12-bit mantissa, 4-bit exponent|
|Compound-Simple-Nu-Observed-Value|set of 32-bit Mder FLOATs|24-bit mantissa, 8-bit exponent|
|Compound-Nu-Observed-Value|set of 32-bit Mder FLOATs|Complex attribute. Also contains<br/> metric-id<br/> measurement status<br/> unit-code|

These attributes contain a measurement value that is described by a set of multiple numbers such as the x, y, and z components of an acceleration. It is NOT used to report an array of measurements but only where the quantity being measured requires more than one number to describe it. Each individual entry of the compound value is reported in an Observation.component element. The Mder SFLOAT and FLOAT encodings of each entry indicate both precision and the number of significant figures. The Observation.component.valueQuantity.value element is required to honor the reported precision as indicated by the Mder S/FLOAT. See the section [Mder FLOATs and SFLOATs](MderFLOATsandSFLOATs.html) for instructions on handling Mder S/FLOATs and their encoding to the valueQuantity.

The Observation.component.code element is obtained from the Metric-Id-List attribute unless the measurement reported is a Compound-Nu-Observed-Value attribute. In that case the attribute itself has the metric type for each entry and that is used instead of the Metric-Id-List entries. The order of the entries in the Metric-Id-List are one-to-one with the order of the compound attribute entries. For example, if the Metric-Id-List in the Blood Pressure measurement has MDC codes for 'systolic", "diastolic" and "mean" in that order, the quantities in the compound attribute are the systolic, diastolic, and mean values, respectively.

The Observation.code element comes from the Type attribute and gives the general type of measurement. For example, the Type attribute might indicate "acceleration" or "non-invasive blood pressure". There is no Observation.value[x] entry. There may still be an Observation.dataAbsentReason element if, say, the Measurement-Status attribute indicates an invalid or otherwise overall failure value. If there is such an overall failure of the measurement, then there is no need to report the components.

The structure definition is given [here](PhdCompoundNumericObservation.html)

### Mapping Compound Numerics to FHIR
The following table shows how the compound numeric attributes are mapped to FHIR. Since the FHIR Quantity also contains the units the Unit-Code attribute value is required to complete the picture. The MDC units need to be mapped to UCUM when used in FHIR.

|Attribute|FHIR coding|
|-
|Compound-Basic-Nu-Observed-Value.*valueN*<br/>Unit-Code.*code*<br/>Metric-Id-List.*codeN*|Observation.component*N*.valueQuantity.value<br/>Observation.component*N*.valueQuantity.code  (as UCUM)<br/>Observation.component*N*.code.coding.code|
|Compound-Simple-Nu-Observed-Value.*valueN*<br/>Unit-Code.*code*<br/>Metric-Id-List.*codeN*|Observation.component*N*.valueQuantity.value<br/>Observation.component*N*.valueQuantity.code  (as UCUM)<br/>Observation.component*N*.code.coding.code
|Compound-Nu-Observed-Value.*valueN*<br/>Compound-Nu-Observed-Value.*unitN*<br/>Compound-Nu-Observed-Value.*metric-idN*<br/>Compound-Nu-Observed-Value.*statusN*|Observation.component*N*.valueQuantity.value<br/>Observation.component*N*.valueQuantity.code  (as UCUM)<br/> Observation.component*N*.code.coding.code<br/>Observation.component*N*.dataAbsentReason|

### Meta Data Profile
The uploader shall populate the Device.meta.profile with http://hl7.org/fhir/uv/phd/StructureDefinition/PhdCompoundNumericObservation indicating this resource is generated following the PHD Implementation Guide.

### Conditional Create Identifier Generation
For a general description of the PHD Observation Identifier see the "PHD Observation Identifier" section in [PHD Base Observation Profile](BaseObservationProfile.html). The table below lists the items that make up the identifier.

|Entry|value|Additional information|
|-
|device|"PHD Device.identifier.value"|This value is the PHD IEEE EUI-64 system identifier|
|patient|"Patient.identifier.value-Patient.identifier.system" or<br/>provided logical id|The dashes are part of the identifier. <br/>When the service provider gives the PHG a pre-determined patient logical id the PHG creates no Patient resource and has no patient information. In that special case the provided logical id is used|
|type|"Observation.code.coding.code"|See [Obtaining the Observation.code](ObtainObservationCode.html)|
|value|"Observation.component*N*.valueQuantity.value" or<br/>"Observation.component*N*.dataAbsentReason.coding.code"|The data absent reason code is used if there is no value|
|units|"Observation.component*1*.valueQuantity.code"|When not a Compound-Nu-Observed-Value attribute the units are the same for each entry so only one unit code is needed|
|valueUnits|"Observation.component*N*.valueQuantity.value" or <br/> "Observation.component*N*.dataAbsentReason.coding.code"<br/>followed by the UCUM unit code for each entry|In the Compound-Nu-Observed-Value the unit code can be different for each entry|
|reported PHD timestamp|"timestamp"|See [Generating the PHD Reported Time Stamp](GeneratingtheReportedTimeStampIdentifier.html)|
|supplemental types|"Supplemental-Types.*N*-"|A sequence of 32-bit MDC codes separated by a dash|

The final identifier is made by concatenating the entries above as follows:
 - "device-patient-type-value-units-reported PHD timestamp-supplemental types" for the Compound-Basic/Simple-Nu-Observed-Value cases.
   - Example of a blood pressure measurement using absolute time and mmHg; the units are the same for each entry: "FEEDABEDEAD2345-sisan34id-23.654.6.6.12.3-150020-100-60-80-mmHg-20170114173041"
 - "device-patient-type-valueUnits-reported PHD timestamp-supplemental types" for the Compound-Nu-Observed-Value case.
   - There are no specializations which use the Compound-Nu-Observed-Value attribute.

### Additional Numerical Measurement Information
11073 20601 numeric metric measurements have some additional optional attributes that are used only for numerics. When they occur, these additional attributes provide further information about the measurement. An example of such a numeric-only additional attribute is one that describes the accuracy of the measurement. The accuracy is a measure of the deviation of the actual measurement from the reported measurement. Consequently, 'accuracy' is not a concept that makes any sense in the context of a measurement which is one or more of a finite set of enumerated codes such as a glucose-monitor meal association (breakfast, snack, fasting, etc.), and thus the attribute is not used in Enumeration metrics.

As in the PhdBaseObservation profile, an Observation.component element is used to contain the additional information. At this time there only the Accuracy attribute is used for compound numerics. The remaining numeric-specific attributes are not structured to handle compounds.

#### Accuracy
The Accuracy attribute gives the maximum deviation as an absolute value of the reported measurement from the actual measurement *over the entire range of the measurement*. The reported accuracy is, thus, static and does not vary over the range of the measurement. It shall be reported if the PHD provides it and it is not corrupted. It is in the units of the measurement itself. This kind of measurement may not make sense to report with some compound measurements, especially in the case of the Compound-Nu-Observed-Value as each element could have different units.

The entries are as populated as follows:

|Observation.component element|entry|Additional Information|
|-
|code.coding.code|67914|This is the MDC code for the Accuracy attribute|
|code.coding.system|urn:iso:std:iso:11073:10101|Indicates the MDC coding system|
|code.text|optional but|Should contain the reference id MDC_ATTR_NU_ACCUR_MSMT along with any other additional text|
|valueQuantity.value|the value|This is accuracy value|
|valueQuantity.unit|optional ||
|valueQuantity.system|http://unitsofmeasure.org |Indicates the UCUM coding system|
|valueQuantity.code|shall be the UCUM code of the primary measurement|Assumes the units are the same for all components|

### Examples:
This example shows a [blood pressure](bloodPress.html) measurement. The important item to note is that there is no value[x] element in the 'primary' measurement. The set of values describing the compound are in the value[x] elements of the Observation.component elements.

### The Other Profiles

 - [Profiles Overview](ProfilesOverview.html)
 - [Base Observation Profile](BaseObservationProfile.html)
 - [Numeric Observation Profile](NumericObservationProfile.html)
 - [Coded Enumeration Observation Profile](CodedEnumerationObservationProfile.html)
 - [BITs Enumeration Observation Profile](BITsEnumerationObservationProfile.html)
 - [Rtsa Observation Profile](RtsaObservationProfile.html)
 - [String Enumeration Observation Profile](StringEnumerationObservationProfile.html)
 - [Coincident Time Stamp Observation Profile](CoincidentTimeStampObservationProfile.html)
 - [Phd Device Profile](PhdDeviceProfile.html)
 - [Phg Device Profile](PhgDeviceProfile.html)
 - [Patient Profile](PhdPatientProfile.html)






