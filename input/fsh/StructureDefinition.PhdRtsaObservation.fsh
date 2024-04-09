Profile: PhdRtsaObservation
Parent: PhdBaseObservation
Id: PhdRtsaObservation
Description: "StructureDefinition for Observation Resources representing measurement data coming from a medical device where the measurement is a waveform."
* ^meta.lastUpdated = "2017-12-14T07:44:36.955-05:00"
* ^extension.url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-wg"
* ^extension.valueCode = #oo
* ^url = "http://hl7.org/fhir/uv/phd/StructureDefinition/PhdRtsaObservation"
* ^status = #draft
* ^date = "2017-06-02T14:29:52.39367-04:00"
* . ^definition = "The PhdRtsaObservation reports PHD measurements that contain a Simple-Sa-Observed-Value attribute."
* . ^comment = "Used for RTSA (waveform) observations from Personal Health Devices"
* meta 1..
* meta.profile ^slicing.discriminator.type = #value
* meta.profile ^slicing.discriminator.path = "value"
* meta.profile ^slicing.rules = #open
* meta.profile contains phdProfile 1..1
* meta.profile[phdProfile] = "http://hl7.org/fhir/uv/phd/StructureDefinition/PhdRtsaObservation" (exactly)
* category ^slicing.discriminator.type = #value
* category ^slicing.discriminator.path = "system"
* category ^slicing.rules = #open
* category ^min = 0
* category contains vitalSignsCategory 0..*
* category[vitalSignsCategory] ^short = "Required by the FHIR specification if the measurement value is a vital sign"
* category[vitalSignsCategory] ^comment = "Vitals signs are not too common in waveforms but one might have pulse rates"
* category[vitalSignsCategory].coding ^slicing.discriminator.type = #value
* category[vitalSignsCategory].coding ^slicing.discriminator.path = "system"
* category[vitalSignsCategory].coding ^slicing.rules = #open
* category[vitalSignsCategory].coding contains vitalSigns 1..1
* category[vitalSignsCategory].coding[vitalSigns] ^short = "Required Vital Signs category code system entry"
* category[vitalSignsCategory].coding[vitalSigns].system 1..
* category[vitalSignsCategory].coding[vitalSigns].system = "http://terminology.hl7.org/CodeSystem/observation-category" (exactly)
* category[vitalSignsCategory].coding[vitalSigns].code 1..
* category[vitalSignsCategory].coding[vitalSigns].code = #vital-signs (exactly)
* category[vitalSignsCategory].coding[vitalSigns].code ^definition = "The 'vital-signs' category code"
* value[x] only SampledData
* value[x] ^definition = "The information determined as a result of making the observation, when the observation consists of a periodic sample of numeric measurements."
* value[x] ^comment = "The RTSA metric is typically used for reporting waveform type data such as an ECG trace, spirometer exhalation rates, pulse oximetry pleth waves, etc., though it can be used to report any set of numric measurements that are periodic. The periodicity is important as the time stamps of each individual entry is known from the start time and the period. Since the amount of data to be transmitted can be large, the data is scaled in such a way to minimize the number of bits taken up by each entry (though the minimization is restricted to 8, 16, or 32 bits). This scaling information is sent along with the start time and period in order for the receiver to recover the original data and to obtain the time stamp of each data point. In theory, this data could be sent using countless phdNumericObservation type resources at a great cost in bandwidth!"
* valueSampledData.origin 1..
* valueSampledData.origin ^short = "Scaling intecept value and units"
* valueSampledData.origin ^definition = "The 'origin' data type contains the 'y-intercept' for the equation that relates the scaled data to the actual data. If valueSampledData.data[i] is the array of sampled scaled data, the actual data is obtained by:\r\nx[i] =valueSampledData.data[i] * valueSampledData.factor + valueSampledData.origin.value"
* valueSampledData.origin ^comment = "The data sent in the Sa-Simple-Observation-Value array is also scaled. Thus with the proper setting of the valueSampledData.origin.value and valueSampledData.factor, the data from the IEEE device can be placed into the data[i] array without modification."
* valueSampledData.origin.value 1..
* valueSampledData.origin.value ^short = "Intercept value (with implicit precision)"
* valueSampledData.origin.value ^definition = "The intercept value with the indicated precision of the data as determined by the device."
* valueSampledData.origin.system 1..
* valueSampledData.origin.system = "http://unitsofmeasure.org" (exactly)
* valueSampledData.origin.system ^short = "The UCUM coding system"
* valueSampledData.origin.system ^definition = "The identification of the UCUM coding system that provides the coded form of the unit."
* valueSampledData.origin.code 1..
* valueSampledData.origin.code ^definition = "The unit code."
* valueSampledData.origin.code ^comment = "The UCUM code translated from the MDC Unit Code attribute noting that the partition is always 4."
* valueSampledData.factor 1..
* valueSampledData.factor ^short = "The scale factor"
* valueSampledData.dimensions ^short = "Number of rtsa sample points at each time point"
* valueSampledData.dimensions ^definition = "The number of rtsa sample points at each time point. This value gives the number of data points in the valueSampledData.data[] array."
* valueSampledData.dimensions ^comment = "This value is obtained from the Sa-Specification.array-size field of the Sa-Specification attribute."
* valueSampledData.data ^definition = "A series of data points which are decimal values separated by a single space (character u20). The special values \"E\" (error), \"L\" (below detection limit) and \"U\" (above detection limit) are not used. The device does not provide such individual values. "
* valueSampledData.data ^comment = "One is strongly encouraged to use the scaling from the 11073 device as it is likely the scaling was chosen to optimize transmission. If\r\nA = Scale-and-Range-SpecificationX.lower-absolute-value as an Mder FLOAT\r\nB = Scale-and-Range-SpecificationX.upper-absolute-value as an Mder FLOAT\r\nI = Scale-and-Range-SpecificationX.lower-scaled-value as a X-bit integer\r\nJ = Scale-and-Range-SpecificationX.upper-scaled-value as a X-bit integer\r\n\r\nvalueSampledData.factor is given by (A-B)/(I-J)\r\nand\r\nvalueSampledData.origin.value = A – (A-B)*I/(I-J)\r\nand \r\nvalueSampledData.data[i] = Sa-Simple-Observed-Value.values[i]"
* dataAbsentReason ^short = "Populated when the Measurement-Status indicates invalid, not unavailable, or msmt ongoing"
* dataAbsentReason ^definition = "Provides a reason why the expected value in the element Observation.valueSampledData is missing."
* dataAbsentReason ^comment = "Thre are no special values sent in RTSA data."
* dataAbsentReason.coding ^slicing.discriminator.type = #value
* dataAbsentReason.coding ^slicing.discriminator.path = "system"
* dataAbsentReason.coding ^slicing.rules = #open
* dataAbsentReason.coding contains FhirDefault 1..1
* dataAbsentReason.coding[FhirDefault].system 1..
* dataAbsentReason.coding[FhirDefault].system = "http://terminology.hl7.org/CodeSystem/data-absent-reason" (exactly)
* dataAbsentReason.coding[FhirDefault].code 1..
* referenceRange ^slicing.discriminator.type = #value
* referenceRange ^slicing.discriminator.path = "low.system"
* referenceRange ^slicing.rules = #open
* referenceRange contains scaleAndReferenceRange 0..1
* referenceRange[scaleAndReferenceRange] ^short = "Provides the scale factors as sent by the 20601 device"
* referenceRange[scaleAndReferenceRange].low 1..
* referenceRange[scaleAndReferenceRange].low ^definition = "The Scale-and-Range-SpecificationX.lower-absolute-value from the RTSA metric where X is one of 8, 16, or 32."
* referenceRange[scaleAndReferenceRange].low.value 1..
* referenceRange[scaleAndReferenceRange].low.value ^definition = "This is the value from the Scale-and-Range-SpecificationX.lower-absolute-value attribute where X is 8, 16, or 32. It is the minimum value that will be reported by the sensor. The attribute reports the value as an Mder FLOAT. Note that the word 'absolute' does not mean the mathematical absolute value!"
* referenceRange[scaleAndReferenceRange].low.value ^comment = "The implicit precision in the value should always be honored. The precision is given by the Mder FLOAT."
* referenceRange[scaleAndReferenceRange].low.system 1..
* referenceRange[scaleAndReferenceRange].low.system = "http://unitsofmeasure.org" (exactly)
* referenceRange[scaleAndReferenceRange].low.system ^definition = "This value identifies the MDC coding system"
* referenceRange[scaleAndReferenceRange].low.code 1..
* referenceRange[scaleAndReferenceRange].low.code ^definition = "This unit code shall be the same as reported in the valueSampledData"
* referenceRange[scaleAndReferenceRange].high 1..
* referenceRange[scaleAndReferenceRange].high.value 1..
* referenceRange[scaleAndReferenceRange].high.value ^definition = "This is the value from the Scale-and-Range-SpecificationX.upper-absolute-value attribute where X is 8, 16, or 32. It is the maximum value that will be reported by the sensor. The attribute reports the value as an Mder FLOAT. Note that the word 'absolute' does not mean the mathematical absolute value!"
* referenceRange[scaleAndReferenceRange].high.value ^comment = "The implicit precision in the value should always be honored. The precision is given by the Mder FLOAT."
* referenceRange[scaleAndReferenceRange].high.system 1..
* referenceRange[scaleAndReferenceRange].high.system = "http://unitsofmeasure.org" (exactly)
* referenceRange[scaleAndReferenceRange].high.system ^definition = "This value identifies theUCUM coding system"
* referenceRange[scaleAndReferenceRange].high.code 1..
* referenceRange[scaleAndReferenceRange].high.code ^definition = "This unit code shall be the same as reported in the valueSampledData"
