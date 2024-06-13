The follwoing sections give more detail on the data elements in a PHDBaseObservation resource.

### Gateway Device extension
HL7 has defined an extension for the Observation resource to reference a gateway device. This extension is used to reference the Device resource representing the Personal Health Gateway (PHG) device.

### Observation Identifier - prevention of data duplication
The *PHD Observation Identifier* is defined to prevent data duplication. It can be used as the selection criterium in the conditional create when uploading observations. 

Ideally the PHG will implement a duplication detection mechanism and filter out any observations that have already been uploaded. One possible mechanism is to record the latest time stamp of any observation received during a connection. Then for a given device and patient and upload destination, on a subsequent connection the PHG can filter out any observations with a time stamp earlier than the recorded latest time stamp of the previous connection. The latest time stamp is then updated given the information received during the current connection. This filter not only saves the server from handling the conditional update transaction but saves bandwidth and upload costs.

Additionally a globally unique identifier can be used in combination with a conditional create operation to prevent  duplication of observations on the server.
The identifier is a concatenated string of elements that contain sufficient information to uniquely identify the observation. The identifier is the combination of the device identifier, patient identifier, the ***PHD*** timestamp of the observation, the observation type code, and the list of Supplemental-Types codes if any. Each entry is separated by a dash (-). It is important to use the time stamp of the PHD and not the potentially modified time stamp placed in the Observation.effective[x] element. Two PHGs may have slightly different times which would allow a duplicate observation to appear different.

All PHGs compliant to this IG should implement this identifier in the same manner. Compliance assures that even if the patient uploads the same observation to the same server from a different PHG, a duplicate of the observation will not be generated on the server. This is important since some PHDs do not provide a means of deleting stored and uploaded observations and will upload old observations again with each new addition of a observation as much as device storage allows.

### Obtaining the Type of observation
One obtains the IEEE 11073-10101 observation type for the code element in the same manner for all metric observations. See the section [Obtaining the Observation.code](ObtainObservationCode.html) for the details of this mapping.

### Subject
The subject element points to the PhdPatient resource using the logical id of the Patient resource, for example 'Patient/123546'.

### Time Stamp: effective[x]
PHDs report time stamps in one of four methods and may not report time stamps at all. The PHG will include a time stamp in every observation that is uploaded using a conversion as needed based on the time stamp data received from the PHD. The time stamp types and corresponding PHG conversions are summarized below:

<style>table, th, td {
border: 1px solid black;
border-collapse:collapse;
padding: 6px;}</style>

|Time Stamp Type|Description|PHD requirement|PHG conversion|
|-
|Absolute Time|Local Wall clock time without time zone information|PHD must provide its current absolute time|PHG maps UTC plus offset and may correct it as described in the section [Coincident Time Stamp](CoincidentTimeStamp.html) |
|Base-Offset Time|Time as UTC plus time added in minutes to get the local time|PHD must provide its current base-offset time|PHG maps UTC plus offset and may correct it as described in the section [Coincident Time Stamp](CoincidentTimeStamp.html) |
|Relative time|The number of ticks in units of 1/8th millisecond|PHD must provide its current relative time|PHD obtains the current relative time at its current time and maps all observation times to UTC plus offset based upon the difference given by the current relative time|
|Hi-Resolution Relative time|The number of ticks in units of microseconds|PHD must provide its current hi-res time|PHD obtains the current hi-res relative time at its current time and maps all observation times to UTC plus offset based upon the difference given by the current relative time|
|No time stamp| | |PHG uses time of reception as UTC plus offset|

The PHG maps the 'converted' time stamp to either an Observation.effectiveDateTime element or an Observation.effectivePeriod element. The second situation occurs when the metric observation includes a Measurement-Active-Period (duration) attribute. Then the time stamp attribute gives the start of the period and the end of the period is obtained by adding the Measurement-Active-Period value to it. If no time stamp is provided, the PHG, using the time of reception of the observation as its time stamp must then do the reverse; the time of reception is the end time and the start time is given by subtracting the Measurement-Active-Period value from it.

### Device
The Observation.device element is a reference to the Device resource representing the PHD that generated the observation.

### derivedFrom: Coincident time stamp and Source Handle reference
This element references Observation resources that are in some manner related to this Observation resource. In the PHD use case, this situation occurs whenever the observation reported by the PHD has a time stamp and/or the observation contains a source handle reference attribute.

#### Time Stamp case
When the observation contains a time stamp, there will be a Coincident Time Stamp Observation defining the details of how the Observation.effective[x] element is generated.

#### Source-Handle-Reference case
A Source-Handle-Reference attribute points to a previously reported observation that is important to this observation. By previously it is meant that the observation is reported prior to the current observation but in the same connection. If multiple such observations have been received, the correct one is that which is most recently received. As an example, the cardiovascular specialization defines a session observation defining some type of exercise period, such as a run. All observations taken during that run have a source handle reference attribute pointing to the session observation. Since Source-Handle-Reference attributes use IEEE 11073 Object handle values and not Logical resource ids to point to observations, the PHG will need to keep track of the Observation resources created during a connection to identify the correct Observation resource, and thus logical id, the Source-Handle-Reference attribute points to. The latest version of the IEEE 11073-20601 standard also supports a Source-Handle-Reference-List containing a list of handles so there can be more than one entry generated due to these attributes. The references are placed in a derivedFrom element.

