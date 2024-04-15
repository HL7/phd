Every IEEE 11073-20601 metric instance is required to have a Type attribute. In most cases, the Type attribute value maps directly to the Observation.code element. However, the metric object may contain other attributes which modify or change this value. The following algorithm indicates the procedure an encoder can take to obtain the Observation.code entry:

* set *partition* = Type.partition
* set *termCode* = Type.code
* if there is a Metric-Id attribute:
  * set *termCode* = Metric-Id
  * if there is a Metric-Id-Partition attribute:
    * set *partition* = Metric-Id-Partition
* if there is a Nu-Observed-Value or Enum-Observed-Value
  * set *termCode* = *-Observed-Value.metric
* final 32-bit MDC code: *value* = *partition* * 2<sup>16</sup> + *termCode*

Once this MDC code value is obtained, the Observation.code element is populated as follows:

* if the application wishes to transcode this MDC code into other coding systems the application is free to do so but
  * the MDC code shall be present in a coding element
  * if the code matches one of the [FHIR LOINC magic codes]( https://www.hl7.org/fhir/observation-vitalsigns.html)), the LOINC magic code shall be present in a coding element
  * any other coding translations desired may be placed in an additional coding element.
* for the MDC code the mapping is as follows:
  * Observation.code.coding.code = *value*
  * Observation.code.coding.system = "urn:iso:std:iso:11073:10101"
  * Observation.code.text should contain the reference identifier as part of the text.
  
The requirement for the MDC reference identifier is not mandatory and is not used as the Observation.code.coding.code value because the reference identifier is not provided by the sensor device in the exchange protocol. Requiring the reference identifier would require that the PHG have an internal map. However, the main reason for not requiring the reference identifier is that doing so would defeat future interoperability. An older PHG would not know the reference identifier of a new specialization but it would be able to propagate the new code since that is provided by the device.

The MDC code entry is required, but the concept may be expressed in other coding systems as well. The choice of any additional translations is up to the application. PHGs operating in certain realms may be required to provide translations to a realm-specified coding system. For example, in the United States realm, LOINC is strongly preferred. For those implementing a PHG for operations in the US, a mapping table for MDC to LOINC can be downloaded [here](https://loinc.org/file-access/download-id/9385/). One may freely use this table as needed in an implementation license free.
  
The consumer of FHIR resources containing the PHD data does not need to concern itself with this complexity. All it needs to do is obtain the Observation.code.coding.code element supporting the 11073-10101 system value to get the measurement type.

 - [Next: Obtaining the Unit code](ObtainUnitCode.html)
 - [Previous: FHIR’s Codeable Concepts](CodeableConcepts.html)