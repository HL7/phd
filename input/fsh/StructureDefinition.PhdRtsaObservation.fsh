Profile: PhdRtsaObservation
Parent: PhdBaseObservation
Id: PhdRtsaObservation
Description: "Observations from a PHD where the measurement is a sample array."
* ^meta.lastUpdated = "2017-12-14T07:44:36.955-05:00"
* ^extension.url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-wg"
* ^extension.valueCode = #oo
* ^date = "2017-06-02T14:29:52.39367-04:00"
* ^abstract = false
* . ^definition = "The PhdRtsaObservation reports PHD measurements that contain a sample array."
  * ^comment = "Used for sample array (waveform) observations from Personal Health Devices"
* value[x] only SampledData
  * ^comment = "The PhdRtsaObservation is typically used for reporting waveform type data such as an ECG trace, spirometer exhalation rates, pulse oximetry pleth (plethysmograph) waves, etc., though it can be used to report any set of numeric measurements that are periodic. The periodicity is important as the timestamps of each individual entry is known from the start time and the period. Since the amount of data to be transmitted can be large, the data is scaled in such a way to minimize the number of bits taken up by each entry (in practice limited to 8, 16 or 32 bits). This scaling information is sent along with the start time and period in order for the receiver to recover the original data and to obtain the timestamp of each data point. In theory, this data could be sent using a large phdNumericObservation type resources at a much greater cost in bandwidth."
  * origin
    * ^comment = "The data sent in the ACOM sample array is also scaled. Thus with the proper setting of the `valueSampledData.origin.value` and `valueSampledData.factor`, the data from the IEEE PHD device can be placed into the `data[i]` array without modification."
    * value 1..
      * ^short = "Intercept value (with implicit precision)"
      * ^definition = "The intercept value with the precision of the data as determined by the device."
    * system 1..
    * system = "http://unitsofmeasure.org" (exactly)
      * ^short = "The UCUM coding system"
      * ^definition = "The identification of the UCUM coding system that provides the coded form of the unit."
    * code 1..
      * ^definition = "The unit code."
      * ^comment = "The UCUM code translated from the MDC Unit Code attribute."
  * factor 1..
    * ^short = "The scale factor"
  * dimensions 
    * ^comment = "This value is filled in by the ACOM number-of-samples-per-period field."
  * data ^definition = "A series of data points which are decimal values separated by a single space (character u20). The special values \"E\" (error), \"L\" (below detection limit) and \"U\" (above detection limit) are not used. The device does not provide such individual values. "
    * ^comment = "It is recommended to re-use the scaling from the PHD device as it is likely the scaling was chosen to optimize transmission. If A = real-range.lower-limit, B = real-range.upper-limit, I = scaled-range.lower-limit (integer), J = scaled-range.upper-limit (integer) then `valueSampledData.factor` is given by (A-B)/(I-J) and `valueSampledData.origin.value` = A – (A-B)*I/(I-J) and `valueSampledData.data[i]` = `samples[i]`"
  * lowerLimit
    * ^short = "The scaled lower limit of the ACOM sample array when provided by the PHD device."
    * ^comment = "The lower limit of the sample array. In ACOM this is the lower limit of the actual-range, but scaled as a normal sample. In GHS this value may be provided as the lower limit Valid Range descriptor."
  * upperLimit
    * ^short = "The scaled upper limit of the ACOM sample array when provided by the PHD device."
    * ^comment = "The upper limit of the sample array. In ACOM this is the upper limit of the actual-range, but scaled as a normal sample. In GHS this value may be provided as the upper limit Valid Range descriptor."

Mapping: IEEE-11073-10206-PhdRtsaObservation
Id: IEEE-11073-10206-PhdRtsaObservation
Title: "IEEE-11073-10206 ACOM to FHIR PhdRtsaObservation"
Source: PhdRtsaObservation
Target: "https://sagroups.ieee.org/11073/phd-wg"
* -> "ACOM"
* valueSampledData.data -> "SampleArrayObservation.samples"
* valueSampledData.origin.unit -> "SampleArrayObservation.unit-code" 
* valueSampledData.period -> "SampleArrayObservation.sample-period"
* valueSampledData.factor -> "Calculate from SampleArrayObservation.Actual-Range and Scaled-Range"
* valueSampledData.dimensions -> "SampleArrayObservation.number-of-samples-per-period"
* valueSampledData.lowerLimit -> "SampleArrayObservation.actual-range.lower-limit (scaled)"
* valueSampledData.upperLimit -> "SampleArrayObservation.actual-range.upper-limit (scaled)"
* valueSampledData.origin.value -> "SampleArrayObservation.scaled-origin as calculated from SampleArrayObservation.Actual-Range and Scaled-Range"