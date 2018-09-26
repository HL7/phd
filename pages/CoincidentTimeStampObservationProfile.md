---
title: PHD Coincident Time Stamp Observation Profile
layout: default
active: CoincidentTimeStampObservationProfile
---

The Coincident Time Stamp Observation Profile is used to compare the timelines of the PHD with the timeline of the PHG. The primary elements are the Observation.effectiveDateTime which has the current time of the PHG and the Observation.valueDateTime or Observation.valueQuantity which has the current time of the PHD. The valueDateTime is used when the PHD uses either an Absolute or Base-Offset time clock and the valueQuantity is used when the PHD uses a relative time clock. The PHG reports its current time at the time it reads the current time of the PHD. For more details on the interpretation of the Coincident Time Stamp see the section [Coincident Time Stamp]({{ output }}CoincidentTimeStamp.html).

A PHD Observation will always reference a Coincident Time Stamp Observation if the measurement reported from the PHD contains a time stamp. It will not reference a Coincident Time Stamp Observation if the measurement contains no time stamp.

If a PHD has its time clock altered, a Date-Time-Adjustment attribute is sent to the PHG. The attribute can come in a live measurement, come by itself, or be part of the PM Segment information in persistently stored data. When a Date-Time-Adjustment occurs by itself, a new Coincident Time Stamp Observation is generated and all data sent after the adjustment will reference the new Coincident Time Stamp Observation. If it comes as part of the data, the Date-Time-Adjustment tells how much one has to adjust the time stamp of the measurement to bring it to the current time line of the agent.

The Coincident Time Stamp Observation is created every connection so data duplication is not an issue. Therefore the identifier element of this resource is not used in this profile.

The Structure Definition for the PHD Coincident Time Stamp Observation Profile is as follows:

### Meta Data Profile
The uploader shall populate the Device.meta.profile with http://pchalliance.org/phdfhir/StructureDefinition/PhdCoincidentTimeStampObservation indicating this resource is generated following the PHD Implementation Guide.

### Code
The code element is used to report the type of time clock used by the PHD. The PHG obtains the type of time clock and its current setting by reading the MDS attributes. There are four types of clocks as follows:

|Attribute|Type of clock|Description|FHIR mapping |
|-
|Date-and-Time|Absolute time|Wall-clock time with offset to UTC|Observation.code.coding.code = 67975|
|Base-Offset-Time|Base offset time|Wall-clock time with offset to some base time, often UTC|Observation.code.coding.code = 68226|
|Relative-Time|relative time|a sequence of ticks with 1/8<sup>th</sup> millisecond resolution|Observation.code.coding.code = 67983|
|HiRes-Relative-Time|relative time|a sequence of ticks with microsecond resolution|Observation.code.coding.code = 68072|

### Subject
The subject element points to the PhdPatient resource using the logical id of the Patient resource, for example 'Patient/123546'

### Populating the PHG Current Time
The PHG is required to have the capability to report local time and offset to UTC. The PHG records its current time in the Observation.effectiveDateTime element regardless of the type of time clock used by the PHD unless the PHD has superior time synchronization than the PHG see the section [Coincident Time Stamp]({{ output }}CoincidentTimeStamp.html) on this topic. In that case, the Observation.effective[x] element is not populated.

### Populating the PHD Current Time
If the PHD uses an Absolute or Base-Offset time clock, the current time of the PHD is reported in an Observation.valueDateTime element. FHIR requires the presence of an offset to UTC so if the PHD uses an absolute time, the PHG adds its offset to the value. Since all PHDs currently use local transports, the PHD and PHG are logically in the same time zone and thus have the same offset to UTC. However, if the PHD is using Base offset time, the offset reported by the PHD is used even if it is NOT the offset of the PHG.

If the PHD uses a relative time clock the current tick time is reported in an Observation.valueQuantity element scaled to microseconds.

If the PHD has a time fault, the Observation.value[x] element is absent and an Observation.dataAbsentReason.coding.code element is present with the code "unknown". A time fault is reported if the PHD itself indicates a time fault or the PHD uses a time stamp in its measurements but does not report its current time.

|Attribute|FHIR mapping |
|-
|Date-and-Time.*value*|Observation.valueDateTime|
|Base-Offset-Time.*value*|Observation.valueDateTime|
|Relative-Time.*value*|Observation.valueQuantity.*value* = Relative-Time.*value* * 125|
|HiRes-Relative-Time.*value*|Observation.valueQuantity.*value* = HiRes-Relative-Time.*value*|

### Device
The Observation.device element is a reference to the Device resource representing the PHD that took the measurement.

### Additional information
There is no additional information reported in component elements in this profile.