The Real Time Sample Array (RTSA) Observation Profile is used when the PHD metric measurement is a periodic sequences of scalars in time, typically waveforms. In theory, this measurement could be split up into a sequence of Numeric Observations but that would be inefficient especially if one is talking about a 1000 samples per second or more. Waveforms are used for spirometry, ECG, pulse oximeter pleth wave traces, etc. 

The measurement is a waveform when the PHD metric contains the following attribute:

<style>table, th, td {
border: 1px solid black;
border-collapse:collapse;
padding: 6px;}</style>

|Attribute|Value|Additional Information|
|-
|Simple-Sa-Observed-Value|A sequence of scaled 8, 16, or 32-bit numbers|Other attributes give scale factors, number of entries, period, and bit-size|

This attribute contain a measurement that is a sequence of scaled periodic values. It is typically used when reporting waveforms. The values are scaled to reduced bandwidth. The bandwidth reduction can be significant in cases where the actual values are small fluctuations about a large average value. The scale factors, number of bits in each sample, the period, and the number of data elements in the sequence are given by a set of support attributes.

IEEE 11073-20601 does not support the concept of compound arrays, so the sampled data is always one dimensional in time only. Reporting a sequence of x, y, z acceleration components from a PHD would require three RTSA objects. FHIR, on the other hand, does support the concept of two-dimensional arrays. It would be possible for the PHG to map the x, y, and z components of an acceleration to a single three-dimensional valueSampledData element. However, doing this task requires pre-existing knowledge about each specialization and cannot be done generically. Therefore this IG does not support such a mapping.

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