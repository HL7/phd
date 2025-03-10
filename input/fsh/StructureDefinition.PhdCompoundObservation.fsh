Alias: $Quantity11073MDC = http://hl7.org/fhir/uv/phd/ValueSet/Quantity11073MDC
Alias: $MDCnotObject = http://hl7.org/fhir/uv/phd/ValueSet/MDCnotObject
Alias: $DataAbsentReason = http://hl7.org/fhir/ValueSet/data-absent-reason

Profile: PhdCompoundObservation
Parent: Observation
Id: PhdCompoundObservation
Description: "StructureDefinition for Observation Resources representing measurement data coming from a medical device where the measurement is described by a set of numbers such as the x, y, and x components of an acceleration."
* ^meta.lastUpdated = "2017-12-08T06:07:29.764-05:00"
* ^url = "http://hl7.org/fhir/uv/phd/StructureDefinition/PhdCompoundObservation"
* ^status = #draft
* ^date = "2017-06-02T14:29:52.39367-04:00"
* . ^definition = "The PhdCompoundObservation reports PHD measurements that contain one or more components with a numeric, string, codeable concepts or sample array value."
  * ^comment = "Used for compound observations from Personal Health Devices"
* value[x] ..0
// * component ^slicing.discriminator[0].type = #value
//   * ^slicing.discriminator[=].path = "value"
//   * ^slicing.rules = #open
* component 1..*
// * component contains
//     MeasurementComponent 1..*
// //     NumericComponent 0..*
// //     CodeableConceptComponent 0..*
// //     StringComponent 0..*
// //     SampledDataComponent 0..*
* component ^short = "Compound measurement components"
  * ^definition = "Each component contains one of the constituents of the compound measurement. These are NOT present if a Measurement-Status attribute indicates an error."
  * ^comment = "A compound measurement is a measurement that requires more than one value to represent it, such as an acceleration which has an x, y, and z components. The Blood pressure is also represented as a compound measurement, containing systolic, diastolic and MAP components."
  * code from $MDCnotObject (extensible) 
    * text ^definition = "It is recommended to display at least the reference identifier describing the compound sub-element"
  * value[x] only SampledData or CodeableConcept or string or Quantity
//   * dataAbsentReason ..0
  // * valueQuantity
  //   * value 0..
  //     * ^definition = "The value of nth element of the compound attribute. The value element for the nth compoundComponent is missing if the attribute sends a special value or the Compound-Nu-Observed-Value status element indicates an error."
  //   * system 1..
  //   * system = "http://unitsofmeasure.org" (exactly)
  //     * ^definition = "The unit code shall use the UCUM system"
  //   * code 1..
  //     * ^definition = "The MDC code must be translated to the UCUM code."
  // * extension contains http://hl7.org/fhir/uv/phd/StructureDefinition/Accuracy named Accuracy 0..1
  // * extension contains http://hl7.org/fhir/uv/phd/StructureDefinition/Confidence95 named Confidence95 0..1
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
      * ^slicing.discriminator[=].path = "code"
      * ^slicing.rules = #open
    * coding contains FhirDefault 1..1
    * coding[FhirDefault]
      * code from $DataAbsentReason (required)
      * code 1..
//   * interpretation
//     * coding ^slicing.discriminator[0].type = #value
//       * ^slicing.discriminator[=].path = "system"
//       * ^slicing.rules = #open
//     * coding contains MsmtStatusInterpretation 1..1
//     * coding[MsmtStatusInterpretation] ^short = "Measurement status interpretation when questionable, calibration-ongoing, validated, early-indication, threshold exceeded, alarm inhibited"
//       * system 1..
//       * system = "http://hl7.org/fhir/uv/pocd/CodeSystem/measurement-status" (exactly)
//       * code 1..


