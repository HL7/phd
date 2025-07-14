Further notes on the elements of the PhdCoincidentTimeObservation resource:

### Code
The code element is used to report the type of time clock used by the PHD. The PHG obtains the type of time clock and its current setting by inspecting the PHD measurement timestamp and current time. The ACOM clock types are mapped as follows:

<style>table, th, td {border: 1px solid black; border-collapse:collapse; padding: 6px;}</style>
|ACOM clock type|Observation.code.coding |
|--- |---|
|Wall Clock with DST and Time Zone offset|Mdc#68225|
|Wall Clock without DST and Time Zone offset|Mdc#67975|
|Time counter|Mdc#67983|

### Subject
The subject element points to the PhdDevice resource using the logical id of the resource, for example:
{% fragment Device/phd-74E8FFFEFF051C00.001C05FFE874 JSON EXCEPT:identifier %}

### PHG Current Time &rarr; Observation.effectiveDateTime
The PHG is required to have the capability to report local time and offset to UTC. The PHG records its current time in the Observation.effectiveDateTime element regardless of the type of time clock used by the PHD unless the PHD has superior time synchronization than the PHG see the section [Coincident Timestamp](CoincidentTimeStamp.html) on this topic. In that case, the Observation.effective[x] element is not populated.

### PHD Current Time &rarr; Observation.value[x]
If the PHD uses a wall clock, the current time of the PHD is reported in an Observation.valueDateTime element. FHIR requires the presence of an offset to UTC so if the PHD does not provide that, the PHG adds its offset to the value. It is reasonable to assume that the PHD and PHG are in the same time zone and thus have the same offset to UTC. However, PHDs can be mobile and if the PHD is reporting an offset, the offset reported by the PHD is used even if it is NOT the offset of the PHG.

If the PHD uses a time counter the current tick time is reported in an Observation.valueQuantity element scaled to microseconds or milliseconds as appropriate for the resolution of the counter.

### PHD synchronization method &rarr; Observation.component.valueCodeableConcept
The PHD synchronization method is reported in the Observation.component.valueCodeableConcept element. The code is a code from the [MDC Time Synchronization Methods](ValueSet-MDCTimeSyncMethods.html) value set. The synchronization method is present in the timestamps supported by GHS and ACOM.  

If the PHD has a time fault, the Observation.value[x] element is absent and an Observation.dataAbsentReason.coding.code element is present with the code "unknown". A time fault is reported when the PHD reports its clock is unsynchronized and when a PHD measurement indicates an unsynchronized clock.

### Device
The Observation.device element is a reference to the Device resource representing the PHG that generated the coincident timestamp.

### Examples:
An example of a coincident timestamp observation where the PHG is better synchronized to NTP time than the PHD is given [here](Observation-coin-example-1.html). An example where the PHD has a time fault is given [here](Observation-coin-example-timefault.html).
