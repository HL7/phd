Profile: PhdCoincidentTimeStampObservation
Parent: Observation
Id: PhdCoincidentTimeStampObservation
Description: "Observations containing a coincident timestamp."
* ^meta.lastUpdated = "2017-12-14T09:41:34.341-05:00"
* ^url = "http://hl7.org/fhir/uv/phd/StructureDefinition/PhdCoincidentTimeStampObservation"
// * ^status = #draft
* ^date = "2017-06-02T14:29:52.39367-04:00"
* . ^definition = "The PhdCoincidentTimeStampObservation reports the current time of the PHD sensor at the current time of the PHG."
* . ^comment = "Used to record the correction the PHG applied to the PHD measurement timestamps (if any) and to be able to recover the original timestamps reported by the PHD should that be needed."
* status = #final (exactly)
* status ^extension.url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-display-hint"
* status ^extension.valueString = "default: final"
* status ^definition = "The status of the result value. Always 'final'"
* status ^comment = "The value shall be set to 'final'"
* code.coding ^slicing.discriminator.type = #value
* code.coding ^slicing.discriminator.path = "system"
* code.coding ^slicing.rules = #open
* code.coding contains MDCType 1..1
* code.coding[MDCType] ^short = "The required MDC code for the type of time clock used by the PHD"
* code.coding[MDCType] ^comment = "PHDs use one of absolute time, base offset time, relative time, or high resolution relative time."
* code.coding[MDCType].system 1..
* code.coding[MDCType].system = "urn:iso:std:iso:11073:10101" (exactly)
* code.coding[MDCType].code 1..
* code.coding[MDCType].code ^comment = "The code for absolute time is 67975 with reference id MDC_ATTR_TIME_ABS, for base offset time is 68226 with reference id MDC_ATTR_TIME_BO, for relative time is 67983 with reference id MDC_ATTR_TIME_REL, and for high resolution relative time is 68072 with reference id MDC_ATTR_TIME_REL_HI_RES."
* subject 1..
* subject.reference 1..
* subject only Reference(PhdDevice)
  * ^short = "Reference to the PHD device for which the coincident timestamp measurement is reported"
  * ^definition = "Reference to the PHD device for which the coincident timestamp measurement is reported. This element will point to a Device resource following the Phd Device Profile."
* effective[x] ^short = "The current time of the PHG at the current time of the PHD. Absent if PHD is better synchronized"
* effective[x] ^definition = "The time of the PHG at the time the current time of the PHD is ascertained."
* effective[x] ^comment = "This element is absent if the PHD has superior time synchronization relative to the PHG. Wnen this element is absent it indicates that the PHG reported the measurement timestamps of the PHD without modification."
* value[x] only dateTime or Quantity
* value[x] ^short = "The current time of the PHD as a wallclock time (dateTime), relative time (Quantity), or if a time fault a dataAbsentReason"
* value[x] ^definition = "The current time of the PHD. It will be either a valueDateTime if a wallclock time or a valueQuantity if a relative time or a dataAbsentReason if there is a time fault. The relative time is expressed in microseconds"
* dataAbsentReason ^short = "Populated when the PHD has a time fault"
* dataAbsentReason ^definition = "In this profile this element indicates that the current time of the PHD for the measurements reported is not known and is unable to be obtained"
* dataAbsentReason ^comment = "This situation arises when the PHD has a time fault, perhaps by battery change. The sensor device may have stored data with timestamps taken at a time when the clock was running but after the fault the original timeline was not able to be recovered. Thus the current timeline, if any, has an unknown relationship to the previous timeline."
* dataAbsentReason.coding ^slicing.discriminator.type = #value
* dataAbsentReason.coding ^slicing.discriminator.path = "code"
* dataAbsentReason.coding ^slicing.rules = #open
* dataAbsentReason.coding contains FhirDefault 1..1
* dataAbsentReason.coding[FhirDefault].code from http://hl7.org/fhir/ValueSet/data-absent-reason (required)
* dataAbsentReason.coding[FhirDefault].code 1..
* dataAbsentReason.coding[FhirDefault].code = #unknown (exactly)
* device 1..
* device only Reference(PhgDevice)
  * ^comment = "This field will reference the PHG Device."
  * reference 1..1
    * ^short = "Reference to the PHG device responsible for the coincident timestamp measurement"
    * ^definition = "Reference to the PHG device responsible for the coincident timestamp measurement. This element will point to a Device resource following the Phg Device Profile."
