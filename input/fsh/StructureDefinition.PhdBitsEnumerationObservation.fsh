Alias: $ASN1measurement = http://hl7.org/fhir/uv/phd/ValueSet/ASN1measurement

Profile: PhdBitsEnumerationObservation
Parent: PhdBaseObservation
Id: PhdBitsEnumerationObservation
Description: "StructureDefinition for Observation Resources representing measurement data coming from a medical device where the measurement is an ASN1 BITS value."
* ^meta.lastUpdated = "2017-12-14T04:24:35.475-05:00"
* ^extension.url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-wg"
* ^extension.valueCode = #oo
* ^url = "http://hl7.org/fhir/uv/phd/StructureDefinition/PhdBitsEnumerationObservation"
* ^status = #draft
* ^date = "2017-06-02T14:29:52.39367-04:00"
* . ^definition = "The PhdBitsEnumerationObservation reports PHD measurements that contain a Enum-Observed-Value-Simple-Bit-Str or Enum-Observed-Value-Basic-Bit-Str attribute."
  * ^comment = "This type of measurement is used when the Personal Health Device reports a measurement as an IEEE 11073 10101 BITs value. This measurement is a complex representation where each bit means something. In many cases only certain bits are defined and it is generally true that the significant case is when the bit has been set. Given that measurement could result in up to 32 component entries (one for each bit) only set bits are required to be reported. Some specializations have used this measurement type when they should have used IEEE 10101 codes."
* meta 1..
  * profile ^slicing.discriminator.type = #value
    * ^slicing.discriminator.path = "value"
    * ^slicing.rules = #open
  * profile contains phdProfile 1..1
  * profile[phdProfile] = "http://hl7.org/fhir/uv/phd/StructureDefinition/PhdBitsEnumerationObservation" (exactly)
* value[x] ..0
* dataAbsentReason ^definition = "Provides a reason why no measurement BITs Component elements are present. This situation only happens if the Measurement-Status attribute or Enum-Observed-Value status field indicates a generic error."
  * coding ^slicing.discriminator.type = #value
    * ^slicing.discriminator.path = "system"
    * ^slicing.rules = #open
  * coding contains FhirDefault 1..1
  * coding[FhirDefault]
    * system 1..
    * system = "http://terminology.hl7.org/CodeSystem/data-absent-reason" (exactly)
    * code 1..
* component contains bitsComponent 0..*
* component[bitsComponent] ^short = "BITs measurements entry components"
  * ^definition = "Each ANS1 component entrant contains one of the reported BITs settings. These entries are NOT present if a Measurement-Status attribute or Enum-Observed-Value status field indicates an error."
  * code from $ASN1measurement (required)
    * coding 1..
      * ^short = "The ANS1 BITs code for the measurement"
      * ^comment = "For BITs measurements, this code is an alpha-numeric string created from the code reported in the Observation.code.coding:11073Type.code followed by a dot (.) followed by the MDER bit being reported. For example, the CGM Device status measurement code is 8418060. If the value reported in the BITs field is 0001 1000 0000 0000 the MDER bits set are bits 3 and 4. Note that MDER bit 0 is the HIGH order bit. Bit 3 means 'sensor malfunction' and bit 4 means 'device specific alert'. This measurement would require two component elements and one would be 8418060.3 and the other would be 8418060.4. Note these are alphas-numeric strings and not decimal numbers. If one took the code 8418060.3 and looked it up in the ASN1 Bits vocabulary one would find it meant 'sensor malfunctioned'."
      * system 1..
      * system = "http://hl7.org/fhir/uv/phd/CodeSystem/ASN1ToHL7" (exactly)
        * ^comment = "This value is a placeholder until the correct reference URL is registered."
      * code 1..
        * ^definition = "A symbol in syntax defined by the IEEE ASN1 system. "
  * value[x] only CodeableConcept
  * dataAbsentReason ^short = "For the optional reporting of unsupported bits"
    * ^definition = "Provides a reason why the expected value in the element Observation.component.value[x] is missing. In this profile for this component that happens if the PHD does not support this bit and the uploader wishes to report that situation."
    * coding ^slicing.discriminator.type = #value
      * ^slicing.discriminator.path = "system"
      * ^slicing.rules = #open
    * coding contains FhirDefault 1..1
    * coding[FhirDefault] ^short = "FHIR default code system for reporting 'unsupported'"
      * system 1..
      * system = "http://terminology.hl7.org/CodeSystem/data-absent-reason" (exactly)
      * code 1..
      * code = #unsupported (exactly)
* valueCodeableConcept
  * coding ^slicing.discriminator.type = #value
    * ^slicing.discriminator.path = "system"
    * ^slicing.ordered = true
    * ^slicing.rules = #open
  * coding contains v2BinaryValue 1..1
  * coding[v2BinaryValue]
    * system 1..
    * system = "http://terminology.hl7.org/CodeSystem/v2-0136" (exactly)
    * code 1..
      * ^definition = "If the bit is set this code is 'Y' and 'N' if the bit is cleared. If an 'event' bit only the set case needs to be reported. If the bit is unsupported, the dataAbsentReason code \"unsupported' is used. Unsupported bits are optional to report. If a state bit is supported both states shall be reported."
