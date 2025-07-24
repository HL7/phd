The following sections give more details on the data elements in a PHDBaseObservation resource.

### Gateway Device extension
HL7 has defined an extension for the Observation resource to reference a gateway device. This extension is used to reference the Device resource representing the Personal Health Gateway (PHG) device.

### Conditional-create Identifier - prevention of data duplication
<a name="ccidentifier"></a>
The *Conditional-create Identifier* is defined to prevent data duplication. It can be used as the selection criterion in the conditional create when uploading observations.

Ideally the PHG will implement a duplication detection mechanism and filter out any observations that have already been uploaded. One possible mechanism is to record the latest timestamp of any observation received during a connection. Then for a given device and patient and upload destination, on a subsequent connection the PHG can filter out any observations with a timestamp earlier than the recorded latest timestamp of the previous connection. The latest timestamp is then updated given the information received during the current connection. This filter not only saves the server from handling the conditional update transaction but saves bandwidth and upload costs.

Additionally a globally unique identifier can be used in combination with a conditional create operation to prevent duplication of observations on the server when multiple PHGs can upload observations from the same PHD. The identifier is a concatenated string of elements that contain sufficient information to uniquely identify the observation. The identifier is the concatenation of the device identifier, patient identifier, the *PHD* timestamp of the observation, the observation type code, the measurement duration if present, and the list of Supplemental-Types codes if any. Each entry is separated by a dash (-). It is important to use the timestamp of the PHD and not the potentially modified timestamp placed in the Observation.effective[x] element. Two PHGs may have slightly different times which would allow an undesired duplicate observation to appear. Note that for this scheme to work PHDs should NOT change the timestamp of a generated observation.

|Entry|value|Additional information|
|---|---|---|
|device|`PHD Device.identifier.value`|This value is a hexadecimal representation of the PHD system identifier (16 hexadecimal characters for the IEEE EUI-64 identifier, 12 for the EUI-48 transport address identifier) all capitals and without dashes|
|patient|`Patient.identifier.value`-`Patient.identifier.system` or<br/>provided logical id|The dashes are part of the identifier. <br/>When the service provider gives the PHG a pre-determined patient logical id the PHG creates no Patient resource and has no patient information. In that situation the provided logical id is used|
|type|`Observation.code.coding.code`|See [MDC Nomenclature codes](Nomenclaturecodes.html) (decimal number)|
|timestamp|`Observation.effectiveDateTime` or `Observation.effectivePeriod.start`|The reported PHD timestamp. See [Generating the PHD Reported Timestamp](GeneratingtheTimeStampPartIdentifier.html)|
|duration|the length of `Observation.effectivePeriod`| See [Generating the PHD Reported Timestamp](GeneratingtheTimeStampPartIdentifier.html)|
|Supplemental Information|`Observation.component.valueCodeableConcept.coding.code` |A sequence of MDC codes (decimal number) separated by a dash from the "supplemental information" components.|

The final identifier is made by concatenating the entries above as follows:
 - *device*-*patient*-*type*-*timestamp*-*duration*-*Supplemental Information*

All PHGs compliant to this IG should implement this identifier in the same manner. Compliance assures that even if the patient uploads the same observation to the same server from a different PHG, a duplicate of the observation will not be generated on the server. This is important since some PHDs do not provide a means of deleting stored and uploaded observations and will upload old observations again with each new addition of a observation as much as device storage allows.

An example of the this identifier from [this example](Observation-numeric-spotnumeric.html) is given below:
{% fragment Observation/numeric-spotnumeric JSON EXCEPT:identifier %}

### Obtaining the Type of observation
One obtains the IEEE 11073-10101 observation type for the code element in the same manner for all metric observations. See the section [MDC Nomenclature codes](Nomenclaturecodes.html) for the details.

### Subject
The subject element normally points to the PhdPatient resource using the logical id of the Patient resource, for example 'Patient/123546'. For device settings known to the PHG it should point to the PHD.

### Performer
In situations where the gateway knows that the patient is the person performing the measurement, a `Observation.performer` element can also point to the PhdPatient resource. However, in most situations this is unknown and the performer is not filled in. And for coincident timestamp observations, the performer should not be provided. This profile puts no constraints on the performer element.

### Timestamp: effective[x]
PHDs report timestamps in various methods and may not report timestamps at all. The PHG will include a timestamp in every observation that is uploaded using a conversion as needed based on the timestamp data received from the PHD. The timestamp types and corresponding PHG conversions are summarized below:

<style>table, th, td {
border: 1px solid black;
border-collapse:collapse;
padding: 6px;}</style>

IEEE 11073-10206 timestamps represent a UTC time or a local time, that is synchronized with an external time source or not and can come with or without a TZ/DST offset or the timestamp represents a Tick Counter value. These timestamps can come from the current timeline of the PHD or not. In order to map a timestamp for the PHD's current timeline, the PHG needs the PHD's current time. 

