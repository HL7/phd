The IEEE 11073-20601 protocol is not only extensible but self-describing. The PHG does not need to know, in advance, anything about the type of measurements the PHD supports. All this information is provided in the protocol exchanges. That exchange may involve the sending of data that is not a measurement. For example the user may change the units on a weight scale from pounds to kilograms while associated with a PHG. The scale will inform the PHG of this change. If that change is sent without an accompanying weight, the incidence of the change alone makes no sense to send downstream. Consequently, a measurement is only reported if the PHD sends one of twelve attributes in the metric event (called an Observation Scan in IEEE 11073-20601 language). These attributes are:

<style>table, th, td {
border: 1px solid black;
border-collapse:collapse;
padding: 6px;}</style>

|Measurement Attribute|Description|
|---|---|
|Basic-Nu-Observed-Value|Contains a single number encoded as an Mder SFLOAT\*|
|Simple-Nu-Observed-Value|Contains a single number encoded as a Mder FLOAT\*|
|Compound-Basic-Nu-Observed-Value|Contains multiple numbers encoded as Mder SFLOATs\*|
|Compound-Simple-Nu-Observed-Value|Contains multiple numbers encoded as Mder FLOATs\*|
|Nu-Observed-Value|Contains single number encoded as an Mder FLOAT\* along with units and type data|
|Compound Nu-Observed-Value|Contains multiple numbers encoded as an Mder FLOATs\* with units and type data|
|Simple-Sa-Observed-Value|Contains a sequence of scaled periodic numeric values|
|Enum-Observed-Value-Simple-OID|Contains a measurement that is an MDC code|
|Enum-Observed-Value-Basic-Bit-Str|Contains a measurement that is an ASN1 BITs string in 16-bits|
|Enum-Observed-Value-Simple-Bit-Str|Contains a measurement that is an ASN1 BITs string in 32-bits|
|Enum-Observed-Value-Simple-Str|Contains a measurement that is human-readable string (rare)|
|Enum-Observed-Value|Contains a measurement that is a 32-bit ASN1 BITs, MDC code, or String plus type data|

\*Mder Floats are described [here](MderFLOATsandSFLOATs.html)

A metric *measurement* always contains one and only one of the above attributes. If a metric event is sent by the PHD that does NOT contain one of the 12 measurement attributes, the metric event is providing information so the PHG can decode any subsequently sent measurements.

However, some of the attributes represent the same type of measurement such as the Basic-Nu-Observed-Value and Simple-Nu-Observed-Value. The only difference between the two is one of them uses 16 bits (Mder SFLOAT) to represent the measurement and the other 32 bits (Mder FLOAT). That difference is solely for protocol efficiency. In the end, these 12 measurement attributes reduce to 6 different measurement types

 - a single number (Basic-, Simple-, and Nu-Observed-Value)
 - a vector (Compound-*-Nu-Observed-Value)
 - a sequence of periodic data (Simple-Sa-Observed-Value)
 - a code (Enum-Observed-Value-Simple-OID)
 - a set of binary states or events (Enum-Observed-Value-*-Bit-Str)
 - a human readable string (Enum-Observed-Value-Simple-Str)
 
 resulting in the 6 measurement profiles described in this guide. The Enum-Observed-Value can be any one of a code, set of binary events, or a human readable string depending upon parameters.

Again, these details are only of concern to the *encoder* of the FHIR resources, the *consumer* of the FHIR resources is not concerned with the types of attributes delivered by the PHD.


 




