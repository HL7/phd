The PHD Base Observation profile contains the elements that are common to all PHD Observation profiles describing measurements. These element are: 
 - gatewayDevice extension: the PHG responsible for generating the upload
 - code: what the measurement is, 
 - subject: the patient this measurement refers to,
 - effective[ x ]: the time stamp and perhaps duration of the measurement,
 - device: the PHD taking the measurement, 
 - derivedFrom: references to any coincident time stamp and/or source handle reference, and 
 - components: contains any additional measurement descriptions (supplemental types and relative time stamps)
 - measurement status

The structure definition differential is given below:
{% comment %}{% include StructureDefinition-PhdDevice-diff.xhtml %}{% endcomment %}

### PHD Observation Gateway Device extension
HL7 has predefined an extension for the Observation resource to reference a gateway device. This extension is used in this profile to reference the Device resource representing the Personal Health Gateway (PHG) device.

### PHD Observation Identifier
The *PHD Observation Identifier* is used to prevent data duplication. It serves as the selection criteria in the conditional create. All measurements that have a timestamp earlier than the current time of connection are required to use the conditional create upload when converted to FHIR. If the uploader knows that the received measurement is a new measurement or the measurement is received with no time stamp, then the identifier is not needed.

Ideally the uploader will implement a duplication detection mechanism and filter out any measurements that have already been uploaded. One possible mechanism is to record the latest time stamp of any measurement received during a connection. Then for a given device and patient and upload destination, on a subsequent connection filter out any measurements with a time stamp earlier than the recorded latest time stamp of the previous connection. The latest time stamp is then updated given the information received during the current connection. The filter not only saves the server from handling the conditional update transaction but saves bandwidth and upload costs.

The identifier is a combined string of elements that contain sufficient information to uniquely identify the measurement for a given patient and device. The identifier is thus a combination of the device identifier, patient identifier, ***PHD*** timestamp of the measurement, measurement type code, measurement value, and the list of Supplemental-Types codes if any. Each entry is separated by a dash (-). It is important to use the time stamp of the PHD and not the potentially modified time stamp placed in the Observation.effective[x] element. Two PHGs may have slightly different times which would allow a duplicate measurement to appear different.

All Continua compliant PHGs must implement this identifier in the same manner. Compliance assures that even if the patient uploads the same measurement to the same server from a different PHG, a duplicate of the measurement will not be generated on the server. Some Bluetooth Low Energy PHDs do not provide a means of deleting stored data and will upload all the old data with each new addition up to the point of the device storage.

The consumer of this Observation resource should ignore the identifier element used for the PHD Profiles.

Generation of the PHD Observation Identifier is PHD Profile specific and is outlined in the respective profiles.

### Obtaining the Type of Measurement
One obtains the 11073 20601 measurement type for the code element in the same manner for all metric measurements. See the section [Obtaining the Observation.code](ObtainObservationCode.html) for the details of this mapping.

### Subject
The subject element points to the PhdPatient resource using the logical id of the Patient resource, for example 'Patient/123546'

### Time Stamp: effective[x]
PHDs report time stamps in one of four methods and may not report time stamps at all. The time clock types are summarized below:

|Time Stamp Type|Description|PHD requirement|PHG conversion|
|-
|Absolute Time|Local Wall clock time without time zone information|PHD must provide its current absolute time|PHG maps UTC plus offset and may correct it as described in the section [Coincident Time Stamp](CoincidentTimeStamp.html) |
|Base-Offset Time|Time as UTC plus time added in minutes to get the local time|PHD must provide its current base-offset time|PHG maps UTC plus offset and may correct it as described in the section [Coincident Time Stamp](CoincidentTimeStamp.html) |
|Relative time|The number of ticks in units of 1/8th millisecond|PHD must provide its current relative time|PHD obtains the current relative time at its current time and maps all measurement times to UTC plus offset based upon the difference given by the current relative time|
|Hi-Resolution Relative time|The number of ticks in units of microseconds|PHD must provide its current hi-res time|PHD obtains the current hi-res relative time at its current time and maps all measurement times to UTC plus offset based upon the difference given by the current relative time|
|No time stamp| | |PHG uses time of reception as UTC plus offset|

