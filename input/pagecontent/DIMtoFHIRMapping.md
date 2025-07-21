
In the IEEE 11073-10206 Abstract Content Model (ACOM), two primary classes are relevant for data upload: the System object and the Observation object. The System object describes the overall device, including its characteristics and capabilities. The Observation object represents individual measurements or events reported by the device. A single PHD will have one System object and will generate multiple Observation objects, each corresponding to a specific measurement or event.

Observation objects in ACOM can represent different types of measurements, including numeric values, enumerated (coded) values, bitfields (for multiple simultaneous states or events), strings, and sample arrays (for periodic data such as waveforms). Numeric observations cover scalar measurements, enumerated observations represent values from a defined set, bitfield observations capture multiple boolean states, and sample arrays represent sequences of numeric values over time.

The static attributes of the System object are mapped to the FHIR Device resource, while the measurement-related attributes of the Observation objects are mapped to FHIR Observation resources. 

### The Observation Model
The IEEE 11073-10206 model describes an Observation using a type (to indicate what the measurement is) and a value and optional attributes including timestamp, status, related observations and supplemental information.

#### Measurement Values
The IEEE 11073-10206 Observation Model supports the following measurement values:
 - **Numeric values**: Numeric values are the familiar simple quantities such as temperature and glucose concentration that are modelled using a unit and a number. Numeric values are mapped to `Observation.valueQuantity` elements.
 - **Discrete values**: Discrete values are used when the measurements are described by a finite set of options such as the meal context of a glucose measurement. The options might be one of breakfast, lunch, dinner, snack, fasting, etc. A code is used for each option. Discrete values can come as single event, multiple concurrent events or as multiple concurrent boolean state or events. 
    - **Single Event value**: Single discrete values are mapped to `Observation.valueCodeableConcept` elements.
    - **Multiple Event value**: Multiple discrete values are mapped to multiple Observations each with a `Observation.valueCodeableConcept` elements.
    - **Multiple Boolean Event/State values**: Also known as bitsrings. Bitstringss values are discrete measurements where each bit of an integer represents an event or state. An event would be something like 'marginal signal' in a pulse oximeter. An event is only of interest when it occurs and the bit is set when the event occurs. A state, on the other hand, would be something like 'averaging-on' or 'averaging-off'. Both settings of a state are of interest. Bitstrings are used when multiple events and/or states can occur simultaneously. The mapping of bitstring values uses the [ASN1 To HL7 code system](CodeSystem-ASN1ToHL7.html) where each bit position is mapped to a code. Each code is mapped to an `Observation.component.code` element and the bit setting is mapped to a binary "Y" or "N" `Observation.component.valueCodeableConcept` element.
 - **String values**: String values are just that; a line of arbitrary text. These rarely used values cannot be generically processed by a machine but are only meant for display. An example of such a measurement would be the program name of a workout on a piece of cardio equipment at a gym. String values are mapped to `Observation.valueString` elements.
 - **Sample Array values**: Sequences of periodic numeric values. These are used to report waveform traces of a given frequency such as 1000 samples per second. An example of such a measurement would be a digitized ECG trace. Sample array values are mapped to `Observation.valueSampledData` elements.
 - **Compound values**: Compound values are measurements that need more than one value to describe, such as the x, y and z components of an acceleration or the systolic, diastolic, and MAP components of a blood pressure. Each sub-value is mapped to an `Observation.component` element. Each component comes with a type and a value. 

##### Measurement Units
Only numeric and sample array values may have a unit; this also applies to Numeric and Sample Array components.

In ACOM, units are expressed as IEEE 11073-10101 nomenclature codes. In FHIR, these unit nomenclature codes are mapped to UCUM codes. 

When an equivalent UCUM code is known this UCUM code shall be used. To keep with the generic and future interoperability design, an implementation shall use the MDC code if it does not know what the UCUM code is for the given unit code. This situation can arise if a new PHD specialization needs to use units that are not currently defined in the existing set of unit codes. When this happens, the `Quantity.system` will point to the MDC system and the code will be the 32-bit unit code received from the PHD.

#### The Observation Type
All Observation objects contain one attribute that specify an IEEE 11073-10101 nomenclature code expressing what the Observation is. This code is given by the `Observation.Type` attribute. For example, a body temperature, body mass, medication dosage, or non-invasive blood pressure. The code is mapped to the `Observation.code` element. In compound observations, the decoder must look at the component-type attributes as well, for example the systolic, diastolic, and MAP values of the non-invasive blood pressure. These component-type codes are mapped to `Observation.component.code` elements representing each component.

#### The Observation Model Timestamp
Timestamps are somewhat complex because PHDs have different types of time clocks, may include a duration, may be out of sync when using wall-clock times, and may send no timestamp at all. The PHG is responsible for placing the measurements on a UTC synchronized timeline with local offset. That includes using the time of reception as the timestamp if the PHD sends no timestamp, mapping simple relative time to UTC and local offset, and correcting the wall clock timestamps reported by PHDs when they are wrong. For auditing purposes, a summary of this work by the PHG is reported in the so-called Coincident Timestamp Observation resource. In the end, the PHG maps timestamps to the `Observation.effectiveDateTime` if the timestamp is a point in time such as for a body temperature measurement, or the `Observation.effectivePeriod` if the Observation contains a measurement-duration attribute such as for a running session. A reference to the Coincident Timestamp Observation, if needed, is placed in an `Observation.extension.valueReference` element in the [Coincident TimeStamp Reference extension](StructureDefinition-CoincidentTimeStampReference.html).

