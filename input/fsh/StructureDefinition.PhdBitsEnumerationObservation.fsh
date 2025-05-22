Alias: $ASN1measurement = http://hl7.org/fhir/uv/phd/ValueSet/ASN1measurement

Profile: PhdBitsEnumerationObservation
Parent: PhdBaseObservation
Id: PhdBitsEnumerationObservation
Description: "Observations from a PHD where the measurement is an ASN1 BITS value."
* ^meta.lastUpdated = "2017-12-14T04:24:35.475-05:00"
* ^extension.url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-wg"
* ^extension.valueCode = #oo
* ^url = "http://hl7.org/fhir/uv/phd/StructureDefinition/PhdBitsEnumerationObservation"
// * ^status = #draft
* ^date = "2017-06-02T14:29:52.39367-04:00"
* . ^definition = "The PhdBitsEnumerationObservation reports PHD measurements that contain a bitstring attribute."
  * ^comment = "This type of measurement is used when the Personal Health Device reports a measurement as an IEEE 11073-10101 BITs value."
* value[x] ..0
* component ^slicing.discriminator[1].type = #value
  * ^slicing.discriminator[=].path = "code"
  * ^slicing.rules = #open
* component contains bitsComponent 0..*
* component[bitsComponent] ^short = "BITs measurements entry components"
  * ^definition = "Each ASN1 component entrant contains one of the reported BITs settings. These entries are NOT present if the Measurement-Status attribute field indicates an error."
  * code from $ASN1measurement (required)  
//    * coding.system = "http://hl7.org/fhir/uv/phd/CodeSystem/ASN1ToHL7" (exactly)
  * value[x] only boolean
  * dataAbsentReason 0..1
    * ^short = "For the optional reporting of unsupported bits"
    * ^definition = "Provides a reason why the expected value in the element Observation.component.value[x] is missing. In this profile for this component that happens if the PHD does not support this bit and the uploader wishes to report that situation."
    * coding ^short = "FHIR code for reporting 'unsupported'"
      * code = #unsupported (exactly)
  * valueBoolean ^short = "The value of the bit"
    * ^definition = "The value of the bit. If the bit is set the value is `true` and if the bit is cleared the value is `false`."

Mapping: IEEE-11073-10206-PhdBitsEnumerationObservation
Id: IEEE-11073-10206-PhdBitsEnumerationObservation
Title: "IEEE-11073-10206 ACOM to FHIR PhdBitsEnumerationObservation"
Source: PhdBitsEnumerationObservation
Target: "https://sagroups.ieee.org/11073/phd-wg"
* -> "ACOM"
* component.code.coding -> "Observation.type + '.' + MDER bit number (ASN1ToHL7 code)"
* component.valueBoolean -> "`true` or `false` depending on the bit value in Observation.state[bit number]"

 