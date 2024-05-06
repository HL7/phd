The Real Time Sample Array (RTSA) Observation Profile is used when the PHD metric measurement is a periodic sequences of scalars in time, typically waveforms. In theory, this measurement could be split up into a sequence of Numeric Observations but that would be inefficient especially if one is talking about a 1000 samples per second or more. Waveforms are used for spirometry, ECG, pulse oximeter pleth wave traces, etc. These measurement types are quite rare.

The measurement is a waveform when the PHD metric contains the following attribute:

<style>table, th, td {
border: 1px solid black;
border-collapse:collapse;
padding: 6px;}</style>

|Attribute|Value|Additional Information|
|-
|Simple-Sa-Observed-Value|A sequence of scaled 8, 16, or 32-bit numbers|Other attributes give scale factors, number of entries, period, and bit-size|

This attribute contain a measurement that is a sequence of scaled periodic values. It is typically used when reporting waveforms. The values are scaled to reduced bandwidth. The bandwidth reduction can be significant in cases where the actual values are small fluctuations about a large average value. The scale factors, number of bits in each sample, the period, and the number of data elements in the sequence are given by a set of support attributes.

IEEE 11073-20601 does not support the concept of compound arrays, so the sampled data is always one dimensional in time only. Reporting a sequence of x, y, z acceleration components from a PHD would require three RTSA objects. FHIR, on the other hand, does support the concept of two-dimensional arrays. It would be possible for the PHG to map the x, y, and z components of an acceleration to a single two-dimensional valueSampledData element. However, doing this task requires pre-existing knowledge about each specialization and cannot be done generically. Therefore this IG does not support such a mapping.

|Support Attribute|Value|Description|
|-
|Sample-Period.*period*|integer|Interval between samples in 1/8<sup>th</sup> milliseconds|
|Sa-Specification.SampleType.*significant-bits*|integer|Number of significant bits in the sample value|
|Sa-Specification.SampleType.*sample-size*|integer|Number of bits in each sample; gives the *X* value in 'Scale-and-Range-Specification*X*'|
|Sa-Specification.*array-size* |integer|Number of samples in 'Simple-Sa-Observed-Value'|
|Scale-and-Range-Specification*X*.*upper-absolute-value*|Mder FLOAT|Highest unscaled value PHD will report *(Optional)*|
|Scale-and-Range-Specification*X*.*lower-absolute-value*|Mder FLOAT|Lowest unscaled value PHD will report *(Optional)*|
|Scale-and-Range-SpecificationX.*upper-scaled-value*|*X*-bit integer|The upper range scaled *(Optional)*|
|Scale-and-Range-SpecificationX.*lower-scaled-value*|*X*-bit integer|The lower range scaled *(Optional)*|

If (*significantBits* < *sampleSize*)
 - the most significant (*sampleSize* - *significantBits*) bits of the sample *i* are zeroed and are treated as unsigned integers

If *significantBits* equals 255
 - the samples are treated as signed integers
otherwise
 - the samples are treated as unsigned integers.

The upper and lower ranges represent the upper and lower actual sensor ranges that can be reported. The name 'absolute' in the attribute does not refer to the mathematical definition of an absolute value. The upper and lower values do NOT mean that a given set of samples has those values or that those values are ever reported by the sensor. However, a graphing application could use those values to define the upper and lower ranges of a graph and be assured that the waveform would never go above or below those boundaries. These upper and lower boundaries are placed in the Observation.referenceRange.low and Observation.referenceRange.high elements, respectively. For a representation of the waveform, the offset and scale factors are sufficient. Reporting the Scale-and-Range-SpecificationX attributes is optional, though they will be needed in deriving the values reported in the valueSampledData element.

The structure definition for the PHD Rtsa Observation Profile is shown [here](StructureDefinition-PhdRtsaObservation.html)

### Mapping RTSA Waveforms To FHIR
Periodic data is mapped to the SampledData data type in FHIR. The SampledData.data element in this data type is also scaled. If *y*[i] is the i<sup>th</sup> entry of the actual unscaled data from the PHD sensor, *y*[i] is obtained from the SampledData type using the following relation:

*y*[i] = d[i] * s + b

where 
 - s = SampledData.scaleFactor
 - b = SampledData.origin.value
 - d[i] = SampledData.data[i]

In the case of the RTSA metric, the i<sup>th</sup> entry of the actual unscaled data from the sensor is obtained from the Simple-Sa-Observed-Value attribute using the following relation:

y[i] = ((A – B)x[i])/(I – J) + A – (A-B)I/(I-J)
where 
 - A = Scale-and-Range-SpecificationX.*upper-absolute-value*
 - B = Scale-and-Range-SpecificationX.*lower-absolute-value*
 - I = Scale-and-Range-SpecificationX.*upper-scaled-value*
 - J = Scale-and-Range-SpecificationX.*lower-scaled-value*
Where X = 8, 16, or 32 and
x[i] = Simple-Sa-Observed-Value.data[i]

Since	 ((A – B)x[i])/(I – J) + A – (A-B)I/(I-J) = d[i] * s + b,

d[i] = x[i] if
 - s = SampledData.scaleFactor = (A – B)/(I – J)