The PHG maps the 'converted' time stamp to either an Observation.effectiveDateTime element or an Observation.effectivePeriod element. The second situation occurs when the metric measurement includes a Measurement-Active-Period (duration) attribute. Then the time stamp attribute gives the start of the period and the end of the period is obtained by adding the Measurement-Active-Period value to it. If no time stamp is provided, the PHG, using the time of reception of the measurement as its time stamp must then do the reverse; the time of reception is the end time and the start time is given by subtracting the Measurement-Active-Period value from it.

### Device
The Observation.device element is a reference to the Device resource representing the PHD that took the measurement.

### derivedFrom: Coincident time stamp and Source Handle reference
This element references Observation resources that are in some manner related to this Observation resource. In the PHD use case, this situation occurs whenever the *metric* measurement reported by the PHD has a time stamp and/or the measurement contains a source handle reference attribute.

#### Time Stamp case
When the metric measurement contains a time stamp, there will be a Coincident Time Stamp Observation defining the details of how the Observation.effective[x] element is generated.

#### Source-Handle-Reference case
A Source-Handle-Reference attribute points to a previously reported measurement that is important to this measurement. By previously it is meant that the measurement is reported prior to the current measurement but in the same connection. If multiple such measurements have been received, the correct one is that which is most recently received. As an example, the cardiovascular specialization defines a session measurement defining some type of exercise period, such as a run. All measurements taken during that run have a source handle reference attribute pointing to the session measurement. Since Source-Handle-Reference attributes use IEEE 11073 Object handle values and not Logical resource ids to point to measurements, the PHG will need to keep track of the Observation resources created during a connection to identify the correct Observation resource, and thus logical id, the Source-Handle-Reference attribute points to. The latest version of the IEEE 11073 20601 standard also supports a Source-Handle-Reference-List containing a list of handles so there can be more than one entry generated due to these attributes. The references are placed in a derivedFrom element.

### Components
Component elements are used whenever the metric measurement contains additional information attributes that further describe the measurement. There are four such attributes that can be reported by all three types of metric measurements; the Supplemental-Types, Relative-Time, Hi-Res-Relative-Time, and Measurement-Status.

#### Supplemental Types
The Supplemental Types attribute contains a list of one or more partition-term code pairs. These define MDC codes that describe some property of the measurement. There will be one component element for each entry pair in the list. For example, the code MDC_MODALITY_SPOT used in the pulse oximeter specialization indicates that the measurement reported is a stable average. In contrast there is MDC_MODALITY_FAST and MDC_MODALITY_SLOW. The component elements are as populated as follows:

|Observation.component element|entry|Additional Information|
|-
|code.coding.code|68193|This is the MDC code for the Supplemental Types attribute|
|code.coding.system|urn:iso:std:iso:11073:10101|Indicates the MDC coding system|
|code.text|optional but|Should contain the reference id MDC_ATTR_SUPPLEMENTAL_TYPES along with any other additional text|
|valueCodeableConcept.coding.system|urn:iso:std:iso:11073:10101|Indicates the MDC coding system|
|valueCodeableConcept.coding.code|the 32-bit MDC code|(partition) * 2<sup>16</sup> + term code|
|valueCodeableConcept.text|optional but|Should contain the reference id for the reported code along with any other additional text|

#### Relative Time Stamp
The Relative-Time-Stamp attribute contains the time stamp of the measurement in units of ticks where each tick is 1/8th of a millisecond. When mapped to FHIR, it is converted to microseconds (multiplied by 125). This attribute is reported to audit the derivation of the Observation.effective[x] time stamp value. The component element is mapped as follows:

|Observation.component element|entry|Additional Information|
|-
|code.coding.code|67985|This is the MDC code for the Relative-Time-Stamp attribute|
|code.coding.system|urn:iso:std:iso:11073:10101|Indicates the MDC coding system|
|code.text|optional but|Should contain the reference id MDC_ATTR_TIME_STAMP_REL along with any other additional text|
|valueQuantity.value|the value|This is relative time value scaled to microseconds|
|valueQuantity.unit|optional| |
|valueQuantity.system|http://unitsofmeasure.org |Indicates the UCUM coding system|
|valueQuantity.code|shall be the code 'us' for microseconds|

#### High Resolution Relative Time Stamp
The Hi-Res-Relative-Time-Stamp attribute contains the time stamp of the measurement in units of ticks where each tick is a microsecond. This attribute is reported as a means to audit the derivation of the Observation.effective[x] time stamp value. The component element is mapped as follows:

