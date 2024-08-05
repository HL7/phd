The fololwing sections give more details on the data elements in a PHDBaseObservation resource.

### Gateway Device extension
HL7 has defined an extension for the Observation resource to reference a gateway device. This extension is used to reference the Device resource representing the Personal Health Gateway (PHG) device.

### Observation Identifier - prevention of data duplication
The *PHD Observation Identifier* is defined to prevent data duplication. It can be used as the selection criterium in the conditional create when uploading observations. 

Ideally the PHG will implement a duplication detection mechanism and filter out any observations that have already been uploaded. One possible mechanism is to record the latest time stamp of any observation received during a connection. Then for a given device and patient and upload destination, on a subsequent connection the PHG can filter out any observations with a time stamp earlier than the recorded latest time stamp of the previous connection. The latest time stamp is then updated given the information received during the current connection. This filter not only saves the server from handling the conditional update transaction but saves bandwidth and upload costs.

Additionally a globally unique identifier can be used in combination with a conditional create operation to prevent duplication of observations on the server.
The identifier is a concatenated string of elements that contain sufficient information to uniquely identify the observation. The identifier is the concatenation of the device identifier, patient identifier, the ***PHD*** timestamp of the observation, the observation type code, the measurement duration if present, and the list of Supplemental-Types codes if any. Each entry is separated by a dash (-). It is important to use the time stamp of the PHD and not the potentially modified time stamp placed in the Observation.effective[x] element. Two PHGs may have slightly different times which would allow an undesired duplicate observation to appear.

|Entry|value|Additional information|
|-
|device|"PHD Device.identifier.value"|This value is the PHD IEEE EUI-64 system identifier|
|patient|"Patient.identifier.value-Patient.identifier.system" or<br/>provided logical id|The dashes are part of the identifier. <br/>When the service provider gives the PHG a pre-determined patient logical id the PHG creates no Patient resource and has no patient information. In that special case the provided logical id is used|
|type|"Observation.code.coding.code"|See [Obtaining the Observation.code](ObtainObservationCode.html)|
|reported PHD timestamp|"timestamp"|See [Generating the PHD Reported Time Stamp](GeneratingtheReportedTimeStampIdentifier.html)|
|duration|"duration"|See [Generating the PHD Reported Time Stamp](GeneratingtheReportedTimeStampIdentifier.html)|
|Supplemental Information|"Supplemental-Types.*N*-"|A sequence of 32-bit MDC codes separated by a dash|

The final identifier is made by concatenating the entries above as follows:
 - "device-patient-type-value-timestamp-duration-Supplemental Information"

All PHGs compliant to this IG should implement this identifier in the same manner. Compliance assures that even if the patient uploads the same observation to the same server from a different PHG, a duplicate of the observation will not be generated on the server. This is important since some PHDs do not provide a means of deleting stored and uploaded observations and will upload old observations again with each new addition of a observation as much as device storage allows.

### Obtaining the Type of observation
One obtains the IEEE 11073-10101 observation type for the code element in the same manner for all metric observations. See the section [Obtaining the Observation.code](ObtainObservationCode.html) for the details of this mapping.

### Subject
The subject element points to the PhdPatient resource using the logical id of the Patient resource, for example 'Patient/123546'.

#### Performer
In situations where the gateway knows that the patinet is the person performing the measurement, a Observation.performer[] element can also point to the PhdPatient resource. However, in most situations this is unknown and the performer is not filled in.

### Time Stamp: effective[x]
PHDs report time stamps in various methods and may not report time stamps at all. The PHG will include a time stamp in every observation that is uploaded using a conversion as needed based on the time stamp data received from the PHD. The time stamp types and corresponding PHG conversions are summarized below:

<style>table, th, td {
border: 1px solid black;
border-collapse:collapse;
padding: 6px;}</style>

IEEE 11073-10206 timestamps represent a UTC time or a local time, that is synchronised with an external time source or not and can come with or without a TZ/DST offset or the time stamp represents a Tick Counter value. These time stamps can come from the current timeline of the PHD or not. In order to map a timestamp for the PHD's cyrrent timeline, the PHG needs the PHD's current time. 

Observations with a timestamp that is not from the current timeline of the PHD and that are not from a timeline synchronised with an external time source should be thrown away since there is no way to give them a correct timestamp.

The PHG can work with the assumption that the PHD and the PHG are always in the same time zone. This allows the PHG to set the offset of the timestamp to its offset.

