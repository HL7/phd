Profile: PhdRtsaObservation
Parent: PhdBaseObservation
Id: PhdRtsaObservation
Description: "Observations from a PHD where the measurement is a sample array."
* ^meta.lastUpdated = "2017-12-14T07:44:36.955-05:00"
* ^extension.url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-wg"
* ^extension.valueCode = #oo
* ^date = "2017-06-02T14:29:52.39367-04:00"
* ^abstract = false
* . ^definition = "The PhdRtsaObservation reports PHD measurements that contain a Simple-Sa-Observed-Value attribute."
  * ^comment = "Used for RTSA (waveform) observations from Personal Health Devices"
* value[x] only SampledData
  * ^definition = "The information determined as a result of making the observation, when the observation consists of a periodic sample of numeric measurements."
  * ^comment = "The RTSA metric is typically used for reporting waveform type data such as an ECG trace, spirometer exhalation rates, pulse oximetry pleth waves, etc., though it can be used to report any set of numric measurements that are periodic. The periodicity is important as the timestamps of each individual entry is known from the start time and the period. Since the amount of data to be transmitted can be large, the data is scaled in such a way to minimize the number of bits taken up by each entry (though the minimization is restricted to 8, 16, or 32 bits). This scaling information is sent along with the start time and period in order for the receiver to recover the original data and to obtain the timestamp of each data point. In theory, this data could be sent using countless phdNumericObservation type resources at a great cost in bandwidth!"
  * origin ^short = "Scaling intecept value and units"
    * ^definition = "The 'origin' data type contains the 'y-intercept' for the equation that relates the scaled data to the actual data. If valueSampledData.data[i] is the array of sampled scaled data, the actual data is obtained by:\r\nx[i] =valueSampledData.data[i] * valueSampledData.factor + valueSampledData.origin.value"
    * ^comment = "The data sent in the Sa-Simple-Observation-Value array is also scaled. Thus with the proper setting of the valueSampledData.origin.value and valueSampledData.factor, the data from the IEEE device can be placed into the data[i] array without modification."
    * value 1..
      * ^short = "Intercept value (with implicit precision)"
      * ^definition = "The intercept value with the indicated precision of the data as determined by the device."
    * system 1..
    * system = "http://unitsofmeasure.org" (exactly)
      * ^short = "The UCUM coding system"
      * ^definition = "The identification of the UCUM coding system that provides the coded form of the unit."
    * code 1..
      * ^definition = "The unit code."
      * ^comment = "The UCUM code translated from the MDC Unit Code attribute noting that the partition is always 4."
  * factor 1..
    * ^short = "The scale factor"
  * dimensions ^short = "Number of rtsa sample points at each time point"
    * ^definition = "The number of rtsa sample points at each time point. This value gives the number of data points in the valueSampledData.data array."
    * ^comment = "This value is obtained from the Sa-Specification.array-size field of the Sa-Specification attribute."
  * data ^definition = "A series of data points which are decimal values separated by a single space (character u20). The special values \"E\" (error), \"L\" (below detection limit) and \"U\" (above detection limit) are not used. The device does not provide such individual values. "
    * ^comment = "One is strongly encouraged to use the scaling from the 11073 device as it is likely the scaling was chosen to optimize transmission. If\r\nA = Scale-and-Range-SpecificationX.lower-absolute-value as an Mder FLOAT\r\nB = Scale-and-Range-SpecificationX.upper-absolute-value as an Mder FLOAT\r\nI = Scale-and-Range-SpecificationX.lower-scaled-value as a X-bit integer\r\nJ = Scale-and-Range-SpecificationX.upper-scaled-value as a X-bit integer\r\n\r\nvalueSampledData.factor is given by (A-B)/(I-J)\r\nand\r\nvalueSampledData.origin.value = A – (A-B)*I/(I-J)\r\nand \r\nvalueSampledData.data[i] = Sa-Simple-Observed-Value.values[i]"
* referenceRange ^slicing.discriminator.type = #value
  * ^slicing.discriminator.path = "type"
  * ^slicing.rules = #open
* referenceRange contains scaleAndReferenceRange 0..1
* referenceRange[scaleAndReferenceRange] ^short = "Provides the scale factors as sent by the PHD device"
  * type = PhdReferenceRangeMeaning#min-max
    * ^short = "The min-max reference range meaning code"
    * ^definition = "The min-max reference range meaning code."
    * ^comment = "This is the code that indicates the meaning of the reference range. The value is always 'min-max'."
  * low 1..
    * ^definition = "The Scale-and-Range-SpecificationX.lower-absolute-value from the RTSA metric where X is one of 8, 16, or 32."
    * value 1..
      * ^definition = "This is the value from the Scale-and-Range-SpecificationX.lower-absolute-value attribute where X is 8, 16, or 32. It is the minimum value that will be reported by the sensor. The attribute reports the value as an Mder FLOAT. Note that the word 'absolute' does not mean the mathematical absolute value!"
      * ^comment = "The implicit precision in the value should always be honored. The precision is given by the Mder FLOAT."
    * system 1..
    * system = "http://unitsofmeasure.org" (exactly)
      * ^definition = "This value identifies the MDC coding system"
    * code 1..
      * ^definition = "This unit code shall be the same as reported in the valueSampledData"
  * high 1..
    * value 1..
      * ^definition = "This is the value from the Scale-and-Range-SpecificationX.upper-absolute-value attribute where X is 8, 16, or 32. It is the maximum value that will be reported by the sensor. The attribute reports the value as an Mder FLOAT. Note that the word 'absolute' does not mean the mathematical absolute value!"
      * ^comment = "The implicit precision in the value should always be honored. The precision is given by the Mder FLOAT."
    * system 1..
    * system = "http://unitsofmeasure.org" (exactly)
      * ^definition = "This value identifies the UCUM coding system"
    * code 1..
      * ^definition = "This unit code shall be the same as reported in the valueSampledData"

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