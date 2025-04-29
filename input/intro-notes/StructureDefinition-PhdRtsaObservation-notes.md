
### Mapping 11073 Sample Arrays To FHIR
Periodic data is mapped to the SampledData data type in FHIR. The SampledData.data element in this data type is also scaled. If *y*[i] is the i<sup>th</sup> entry of the actual unscaled data from the PHD sensor, *y*[i] is obtained from the SampledData type using the following relation:

*y*[i] = d[i] * s + b

where 
 - s = SampledData.scaleFactor
 - b = SampledData.origin.value
 - d[i] = SampledData.data[i]

In the case of the Sample Array observation, the i<sup>th</sup> entry of the actual unscaled data from the sensor is obtained from the Actual-range and Scaled-range attributes using the following relation:

y[i] = ((A – B)x[i])/(I – J) + A – (A-B)I/(I-J)
where 
 - A = Actual-range.*upper-value*
 - B = Actual-range.*lower-value*
 - I = Scaled-Range.*upper-value*
 - J = Scaled-Range.*lower-value*

Since	 ((A – B)x[i])/(I – J) + A – (A-B)I/(I-J) = d[i] * s + b,

d[i] = x[i] if
 - s = SampledData.scaleFactor = (A – B)/(I – J)
and
 - b = SampledData.origin.value = A –(A-B)I/(I-J) = (BI-AJ)/(I-J)

Using these scale factor and origin values allows to map the Simple-Sa-Observed-Value.data[i] values directly to the SampledData.data[i] values unchanged. It is recommended that the uploader maps the samples to the Observation.valueSampledData element using the above scaling as it is assumed the PHD chose this scaling for a good reason. However, that does not restrict the uploader using other scalings. As an example, the uploader could decode the scaled values and report the unscaled original sensor values in the Observation.valueSampledData.data element and set the Observation.valueSampledData.scaleFactor to 1.0 and the Observation.valueSampledData.origin.value to 0. This approach is used in PCD-01.

Using the variables 'b' and 's' as defined above the mapping to the FHIR Observation resource is as follows:

|IEEE 11073-10206 Sample Array Observation Attribute|FHIR Observation element|
|-
|samples[i]     |valueSampledData.data[i]|
|Unit-Code      |valueSampledData.origin.code (as UCUM when available)|
|See calculation of 'b' above|valueSampledData.origin.value = b|
|See calculation of 's' above|valueSampledData.scaleFactor = s|
|Sample-period|valueSampledData.period (milliseconds)|
|number-of-samples-per-period|valueSampledData.dimensions|
|Actual-range.*upper-value*|referenceRange.high.value|
|Unit-Code|referenceRange.high.code (as UCUM when available)|
|Actual-range.*lower-absolute-value*|referenceRange.low.value|
|Unit-Code.*code*|referenceRange.low.code (as UCUM when available)|

### Additional RTSA Measurement Information
All additional attributes that may be reported in a numerical metric measurement may also be present in an RTSA metric measurement. 

### Examples:

A short RTSA observation with a time stamp is shown in this [RTSA example](Observation-rtsa-example.html).
This example results when the device sends a waveform. The value[x] becomes a valueSampledData data type. 
<br>
Note there is no logical id in this resource as this resource is being uploaded to the server in a create operation. The server will create the logical id and return it to the sender in the response.
Note the valueSampledData:
{% fragment Observation/rtsa-example JSON BASE:value %}

## Consumers of the RTSA Profile
About the only work a consumer of this profile needs to do is to back-scale the valueSampledData.data[] values to the original values reported by the sensor. The following table summarizes where a reader can obtain the most pertinent information.

|information|Data element in Observation|
|-
|Type of measurement|code.coding.code|
|Time at the start of the waveform|effectiveDateTime|
|Dimensions / number of samples per period|valueSampledData.dimension|
|Time between samples in milliseconds|valueSampledData.period|
|Units of samples|valueSampledData.origin.code|
|Upper range of values|referenceRange.high.value|
|Lower range of values|referenceRange.low.value|
|The actual *n* values|valueSampledData.data[*n*] * valueSampledData.scaleFactor + valueSampledData.origin.value|
