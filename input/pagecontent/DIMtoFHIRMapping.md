
In the IEEE 11073-10206 Abstract Content Model (ACOM), two primary classes are relevant for data upload: the System object and the Observation object. The System object describes the overall device, including its characteristics and capabilities. The Observation object represents individual measurements or events reported by the device. A single PHD will have one System object and will generate multiple Observation objects, each corresponding to a specific measurement or event.

Observation objects in ACOM can represent different types of measurements, including numeric values, enumerated (coded) values, bitfields (for multiple simultaneous states or events), strings, and sample arrays (for periodic data such as waveforms). Numeric observations cover scalar measurements, enumerated observations represent values from a defined set, bitfield observations capture multiple boolean states, and sample arrays represent sequences of numeric values over time.

The static attributes of the System object are mapped to the FHIR Device resource, while the measurement-related attributes of the Observation objects are mapped to FHIR Observation resources. 

### The Observation Model ###
The IEEE 11073-10206 model describes an Observation using a type (to indicate what the measurement is) and a value and optional attributes including timestamp, status, related observations and supplemental information.

#### Measurement Values ####
The IEEE 11073-10206 Observation Model supports the following measurement values:
 - **Numeric values**: Numeric values are the familiar simple quantities such as temperature and glucose concentration that are modelled using a unit and a number. Numeric values are mapped to Observation.valueQuantity elements.
 - **Discrete values**: Discrete values are used when the measurements are described by a finite set of options such as the meal context of a glucose measurement. The options might be one of breakfast, lunch, dinner, snack, fasting, etc. A code is used for each option. Discrete values can come as single event, multiple concurrent events or as multiple concurrent boolean state or events. 
    - **Single Event value**: Single discrete values are mapped to Observation.valueCodeableConcept elements.
    - **Multiple Event value**: Multiple discrete values are mapped to multiple Observations each with a Observation.valueCodeableConcept elements.
    - **Multiple Boolean Event/State values**: Also known as bitsrings. Bitstringss values are discrete measurements where each bit of an integer represents an event or state. An event would be something like 'marginal signal' in a pulse oximeter. An event is only of interest when it occurs and the bit is set when the event occurs. A state, on the other hand, would be something like 'averaging-on' or 'averaging-off'. Both settings of a state are of interest. Bitstrings are used when multiple events and/or states can occur simultaneously. The mapping of bitstring values uses the [ASN1 To HL7 code system](CodeSystem-ASN1ToHL7.html) where each bit position is mapped to a code. Each code is mapped to an Observation.component.code element and the bit setting is mapped to a binary "Y" or "N" Observation.component.valueCodeableConcept element.
 - **String values**: String values are just that; a line of arbitrary text. These rarely used values cannot be generically processed by a machine but are only meant for display. An example of such a measurement would be the program name of a workout on a piece of cardio equipment at a gym. String values are mapped to Observation.valueString elements.
 - **Sample Array values**: Sequences of periodic numeric values. These are used to report waveform traces of a given frequency such as 1000 samples per second. An example of such a measurement would be a digitized ECG trace. Sample array values are mapped to Observation.valueSampledData elements.
 - **Compound values**: Compound values are measurements that need more than one value to describe, such as the x, y and z components of an acceleration or the systolic, diastolic, and MAP components of a blood pressure. Each sub-value is mapped to an Observation.component element. Each component comes with a type and a value. 

##### Measurement Units
Only numeric and sample array values may have a unit; this also applies to Numeric and Sample Array components.

In ACOM, units are expressed as 11073-10101 nomenclature codes. In FHIR, these unit nomenclature codes are mapped to UCUM codes. 

When an equivalent UCUM code is known this UCUM code shall be used. To keep with the generic and future interoperability design, an implementation shall use the MDC code if it does not know what the UCUM code is for the given unit code. This situation can arise if a new PHD specialization needs to use units that are not currently defined in the existing set of unit codes. When this happens, the Quantity.system will point to the MDC system and the code will be the 32-bit unit code received from the PHD.

#### The Observation Type ####
All Observation objects contain one attribute that specify a 11073-10101 nomenclature code expressing what the Observation is. This code is given by the Observation.Type attribute. For example, a body temperature, body mass, medication dosage, or non-invasive blood pressure. The code is mapped to the Observation.code element. In compound observations, the decoder must look at the component-type attributes as well, for example the systolic, diastolic, and MAP values of the non-invasive blood pressure. These component-type codes are mapped to Observation.component.code elements representing each component.

