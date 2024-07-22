Profile: PhdCoincidentTimeStampObservation
Parent: Observation
Id: PhdCoincidentTimeStampObservation
Description: "StructureDefinition for Observation Resources representing the coincident time stamp. This report is a measurement of the current time of the sensor at the current time of the PHG. The purpose of this observation is to record the difference in the time lines between the PHG and PHD and to be able to recover the original measurement time stamps reported by the PHD should the PHG correct them because the sensor clock is in error."
* ^meta.lastUpdated = "2017-12-14T09:41:34.341-05:00"
* ^url = "http://hl7.org/fhir/uv/phd/StructureDefinition/PhdCoincidentTimeStampObservation"
* ^status = #draft
* ^date = "2017-06-02T14:29:52.39367-04:00"
* . ^definition = "The PhdCoincidentTimeStampObservation reports the current time of the PHD sensor at the current time of the PHG."
* . ^comment = "Used to record the correction the PHG applied to the PHD measurement time stamps (if any) and to be able to recover the original time stamps reported by the PHD should that be needed."
* extension 1..1
* extension ^short = "Extension for the PHG"
* extension.url = "http://hl7.org/fhir/StructureDefinition/observation-gatewayDevice" (exactly)
* extension.url ^short = "Url indicating this is the gateway device extension"
* extension.value[x] 1..
* extension.value[x] only Reference
* extension.value[x] ^short = "Reference to the Personal Health Gateway (PHG) Device"
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
* effective[x] ^short = "The current time of the PHG at the current time of the PHD. Absent if PHD is better synchronized"
* effective[x] ^definition = "The time of the PHG at the time the current time of the PHD is ascertained."
* effective[x] ^comment = "This element is absent if the PHD has superior time synchronization relative to the PHG. Wnen this element is absent it indicates that the PHG reported the measurement time stamps of the PHD without modification."
* value[x] only dateTime or Quantity
* value[x] ^short = "The current time of the PHD as a wallclock time (dateTime), relative time (Quantity), or if a time fault a dataAbsentReason"
* value[x] ^definition = "The current time of the PHD. It will be either a valueDateTime if a wallclock time or a valueQuantity if a relative time or a dataAbsentReason if there is a time fault. The relative time is expressed in microseconds"
* dataAbsentReason ^short = "Populated when the PHD has a time fault"
* dataAbsentReason ^definition = "In this profile this element indicates that the current time of the PHD for the measurements reported is not known and is unable to be obtained"
* dataAbsentReason ^comment = "This situation arises when the PHD has a time fault, perhaps by battery change. The sensor device may have stored data with time stamps taken at a time when the clock was running but after the fault the original time line was not able to be recovered. Thus the current time line, if any, has an unknown relationship to the previous time line."
* dataAbsentReason.coding ^slicing.discriminator.type = #value
* dataAbsentReason.coding ^slicing.discriminator.path = "system"
* dataAbsentReason.coding ^slicing.rules = #open
* dataAbsentReason.coding contains FhirDefault 1..1
* dataAbsentReason.coding[FhirDefault].system 1..
* dataAbsentReason.coding[FhirDefault].system = "http://terminology.hl7.org/CodeSystem/data-absent-reason" (exactly)
* dataAbsentReason.coding[FhirDefault].code 1..
* dataAbsentReason.coding[FhirDefault].code = #unknown (exactly)
* device 1..
* device ^comment = "This field references the PHD Device"
* device.reference 1..
* device.reference ^short = "Reference to the device responsible for the measurement"
* device.reference ^definition = "Reference to the device resources that describes the sensor device taking the measurement."
* device.reference ^comment = "This reference points to the Device resource containing information about the sensor device that took the measurement."
