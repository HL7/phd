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
* . ^definition = "The PhdCompoundObservation reports PHD measurements that contain one of either a Compound-Basic-Nu-Observed-Value, Compound-Simple-Nu-Observed-Value, or Compound-Nu-Observed-Value attribute."
  * ^comment = "Used for compound numeric observations from Personal Health Devices"
* value[x] ..0
// * component ^slicing.discriminator[0].type = #type
//   * ^slicing.discriminator[=].path = "value"
//   * ^slicing.rules = #open
// * component contains
//     NumericComponent 0..*
//     // CodeableConceptComponent 0..*
//     // StringComponent 0..*
//     // SampledDataComponent 0..*
* component ^short = "Compound measurement components"
  * ^definition = "Each component contains one of the constituents of the compound measurement. These are NOT present if a Measurement-Status attribute indicates an error."
  * ^comment = "A compound measurement is a measurement that requires more than one value to represent it, such as an acceleration which has an x, y, and z components. The Blood pressure is also represented as a compound measurement, containing systolic, diastolic and MAP components."
  * code from $MDCnotObject (extensible) 
    * text ^definition = "It is recommended to display at least the reference identifier describing the compound sub-element"
  * value[x] only SampledData or CodeableConcept or string or Quantity
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
// * component
//   * dataAbsentReason ^short = "Populated when the component value is invalid or unavailable for some reason"
//     * ^definition = "Provides a reason why the expected value in the component is missing. For numeric components this could be not-a-number, negative-infinity or similar."
//     * coding ^slicing.discriminator[0].type = #value
//       * ^slicing.discriminator[=].path = "system"
//       * ^slicing.rules = #open
//     * coding contains FhirDefault 1..1
//     * coding[FhirDefault]
//       * system 1..
//       * system = "http://terminology.hl7.org/CodeSystem/data-absent-reason" (exactly)
//       * code 1..
//   * interpretation
//     * coding ^slicing.discriminator[0].type = #value
//       * ^slicing.discriminator[=].path = "system"
//       * ^slicing.rules = #open
//     * coding contains MsmtStatusInterpretation 1..1
//     * coding[MsmtStatusInterpretation] ^short = "Measurement status interpretation when questionable, calibration-ongoing, validated, early-indication, threshold exceeded, alarm inhibited"
//       * system 1..
//       * system = "http://hl7.org/fhir/uv/pocd/CodeSystem/measurement-status" (exactly)
//       * code 1..
* component ^slicing.discriminator[0].type = #value
  * ^slicing.discriminator[=].path = "code"
  * ^slicing.rules = #open
* component contains
    supplementalTypesComponent 0..*
* component[supplementalTypesComponent] ^short = "Supplemental Type: A further description of the measurement type."
  * ^definition = "For each partition:term code pair contained in the Supplemental-Types attribute, a separate supplementalTypesComponent element is generated. The component is not generated if the attribute is absent or empty. The component shall be generated otherwise."
  * ^comment = "A PHD may send a Supplemental-Types attribute as part of the measurement. This attribute consists of a set of MDC nomenclature codes as partition:term code pairs. Each pair is a code describing something additional about the measurement, such as MDC_MODALITY_SPOT in the pulse oximeter which indicates that the provided measurement is a stable average. An MDC_MODALITY_FAST would indicate that a short averaging is used and the result reported regardless of stability."
  * code
    * coding 1..
      * ^slicing.discriminator[0].type = #value
      * ^slicing.discriminator[=].path = "system"
      * ^slicing.rules = #open
    * coding contains MdcType 1..1
    * coding[MdcType] ^short = "The 11073-10101 MDC code for the measurement"
      * system 1..
      * system = "urn:iso:std:iso:11073:10101" (exactly)
      * code 1..
      * code = #68193 (exactly)
        * ^definition = "68193 is the 32-bit nomenclature code indicating a 'Supplemental-Types' value"
    * text ^definition = "It is recommended to display at least the reference identifier for the Supplemental-Types which is MDC_ATTR_SUPPLEMENTAL_TYPES"
  * value[x] 1..
  * valueCodeableConcept 1..1
  * valueCodeableConcept only CodeableConcept
    * ^sliceName = "valueCodeableConcept"
    * ^definition = "The supplemental information determined as a result of making the observation, if the information is a code."
    * coding ^slicing.discriminator[0].type = #value
      * ^slicing.discriminator[=].path = "system"
      * ^slicing.rules = #open
    * coding contains MDCType 1..1
    * coding[MDCType] ^short = "Required MDC code entry."
      * system 1..
      * system = "urn:iso:std:iso:11073:10101" (exactly)
      * code 1..
        * ^definition = "For the given Supplemental-Types entry the code here is given by: partition * 2**16 + term code"
  * dataAbsentReason ..0