### Components
Component elements are used whenever the observation contains additional information attributes that further describe the observation. There are four such attributes that can be reported by all types of  observations; the Supplemental-Types, Relative-Time, Hi-Res-Relative-Time, and Measurement-Status.

#### Supplemental Types
The Supplemental Types attribute contains a list of one or more partition-term code pairs. These define MDC codes that describe some property of the observation. There will be one component element for each entry pair in the list. For example, the code MDC_MODALITY_SPOT used in the pulse oximeter specialization indicates that the observation reported is a stable average. In contrast there is MDC_MODALITY_FAST and MDC_MODALITY_SLOW. The component elements are as populated as follows:

|Observation.component element|entry|Additional Information|
|-
|code.coding.code|68193|This is the MDC code for the Supplemental Types attribute|
|code.coding.system|urn:iso:std:iso:11073:10101|Indicates the MDC coding system|
|code.text|optional but|Should contain the reference id MDC_ATTR_SUPPLEMENTAL_TYPES along with any other additional text|
|valueCodeableConcept.coding.system|urn:iso:std:iso:11073:10101|Indicates the MDC coding system|
|valueCodeableConcept.coding.code|the 32-bit MDC code|(partition) * 2<sup>16</sup> + term code|
|valueCodeableConcept.text|optional but|Should contain the reference id for the reported code along with any other additional text|

#### Relative Time Stamp
The Relative-Time-Stamp attribute contains the time stamp of the observation in units of ticks where each tick is 1/8th of a millisecond. When mapped to FHIR, it is converted to microseconds (multiplied by 125). This attribute is reported to audit the derivation of the Observation.effective[x] time stamp value. The component element is mapped as follows:

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
The Hi-Res-Relative-Time-Stamp attribute contains the time stamp of the observation in units of ticks where each tick is a microsecond. This attribute is reported as a means to audit the derivation of the Observation.effective[x] time stamp value. The component element is mapped as follows:

|Observation.component element|entry|Additional Information|
|-
|code.coding.code|68073|This is the MDC code for the Relative-Time-Stamp attribute|
|code.coding.system|urn:iso:std:iso:11073:10101|Indicates the MDC coding system|
|code.text|optional but|Should contain the reference id MDC_ATTR_TIME_STAMP_REL_HI_RES along with any other additional text|
|valueQuantity.value|the value|This is relative time value scaled to microseconds|
|valueQuantity.unit|optional | |
|valueQuantity.system|http://unitsofmeasure.org |Indicates the UCUM coding system|
|valueQuantity.code|shall be the code 'us' for microseconds|

### Category
The category element identifies the observation as being generated by a PHD. This can be used in searches and distinguishes such observations from observations collected using clinical equipment or collected in a clinical context. PHGs shall include a category element with a fixed coding as specified by the profile.

Note that for vital signs observations there also should be a category element as defined by the [Vital Signs profile](https://hl7.org/fhir/R4/observation-vitalsigns.html).

### Measurement Status
The Measurement Status element is an ASN.1 16-BITs value used to report errors or other special conditions. It defines 11 values. Only set bits are reported. The element reports one or more of the following conditions in the indicated Mder bit position:

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
|0|invalid|dataAbsentReason.coding.code="error"<br/>http://terminology.hl7.org/CodeSystem/data-absent-reason|
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

The status field is also reported in the Compound-Nu-Observed-Value. In this case the status field applies only to the Observation.component. An overall Measurement-Status attribute may also be present. The Observation.component has its own dataAbsentReason and interpretation element. However it does not have a meta element. On the other hand it does not make sense to have one sub-value of a compound report test data while another does not. A compound observation in 20601 is a single observation taken as a whole. However it is possible that a sub-value fails in the observation process thus an error can occur on one sub-value while the others succeed.

### The Other Profiles

 - [Profiles Overview](ProfilesOverview.html)
 - [Numeric Observation Profile](NumericObservationProfile.html)
 - [Compound Numeric Observation Profile](CompoundNumericObservationProfile.html)
 - [Coded Enumeration Observation Profile](CodedEnumerationObservationProfile.html)
 - [BITs Enumeration Observation Profile](BITsEnumerationObservationProfile.html)
 - [Rtsa Observation Profile](RtsaObservationProfile.html)
 - [String Enumeration Observation Profile](StringEnumerationObservationProfile.html)
 - [Coincident Time Stamp Observation Profile](CoincidentTimeStampObservationProfile.html)
 - [Phd Device Profile](PhdDeviceProfile.html)
 - [Phg Device Profile](PhgDeviceProfile.html)
 - [Patient Profile](PhdPatientProfile.html)
