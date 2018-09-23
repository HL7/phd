---
title: Metric Protocol-Only Attributes
layout: default
active: MetricAttributesofNoInterest
---

Protocol-Only attributes are **not** mapped to FHIR.

In the 11073 20601 specification, measurements are mapped to Metric Objects. The Metric Object contains several attributes that are used to describe the measurement such as the Type, Unit-Code, and Simple-Nu-Observed-Value. However, it also contains attributes that are only of interest to the PHG for the purposes of decoding the measurement. For the purposes of optimization on the wire, the PHD only sends attributes that have changed when it sends a measurement. The PHG is expected to retain static and dynamic information. There are also techniques used to efficiently encode the data and tell the PHG how big and in what sense this data may come. To accomplish this encoding the PHD sends keys describing the encoding and the PHG uses these keys to decode the data. These keys are not meant for security purposes but just to minimize data transmission size.

Attributes are also used for these keys. Once the measurement has been reconstructed using these keys and the retained static and dynamic data, the attributes providing these keys are no longer of interest. This guide will refer to these attributes as 'Protocol-Only' attributes.

|Protocol-Only Attribute|Description|
|-
|Handle|Provides the PHG with a key to access the static and dynamic information associated with this metric|
|Metric-Spec-Small|Gives info about the delivery and nature of the metric events|
|Attribute-Value-Map|Provides a means to compact attribute values|
|Metric-Structure-Small|Gives info about the number of entries in compound attributes|
|Capability-Mask-Basic|Inicates which of the 16-bit ASN1 BITs are supported by PHD|
|Capability-Mask-Simple|Inicates which of the 32-bit ASN1 BITs are supported by PHD|
|State-Flag-Basic|Inicates whether the 16-bit ASN1 BITs are a 'state' or an 'event'|
|State-Flag-Simple|Inicates whether the 32-bit ASN1 BITs are a 'state' or an 'event'|

The last four attributes are essential for the decoder to properly map ASN1 BITS measurements to FHIR using the ASN1 coding system but the attributes themselves are not of interest once mapped. For example, the Capability-Mask-* attribute tells which bits are supported by the PHD. The encoder needs to know which bits these are but once known, the attribute value itself is no longer of interest. The State-Flag-* indicates to the decoder whether the bit is an event or a state. If an event, only the set case (event occurred) needs to be recorded, for example, 'sensor malfunctioned' in the sensor status measurement of several specializations. If a 'state' both the set or cleared case needs to be reported, for example 'patient in room' or 'patient not in room' in the independent living case.





