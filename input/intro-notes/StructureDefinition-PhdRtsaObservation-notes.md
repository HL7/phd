
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

### Additional RTSA Measurement Information
All additional attributes that may be reported in a numerical metric measurement may also be present in an RTSA metric measurement. See the section 'Additional Note that one could report a waveform by reporting each value in the sequence as a sequence of single numeric metric measurements. Of course that would be costly in terms of bandwidth.

### Examples:

A short RTSA observation with a time stamp is shown in this [RTSA example](Observation-rtsa-example.html).
This example results when the device sends a waveform. The value[x] becomes a valueSampledData data type. 
<br>
Note there is no logical id in this resource as this resource is being uploaded to the server in a create operation. The server will create the logical id and return it to the sender in the response.
Note the valueSampledData:
{% fragment Observation/rtsa-example JSON BASE:value %}

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
