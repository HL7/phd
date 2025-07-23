The (Real Time) Sample Array (RTSA) Observation Profile is used when the measurement is a periodic sequences of scalars in time, typically waveforms. In theory, this measurement could be split up into a sequence of Numeric Observations but that would be inefficient especially if one is talking about a 1000 samples per second or more. Waveforms are used for spirometry, ECG, pulse oximeter pleth wave traces, etc. It is used to represent ACOM Sample Array Observations.

<style>table, th, td {
border: 1px solid black;
border-collapse:collapse;
padding: 6px;}</style>

The values are scaled to reduced bandwidth. The bandwidth reduction can be significant in cases where the actual values are small fluctuations about a large average value. The scale factors, number of bits in each sample, the period, and the number of data elements in the sequence are given by a set of support attributes.

IEEE 11073-10206 ACOM and GHS support the concept of multi-dimensional arrays. Reporting a sequence of x, y, z acceleration components from a PHD can be done by reporting 3 samples per period, that all share the same unit and scaling factors. FHIR also support the concept of multi-dimensional arrays. 

|IEEE 11073-10206 Sample Array Attribute|Value type|Description|
|--|-|-|
|Sample-Period|period|Interval between samples|
|number-of-samples-per-period|integer|#Dimensions of the measurement|
|Actual-Range|Real range|Lowest-Highest unscaled value PHD can ever report \[A,B\]|
|Scaled-range|Integer range|Low- and high-value used for scaling \[I,J\]|
|Unit-code|UCUM code|The unit of the samples|
|Samples|array of integer|The scaled measured samples|

When mapping the samples directly to FHIR `SampledData.data`, the FHIR scale factor and origin can be derived from this:
 - `SampledData.factor` = (B-A)/(J-I)
 - `SampledData.origin` = (A\*J - B\*I)/ (J-I)

A graphing application could use the Actual-range limits to define the upper and lower ranges of a graph and be assured that the waveform would never go above or below those boundaries. These upper and lower boundaries are scaled and placed in the `SampledData.lowerLimit` and `SampledData.upperLimit` elements, respectively.
