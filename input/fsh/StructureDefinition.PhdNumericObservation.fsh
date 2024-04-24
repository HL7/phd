Alias: $CodeableConcept11073MDC = http://hl7.org/fhir/uv/phd/ValueSet/CodeableConcept11073MDC
Alias: $Quantity11073MDC = http://hl7.org/fhir/uv/phd/ValueSet/Quantity11073MDC
Alias: $ASN1attribute = http://hl7.org/fhir/uv/phd/ValueSet/ASN1attribute
Alias: $Range11073MDC = http://hl7.org/fhir/uv/phd/ValueSet/Range11073MDC
Alias: $String11073MDC = http://hl7.org/fhir/uv/phd/ValueSet/String11073MDC

Profile: PhdNumericObservation
Parent: PhdBaseObservation
Id: PhdNumericObservation
Description: "StructureDefinition for Observation Resources representing measurement data coming from a medical device where the measurement is number."
* ^meta.lastUpdated = "2017-12-14T04:43:57.173-05:00"
* ^extension.url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-wg"
* ^extension.valueCode = #oo
* ^url = "http://hl7.org/fhir/uv/phd/StructureDefinition/PhdNumericObservation"
* ^status = #draft
* ^date = "2017-06-02T14:29:52.39367-04:00"
* . ^short = "Simple Numeric measurement"
  * ^definition = "The PhdNumericObservation reports PHD measurements that contain one of either a Basic-Nu-Observed-Value, Simple-Nu_observed-Value, or Nu_observed-Value attribute."
  * ^comment = "Used for non-compound numeric observations from Personal Health Devices."
* meta
  * profile
    * ^slicing.discriminator[0].type = #value
    * ^slicing.discriminator[=].path = "value"
    * ^slicing.rules = #open
  * profile contains phdProfile 0..1
  * profile[phdProfile] = "http://hl7.org/fhir/uv/phd/StructureDefinition/PhdNumericObservation" (exactly)
    * ^comment = "Uploaders should include this element to ease validation by the receiver."
* category
  * ^slicing.discriminator[0].type = #value
  * ^slicing.discriminator[=].path = "coding.code"
  * ^slicing.discriminator[+].type = #value
  * ^slicing.discriminator[=].path = "coding.system"
  * ^slicing.ordered = false
  * ^slicing.rules = #open
* category contains VSCat 0..1
* category[VSCat].coding 1..
  * system 1..
  * system = "http://terminology.hl7.org/CodeSystem/observation-category" (exactly)
  * code 1..
  * code = #vital-signs (exactly)
* value[x] only Quantity
  * value 1..
    * ^definition = "The decoded Mder FLOAT or SFLOAT value from a PHD measurement containing either a\r\nBasic-Nu-Observed-Value\r\nSimple-Nu-Observed-Value or\r\nNu_observed-Value attribute."
    * ^comment = "The implicit precision in the value shall be honored. The Mder encoding used in the above attributes provides this precision. The translating software shall honor that precision when generating this value.\r\nThis element shall be present unless there is an error reported in the Measurement-Status attribute or the Nu-Observed-Value.status field or the Mder encoding represents one of the special values. In that case there is a dataAbsentReason element and the valueQuantity element is not present. Note that not all measurement status values are errors resulting in no measurement being reported here; for example the preliminary or verified status."
  * system 1..
  * system = "http://unitsofmeasure.org" (exactly)
  * code 1..
    * ^short = "The UCUM code for the units of this measurement."
    * ^comment = "The UCUM code needs to be translated from  the 11073-10101 code from the device. This translation means that the reporting of units is not future proof."
