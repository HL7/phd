
These notes provide information on how the scaling of the ACOM Sample Array observation is done and how it can best be mapped to the FHIR Observation resource and its SampledData element.

In the case of the Sample Array observation, ACOM provides the Actual-range and Scaled-Range attributes. The i<sup>th</sup> entry of the actual unscaled data from the sensor is obtained from these attributes using the following relation:

y[i] = ((A – B)\*x[i])/(I – J) + A – (A-B)\*I/(I-J)
where:
 - A = Actual-range.*upper-value*
 - B = Actual-range.*lower-value*
 - I = Scaled-Range.*upper-value*
 - J = Scaled-Range.*lower-value*
 - x[i] = SampleArray.samples[i]

Since ((A – B)\*x[i])/(I – J) + A – (A-B)\*I/(I-J) = d[i] * s + b,

d[i] = x[i] if
 - s = SampledData.scaleFactor = (A – B)/(I – J)
and
 - b = SampledData.origin.value = A –(A-B)I/(I-J) = (B\*I-A\*J)/(I-J)

Using these scale factor and origin values allows to map the SampleArray.samples[i] values directly to the SampledData.data[i] values unchanged. It is recommended that the uploader maps the samples to the Observation.valueSampledData element using the above scaling as it is assumed the PHD chose this scaling for a good reason. However, that does not restrict the uploader using another scaling. As an example, the uploader could decode the scaled values and report the unscaled original sensor values in the Observation.valueSampledData.data element and set the Observation.valueSampledData.scaleFactor to 1.0 and the Observation.valueSampledData.origin.value to 0. This approach is used in IHE PCD-01.

Using the variables 'b' and 's' as defined above the mapping to the FHIR Observation resource is as follows:

|IEEE 11073-10206 Sample Array Observation Attribute|FHIR Observation element|
|--|--|
|samples[i]     |valueSampledData.data[i]|
|Unit-Code      |valueSampledData.origin.code (as UCUM when available)|
|See calculation of 'b' above|valueSampledData.origin.value = b|
|See calculation of 's' above|valueSampledData.scaleFactor = s|
|Sample-period|valueSampledData.period (milliseconds)|
|number-of-samples-per-period|valueSampledData.dimensions|
|Actual-range.*upper-limit*|valueSampledData.upperLimit|
|Actual-range.*lower-limit*|valueSampledData.lowerLimit|


### Additional Sample Array Attributes
All additional attributes such as accuracy that may be reported in a numerical observation may also be present in a Sample Array Observation and are mapped to FHIR in the same way. See the [Additional Numerical Measurement Information](StructureDefinition-PhdNumericObservation.html#additional-numerical-measurement-information) for more information on these attributes.

## Consumers of the RTSA Profile
About the only work a consumer of this profile needs to do is to back-scale the valueSampledData.data values to the original values reported by the sensor. The following table summarizes where a reader can obtain the most pertinent information.

|information|Data element in Observation|
|--|--|
|Type of measurement|code.coding.code|
|Time at the start of the waveform|effectiveDateTime|
|Dimensions / number of samples per period|valueSampledData.dimension|
|Time between samples in milliseconds|valueSampledData.period|
|Units of samples|valueSampledData.origin.code|
|Upper range of values|valueSampledData.upperLimit (scaled)|
|Lower range of values|valueSampledData.lowerLimit (scaled)|
|The actual *n* values|valueSampledData.data[*n*] * valueSampledData.scaleFactor + valueSampledData.origin.value|
