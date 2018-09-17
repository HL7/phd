### Obtaining the Observation.code
Every 11073 20601 metric instance is required to have a Type attribute. In most cases, the Type attribute value maps directly to the Observation.code element. However, the metric object may contain other attributes which modify or change this value. The following algorithm indicates the procedure an encoder can take to obtain the Observation.code entry:

* set *partition* = Type.partition
* set *termCode* = Type.code
* if there is a Metric-Id attribute:
  * set *termCode* = Metric-Id
  * if there is a Metric-Id-Partition attribute:
    * set *partition* = Metric-Id-Partition
* if there is a Nu-Observed-Value or Enum-Observed-Value
  * set *termCode* = *-Observed-Value.metric
* final 32-bit MDC code: *value* = *partition* * 2<sup>16</sup> + *termCode*

Once this MDC code value is obtained the Observation.code element is populated as follows:

* if the application wishes to transcode this MDC code into other coding systems the application is free to do so but
  * the MDC code shall be in the first Observation.code.coding element
  * if the code matches one of the FHIR LOINC magic codes, the LOINC magic code shall be in the second Observation.code.coding element
  * any other coding translations desired are placed in subsequent Observation.code.coding elements.
* for the MDC code the mapping is as follows:
  * Observation.code.coding.code = *value*
  * Observation.code.coding.system = "urn:iso:std:iso:11073:10101"
  * Observation.code.display should contain the reference identifier as part of the text.
  
The requirement for the MDC reference identifier is not mandatory and not used as the Observation.code.coding.code value because the reference identifier is not provided by the sensor device in the exchange protocol. Requiring the reference identifier would require that the PHG have an internal map. However, the main reason for not requiring the reference identifier is that doing so would defeat future interoperability. An older PHG would not know the reference identifier of a new specialization.
  
The consumer of PHD data does not need to concern itself with this complexity. All it needs to do is obtain the first Observation.code.coding.code element to ge the measurement type.