#### Further Observation attributes
An Observation may contain optional attributes that provide additional information about the measurement. The Supplemental-Types and Accuracy are examples of such attributes. When these attributes occur, they are mapped to component elements or extensions in the FHIR Observation resource. 

The tables below show common measurement types and their mappings to FHIR Observation elements.

<style>table, th, td {
border: 1px solid black;
border-collapse:collapse;
padding: 6px;}</style>

### Scalar Numeric Metric Object Mapping Example

The simplest example of a mapping of a Numeric Metric object to a FHIR Observation resource is as follows

|ACOM Numeric Observation Attribute|Meaning|FHIR Observation element|
|-|---|---|
|Type|Tells what the measurement is as an IEEE 11073-10101 code|`code`|
|Time-stamp|Gives the time of the measurement|`effectiveDateTime`|
|Value|Gives the value of the measurement|`valueQuantity.value`|
|Unit-Code|Gives the units of the measurement as an IEEE 11073-10101 code. Shall be translated to the equivalent UCUM code and system when available.|`valueQuantity.code`|

This mapping applies to several simple types of PHD measurements that are scalars, for example body temperature, body mass, body height, glucose concentration, among many others. This Implementation Guide specifies a structure definition profile that applies to all scalar Numeric Metric measurements.

Scalar numeric measurements are the most common type of PHD measurement.

### Compound (Numeric) Observation Mapping Example

The table below illustrates the mapping of a Compound Observation with *N* numeric components to a FHIR Observation resource:

|ACOM Observation Attribute|Meaning|FHIR Observation element|
|---|----|---|
|Type|Tells what the 'overall' measurement is as an IEEE 11073-10101 code|`code`|
|Time-stamp|Gives the time of the measurement|`effectiveDateTime`|
|components[N].component-type|Gives the code of *N*th component of the measurement|`component[N].code`|
|components[N].value|Gives value of the *N*th component of the measurement|`component[N].valueQuantity.value`|
|components[N].unit|Gives the units of the *N*th component of the measurement as an IEEE 11073-10101 code. Shall be translated to the equivalent UCUM code and system when available.|`component[N].valueQuantity.code`|

This mapping applies to simple types of PHD measurements that are represented by vectors, for example, the blood pressure and the user feedback. The Type attribute indicates what the overall measurement is, and the components[].component-type indicates what each component of the overall measurement is. In the blood pressure case, the Type states that this is a non-invasive blood pressure and the component-type attribute identifies the systolic, diastolic, and MAP components. This implementation guide specifies a structure definition profile that applies to all Compound Observations. A dedicated profile for Compound Numeric Observations is present for backwards compatibility.

### Discrete Observation Mapping Example
The simplest example of a mapping of a discrete observation, where the measurement is a code, to a FHIR Observation resource is as follows:

|IEEE Attribute|Meaning|Observation element|
|-|----|---|
|Type|Tells what the measurement is as an IEEE 11073-10101 code|`code`|
|Time-stamp|Gives the time of the measurement|`effectiveDateTime`|
|value|Gives the value of the measurement as IEEE 11073-10101 code|`valueCodeableConcept`|

This mapping applies to simple types of PHD measurements whose value is given by a finite list of codes, for example the pulsatile characteristics measurement of a pulse oximeter or the meal context associated with a glucose measurement. In the pulse oximeter case there are three codes defined that can be reported; trigger on a beat, trigger on a maximum inrush, and no pulsatile event occurred. The latter is only reported by the device in special conditions and is usually not reported. This implementation guide specifies a structure definition profile that applies to all discrete observation that report a single code.

### Multiple Boolean Observation Mapping Example
The Multiple Boolean Observation or bit string Observation is the most difficult measurement class to map because HL7 does not support this measurement type. The reported  value is a bit string where each bit can means something. This type of measurement is typically used to report events, statuses, or conditions when more than one of these situations can happen at the same time. They are classed as either events or states. To map this measurement to FHIR the BITs integer needs to be converted to codes. This IG contains a code system for this purpose allowing one to map a BITs value to a set of valueCodeableConcept components. For details about the code system and links to the code system itself see [ASN1 To HL7 CodeSystem](CodeSystem-ASN1ToHL7.html). The code system has a code and a definition per bit. Each bit is mapped to an `Observation.component` with one of these codes.

The simplest example of a mapping of an ASN1 BITs enumeration object to a FHIR Observation resource is as follows:

|ACOM Multiple Boolean Observation Attribute|Meaning|Observation element|
|---|----|---|
|Type|Tells what the measurement is as an IEEE 11073-10101 code|`code`|
|Time-stamp|Gives the time of the measurement|`effectiveDateTime`|
|ASN1 Code for bit N|Gives the code of Nth bit|`component[M].code`|
|value[N]|Gives the *N*th bit setting as Boolean|`component[M].valueBoolean`|

*M* (the number of the component) may be different from *N* (the bit-position) because cleared event bits for events do not need to be reported. 

This implementation guide specifies a structure definition profile that applies to all Multiple Boolean Observation measurements.

### List of supported Observation Types
The IEEE 11073-10206 ACOM specification and the Bluetooth SIG GHS specifications require a compliant device to publish the list of supported observation types. This list of observation types can be mapped to a set of [PhdDeviceMetric resources](StructureDefinition-PhdDeviceMetric.html). The GHS specifications also support an optional Observation Schedule descriptor. The information in this descriptor can be mapped to the DeviceMetric.measurementPeriod. 