A timestamp comes from the current timeline of the PHD if the PHD's clock progressed naturally without discontinuities since the time reported in the timestamp. This information is included in the timestamp reported by an IEEE 11073-10206 compliant PHD, such as Bluetooth devices following the GHS specification. More information can be found in the IEEE 11073-10206 ACOM and Bluetooth GHS specifications.

Observations with a timestamp that is not from the current timeline of the PHD and that are not from a timeline synchronized with an external time source should be thrown away since there is no way to give them a correct timestamp.

The PHG can work with the assumption that the PHD and the PHG are always in the same time zone. This allows the PHG to set the offset of the timestamp to its offset.

For IEEE 11073-10206 timestamps the following table can be used: 

| Time type    | Current | Synced | Offset | Recommended Mapping                                                     | Coincident Timestamp Observation required |
| ------------ | ------- | ------ | ------ | ----------------------------------------------------------------------- | --------------------------------- |
| UTC          | Yes     | Yes    | Yes    | Keep as is                                                              | No                               |
| UTC          | Yes     | Yes    | No     | Keep as is, but include PHG offset                                      | No                               |
| UTC          | Yes     | No     | Yes    | Map to PHG timeline, including PHG offset                               | Yes                               |
| UTC          | Yes     | No     | No     | Map to PHG UTC timeline, include PHG offset                             | Yes                               |
| UTC          | No      | Yes    | Yes    | Keep as is                                                              | No                               |
| UTC          | No      | Yes    | No     | Keep as is, include PHG offset                                          | No                               |
| UTC          | No      | No     | Yes    | Throw away                                                              | n.a.                 |
| UTC          | No      | No     | No     | Throw away                                                              | n.a.                               |
| Local        | Yes     | Yes    | Yes    | Map to UTC+offset                                                       | Yes                               |
| Local        | Yes     | Yes    | No     | Map to UTC+offset, including PHG offset                                 | Yes                               |
| Local        | Yes     | No     | Yes    | Map to PHG timeline, including PHG offset                               | Yes                               |
| Local        | Yes     | No     | No     | Map to PHG timeline, including PHG offset                               | Yes                               |
| Local        | No      | Yes    | Yes    | Map to UTC+offset                                                       | No                               |
| Local        | No      | Yes    | No     | Map to UTC+offset, include PHG offset                                   | No                               |
| Local        | No      | No     | Yes    | Throw away                                                              | n.a.                               |
| Local        | No      | No     | No     | Throw away                                                              | n.a.                               |
| Tick counter | Yes     | n.a.   | n.a.   | Map to PHG timeline, including PHG offset                               | Yes                               |
| Tick counter | No      | n.a.   | n.a.   | Throw away                                                              | n.a.                               |

The PHG maps the 'converted' timestamp to either an `Observation.effectiveDateTime` element or an `Observation.effectivePeriod` element. The second situation occurs when the metric observation includes a Measurement-Duration (duration) attribute. Then the timestamp attribute gives the start of the period and the end of the period is obtained by adding the Measurement-Duration value to it. If no timestamp is provided, the PHG, using the time of reception of the observation as its timestamp must then do the reverse; the time of reception is the end time and the start time is given by subtracting the Measurement-Duration value from it.
When the PHG modifies an Observation's timestamp as received from the PHD it shall also generate a Coincident Timestamp observation that records how the Observation.effective[x] element is generated.

### Device
The `Observation.device` element is a reference to the Device resource representing the PHD that generated the observation.

### extension: Coincident timestamp reference
This extension references Coincident Timestamp Observation resource that relates the PHD and PHG timelines. This occurs whenever the observation reported by the PHD has a timestamp. The Coincident Timestamp Observation reports how this Observation.effective[x] element is generated.

### derivedFrom and hasMember: related Observations
The derivedFrom element references Observation resources that are in some manner related to this Observation resource. In the PHD use case, this situation occurs whenever the observation reported by the PHD contains a derivedFrom attribute referencing a related Observation.

The hasMember element is used when the PHD Observation reports a group of related observations. In GHS an Observation can have an Is Member Of attribute that references a group observation. When uploading to a FHIR server the gateway should report the group observation with a hasMember reference to all member Observations.

In GHS the sensor related Observations are identified using a 32-bit Observation Id that is unique in the set of observations transferred during a connection.  
Related observations are best uploaded in a single FHIR Bundle with logical ids assigned.

#### Source-Handle-Reference case (concept from IEEE 11073-20601 - deprecated)
A Source-Handle-Reference attribute points to a previously reported observation that is important to this observation. By previously it is meant that the observation is reported prior to the current observation but in the same connection. If multiple such observations have been received, the correct one is that which is most recently received. As an example, the cardiovascular specialization defines a session observation defining some type of exercise period, such as a run. All observations taken during that run have a source handle reference attribute pointing to the session observation. Since Source-Handle-Reference attributes use IEEE 11073-20601 Object handle values and not Logical resource ids to point to observations, the PHG will need to keep track of the Observation resources created during a connection to identify the correct Observation resource, and thus logical id, the Source-Handle-Reference attribute points to. Recent versions of the IEEE 11073-20601 standard also supports a Source-Handle-Reference-List containing a list of handles so there can be more than one entry generated due to these attributes. The references are placed in a derivedFrom element.

