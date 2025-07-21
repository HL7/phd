Alias: $ASN1DeviceBits = http://hl7.org/fhir/uv/phd/ValueSet/ASN1DeviceBits

Profile: PhdNumericObservation
Parent: PhdBaseObservation
Id: PhdNumericObservation
Description: "Observations from a PHD where the measurement is number"
* ^meta.lastUpdated = "2017-12-14T04:43:57.173-05:00"
* ^extension.url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-wg"
* ^extension.valueCode = #oo
* ^url = "http://hl7.org/fhir/uv/phd/StructureDefinition/PhdNumericObservation"
// * ^status = #draft
* ^date = "2017-06-02T14:29:52.39367-04:00"
* . ^short = "Simple Numeric measurement"
  * ^definition = "The PhdNumericObservation reports PHD measurements that contain one of either a Basic-Nu-Observed-Value, Simple-Nu_observed-Value, or Nu_observed-Value attribute."
  * ^comment = "Used for non-compound numeric observations from Personal Health Devices."
* value[x] only Quantity
  * value 1..
    * ^definition = "The decoded FLOAT or SFLOAT value from a PHD measurement containing either a\r\nBasic-Nu-Observed-Value\r\nSimple-Nu-Observed-Value or\r\nNu_observed-Value attribute."
    * ^comment = "The implicit precision in the value shall be honored. The MDER encoding used in the above attributes provides this precision. The translating software shall honor that precision when generating this value.\r\nThis element shall be present unless there is an error reported in the Measurement-Status attribute or the Nu-Observed-Value.status field or the Mder encoding represents one of the special values. In that case there is a dataAbsentReason element and the valueQuantity element is not present. Note that not all measurement status values are errors resulting in no measurement being reported here; for example the preliminary or verified status."
  * system 1..
  * system = "http://unitsofmeasure.org" (exactly)
  * code 1..
    * ^short = "The UCUM code for the units of this measurement."
    * ^comment = "The UCUM code needs to be translated from  the 11073-10101 code from the device. This translation means that the reporting of units is not future proof."
* dataAbsentReason ^short = "This element is populated for numeric observations when a special value is reported that is not a real number."
  * ^definition = "Provides a reason why the expected value in the element Observation.valueQuantity is missing. In this case this could also be 'not-a-number', 'positive-infinity', 'negative-infinity' or 'error'."
  * ^comment = "The values in the http://terminology.hl7.org/CodeSystem/data-absent-reason system do not provide a code that matches the special values 'not at this resolution' and 'reserved'. In those cases one uses the generic 'error' code. If both a special value and a Measurement-Status indicating invalid, not available, or msmt ongoing are received, the Measurement-Status mapping takes precedence."
* extension contains http://hl7.org/fhir/uv/phd/StructureDefinition/Accuracy named Accuracy 0..1
* extension contains http://hl7.org/fhir/uv/phd/StructureDefinition/Confidence95 named Confidence95 0..1
* extension contains http://hl7.org/fhir/uv/phd/StructureDefinition/SimpleAlerting named SimpleAlerting 0..1

Mapping: IEEE-11073-10206-PhdNumericObservation
Id: IEEE-11073-10206-PhdNumericObservation
Title: "IEEE-11073-10206 ACOM to FHIR/1"
Source: PhdNumericObservation
Target: "https://sagroups.ieee.org/11073/phd-wg"
* -> "ACOM"
* valueQuantity.value -> "NumericObservation.value"
* valueQuantity.unit -> "NumericObservation.unit" 
* extension[Accuracy].valueQuantity.value -> "NumericObservation.accuracy"
