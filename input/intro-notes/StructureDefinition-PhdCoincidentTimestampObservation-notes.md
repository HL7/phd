Further notes on the elements of the PhdCoincidentTimeObservation resource:

### Code
The code element is used to report the type of time clock used by the PHD. The PHG obtains the type of time clock and its current setting by inspecting the PHD measurement time stamp and current time. The ACOM clock types are mapped as follows:

<style>table, th, td {border: 1px solid black; border-collapse:collapse; padding: 6px;}</style>
|ACOM clock type|Description|FHIR mapping |
|-
|Local time|Civil time (with or without TZ/DST offset)|Observation.code.coding.code = 67975|
|UTC time|UTC time (with or without TZ/DST offset)|Observation.code.coding.code = 68226|
|Tick counter|a tick counter with a defined resolution and arbitrary starting point|Observation.code.coding.code = 67983|

### Subject
The subject element points to the PhdDevice resource using the logical id of the resource, for example:
{% fragment Device/phd-74E8FFFEFF051C00.001C05FFE874 JSON EXCEPT:identifier %}

### Populating the PHG Current Time
The PHG is required to have the capability to report local time and offset to UTC. The PHG records its current time in the Observation.effectiveDateTime element regardless of the type of time clock used by the PHD unless the PHD has superior time synchronization than the PHG see the section [Coincident Time Stamp](CoincidentTimeStamp.html) on this topic. In that case, the Observation.effective[x] element is not populated.

### Populating the PHD Current Time
If the PHD uses a UTC or civil time clock, the current time of the PHD is reported in an Observation.valueDateTime element. FHIR requires the presence of an offset to UTC so if the PHD does not provide that, the PHG adds its offset to the value. It is reasonable to assume that the PHD and PHG are in the same time zone and thus have the same offset to UTC. However, PHDs can be mobile and if the PHD is reporting an offset, the offset reported by the PHD is used even if it is NOT the offset of the PHG.

If the PHD uses a tick counter the current tick time is reported in an Observation.valueQuantity element scaled to microseconds or milliseconds as appropriate for the resolution of the counter.

If the PHD has a time fault, the Observation.value[x] element is absent and an Observation.dataAbsentReason.coding.code element is present with the code "unknown". A time fault is reported when the PHD reports its clock is unsynchronised and when a PHD measurement indicates an unsynchronised clock.

### Device
The Observation.device element is a reference to the Device resource representing the PHG that generated the coincident time stamp.

### Examples:
An example of a coincident time stamp observation where the PHG is better synchronized to NTP time than the PHD is given [here](Observation-coin-example-1.html). An example where the PHD has a time fault is given [here](Observation-coin-example-timefault.html).