This mapping is quite often semantically incorrect. In FHIR the session observation resource should have "hasMember" references to all observations that are part of the session.

### Category
The category element identifies the observation as being generated by a PHD. This can be used in searches and distinguishes such observations from observations collected using clinical equipment or collected in a clinical context. PHGs shall include a category element with a fixed coding as specified by the profile.

Note that for vital signs observations there also should be a category element as defined by the [Vital Signs profile]({{ site.data.fhir.path }}observation-vitalsigns.html).

### Supplemental Information - Components
Component elements are used whenever the observation contains additional information attributes that further describe the observation. PHD observations can include Supplemental-Information that can be mapped to one or more FHIR Observation components.

The Supplemental Information attribute contains a list of one or more MDC codes that describe some property of the observation. There will be one component element for each entry in the list. For example, the code MDC_MODALITY_SPOT used in the pulse oximeter specialization indicates that the observation reported is a stable average. In contrast there is MDC_MODALITY_FAST and MDC_MODALITY_SLOW. 

{% fragment Observation/numeric-spotnumeric JSON EXCEPT:component[0] %}

<blockquote class="stu-note">
	<strong>Should we move Supplemental Type information to an extension?</strong>
	In the PHD IG v1.0 an attempt was made to avoid extensions as much as possible. In this version we are using extensions for less often used elements of the IEEE 11073-10206 model and in places were the conceptual models from PHD and FHIR model are too different to have a 1-1 mapping between data elements of these models.

    The question is if this applies to Supplemental Type information as well. Should IEEE 11073-10206/20601 Supplemental Information be modeled as a FHIR `Observation.component` or as an extension in FHIR?
    Input is welcome.
</blockquote>


### Measurement Status
The Measurement Status element from IEEE 11073-10206 ACOM is used to report errors or other special conditions.  The Bluetooth SIG GHS specification adds more possible conditions. It is possible to have multiple conditions simultaneously, but some combinations of conditions do not make sense and should not occur.

To report these conditions in FHIR requires the use of different elements:
- The `dataAbsentReason` element is used to report the error or not-available condition.
- The `status` element is used to report the entered-in-error condition.
- The `interpretation` element is used to report the questionable, calibrating, early-estimate, manually-entered, threshold error, and thresholding disabled conditions.

The table below lists the error conditions and the FHIR data elements to which they are mapped. The code system from which the code is drawn is also shown using a `codsystem#code` notation.

| IEEE 11073-10206 Measurement Status     | FHIR Observation Resource Data Element                                         | Further Remarks Options                                                                                                    |
| ---------------------- | ------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------- |
| Invalid                | `dataAbsentReason` = DAR#error<br/> `status` = HL7Status#entered-in-error           | A device or gateway could decide not to upload invalid observations and could report an error by other means.               |
| Questionable           | `interpretation` = PoCDStatus#questionable                                        | \-                                                                                                                          |
| Not-available          | `dataAbsentReason` = DAR#not-performed                                            | A device or gateway could decide not to upload observations with no value and could report an error by other means.         |
| Calibrating            | `interpretation` = PoCDStatus#calibration-ongoing                                 | \-                                                                                                                          |
| Test-data              | `meta.security` = ActReason#HTEST                                                 | Test data should in most cases not be uploaded to a FHIR server, except for testing purposes.                              |
| Early-estimate         | `interpretation` = PoCDStatus#early-indication<br/> `status` = HL7Status#preliminary| \-                                                                                                                          |
| Manually-entered       | \-                                                                              | Add a note to the Observation resource that it was manually entered.                                                        |
| Setting                | \-                                                                              | For device settings, the Observation resource should reference the PHD Device as the subject and not the Patient.           |
| Threshold error        | `interpretation` = PoCDStatus#in-alarm                                            | Applies to numeric data. Add a note to the Observation resource that it is outside its boundaries. Should be used in combination with the SimpleAlerting Extension.                                         |
| Thresholding disabled  | `interpretation` = PoCDStatus#alarm-inhibited                                     | Applies to numeric data. Add a note to the Observation resource that its boundaries are not checked. Should be used in combination with the SimpleAlerting Extension.                                      |

DAR: [Data Absent Reason CodeSystem](http://terminology.hl7.org/CodeSystem/data-absent-reason)
HL7Status: [Observation Status CodeSystem]({{ site.data.fhir.path }}observation-status)
PoCDStatus: [CodeSystem: Measurement Status Codes CodeSystem](https://hl7.org/fhir/uv/pocd/2021Sep/ValueSet-observation-interpretation.html)
ActReason: [CodeSystem: Act Reason CodeSystem](http://terminology.hl7.org/CodeSystem/v3-ActReason)

