Profile: PhdCoincidentTimeStampObservation
Parent: Observation
Id: PhdCoincidentTimeStampObservation
Description: "Observations containing a coincident timestamp."
* ^meta.lastUpdated = "2017-12-14T09:41:34.341-05:00"
* ^url = "http://hl7.org/fhir/uv/phd/StructureDefinition/PhdCoincidentTimeStampObservation"
* ^status = #active
* ^date = "2017-06-02T14:29:52.39367-04:00"
* . ^definition = "The PhdCoincidentTimeStampObservation reports the current time of the PHD sensor at the current time of the PHG."
* . ^comment = "Used to record the correction the PHG applied to the PHD measurement timestamps (if any) and to be able to recover the original timestamps reported by the PHD should that be needed."
* status = #final
* status ^extension.url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-display-hint"
* status ^extension.valueString = "default: final"
* status ^definition = "The status of the result value. Always 'final'"
* status ^comment = "The value shall be set to 'final'"
* code.coding ^slicing.discriminator.type = #value
* code.coding ^slicing.discriminator.path = "$this"
* code.coding ^slicing.rules = #open
* code.coding contains MDCType 1..1
* code.coding[MDCType] 
  * ^short = "The type of time clock used by the PHD"
* code.coding[MDCType] from http://hl7.org/fhir/uv/phd/ValueSet/MDCClockTypes (required)
  * ^binding.description = "MDC codes for PHD clock types"
  // * ^binding.additional.purpose = #required  
  // * ^binding.additional.key = PHD-MDC-CLOCK-TYPE 
* subject 1..
* subject.reference 1..
* subject only Reference(PhdDevice)
  * ^short = "Reference to the PHD device for which the coincident timestamp measurement is reported"
  * ^definition = "Reference to the PHD device for which the coincident timestamp measurement is reported. This element will point to a Device resource following the Phd Device Profile."
* effective[x] ^short = "The current time of the PHG at the current time of the PHD. Absent if PHD is better synchronized"
* effective[x] ^definition = "The time of the PHG at the time the current time of the PHD is ascertained."
* effective[x] ^comment = "This element is absent if the PHD has superior time synchronization relative to the PHG. When this element is absent it indicates that the PHG reported the measurement timestamps of the PHD without modification."
* value[x] only dateTime or Quantity
* value[x] ^short = "The current time of the PHD as a wallclock time (dateTime), relative time (Quantity), or if a time fault a dataAbsentReason"
* value[x] ^definition = "The current time of the PHD. It will be either a `valueDateTime` if a wallclock time or a `valueQuantity` if a relative time or a `dataAbsentReason` if there is a time fault. The relative time is expressed in microseconds"
* dataAbsentReason.coding ^slicing.discriminator.type = #value
* dataAbsentReason.coding ^slicing.discriminator.path = "$this"
* dataAbsentReason.coding ^slicing.rules = #open
* dataAbsentReason.coding contains TimeFault 0..1
* dataAbsentReason.coding[TimeFault] 
  * ^short = "Time Fault: The PHD has a time fault"
  * ^definition = "This element is populated when the PHD has a time fault and the current time of the PHD cannot be obtained."
  * ^patternCoding = http://terminology.hl7.org/CodeSystem/data-absent-reason#unknown

* component ^slicing.discriminator[0].type = #value
  * ^slicing.discriminator[=].path = "code"
  * ^slicing.rules = #open
* component contains clockSyncMethod 0..1
* component[clockSyncMethod] ^short = "Clock Synchronization Method: The method used to synchronize the clock."
  * ^definition = "The method used to synchronize the clock of the PHD. This element is populated if the PHD supports clock synchronization."
  * ^comment = "Clock synchronization methods may include NTP, PTP, or other mechanisms."
  * code = Mdc#68220 // MDC_TIME_SYNC_PROTOCOL
  * valueCodeableConcept from http://hl7.org/fhir/uv/phd/ValueSet/MDCTimeSyncMethods (extensible)
    * ^short = "The clock synchronization method last used by the PHD/PHG to synchronize the clock of the PHD"
  * dataAbsentReason ..0
* device 1..
* device only Reference(PhgDevice)
  * ^comment = "This field will reference the PHG Device."
  * reference 1..1
    * ^short = "Reference to the PHG device responsible for the coincident timestamp measurement"
    * ^definition = "Reference to the PHG device responsible for the coincident timestamp measurement. This element will point to a Device resource following the Phg Device Profile."
* derivedFrom 0..0
  * ^short = "No reference to a source observation in PHD. The coincident timestamp is not derived from another observation."
  * ^definition = "This element is not used in PHD as the coincident timestamp is not derived from another observation."
* hasMember 0..0
  * ^short = "No reference to a group observation in PHD. The coincident timestamp is not part of a group observation."
  * ^definition = "This element is not used in PHD as the coincident timestamp is not part of a group observation."
* specimen 0..0
  * ^short = "No specimen in PHD. The coincident timestamp is not associated with a specimen."
  * ^definition = "This element is not used in PHD as the coincident timestamp is not associated with a specimen."
* focus 0..0
  * ^short = "No focus in PHD. The coincident timestamp is not associated with a focus."
  * ^definition = "This element is not used in PHD as the coincident timestamp is not associated with a focus."
