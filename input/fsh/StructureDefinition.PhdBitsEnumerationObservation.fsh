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
  * ^comment = "This type of measurement is used when the Personal Health Device reports a measurement as an IEEE 11073-10101 BITs value. This measurement is a complex representation where each bit means something. In many cases only certain bits are defined and it is generally true that the significant case is when the bit has been set. Given that measurement could result in up to 32 component entries (one for each bit) only set bits are required to be reported. Some specializations have used this measurement type when they should have used IEEE 11073-10101 codes."
* value[x] ..0
* component ^slicing.discriminator[0].type = #value
  * ^slicing.discriminator[=].path = "code"
  * ^slicing.rules = #open
* component contains bitsComponent 0..*
* component[bitsComponent] ^short = "BITs measurements entry components"
  * ^definition = "Each ANS1 component entrant contains one of the reported BITs settings. These entries are NOT present if a Measurement-Status attribute or Enum-Observed-Value status field indicates an error."
  * code from $ASN1measurement (required)
    * coding 1..
      * ^short = "The ANS1 BITs code for the measurement"
      * ^comment = "For BITs measurements, this code is an alpha-numeric string created from the code reported in the Observation.code.coding:11073Type.code followed by a dot (.) followed by the MDER bit being reported. For example, the CGM Device status measurement code is 8418060. If the value reported in the BITs field is 0001 1000 0000 0000 the MDER bits set are bits 3 and 4. Note that MDER bit 0 is the HIGH order bit. Bit 3 means 'sensor malfunction' and bit 4 means 'device specific alert'. This measurement would require two component elements and one would be 8418060.3 and the other would be 8418060.4. Note these are alphas-numeric strings and not decimal numbers. If one took the code 8418060.3 and looked it up in the ASN1 Bits vocabulary one would find it meant 'sensor malfunctioned'."
      * code 1..
        * ^definition = "A symbol in syntax defined by the IEEE ASN1 system. "
  * value[x] only CodeableConcept
  * dataAbsentReason ^short = "For the optional reporting of unsupported bits"
    * ^definition = "Provides a reason why the expected value in the element Observation.component.value[x] is missing. In this profile for this component that happens if the PHD does not support this bit and the uploader wishes to report that situation."
    * coding ^short = "FHIR code for reporting 'unsupported'"
      * code = #unsupported (exactly)
  * valueCodeableConcept
    * coding 
      * code from http://terminology.hl7.org/ValueSet/v2-0136|2.0.0 (required)
      * code 1..
        * ^definition = "If the bit is set this code is 'Y' and 'N' if the bit is cleared. If an 'event' bit only the set case needs to be reported. If the bit is unsupported, the dataAbsentReason code \"unsupported' is used. Unsupported bits are optional to report. If a state bit is supported both states shall be reported."

Mapping: IEEE-11073-10206-PhdBitsEnumerationObservation
Id: IEEE-11073-10206-PhdBitsEnumerationObservation
Title: "IEEE-11073-10206 ACOM to FHIR"
Source: PhdBitsEnumerationObservation
Target: "https://sagroups.ieee.org/11073/phd-wg"
* -> "ACOM"
* component.code.coding -> "Observation.type + '.' + MDER bit number"
* component.valueCodeableConcept -> "Y or N depending on the bit value in Observation.state[bit number]"
 