### Definition of a Metric Measurement
The 11073 20601 protocol is not only extensible but self-describing. The PHG does not need to know, in advance, anything about the type of measurements the PHD supports. All this information is provided in the protocol exchanges. That exchange may involve the sending of data that is not a measurement, for example the user may change the units on a weight scale from pounds to kilograms. The scale will inform the PHG of this change. If that change is sent without an accompanying weight, the incidence of the change alone makes no sense to send downstream. Consequently, a measurement is only reported if the PHD sends one of twelve attributes in the metric event (called an Observation Scan in 11073-20601 language). These attributes are:

|Measurement Attribute|Description|
|-
|Basic-Nu-Observed-Value|Contains a single number encoded as an Mder SFLOAT|
|Simple-Nu-Observed-Value|Contains a single number encoded as a Mder FLOAT|
|Compound-Basic-Nu-Observed-Value|Contains multiple numbers encoded as Mder SFLOATs|
|Compound-Simple-Nu-Observed-Value|Contains multiple numbers encoded as Mder FLOATs|
|Nu-Observed-Value|Contains single number encoded as an Mder FLOAT along with units and type data|
|Compound Nu-Observed-Value|Contains multiple numbers encoded as an Mder FLOATs with units and type data|
|Simple-Sa-Observed-Value|Contains a sequence of scaled periodic numeric values|
|Enum-Observed-Value-Simple-OID|Contains a measurement that is an MDC code|
|Enum-Observed-Value-Basic-Bit-Str|Contains a measurement that is an ASN1 BITs string in 16-bits|
|Enum-Observed-Value-Simple-Bit-Str|Contains a measurement that is an ASN1 BITs string in 32-bits|
|Enum-Observed-Value-Simple-Str|Contains a measurement that is human-readable string (rare)|
|Enum-Observed-Value|Contains a measurement that is a 32-bit ASN1 BITs, MDC code, or String plus type data|

A metric *measurement* always contains one and only one of the above attributes. If a metric event is sent by the PHD that does NOT contain one of the 12 measurement attributes, the metric event is providing information so the PHG can decode any subsequently sent measurements.

Again, these details are only of concern to the *encoder* of the FHIR resources, the *consumer* of the FHIR resources is not concerned with the types of attributes delivered by the PHD.