#### The Observation Model Timestamp ####
Timestamps are somewhat complex because PHDs have different types of time clocks, may include a duration, may be out of sync when using wall-clock times, and may send no timestamp at all. The PHG is responsible for placing the measurements on a UTC synchronized timeline with local offset. That includes using the time of reception as the timestamp if the PHD sends no timestamp, mapping simple relative time 'ticks' to UTC and local offset, and correcting the wall clock timestamps reported by PHDs when they are wrong. For auditing purposes, a summary of this work by the PHG is reported in the so-called Coincident Timestamp Observation resource. In the end, the PHG maps timestamps to the Observation.effectiveDateTime if the timestamp is a point in time such as for a body temperature measurement, or the Observation.effectivePeriod if the Observation contains a measurement-duration attribute such as for a running session. A reference to the Coincident Timestamp Observation, if needed, is placed in an Observation.extension.valueReference element in the [Coincident TimeStamp Reference extension](StructureDefinition-CoincidentTimeStampReference.html).

#### further Observation attributes ####
To be updated:
An Observation Object contains a set of optional attributes that provide additional information about the measurement. The Supplemental-Types and Accuracy are examples of such attributes. When these attributes occur, they are mapped to component elements in the FHIR Observation resource. The component.code is given by the 11073-10101 nomenclature code of the respective attribute. The component.value[x] is given by the attribute value(s). In the case of the Accuracy, the value[x] is a valueQuantity, and in the case of the Supplemental-Types, the value[x] is a valueCodeableConcept. Since the Supplemental-Types is actually a list of codes, one may need several component elements.

The examples below show the most common basic measurement types where the PHD provides one of the wall-clock type timestamps.

<style>table, th, td {
border: 1px solid black;
border-collapse:collapse;
padding: 6px;}</style>

### Scalar Numeric Metric Object Mapping Example

The simplest example of a mapping of a Numeric Metric object to a FHIR Observation resource is as follows

|IEEE Attribute|Meaning|Observation element|
|-
|Type|Tells what the measurement is as an IEEE 11073-10101 code|code|
|Absolute-Time-Stamp<br/>Base-Offset-Time-Stamp|Gives the time of the measurement|effectiveDateTime|
|Simple/Basic-Nu-Observed-Value|Gives the value of the measurement|valueQuantity.value|
|Unit-Code|Gives the units of the measurement as an IEEE 11073-10101 code. Shall be translated to the equivalent UCUM code and system when available|valueQuantity.code|

This mapping applies to several simple types of PHD measurements that are scalars, for example body temperature, body mass, body height, glucose concentration, among many others. This Implementation Guide specifies a structure definition profile that applies to all scalar Numeric Metric measurements.

Scalar numeric measurements are the most common type of PHD measurement.

### Compound Numeric Metric Object Mapping Example

The simplest example of a mapping of a Compound Numeric Metric object whose value has *N* components to a FHIR Observation resource is as follows:

|IEEE Attribute|Meaning|Observation element|
|-
|Type|Tells what the 'overall' measurement is as an IEEE 11073-10101 code|code|
|Absolute-Time-Stamp<br/>Base-Offset-Time-Stamp|Gives the time of the measurement|effectiveDateTime|
|Metric-Id-List.*entryN*|Gives the code of *N*th component of the measurement|component*N*.code|
|Compound Simple/Basic-Nu-Observed-Value.*valueN*|Gives the *N*th component of the measurement|component*N*.valueQuantity.value|
|Unit-Code|Gives the units of the *N*th component of the measurement as an IEEE 11073-10101 code. Shall be translated to the equivalent UCUM code and system when available|component*N*.valueQuantity.code|

This mapping applies to simple types of PHD measurements that are represented by vectors, for example, the blood pressure and the user feedback. The Type attribute indicates what the overall measurement is, and the Metric-Id-List attribute indicates what each component of the overall measurement is. In the blood pressure case, the Type states that this is a non-invasive blood pressure and the Metric-Id-List attribute identifies the systolic, diastolic, and MAP components. This implementation guide specifies a structure definition profile that applies to all compound Numeric Metric measurements.

Outside of the blood pressure monitor, compound numeric measurements are relatively uncommon in PHDs.

### Enumeration Coded Value Metric Object Mapping Example
The simplest example of a mapping of Enumeration Metric object, where the enumerated measurement is a code, to a FHIR Observation resource is as follows:

|IEEE Attribute|Meaning|Observation element|
|-
|Type|Tells what the measurement is as an IEEE 11073-10101 code|code|
|Absolute-Time-Stamp<br/>Base-Offset-Time-Stamp|Gives the time of the measurement|effectiveDateTime|
|Enum-Observed-Value-Simple-OID|Gives the value of the measurement as IEEE 11073-10101 code|valueCodeableConcept|

