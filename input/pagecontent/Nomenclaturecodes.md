IEEE 11073-10101 uses nomenclature codes to represent an entity that needs to be machine readable such as a type or what the measurement is. Nomenclature codes are 32-bit unsigned integers. The most significant 16 bits give the *partition* and the least significant 16 bits give the *term code*. Partitions group the term codes into sets with a common meaning. For example, in PHD there is a health and fitness partition which groups terms associated with health and fitness, such as term codes for activities like run, bike, swim, altitude gained, distance, etc.

Associated with each 32-bit code is a reference identifier. The reference identifier is a 'semi-' human readable string such as MDC_ECG_HEART_RATE which is easier for the human reader to understand than the associated nomenclature code 147842. However, these reference identifiers are typically not provided by a PHD. Consequently, this guide does not require the encoder to include them in the FHIR mapping though it is encouraged. A second reason reference identifiers are not required is that is not possible for the encoder to send them if it encounters data from future PHDs using codes it does not know. The new codes can still be mapped to FHIR, but the reference identifiers require the encoder to have an internal map. Not requiring the reference identifiers allows the encoder to work with these future PHDs. Supporting future compatibility is one of the reasons this guide uses a generic mapping approach.

In FHIR, the 32-bit value of the code is always used. If in the PHD to PHG exchange sometimes a 16-bit code is used when the partition can be inferred from the attribute to decrease bandwidth. In these situations the encoder must convert the 16-bit value to the appropriate 32-bit value.

The set of nomenclature codes is extensive, but it is segmented by partitions. Many of the codes used in the PHD measurement types and measurement values (when codes) come from the SCADA, INFRA, SITES, PHD_DM, PHD_HF, and PHD_AI partitions. This guide does not restrict the codes to come from only those partitions for future compatibility reasons. New partitions could be added and those codes could be used in future PHD specializations. Since the codes are provided by the PHD, the uploader does not need to maintain a code dictionary unless it wants to include the reference identifier or display text about the code. If this guide were to restrict the allowable codes to a given set of partitions, that restriction would prevent an older implementation from working with future devices when it otherwise could have worked with the device. It is clear, however, that any consumer and interpreter of the uploaded information *would* need to know about the new codes.

#### Unit codes
IEEE 11073-10206 ACOM unit codes are MDC codes from partition 4 of IEEE 11073-10101. HL7 and IHE favor the use of UCUM for units. This guide requires IEEE 11073-10101 nomenclature codes for units to be mapped to the equivalent UCUM code. A mapping can be found in the [RTMMS](https://rtmms.nist.gov/) and in the latest version of IEEE 11073-10101. 

If the rare situation arises where a new unit has been introduced or the PHD uses a unit code that has not been previously used in PHD specializations, the FHIR encoder may use the MDC code in place of the UCUM code. This allows the encoder to work with future PHDs without requiring an update to the encoder.

#### Mapping to FHIR
The IEEE 11073-10101 nomenclature codes are mapped to FHIR using the `CodeableConcept` data type. The mapping is as follows:
 - `CodeableConcept.coding.code` = MDC code (decimal value)
 - `CodeableConcept.coding.system` = urn:iso:std:iso:11073:10101
 - `CodeableConcept.coding.display` = reference identifier (*optional*)
 - `CodeableConcept.text` = additional information about the code (*optional*)

The reference identifier in the `display` element is optional since the uploader may not know what the code means; for example, if the uploader works with a PHD specialization developed after the uploader had been released. However, this guide encourages that the `display` element contains at least the reference identifier for the MDC code if it is known.

The `display` element itself is also optional for future compatibility. Any `display` element entry requires that the uploader have previous knowledge of the code as display information is not provided by protocol.

The `text` element can also used to provide additional information about the used code.  An option is that the `text` element is populated with the reference identifier followed by additional implementation-defined text describing the code which may be in the local language. For example, `"MDC_CTXT_GLU_MEAL: Meal associated with measurement"`.

#### Observation codes
Every IEEE 11073-10206 ACOM Observation instance is required to have a Type attribute. The Type attribute value is an MDC term code that maps directly to the `Observation.code` element which is a `CodeableConcept`. 
This means, following the mapping above, that the `Observation.code` element is populated as follows:
  * `Observation.code.coding.code` = *code value*
  * `Observation.code.coding.system` = "urn:iso:std:iso:11073:10101"
  * `Observation.code.coding.display` optional
  * `Observation.code.text` optional

If the code matches one of the [FHIR observation-vitalsigns codes]({{ site.data.fhir.path }}observation-vitalsigns.html), the corresponding LOINC code shall be present in an additional coding element.

If the application wishes to transcode the MDC code into other coding systems the application is free to do so but:
  * the MDC code shall be present in a coding element,
  * any other codings may be placed in an additional coding element.

PHGs operating in certain realms may be required to provide translations to a realm-specified coding system. For example, in the United States realm, LOINC is preferred. [RTMMS](https://rtmms.nist.gov/) contains a mapping to LOINC for a subset of the MDC codes.

#### Additional information
More information describing the use of the MDC coding system in HL7 standards can be found [here](https://terminology.hl7.org/MDC.html)

