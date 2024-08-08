Alias: $Quantity11073MDC = http://hl7.org/fhir/uv/phd/ValueSet/Quantity11073MDC
Alias: $MDCnotObject = http://hl7.org/fhir/uv/phd/ValueSet/MDCnotObject

Profile: PhdCompoundNumericObservation
Parent: PhdBaseObservation
Id: PhdCompoundNumericObservation
Description: "StructureDefinition for Observation Resources representing measurement data coming from a medical device where the measurement is described by a set of numbers such as the x, y, and x components of an acceleration."
* ^meta.lastUpdated = "2017-12-08T06:07:29.764-05:00"
* ^extension.url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-wg"
* ^extension.valueCode = #oo
* ^url = "http://hl7.org/fhir/uv/phd/StructureDefinition/PhdCompoundNumericObservation"
* ^status = #draft
* ^date = "2017-06-02T14:29:52.39367-04:00"
* . ^definition = "The PhdCompoundNumericObservation reports PHD measurements that contain one of either a Compound-Basic-Nu-Observed-Value, Compound-Simple-Nu-Observed-Value, or Compound-Nu-Observed-Value attribute."
  * ^comment = "Used for compound numeric observations from Personal Health Devices"
* category ..*
* category only CodeableConcept
  * ^slicing.discriminator[0].type = #value
  * ^slicing.discriminator[=].path = "coding.code"
  * ^slicing.discriminator[+].type = #value
  * ^slicing.discriminator[=].path = "coding.system"
  * ^slicing.ordered = false
  * ^slicing.rules = #open
* category contains VSCat 0..1
* category[VSCat] only CodeableConcept
  * coding 1..*
  * coding only Coding
    * system 1..1
    * system only uri
    * system = "http://terminology.hl7.org/CodeSystem/observation-category" (exactly)
    * code 1..1
    * code only code
    * code = #vital-signs (exactly)
* value[x] ..0
* dataAbsentReason ^definition = "Provides a reason why no measurement compoundComponent elements are present. This situation only happens if the Measurement-Status attribute indicates a generic error."
  * ^comment = "Special values reported in the Compound-Basic/Simple-Nu-Observed-Value are handled individually in each compoundComponent element and are not considered generic. The Compound-Nu-Observed-Value has its own status entry and it is also handled in the component elements representing the compound."
  * coding ^slicing.discriminator[0].type = #value
    * ^slicing.discriminator[=].path = "system"
    * ^slicing.rules = #open
  * coding contains FhirDefault 1..1
  * coding[FhirDefault]
    * system 1..
    * system = "http://terminology.hl7.org/CodeSystem/data-absent-reason" (exactly)
    * code 1..
* component ^slicing.discriminator[0].type = #value
  * ^slicing.discriminator[=].path = "code"
  * ^slicing.rules = #open
* component contains
    compound 0..* and
    accuracyComponent 0..1
//   * code.coding[LoincCoding]
//     * system 1..
//     * system = "http://loinc.org" (exactly)
//     * code 1..
//       * ^comment = "Required if the measurement is a vital sign"
* component[compound] ^short = "Compound numeric measurement entry components"
  * ^definition = "Each compoundComponent contains one of the N constituents of the compound measurement. These entries are NOT present if a Measurement-Status attribute indicates an error."
  * ^comment = "A compound measurement is a measurement that requires more than one value to represent it, such as an acceleration which has an x, y, and z components. The Blood pressure is also represented as a compound measurement, containing systolic, diastolic and MAP components. One combines all the compound elements together to describe the measurement. The Metric-Id-List entry n and Compound-Basic/Simple-Nu-Observed-Value entry n are ordered such that the code that describes each entry n is computed from the partition of the Type attribute and the term code of the Metric-Id-List attribute. In the case of the Compound-Nu-Observed-Value, the term code comes from the Compound-Nu-Observed-Value.metric sub-component."
  * code from $MDCnotObject (required)
    * coding 1..
      * ^slicing.discriminator[0].type = #value
      * ^slicing.discriminator[=].path = "system"
      * ^slicing.rules = #open
    * coding contains
        MdcType 1..1 and
        LoincCoding 0..1
    * coding[MdcType] ^short = "The 11073-10101 MDC code for the measurement"
      * ^definition = "This MDC code expresses what the measurement is"
      * system 1..
      * system = "urn:iso:std:iso:11073:10101" (exactly)
      * code 1..
    * coding[LoincCoding] ^short = "The LOINC code for the measurement if a vital sign"
      * ^definition = "This (optional) LOINC code expresses what the measurement is"
      * system 1..
      * system = "http://loinc.org" (exactly)
      * code 1..
        * ^comment = "Required if the measurement is a vital sign"    
    * text ^definition = "It is recommended to display at least the reference identifier describing the compound sub-element"
  * value[x] only Quantity
  * valueQuantity
    * value 1..
      * ^definition = "The value of nth element of the compound attribute. The value element for the nth compoundComponent is missing if the attribute sends a special value or the Compound-Nu-Observed-Value status element indicates an error."
    * system 1..
    * system = "http://unitsofmeasure.org" (exactly)
      * ^definition = "The unit code shall use the UCUM system"
    * code 1..
      * ^definition = "The MDC code must be translated to the UCUM code."
  * dataAbsentReason ^short = "Populated when a special value or status in Compound-Nu-Observed-Value indicates invalid, not unavailable, or msmt ongoing"
    * ^definition = "Provides a reason why the expected value in the nth element Observation.compoundComponent.valueQuantity is missing. This could be a NaN (Not a Number), PINF (Positive infinity), NINF (Negative infinity) or the reserved and not-at-this-resolution special values. It can also be indicated by the (measurement) status field of the Compound-Nu-Observed-Value. Note that the FHIR codes for NAN are no longer 'NAN' but 'not-a-number'. Similar changes have been made for NINF and PINF."
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
* component[accuracyComponent] ^short = "The accuracy of the measurement"
  * ^definition = "This component shall be present if the Accuracy attribute is present."
  * code from $Quantity11073MDC (required)
    * coding 1..
      * ^slicing.discriminator[0].type = #value
      * ^slicing.discriminator[=].path = "system"
      * ^slicing.rules = #open
    * coding contains MdcType 1..1
    * coding[MdcType] ^short = "The 11073-10101 MDC code for the measurement"
      * system 1..
      * system = "urn:iso:std:iso:11073:10101" (exactly)
      * code 1..
      * code = #67914 (exactly)
        * ^definition = "The code for the Accuracy attribute is 67914"
    * text ^definition = "Should include the reference identifier for the Accuracy attribute MDC_ATTR_NU_ACCUR_MSMT"
  * value[x] 1..
    * ^slicing.discriminator[0].type = #type
    * ^slicing.discriminator[=].path = "$this"
    * ^slicing.rules = #open
  * valueQuantity 1..
  * valueQuantity only Quantity
    * ^sliceName = "valueQuantity"
    * value 1..
      * ^definition = "This is the value of the accuracy attribute. The value is Mder FLOAT encoded and shall be expressed to the precision indicated by the Mder FLOAT."
    * system 1..
    * system = "http://unitsofmeasure.org" (exactly)
      * ^definition = "The unit code shall use the UCUM system"
    * code 1..
      * ^definition = "The units for the Accuracy are given by the units of the measurement so this entry shall have the same code as in Observation.valueQuantity.code"
  * dataAbsentReason ..0
