There are two classes of IEEE 11073-20601 objects that are relevant for uploading; the Medical Device System (MDS) object and the Metric object. The remaining objects assist in the PHD to PHG exchange protocol and are not of interest downstream. The MDS object is used to describe the device features and properties. The Metric object is used to model measurement types. A PHD contains a single MDS object and may contain many Metric objects, each one representing a single measurement. There are three sub-classes of Metric objects, Numeric, Real-Time-Sample-Array (RTSA), and Enumeration. Numeric Metric objects are used to describe all measurements that are either scalars or vectors. Enumeration Metric objects are used to describe measurements that are represented by a finite set of items. RTSA Metric objects are used to represent a sequence of periodic numeric scalar measurements. An RTSA *could* be expressed as a sequence of scalar numeric metrics but that would be inefficient.

The static attributes of the MDS object are mapped to a Device resource and the 'measurement' attributes of the Metric objects are mapped to Observation resources. The description 'measurement' is used as there are some attributes, such as the attribute value map, that only aid in the formatting of the Application Protocol Data Unit (APDU) packets and have nothing to do with the measurement values themselves. Those attributes are not of interest in the 20601 to FHIR mapping.

### The Metric 'Model' ###
The 20601 metric model describes a measurement using a value, an optional unit, a type (to indicate what the measurement is), an optional time stamp, and an optional set of extra descriptions.This information is present in the Metric Object attributes.

#### The Metric Model Values ####
 The Metric Object handles six types of measurement values:

 - **scalar values**: Scalars are the familiar simple quantities such as temperature and glucose concentration. Scalars are mapped to Observation.valueQuantity elements.
 - **Compound or vector values**: Compound quantities are measurements that need more than one value to describe, such as the x, y and z components of an acceleration or the systolic, diastolic, and MAP components of a blood pressure. Each vector sub-value is mapped to an Observation.component.valueQuantity element.
 - **coded values**: Coded values are used when the measurements are described by a finite set of options such as the meal context of a glucose measurement. The options might be one of breakfast, lunch, dinner, snack, fasting, etc. A code is used for each option. Coded values are mapped to Observation.valueCodeableConcept elements.
 - **BITs values**: BITs values are measurements where each bit in a 16- or 32-bit 'integer' represents an event or state. An event would be something like 'marginal signal' in a pulse oximeter. An event is only of interest when it occurs and the bit is set when the event occurs. A state, on the other hand, would be something like 'averaging-on' or 'averaging-off'. Both settings of a state are of interest. BITs values are used when multiple events and/or states can occur simultaneously. The mapping of BITs values is complicated as FHIR (and HL7 in general) has no support for this type of measurement. Instead Continua has developed a code system where each bit position is mapped to a code. Each code is mapped to an Observation.component.code element and the bit setting is mapped to a binary Observation.component.valueCodeableConcept element.
 - **human readable strings**: String values are just that; a line of arbitrary text. These rarely used values cannot be generically processed by a machine but are only meant for display. An example of such a measurement would be the program name of a workout on a piece of cardio equipment at a gym. String values are mapped to Observation.valueString elements.
 - **sequences of periodic scalars**: Waveform traces are a sequence of periodic scalars that may have a high frequency such as 1000 samples per second. An example of such a measurement would be a digitized ECG trace. Waveforms are mapped to Observation.valueSampledData elements.

##### Units
Only scalar and vector values may have a unit. In earlier versions of 20601 it was possible to have a Unit-Code attribute in an Enumeration Metric Object. This inconsistency has been corrected in the latest versions of the 20601 standard. In addition, there is no specialization that uses a unit code in an enumeration measurement. Thus it is anticipated that the implementer will never have to handle a unit code attribute when the metric measurement contains one of the enumeration value attributes.

In 20601, units are expressed as 11073-10101 nomenclature codes. In FHIR, these unit nomenclature codes are mapped to UCUM codes. When an equivalent UCUM code is known this UCUM code shall be used. To keep with the generic and future interoperability design, an implementation shall use the MDC code if it does not know what the UCUM code is for the given unit code. This situation can arise if a new PHD specialization needs to use units that are not currently defined in the existing set of unit codes. When this happens, the Quantity.system will point to the MDC system and the code will be the 32-bit unit code received from the PHD.

#### The Metric Model Type ####
All Metric objects contain one or more attributes that specify a 11073-10101 nomenclature code expressing what the measurement is. In most cases this code is given by the Type attribute. In more complex cases the Type attribute alone is not sufficient; the decoder must look for the existence of several additional but optional attributes. If these additional attributes, such as the Metric-Id and Metric-Id-Partition among others, are present, their values, along with the Type attribute are needed to determine the final code. In the end, the decoder gets a single code specifying what the 'overall' measurement is. For example, a body temperature, body mass, medication dosage, or non-invasive blood pressure. The overall code is mapped to the Observation.code element. The expression 'overall' is used because in compound cases, the decoder must look at additional metric attributes to obtain the sub-types of the measurement, for example the systolic, diastolic, and MAP values of the non-invasive blood pressure. These sub-type codes are mapped to Observation.component.code elements representing each sub-type.

