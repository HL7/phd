In this guide there will be several instances where the 11073 10101 nomenclature (MDC) codes are mapped to FHIR. In almost all cases this mapping involves an element that is a CodeableConcepts data type. The mapping is as follows:

 - CodeableConcept.coding.code = *partition* * 2<sup>16</sup> + *term code*
 - CodeableConcept.coding.system = urn:iso:std:iso:11073:10101
 - CodeableConcept.text = reference identifier (*optional*)

The reference identifier in the text element is optional since the uploader may not know what the code means; for example, if the uploader works with a PHD specialization developed after the uploader had been released. However, this guide strongly encourages that the text element contains at least the normative reference identifier for the MDC code if it is known.

The text element itself is also optional for future compatibility. Any text element entry requires that the uploader have some previous knowledge of the code as display information is not provided by protocol.

The text element is also used instead of the coding.display element since the latter has restrictions based upon the code system. The information in the display element must come from the code system itself, and in the case of the MDC code system only the reference identifier is defined for all codes. Consequently for this implementation guide to avoid conflicts it is suggested that the text element be populated with *"reference identifier: optional additional implementation-defined text describing the code which may be in the local language*". For example, "MDC_CTXT_GLU_MEAL: Meal associated with measurement".

 - [Next: Obtaining the Observation.code](ObtainObservationCode.html)
 - [Previous: Nomenclature Codes](Nomenclaturecodes.html)