This mapping applies to simple types of PHD measurements whose value is given by a finite list of codes, for example the pulsatile characteristics measurement of a pulse oximeter or the meal context associated with a glucose measurement. In the pulse oximter case there are three codes defined that can be reported; trigger on a beat, trigger on a maximum inrush, and no pulsatile event occurred. The latter is only reported by the device in special conditions and is usually not reported. This implementation guide specifies a structure definition profile that applies to all coded Metric measurements.

### Enumeration BITs Value Metric Object Mapping Example
The ASN.1 BITs measurement is the most difficult measurement class to map because HL7 does not support this measurement type. An ASN.1 BITs value is a 16 or 32-bit integer where each bit can mean something. The bit is either set (value = 1) or cleared (value = 0). This type of measurement is typically used to report events, statuses, or conditions when more than one of these situations can happen at the same time. They are classed as either events or states. To map this measurement to HL7 the BITs integer needs to be converted to codes. Continua has created a code system for this purpose allowing one to map a BITs value to a set of valueCodeableConcepts. For details about the code system and links to the code system itself see [ASN1 To HL7 Codesystem](CodeSystem-ASN1ToHL7.html). The code system has a code for each possible setting, so a 16/32-bit ASN.1 BITs value can result in up to 16/32 codes. Since a BITs value can contain multiple settings, each setting is mapped to an Observation.component.

In the latest version of IEEE 11073-20601, two sets of support attributes for an ASN1 BITs measurements have been added. The Capability-Mask-Simple/Basic attribute indicates whether a given bit is supported (set) or not (cleared). The State-Flag-Simple/Basic attribute indicates whether a given bit is an event (cleared) or state (set). Unsupported bits do not need to be reported and cleared event bits do not need to be reported. Both set and cleared state bits need to be reported. Undefined bits are never reported (what bits are defined is given in the respective specialization documents).

Since the earlier versions of the 20601 standard do not provide state/event information, the [ASN1 To HL7 Codesystem](CodeSystem-ASN1ToHL7.html) does. There is no way to determine if a given device supports a defined bit setting so one has to assume that all defined settings are supported. Since most BITs measurements are events, the lack of support information tends not to be a problem.

The simplest example of a mapping of an ASN1 BITs enumeration object to a FHIR Observation resource is as follows:

|IEEE Attribute|Meaning|Observation element|
|-
|Type|Tells what the measurement is as an IEEE 11073-10101 code|code|
|Absolute-Time-Stamp<br/>Base-Offset-Time-Stamp|Gives the time of the measurement|effectiveDateTime|
|ASN1 Code for BIT *N*|Gives the code of *N*th BIT setting|component*M*.code|
|Enum-Observed-Value-Simple/Basic-Bit-Str.*BitN*|Gives the *N*th bit setting as binary yes/no|component*M*.valueCodeableConcept (Y/N)|

*M* (the number of the component) is different from *N* (the bit-position) because cleared event bits do not need to be reported. What is not shown in the table is that the ASN1 Code entered in the component*M*.code element can be generated from data sent by the PHD. The ASN1 code is generated by converting the 32-bit code from the Type attribute to a string, concatenating a dot (.) followed by the Mder bit position *N*. A reader will still need to refer to the ASN1 code dictionary to interpret the meaning.

This implementation guide specifies a structure definition profile that applies to all ASN1 Bits Metric measurements.

### PhdDeviceMetric
The IEEE 11073-10206 ACOM specification and the Bluetooth SIG GHS specifications require a compliant device to publish the list of supported observation types. This list of observation types can be mapped to a set of [PhdDeviceMetric resources](StructureDefinition-PhdDeviceMetric.html). The GHS specifications also support an optional Observation Schedule descriptor. The information in this descriptor can be mapped to the DeviceMetric.measurementPeriod. 

### The Devil is in the Details
Unfortunately, the Metric object to Observation resource mapping is not always a simple one-to-one relation between IEEE 11073-20601 attributes and Observation elements as shown in the tables above. For example, the code that ends up in the Observation.code element does not always come from the Type attribute. The PHD decoder (the endpoint that receives and decodes IEEE 20601 data) will, in general, need to look at other attributes, should they be sent, to get the final code to enter in the Observation.code element. The same goes for the unit code. The Unit-code attribute can be overridden if certain other attributes exist.

However, this complexity is of no concern to the *consumer* or reader of the FHIR resources, only to the PHD decoder and creator of the FHIR resources, such as the Continua PHG.

