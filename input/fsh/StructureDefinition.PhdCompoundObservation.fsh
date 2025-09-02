Alias: $MDCnotObject = http://hl7.org/fhir/uv/phd/ValueSet/MDCnotObject
Alias: $DataAbsentReason = http://hl7.org/fhir/ValueSet/data-absent-reason

Profile: PhdCompoundObservation
Parent: PhdBaseObservation
Id: PhdCompoundObservation
Description: "Observations from a PHD where the measurement is a set of numbers such as the x, y, and z components of an acceleration."
* ^meta.lastUpdated = "2017-12-08T06:07:29.764-05:00"
* ^url = "http://hl7.org/fhir/uv/phd/StructureDefinition/PhdCompoundObservation"
// * ^status = #draft
* ^date = "2017-06-02T14:29:52.39367-04:00"
* . ^definition = "The PhdCompoundObservation reports PHD measurements that contain one or more components with a numeric, string, codeable concepts or sample array value."
  * ^comment = "Used for compound observations from Personal Health Devices"
* value[x] ..0
* component.value[x] only Quantity or CodeableConcept or string or SampledData
* component contains
  measurement 0..*
* component[measurement] ^short = "Compound measurement entry component"
  * ^definition = "Each compoundComponent contains one of the N constituents of the compound measurement. These entries are NOT present if a Measurement-Status attribute indicates an error."
  * ^comment = "A compound measurement is a measurement that requires more than one value to represent it, such as an acceleration which has an x, y, and z components. The Blood pressure is also represented as a compound measurement, containing systolic, diastolic and MAP components. One combines all the compound elements together to describe the measurement."
  * code from http://hl7.org/fhir/uv/phd/ValueSet/MDCValueSet (required)
  * value[x] only Quantity or CodeableConcept or string or SampledData
  * valueQuantity
    * value 1..
      * ^definition = "The value of the numeric component. The value element is missing if a special FLOAT value is reported."
    * system 1..
    * system = "http://unitsofmeasure.org" (exactly)
      * ^definition = "The unit code shall use the UCUM system"
    * code 1..
      * ^definition = "The MDC code must be translated to the UCUM code."
  * valueCodeableConcept
    * coding 1..1
      * ^slicing.discriminator[0].type = #value
      * ^slicing.discriminator[=].path = "system"
      * ^slicing.rules = #open
    * coding contains
        MdcType 1..1 
    * coding[MdcType] ^short = "The 11073-10101 MDC code for the measurement"
      * ^definition = "This MDC code expresses what the measurement is"
      * system 1..
      * system = "urn:iso:std:iso:11073:10101" (exactly)
      * code 1.. 
    * text ^definition = "It is recommended to display at least the reference identifier describing the compound sub-element"
  * valueSampledData
    * origin 1..1
      * ^definition = "The base quantity that a measured value of zero represents. In addition, this provides the calibration information for the measurement."
    * interval 1..
      * ^definition = "The time interval between samples."
    * factor 1..
      * ^definition = "A correction factor that is applied to the sampled data points before they are added to the origin."
    * lowerLimit 1..
      * ^definition = "The lower limit of detection of the measured values. This is needed if any of the data points have the value of zero."
    * upperLimit 1..
      * ^definition = "The upper limit of detection of the measured values. This is needed if any of the data points have the value of zero."
    * dimensions 1..
      * ^definition = "The number of sample points at each time point."
    * data 1..
      * ^definition = "A series of data points which are the sampled values."
  * valueString ^short = "The value of the string component"
    * ^definition = "The value of the string component"
  * dataAbsentReason ^short = "Populated when the component is missing or invalid"
    * ^definition = "Provides a reason why the expected value in the nth element `component.value[x]` is missing. This can happen when a component reports a special FLOAT value."
    * coding from http://hl7.org/fhir/ValueSet/data-absent-reason (required)

* component
  * extension contains http://hl7.org/fhir/uv/phd/StructureDefinition/Accuracy named Accuracy 0..1
  * extension contains http://hl7.org/fhir/uv/phd/StructureDefinition/Confidence95 named Confidence95 0..1
  * extension contains http://hl7.org/fhir/uv/phd/StructureDefinition/SimpleAlerting named SimpleAlerting 0..1

Mapping: IEEE-11073-10206-PhdCompoundObservation
Id: IEEE-11073-10206-PhdCompoundObservation
Title: "IEEE-11073-10206 ACOM to FHIR PhdCompoundObservation"
Source: PhdCompoundObservation
Target: "https://sagroups.ieee.org/11073/phd-wg"
* -> "ACOM"
* component.code.coding.system -> "MDC (urn:iso:std:iso:11073:10101)"
* component.code.coding.code -> "CompoundObservation.component-type"
* component.value[x] -> "CompoundObservation.component.value (dependent on the type of the component)"