For IEEE 11073-10206 time stamps the following table can be used: 

| Time type    | Current | Synced | Offset | Recommended Mapping                                                     |
| ------------ | ------- | ------ | ------ | ----------------------------------------------------------------------- |
| UTC          | Yes     | Yes    | Yes    | Keep as is with optional correction to PHG timeline, keep offset as is  |
| UTC          | Yes     | Yes    | No     | Keep as is , with optional correction and optionally include PHG offset |
| UTC          | Yes     | No     | Yes    | Map to PHG timeline, including PHG offset                               |
| UTC          | Yes     | No     | No     | Map to PHG UTC timeline, optionally include PHG offset                  |
| UTC          | No      | Yes    | Yes    | Keep as is                                                              |
| UTC          | No      | Yes    | No     | Keep as is, optionally include PHG offset                               |
| UTC          | No      | No     | Yes    | Throw away                                                              |
| UTC          | No      | No     | No     | Throw away                                                              |
| Local        | Yes     | Yes    | Yes    | Map to UTC+offset with optional correction                              |
| Local        | Yes     | Yes    | No     | Map to UTC+offset, including PHG offset                                 |
| Local        | Yes     | No     | Yes    | Map to PHG timeline, including PHG offset                               |
| Local        | Yes     | No     | No     | Map to PHG timeline, including PHG offset                               |
| Local        | No      | Yes    | Yes    | Map to UTC+offset                                                       |
| Local        | No      | Yes    | No     | Map to UTC, optionally include PHG offset                                            |
| Local        | No      | No     | Yes    | Throw away                                                              |
| Local        | No      | No     | No     | Throw away                                                              |
| Tick counter | Yes     | n.a.   | n.a.   | Map to PHG timeline, including PHG offset                               |
| Tick counter | No      | n.a.   | n.a.   | Throw away                                                              |

The PHG maps the 'converted' time stamp to either an Observation.effectiveDateTime element or an Observation.effectivePeriod element. The second situation occurs when the metric observation includes a Measurement-Duration (duration) attribute. Then the time stamp attribute gives the start of the period and the end of the period is obtained by adding the Measurement-Duration value to it. If no time stamp is provided, the PHG, using the time of reception of the observation as its time stamp must then do the reverse; the time of reception is the end time and the start time is given by subtracting the Measurement-Duration value from it.
When the PHG modifies an Observation's time stamp as received from the PHD it shall also generate a Coincident Timestamp observation that records how the Observation.effective[x] element is generated.

### Device
The Observation.device element is a reference to the Device resource representing the PHD that generated the observation.

### derivedFrom: Coincident time stamp and related Observations
This element references Observation resources that are in some manner related to this Observation resource. In the PHD use case, this situation occurs whenever the observation reported by the PHD has a time stamp and/or the observation contains a derivedFrom attribute referencing a related Observation.

### hasMember: related Observations
This element is used when the PHD Observation reports a group of related observations.

In GHS an Observation can have an Is Member Of attribute that references a group observation. When uploading to a FHIR server the gateway should report the group observation with a hasMember reference to all member Observations.

In GHS the sensor device related Observations are identified using a 32-bit Observation Id that is unique in the set of observations transferred during a connection.  When

Related observations are best uploaded in a single FHIR Bundle with logical ids assigned


#### Time Stamp case
When the observation contains a time stamp, there will be a Coincident Time Stamp Observation defining the details of how the Observation.effective[x] element is generated.

#### Source-Handle-Reference case
A Source-Handle-Reference attribute points to a previously reported observation that is important to this observation. By previously it is meant that the observation is reported prior to the current observation but in the same connection. If multiple such observations have been received, the correct one is that which is most recently received. As an example, the cardiovascular specialization defines a session observation defining some type of exercise period, such as a run. All observations taken during that run have a source handle reference attribute pointing to the session observation. Since Source-Handle-Reference attributes use IEEE 11073 Object handle values and not Logical resource ids to point to observations, the PHG will need to keep track of the Observation resources created during a connection to identify the correct Observation resource, and thus logical id, the Source-Handle-Reference attribute points to. The latest version of the IEEE 11073-20601 standard also supports a Source-Handle-Reference-List containing a list of handles so there can be more than one entry generated due to these attributes. The references are placed in a derivedFrom element.

### Category
The category element identifies the observation as being generated by a PHD. This can be used in searches and distinguishes such observations from observations collected using clinical equipment or collected in a clinical context. PHGs shall include a category element with a fixed coding as specified by the profile.