#### The Metric Model TimeStamp ####
Time stamps are more complicated because PHDs have different types of time clocks, may include a duration, may be out of sync when using wall-clock times, and may send no time stamp at all. The PHG is responsible for placing the measurements on a UTC synchronized time line with local offset. That includes using the time of reception as the time stamp if the PHD sends no time stamp, mapping simple relative time 'ticks' to UTC and local offset, and correcting the wall clock time stamps reported by PHDs when they are wrong. For auditing purposes, a summary of this work by the PHG is reported in the so-called Coincident Time Stamp Observation resource. In the end, the PHG maps time stamps to the Observation.effectiveDateTime if the time stamp is a point in time such as a body temperature, or the Observation.effectivePeriod if the metric contains a Measure-Active-Period (duration) attribute such as a running session. A reference to the Coincident Time Stamp Observation, if needed, is placed in the Observation.derivedFrom element.

#### The Metric Model Descriptions ####
The Metric Object contains a set of optional attributes that provide additional information about the measurement. The Supplemental-Types and Accuracy are examples of such attributes. When these attributes occur, they are mapped to component elements in the FHIR Observation resource. The component.code is given by the 11073-10101 nomenclature code of the respective attribute. The component.value[x] is given by the attribute value(s). In the case of the Accuracy, the value[x] is a valueQuantity, and in the case of the Supplemental-Types, the value[x] is a valueCodeableConcept. Since the Supplemental-Types is actually a list of codes, one may need several component elements.

The examples below show the most common basic measurement types where the PHD provides one of the wall-clock type time stamps.

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
The ASN.1 BITs measurement is the most difficult measurement class to map because HL7 does not support this measurement type. An ASN.1 BITs value is a 16 or 32-bit integer where each bit can mean something. The bit is either set (value = 1) or cleared (value = 0). This type of measurement is typically used to report events, statuses, or conditions when more than one of these situations can happen at the same time. They are classed as either events or states. To map this measurement to HL7 the BITs integer needs to be converted to codes. Continua has created a code system for this purpose allowing one to map a BITs value to a set of valueCodeableConcepts. For details about the code system and links to the code system itself see [ASN1 BITs Code System](ASN1BITsCodeSystem.html). The code system has a code for each possible setting, so a 16/32-bit ASN.1 BITs value can result in up to 16/32 codes. Since a BITs value can contain multiple settings, each setting is mapped to an Observation.component.

In the latest version of IEEE 11073-20601, two sets of support attributes for an ASN1 BITs measurements have been added. The Capability-Mask-Simple/Basic attribute indicates whether a given bit is supported (set) or not (cleared). The State-Flag-Simple/Basic attribute indicates whether a given bit is an event (cleared) or state (set). Unsupported bits do not need to be reported and cleared event bits do not need to be reported. Both set and cleared state bits need to be reported. Undefined bits are never reported (what bits are defined is given in the respective specialization documents).

Since the earlier versions of the 20601 standard do not provide state/event information, the [ASN1 BITs Code System](ASN1BITsCodeSystem.html) does. There is no way to determine if a given device supports a defined bit setting so one has to assume that all defined settings are supported. Since most BITs measurements are events, the lack of support information tends not to be a problem.

The simplest example of a mapping of an ASN1 BITs enumeration object to a FHIR Observation resource is as follows:

|IEEE Attribute|Meaning|Observation element|
|-
|Type|Tells what the measurement is as an IEEE 11073-10101 code|code|
|Absolute-Time-Stamp<br/>Base-Offset-Time-Stamp|Gives the time of the measurement|effectiveDateTime|
|ASN1 Code for BIT *N*|Gives the code of *N*th BIT setting|component*M*.code|
|Enum-Observed-Value-Simple/Basic-Bit-Str.*BitN*|Gives the *N*th bit setting as binary yes/no|component*M*.valueCodeableConcept (Y/N)|

*M* (the number of the component) is different from *N* (the bit-position) because cleared event bits do not need to be reported. What is not shown in the table is that the ASN1 Code entered in the component*M*.code element can be generated from data sent by the PHD. The ASN1 code is generated by converting the 32-bit code from the Type attribute to a string, concatenating a dot (.) followed by the Mder bit position *N*. A reader will still need to refer to the ASN1 code dictionary to interpret the meaning.

This implementation guide specifies a structure definition profile that applies to all ASN1 Bits Metric measurements.

### Other Potential Mappings
One could go further and add mappings of IEEE-11073-20601 specifics such as the Configuration Report. This addition would require the use of the DeviceMetric resource. Adding such mappings would add significant bulk to the upload. Mapping of the Configuration Report would not be something of interest to medical personnel. Giving the cost in complexity and bulk it is not considered in this version of the guide. 


### The Devil is in the Details
Unfortunately, the Metric object to Observation resource mapping is not always a simple one-to-one relation between IEEE 11073-20601 attributes and Observation elements as shown in the tables above. For example, the code that ends up in the Observation.code element does not always come from the Type attribute. The PHD decoder (the endpoint that receives and decodes IEEE 20601 data) will, in general, need to look at other attributes, should they be sent, to get the final code to enter in the Observation.code element. The same goes for the unit code. The Unit-code attribute can be overridden if certain other attributes exist.

However, this complexity is of no concern to the *consumer* or reader of the FHIR resources, only to the PHD decoder and creator of the FHIR resources, such as the Continua PHG.

 - [Next: General Notes to Consumers of FHIR Data](GeneralNotestoConsumers.html)
 - [Previous: Generic and Extensible Model](GenericModel.html)