|Observation.component element|entry|Additional Information|
|-
|code.coding.code|68073|This is the MDC code for the Relative-Time-Stamp attribute|
|code.coding.system|urn:iso:std:iso:11073:10101|Indicates the MDC coding system|
|code.text|optional but|Should contain the reference id MDC_ATTR_TIME_STAMP_REL_HI_RES along with any other additional text|
|valueQuantity.value|the value|This is relative time value scaled to microseconds|
|valueQuantity.unit|optional | |
|valueQuantity.system|http://unitsofmeasure.org |Indicates the UCUM coding system|
|valueQuantity.code|shall be the code 'us' for microseconds|

### Measurement Status
The Measurement Status attribute is an ASN.1 16-BITs measurement used to report errors or other special conditions. It defines 11 events. Being events, only set bits are reported. The attribute reports one or more of the following conditions in the indicated Mder bit position:

 - invalid(0),
 - questionable(1),
 - not-available(2),
 - calibration-ongoing(3),
 - test-data(4),
 - demo-data(5),
 - validated-data(8)
 - early-indication(9)
 - msmt-ongoing(10),
 - msmt-value-exceed-boundaries(14),
 - msmt-state-ann-inhibited(15)

Though it is possible to have multiple bits simultaneously set, some combinations of set bits do not make sense and should not occur.

To report these cases in FHIR requires the use of three different elements. The interpretation codes are taken from the measurement status value set defined in the [Point of Care implementation guide](https://build.fhir.org/ig/HL7/uv-pocd/index.html). The mapping is shown in the following table:

|status Mder bit | ASN1 name|Observation element|
|-
|0|invalid|dataAbsentReason.coding.code="error"<br/>http://terminology.hl7.org/CodeSystem/data-absent-reason version |
|1|questionable|interpretation.coding.system="http://hl7.org/fhir/uv/pocd/CodeSystem/measurement-status" <br/> interpretation.coding.code="questionable"|
|2|not-available|dataAbsentReason.coding.code="not-performed"<br>dataAbsentReason.coding.system="http://terminology.hl7.org/CodeSystem/data-absent-reason |
|3|calibration-ongoing|interpretation.coding.system="http://hl7.org/fhir/uv/pocd/CodeSystem/measurement-status" <br/> interpretation.coding.code="calibration-ongoing"|
|4|test-data|meta.security.coding.code="HTEST"<br/> meta.security.coding.system="http://terminology.hl7.org/CodeSystem/v3-ActReason" |
|5|demo-data|meta.security.coding.code="HTEST"<br/> meta.security.coding.system="http://terminology.hl7.org/CodeSystem/v3-ActReason" |
|8|validated-data|interpretation.coding.system="http://hl7.org/fhir/uv/pocd/CodeSystem/measurement-status" <br/> interpretation.coding.code="validated-data" |
|9|early-indication|interpretation.coding.system="http://hl7.org/fhir/uv/pocd/CodeSystem/measurement-status" <br/> interpretation.coding.code="early-indication" |
|10|msmt-ongoing|dataAbsentReason.coding.code="temp-unknown"<br>dataAbsentReason.coding.system="http://terminology.hl7.org/CodeSystem/data-absent-reason" |
|14|msmt-value-exceed-boundaries|interpretation.coding.system="http://hl7.org/fhir/uv/pocd/CodeSystem/measurement-status" <br/>interpretation.coding.code="in-alarm" |
|15|msmt-state-ann-inhibited|interpretation.coding.system="http://hl7.org/fhir/uv/pocd/CodeSystem/measurement-status" <br/>interpretation.coding.code="alarm-inhibited"|

Note that a status field is reported in the Nu-Observed-Value and Enum-Observed-Value attributes. When these attributes are sent, the status field in the attribute replaces the Measurement-Status attribute should the PHD have sent both (which would seem unlikely).

The status field is also reported in the Compound-Nu-Observed-Value. In this case the status field applies only to the Observation.component. An overall Measurement-Status attribute may also be present. The Observation.component has its own dataAbsentReason and interpretation element. However it does not have a meta element. On the other hand it does not make sense to have one sub-value of a compound report test data while another does not. A compound measurement in 20601 is a single measurement taken as a whole. However it is possible that a sub-value fails in the measurement process thus an error can occur on one sub-value while the others succeed.
