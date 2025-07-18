In this guide there will be several instances where the IEEE 11073-10101 nomenclature (MDC) codes are mapped to FHIR. In almost all cases this mapping involves an element that is a `CodeableConcepts` data type. The mapping is as follows:

 - `CodeableConcept.coding.code` = *partition* * 2<sup>16</sup> + *term code*
 - `CodeableConcept.coding.system` = urn:iso:std:iso:11073:10101
 - `CodeableConcept.display` = reference identifier (*optional*)

The reference identifier in the display element is optional since the uploader may not know what the code means; for example, if the uploader works with a PHD specialization developed after the uploader had been released. However, this guide encourages that the display element contains at least the reference identifier for the MDC code if it is known.

The display element itself is also optional for future compatibility. Any display element entry requires that the uploader have previous knowledge of the code as display information is not provided by protocol.

The `text` element can also used to provide additional information about the used code.  An option is that the `text` element is populated with the reference identifier followed by additional implementation-defined text describing the code which may be in the local language. For example, `"MDC_CTXT_GLU_MEAL: Meal associated with measurement"`.