* dataAbsentReason ^short = "Populated when a special value occurs or Measurement-Status indicates invalid, not unavailable, or msmt ongoing"
  * ^definition = "Provides a reason why the expected value in the element Observation.valueQuantity is missing. This could be a 'not-a-number', 'positive-infinity', 'negative-infinity' or an error condition indicated by the Measurement-Status attribute or the status field from a Nu-Observed-Value attribute."
  * ^comment = "The current values in the http://terminology.hl7.org/CodeSystem/data-absent-reason system do not provide a code that matches the special values 'not at this resolution' and 'reserved'. In those cases one uses the generic 'error' code. If both a special value and a Measurement-Status indicating invalid, not unavailable, or msmt ongoing are received, the Measurement-Status mapping takes precedence."
  * coding ^slicing.discriminator[0].type = #value
    * ^slicing.discriminator[=].path = "system"
    * ^slicing.rules = #open
  * coding contains FhirDefault 1..1
  * coding[FhirDefault]
    * system 1..
    * system = "http://terminology.hl7.org/CodeSystem/data-absent-reason" (exactly)
    * code 1..
* component contains
    accuracyComponent 0..1 and
    alertOpStateComponent 0..* and
    currentLimitsComponent 0..1 and
    alertOpTextStringComponent 0..1 and
    measurementConfidence95Component 0..1 and
    thresholdNotificationTextStringComponent 0..1
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
  * valueQuantity 1..1
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
* component[alertOpStateComponent] ^short = "The Alert Operations State component"
  * ^definition = "This component gives one of the settings reported in the Alert-Op-State attribute. This attribute is used only by the Pulse Oximeter specialization.\r\nThe Alert-Op-State attribute is used in conjunction with the Current-Limits and Measurement-Status attributes. The Current-Limits defines upper and lower limit thresholds for a reported measurement value. When the reported measurement value goes below or above these limits, a bit is set in the Measurement-Status attribute is set if the Alert-Op-State attribute indicates that the alert is active for the given threshold. Since it is considered important that if a Current-Limits attribute is present an alert shall be sent went the thresholds are crossed, the Alert-Op-State Bits are only set when the alert is, for some reason, turned OFF for a given threshold.\r\nThere shall be one such alertOpStateComponent entry for every bit set in the Alert-Op-State attribute. There may be an entry for the defined cleared components as well."
  * ^comment = "Recall that when creating the code for this entry that the code uses the MDER-Bit setting to be reported along with the Alert-Op-State attribute's MDC code. MDER-Bit 0 is the most significant bit of the attribute value. Since the Alert-Op-State attribute is a BITS-16 value, MDER-Bit 0 would have value 0x8000 and MDER-Bit 1 would have value 0x4000. Only bits 0, 1, and 2 are defined for this attribute. This component indicates if a given alert condition monitoring is turned off."
  * code from $ASN1attribute (required)
    * coding 1..1
      * ^short = "Only the ASN1 to HL7 coding for this item."
      * ^comment = "Normally alternative coding systems are allowed but in this case the value is intimately tied to the code. The code represents the feature indicated by a bit setting in the attribute value. which is either cleared (0) or set (1). Thus the value for this entry is itself a binary 'Y' or 'N' code from http://terminology.hl7.org/CodeSystem/v2-0203"
      * system 1..
      * system = "http://hl7.org/fhir/uv/phd/CodeSystem/ASN1ToHL7" (exactly)
      * code 1..
        * ^definition = "This code, which is an alpha-numeric string, is generated by the attribute MDC code, which is 68746 for the Alert-Op-State, followed by a dot (.) followed by the MDER-bit that was set. Given that only three bits are defined in the Pulse Ox specialization that uses this attribute, the code will be one of 68746.0, 68746.1, or 68746.2"
        * ^comment = "Note that this code is an alpha-numeric string and not a decimal number. Think of it like a very-limited OID."
  * value[x] 1..
  * value[x] only CodeableConcept
    * coding 1..
      * ^slicing.discriminator[0].type = #value
      * ^slicing.discriminator[=].path = "system"
      * ^slicing.rules = #open
    * coding contains V2Binary 1..1
    * coding[V2Binary] ^short = "The required Version 2 Table 0136 Binary code entry"
      * system 1..
      * system = "http://terminology.hl7.org/CodeSystem/v2-0203" (exactly)
        * ^definition = "This coding system contains only two entries, 'Y' (bit set) and 'N' (bit cleared)"
      * code 1..
        * ^definition = "If the MDER-Bit is set, the code value is 'Y' otherwise it is 'N'. These are 'state' bits thus both the set and cleared states are reported."
        * ^comment = "Recall that when the value is 'Y' the alarm or alert is turned off"
  * dataAbsentReason ..0
