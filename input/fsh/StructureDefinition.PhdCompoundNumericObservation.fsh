Alias: $MDCnotObject = http://hl7.org/fhir/uv/phd/ValueSet/MDCnotObject
Alias: $DataAbsentReason = http://hl7.org/fhir/ValueSet/data-absent-reason

Profile: PhdCompoundNumericObservation
Parent: PhdBaseObservation
Id: PhdCompoundNumericObservation
Description: "Observations coming from a PHD where the measurement is a set of numbers such as the x, y, and z components of an acceleration."
* ^meta.lastUpdated = "2017-12-08T06:07:29.764-05:00"
* ^extension.url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-wg"
* ^extension.valueCode = #oo
* ^url = "http://hl7.org/fhir/uv/phd/StructureDefinition/PhdCompoundNumericObservation"
// * ^status = #draft
* ^date = "2017-06-02T14:29:52.39367-04:00"
* . ^definition = "The PhdCompoundNumericObservation reports PHD measurements that contain one of either a Compound-Basic-Nu-Observed-Value, Compound-Simple-Nu-Observed-Value, or Compound-Nu-Observed-Value attribute."
  * ^comment = "Used for compound numeric observations from Personal Health Devices"
* value[x] ..0
* component contains
    compound 0..*
* component[compound] ^short = "Compound numeric measurement entry components"
  * ^definition = "Each compoundComponent contains one of the N constituents of the compound measurement. These entries are NOT present if a Measurement-Status attribute indicates an error."
  * ^comment = "A compound measurement is a measurement that requires more than one value to represent it, such as an acceleration which has an x, y, and z components. The Blood pressure is also represented as a compound measurement, containing systolic, diastolic and MAP components. One combines all the compound elements together to describe the measurement. The Metric-Id-List entry n and Compound-Basic/Simple-Nu-Observed-Value entry n are ordered such that the code that describes each entry n is computed from the partition of the Type attribute and the term code of the Metric-Id-List attribute. In the case of the Compound-Nu-Observed-Value, the term code comes from the Compound-Nu-Observed-Value.metric sub-component."
  * code from $MDCnotObject (required)
    * coding 1..
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
  * value[x] only Quantity
  * valueQuantity
    * value 1..
      * ^definition = "The value of nth element of the compound attribute."
    * system 1..
    * system = "http://unitsofmeasure.org" (exactly)
      * ^definition = "The unit code shall use the UCUM system"
    * code 1..
      * ^definition = "The MDC code must be translated to the UCUM code."
  * dataAbsentReason ^short = "Populated when the component reports a special FLOAT value"
    * ^definition = "Provides a reason why the expected value in the nth element Observation.compoundComponent.valueQuantity is missing. This happens when the value sent by the PHD is a special FLOAT value."
    * coding from http://hl7.org/fhir/ValueSet/data-absent-reason (required)
  * interpretation
    * coding ^slicing.discriminator[0].type = #value
      * ^slicing.discriminator[=].path = "system"
      * ^slicing.rules = #open
    * coding contains MsmtStatusInterpretation 1..1
    * coding[MsmtStatusInterpretation] ^short = "Measurement status interpretation when questionable, calibration-ongoing, validated, early-indication, threshold exceeded, alarm inhibited"
      * system 1..
      * system = "http://hl7.org/fhir/uv/pocd/CodeSystem/measurement-status" (exactly)
      * code 1..
  * extension contains http://hl7.org/fhir/uv/phd/StructureDefinition/Accuracy named Accuracy 0..1
  * extension contains http://hl7.org/fhir/uv/phd/StructureDefinition/Confidence95 named Confidence95 0..1
  * extension contains http://hl7.org/fhir/uv/phd/StructureDefinition/SimpleAlerting named SimpleAlerting 0..1

Mapping: IEEE-11073-10206-PhdCompoundNumericObservation
Id: IEEE-11073-10206-PhdCompoundNumericObservation
Title: "IEEE-11073-10206 ACOM to FHIR PhdCompoundNumericObservation"
Source: PhdCompoundNumericObservation
Target: "https://sagroups.ieee.org/11073/phd-wg"
* -> "ACOM"
* component.code.coding.system -> "MDC (urn:iso:std:iso:11073:10101)"
* component.code.coding.code -> "CompoundObservation.component-type"
* component.valueQuantity.value -> "CompoundObservation.component.value"
* component.valueQuantity.code -> "CompoundObservation.component.unit"