and
 - b = SampledData.origin.value = A –(A-B)I/(I-J) = (BI-AJ)/(I-J)

allowing one to map the Simple-Sa-Observed-Value.data[i] values directly to the SampledData.data[i] values unchanged. It is recommended that the uploader map the RTSA waveform to the Observation.valueSampledData element using the above scaling as it is assumed the PHD chose this scaling for a good reason. However, that does not restrict the uploader using other scalings. As an example, the uploader could decode the scaled values and report the unscaled original sensor values in the Observation.valueSampledData.data element and set the Observation.valueSampledData.scaleFactor to 1.0 and the Observation.valueSampledData.origin.value to 0. This approach is used in PCD-01.

Using the variables 'b' and 's' as defined above the mapping to the FHIR Observation resource is as follows:

|Attribute|FHIR coding|
|-
|Simple-Sa-Observed-Value.*data[i]*|Observation.valueSampledData.data[i]|
|Unit-Code.*code*|Observation.valueSampledData.origin.code (as UCUM when available)|
|See calculation of 'b' above|Observation.valueSampledData.origin.value = b*|
|See calculation of 's' above|Observation.valueSampledData.scaleFactor = s*|
|Sample-Period.*period*/8|Observation.valueSampledData.period (milliseconds)|
|Concept not supported in 20601.|Observation.valueSampledData.dimensions = 1|
|Scale-and-Range-SpecificationX.*upper-absolute-value*|Observation.referenceRange.high.value|
|Unit-Code.*code*|Observation.referenceRange.high.code (as UCUM when available)|
|Scale-and-Range-SpecificationX.*lower-absolute-value*|Observation.referenceRange.low.value|
|Unit-Code.*code*|Observation.referenceRange.low.code (as UCUM when available)|

*noting that other scaling options are allowed.

### Conditional Create Identifier Generation
For a general description of the PHD Observation Identifier see the "PHD Observation Identifier" section in [PHD Base Profile](BaseObservationProfile.html). The table below lists the items that make up the identifier.

|Entry|value|Additional information|
|-
|device|"PHD Device.identifier.value"|This value is the PHD IEEE EUI-64 system identifier|
|patient|"Patient.identifier.value-Patient.identifier.system" or<br/>provided logical id|The dashes are part of the identifier. <br/>When the service provider gives the PHG a pre-determined patient logical id the PHG creates no Patient resource and has no patient information. In that special case the provided logical id is used|
|type|"Observation.code.coding.code"|See [Obtaining the Observation.code](ObtainObservationCode.html)|
|value|Observation.valueSampledData.period-Observation.valueSampledData.dimensions-Observation.valueSampledData.data[0]|The data absent reason code is used if there is no value|
|units|"Observation.valueSampledData.origin.code|The units are the same for all data points|
|reported PHD timestamp|"timestamp"|See [Generating the PHD Reported Time Stamp](GeneratingtheReportedTimeStampIdentifier.html)|
|supplemental types|"Supplemental-Types.*N*-"|A sequence of 32-bit MDC codes separated by a dash|

The final identifier is made by concatenating the entries above as follows:
 - "device-patient-type-value-units-reported PHD timestamp-supplemental types".

### Additional RTSA Measurement Information
All additional attributes that may be reported in a numerical metric measurement may also be present in an RTSA metric measurement. See the section 'Additional Note that one could report a waveform by reporting each value in the sequence as a sequence of single numeric metric measurements. Of course that would be costly in terms of bandwidth.

### Examples:

A short RTSA observation with a time stamp is shown in [RTSA example](Rtsa.html). Note the valueSampledData.

## Consumers of the RTSA Profile
About the only work a consumer of this profile needs to do is to back-scale the valueSampledData.data[] values to the original values reported by the sensor. The following table summarizes where a reader can obtain the most pertinent information.

|information|Location in Observation.|
|-
|Type of measurement|code.coding.code|
|Time at the start of the waveform|effectiveDateTime|
|Fixed at one|valueSampledData.dimension = 1|
|Time between samples in milliseconds|valueSampledData.period|
|Units of samples|valueSampledData.origin.code|
|Upper range of values|referenceRange.high.value|
|Lower range of values|referenceRange.low.value|
|The actual *n* values|valueSampledData.data[*n*] * valueSampledData.scaleFactor + valueSampledData.origin.value|

### The Other Profiles

 - [Profiles Overview](ProfilesOverview.html)
 - [Base Observation Profile](BaseObservationProfile.html)
 - [Numeric Observation Profile](NumericObservationProfile.html)
 - [Compound Numeric Observation Profile](CompoundNumericObservationProfile.html)
 - [Coded Enumeration Observation Profile](CodedEnumerationObservationProfile.html)
 - [BITs Enumeration Observation Profile](BITsEnumerationObservationProfile.html)
 - [String Enumeration Observation Profile](StringEnumerationObservationProfile.html)
 - [Coincident Time Stamp Observation Profile](CoincidentTimeStampObservationProfile.html)
 - [Phd Device Profile](PhdDeviceProfile.html)
 - [Phg Device Profile](PhgDeviceProfile.html)
 - [Patient Profile](PhdPatientProfile.html)