* component[currentLimitsComponent] ^short = "The Current-Limits values"
  * ^definition = "The Current-Limits attribute gives upper and lower threshold values for the triggering of an alert for the measured value being reported in this Observation resource. This attribute is currently used only in the Pulse Oximeter specialization. If the alerting is not turned off, a Measurement-Status attribute bit is set when either threshold is crossed. The Current-Limits attribute value shall be reported if it is present in the measurement."
  * ^comment = "The value is expressed as a range. The lower and upper values of the range represent the thresholds."
  * ^requirements = "Allows the downstream signaling of an alert and/or warning situation."
  * code from $Range11073MDC (required)
    * coding 1..
      * ^slicing.discriminator[0].type = #value
      * ^slicing.discriminator[=].path = "system"
      * ^slicing.rules = #open
    * coding contains MdcType 1..1
    * coding[MdcType] ^short = "The 11073-10101 MDC code for the measurement"
      * system 1..
      * system = "urn:iso:std:iso:11073:10101" (exactly)
        * ^definition = "Indicates the MDC coding system"
        * ^comment = "The code is that of the Current-Limits attribute"
      * code 1..
      * code = #67892 (exactly)
        * ^definition = "Shall be the code of the Current-Limits attribute."
    * text ^definition = "Should include the reference id for the Current-Limits attribute which is MDC_ATTR_LIMIT_CURR"
  * value[x] only Range
    * low 1..
      * value 1..
        * ^definition = "This value is given by Current-Limits.lower as an MDER-FLOAT and shall be expressed in the precision indicated by the MDER-FLOAT construct."
        * ^comment = "This gives the lower threshold. If the measurement falls below this value, the Measurement-Status attribute is sent with a bit stating the alert is present (if the alerts are not turned off for the lower limits)."
      * system 1..
      * system = "http://unitsofmeasure.org" (exactly)
        * ^definition = "Indicates the UCUM coding system."
      * code 1..
        * ^definition = "This code (which is the code for the units) shall be the same as Observation.valueQuantity.code"
        * ^comment = "The MDC units are translated to UCUM."
    * high 1..
      * ^comment = "The high limit shall be present"
      * value 1..
        * ^definition = "This value is given by Current-Limits.upper as an MDER-FLOAT and shall be expressed in the precision indicated by the MDER-FLOAT construct."
        * ^comment = "This gives the upper threshold. If the measurement goes above this value, the Measurement-Status attribute is sent with a bit stating the alert is present (if the alerts are not turned off for the upper limits)."
      * system 1..
      * system = "http://unitsofmeasure.org" (exactly)
        * ^definition = "Indicates the MDC coding system."
      * code 1..
        * ^definition = "This code (which is the code for the units) shall be the same as Observation.valueQuantity.code"
        * ^comment = "The MDC units are translated to UCUM."
  * dataAbsentReason ..0
* component[alertOpTextStringComponent] ^short = "The Alert-Op-Text human readable strings"
  * ^definition = "This component reports the values in the Alert-Op-Text-String attribute."
  * ^comment = "This attribute consists of human readable strings giving further information about the upper and lower limits of the Alerts"
  * code from $String11073MDC (required)
    * coding 1..
      * ^slicing.discriminator[0].type = #value
      * ^slicing.discriminator[=].path = "system"
      * ^slicing.rules = #open
    * coding contains MdcType 1..1
    * coding[MdcType] ^short = "The 11073-10101 MDC code for the measurement"
      * system 1..
      * system = "urn:iso:std:iso:11073:10101" (exactly)
      * code 1..
      * code = #68104 (exactly)
        * ^definition = "The MDC code for the Alert-Op-Text-String attribute"
    * text ^definition = "The reference identifier for the attribute should be included. The Alert-Op-Text-String attribute ref id is MDC_ATTR_AL_OP_TEXT_STRING"
  * value[x] 1..
  * valueString 1..1
  * valueString only string
    * ^sliceName = "valueString"
    * value 1..
      * ^definition = "This is the value of the lower and upper text strings presented in an application specific manner."
  * dataAbsentReason ..0
