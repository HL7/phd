Alias: $Quantity11073MDC = http://hl7.org/fhir/uv/phd/ValueSet/Quantity11073MDC
Alias: $MDCnotObject = http://hl7.org/fhir/uv/phd/ValueSet/MDCnotObject
Alias: $DataAbsentReason = http://hl7.org/fhir/ValueSet/data-absent-reason

Profile: PhdCompoundObservation
Parent: PhdBaseObservation
Id: PhdCompoundObservation
Description: "StructureDefinition for Observation Resources representing measurement data coming from a medical device where the measurement is described by a set of numbers such as the x, y, and x components of an acceleration."
* ^meta.lastUpdated = "2017-12-08T06:07:29.764-05:00"
* ^extension.url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-wg"
* ^extension.valueCode = #oo
* ^url = "http://hl7.org/fhir/uv/phd/StructureDefinition/PhdCompoundObservation"
* ^status = #draft
* ^date = "2017-06-02T14:29:52.39367-04:00"
* . ^definition = "The PhdCompoundObservation reports PHD measurements that contain one of either a Compound-Basic-Nu-Observed-Value, Compound-Simple-Nu-Observed-Value, or Compound-Nu-Observed-Value attribute."
  * ^comment = "Used for compound numeric observations from Personal Health Devices"
* category ..*
* category only CodeableConcept
  * ^slicing.discriminator[0].type = #value
  * ^slicing.discriminator[=].path = "coding.code"
  * ^slicing.discriminator[+].type = #value
  * ^slicing.discriminator[=].path = "coding.system"
  * ^slicing.ordered = false
  * ^slicing.rules = #open
* value[x] ..0
* component ^slicing.discriminator[0].type = #value
  * ^slicing.discriminator[=].path = "code"
  * ^slicing.rules = #open
* component contains
    NumericComponent 0..*
    // CodeableConceptComponent 0..*
    // StringComponent 0..*
    // SampledDataComponent 0..*
* component ^short = "Compound measurement components"
  * ^definition = "Each compoundComponent contains one of the N constituents of the compound measurement. These entries are NOT present if a Measurement-Status attribute indicates an error."
  * ^comment = "A compound measurement is a measurement that requires more than one value to represent it, such as an acceleration which has an x, y, and z components. The Blood pressure is also represented as a compound measurement, containing systolic, diastolic and MAP components. One combines all the compound elements together to describe the measurement. The Metric-Id-List entry n and Compound-Basic/Simple-Nu-Observed-Value entry n are ordered such that the code that describes each entry n is computed from the partition of the Type attribute and the term code of the Metric-Id-List attribute. In the case of the Compound-Nu-Observed-Value, the term code comes from the Compound-Nu-Observed-Value.metric sub-component."
  * code from $MDCnotObject (extensible) 
    * text ^definition = "It is recommended to display at least the reference identifier describing the compound sub-element"
* component[NumericComponent] ^short = "Numeric measurement component"
  * value[x] only Quantity
  * valueQuantity
    * value 0..
      * ^definition = "The value of nth element of the compound attribute. The value element for the nth compoundComponent is missing if the attribute sends a special value or the Compound-Nu-Observed-Value status element indicates an error."
    * system 1..
    * system = "http://unitsofmeasure.org" (exactly)
      * ^definition = "The unit code shall use the UCUM system"
    * code 1..
      * ^definition = "The MDC code must be translated to the UCUM code."
  * extension contains http://hl7.org/fhir/uv/phd/StructureDefinition/Accuracy named Accuracy 0..1
  * extension contains http://hl7.org/fhir/uv/phd/StructureDefinition/Confidence95 named Confidence95 0..1
// * component[StringComponent] ^short = "String measurement component"
//   * value[x] only string
//   * valueString
//     * ^short = "Human readable text string"
// * component[SampledDataComponent] ^short = "Sampled data measurement component"
//   * value[x] only SampledData
//   * valueSampledData
//     * ^short = "Data as a series of measurements taken by a device"
// * component[CodeableConceptComponent] ^short = "CodeableConcept measurement component"
//   * valueCodeableConcept.coding
//     * ^short = "Required MDC code"
//     * system 1..
//     * system = "urn:iso:std:iso:11073:10101" (exactly)
* component
  * dataAbsentReason ^short = "Populated when the component value is invalid or unavailable for some reason"
    * ^definition = "Provides a reason why the expected value in the component is missing. For numeric components this could be not-a-number, negative-infinity or similar."
    * coding ^slicing.discriminator[0].type = #value
      * ^slicing.discriminator[=].path = "system"
      * ^slicing.rules = #open
    * coding contains FhirDefault 1..1
    * coding[FhirDefault]
      * system 1..
      * system = "http://terminology.hl7.org/CodeSystem/data-absent-reason" (exactly)
      * code 1..
  * interpretation
    * coding ^slicing.discriminator[0].type = #value
      * ^slicing.discriminator[=].path = "system"
      * ^slicing.rules = #open
    * coding contains MsmtStatusInterpretation 1..1
    * coding[MsmtStatusInterpretation] ^short = "Measurement status interpretation when questionable, calibration-ongoing, validated, early-indication, threshold exceeded, alarm inhibited"
      * system 1..
      * system = "http://hl7.org/fhir/uv/pocd/CodeSystem/measurement-status" (exactly)
      * code 1..