Note that for vital signs observations there also should be a category element as defined by the [Vital Signs profile](https://hl7.org/fhir/R4/observation-vitalsigns.html).

### Supplemental Information - Components
Component elements are used whenever the observation contains additional information attributes that further describe the observation. PHD observations can include Supplemental-Information that can be mapped to one or more FHIR Observation components.

The Supplemental Information attribute contains a list of one or more MDC codes that describe some property of the observation. There will be one component element for each entry in the list. For example, the code MDC_MODALITY_SPOT used in the pulse oximeter specialization indicates that the observation reported is a stable average. In contrast there is MDC_MODALITY_FAST and MDC_MODALITY_SLOW. The component elements are as populated as follows:

| Observation.component element      | entry                            | Additional Information                                                                           |
| ---------------------------------- | -------------------------------- | ------------------------------------------------------------------------------------------------ |
| code.coding.code                   | 68193                            | This is the MDC code for the Supplemental Types attribute                                        |
| code.coding.system                 | urn:iso:std:iso:11073:10101      | Indicates the MDC coding system                                                                  |
| code.text                          | optional                         | Should contain the reference id MDC_ATTR_SUPPLEMENTAL_TYPES along with any other additional text |
| valueCodeableConcept.coding.system | urn:iso:std:iso:11073:10101      | Indicates the MDC coding system                                                                  |
| valueCodeableConcept.coding.code   | the MDC code as a decimal string |                                                                                                  |
| valueCodeableConcept.text          | optional                         | Should contain the reference id for the reported code along with any other additional text       |


### Measurement Status
The Measurement Status element from IEEE 11073-10206 is used to report errors or other special conditions. The element reports one or more of the following conditions:

 - invalid
 - questionable
 - not-available
 - calibrating
 - test-data
 - early-estimate
 - threshold-error
 - annunciation-inhibited
 - setting
 - manually-entered

The Bluetooth SIG GHS specification adds two more:

 - Threshold error                                         |
 - Thresholding disabled  


It is possible to have multiple conditions simultaneously, but some combinations of conditions do not make sense and should not occur.

To report these cases in FHIR requires the use of three different elements. The interpretation codes are taken from the measurement status value set defined in the [Point of Care implementation guide](https://build.fhir.org/ig/HL7/uv-pocd/index.html). The mapping is shown in the following table:

| Measurement Status     | FHIR® Observation Resource Data Element                                         | Further Handling Options                                                                                                    |
| ---------------------- | ------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------- |
| Invalid                | dataAbsentReason = error – from CS1 <br/> status = entered-in-error – from CS2        | A device or gateway could decide not to upload invalid observations and could report an error by other means.               |
| Questionable           | interpretation = questionable – from CS3                                        | \-                                                                                                                          |
| Not-available          | dataAbsentReason = not-performed – from CS1                                     | A device or gateway could decide not to upload observations with no value and could report an error by other means.         |
| Calibrating            | interpretation = calibration-ongoing – from CS3                                 | \-                                                                                                                          |
| Test-data              | meta.security = HTEST – from CS4                                                | Test data should in most cases not be uploaded to a FHIR® server, except for testing purposes.                              |
| Early-estimate         | interpretation = early-indication – from CS3 <br/> status = preliminary – from CS2 | \-                                                                                                                          |
| Annunciation-inhibited | TBD                                                                             |                                                                                                                             |
| Manually-entered       | \-                                                                              | Add a note to the Observation resource that it was manually entered.                                                        |
| Setting                | \-                                                                              | For device settings, the Observation resource should reference the Device resource as a subject and not a Patient resource. |
| Threshold error        | interpretation = in-alarm – from CS3                                            | Ignore or add a note to the Observation resource that it is outside its boundaries.                                         |
| Thresholding disabled  | interpretation = alarm-inhibited – from CS3                                     | Ignore or add a note to the Observation resource that its boundaries are not checked.                                       |

CS1: [Data Absent Reason CodeSystem](http://terminology.hl7.org/CodeSystem/data-absent-reason)
CS2: [Observation Status CodeSystem](http://hl7.org/fhir/observation-status)
CS3: [CodeSystem: Measurement Status Codes CodeSystem](https://build.fhir.org/ig/HL7/uv-pocd/CodeSystem-measurement-status.html)
CS4: [CodeSystem: Act Reason CodeSystem](http://terminology.hl7.org/CodeSystem/v3-ActReason)

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