* component[measurementConfidence95Component] ^short = "The Measurement-Confidence-95 range"
  * ^definition = "The Measurement-Confidence-95 attribute defines the lower and upper bounds for a range within which the manufacture is 95% confident that the actual value resides. The unit for the lower bound and upper bound is the same as the measurement. "
  * code from $Range11073MDC (required)
    * coding 1..
      * ^slicing.discriminator[0].type = #value
      * ^slicing.discriminator[=].path = "system"
      * ^slicing.rules = #open
    * coding contains MdcType 1..1
    * coding[MdcType] ^short = "The 11073-10101 MDC code for the measurement"
      * system 1..
      * system = "urn:iso:std:iso:11073:10101" (exactly)
        * ^definition = "Indicates the MDC coding system"
        * ^comment = "The code is that of the Current-Limits attribute"
      * code 1..
      * code = #68236 (exactly)
        * ^definition = "Shall be the code of the Current-Limits attribute."
    * text ^definition = "Should include the reference id for the Current-Limits attribute which is MDC_ATTR_MSMT_CONFIDENCE_95"
  * value[x] 1..
  * value[x] only Range
    * low 1..
      * value 1..
        * ^definition = "Thsi value is given by Measurement-Confidence-95.lower-bound as an MDER-FLOAT and shall be expressed in the precision indicated by the MDER-FLOAT construct."
        * ^comment = "This gives the lower bound of the range for which the manufacturer is 95% confident that the measurement reported lies in."
      * system 1..
      * system = "http://unitsofmeasure.org" (exactly)
        * ^definition = "Indicates the UCUM coding system."
      * code 1..
        * ^definition = "This code (which is the code for the units) shall be the same as Observation.valueQuantity.code"
        * ^comment = "The MDC units are translated to UCUM."
    * high 1..
      * ^comment = "The high limit shall be present"
      * value 1..
        * ^definition = "This value is given by Measurement-Confidence-95.upper-bound as an MDER-FLOAT and shall be expressed in the precision indicated by the MDER-FLOAT construct."
        * ^comment = "This gives the upper bound of the range for which the manufacturer is 95% confident that the measurement reported lies in."
      * system 1..
      * system = "http://unitsofmeasure.org" (exactly)
        * ^definition = "Indicates the UCUM coding system."
      * code 1..
        * ^definition = "This code (which is the code for the units) shall be the same as Observation.valueQuantity.code"
        * ^comment = "The MDC units are translated to UCUM."
  * dataAbsentReason ..0
* component[thresholdNotificationTextStringComponent] ^short = "The Threshold-Notification-Text-String attribute value entry"
  * ^definition = "This component reports the values in the Threshold-Notification-Text-String attribute. This attribute is a human readable string describing the threshold met condition."
  * ^comment = "This attribute consists of human readable strings giving further information threshold notification(s)"
  * code from $String11073MDC (required)
    * coding 1..
      * ^slicing.discriminator[0].type = #value
      * ^slicing.discriminator[=].path = "system"
      * ^slicing.rules = #open
    * coding contains MdcType 1..1
    * coding[MdcType] ^short = "The 11073-10101 MDC code for the measurement"
      * system 1..
      * system = "urn:iso:std:iso:11073:10101" (exactly)
      * code 1..
      * code = #68232 (exactly)
        * ^definition = "The MDC code for the Threshold-Notification-Text-String attribute"
    * text ^definition = "The reference identifier for the attribute should be included. The Threshold-Notification-Text-String attribute ref id is MDC_ATTR_THRES_NOTIF_TEXT_STRING"
  * value[x] 1..
  * valueString 1..1
  * valueString only string
    * ^sliceName = "valueString"
    * value 1..
      * ^definition = "This is the value of the text string."
  * dataAbsentReason ..0