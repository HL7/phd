Further notes on the elements of the PhdCoincidentTimeObservation resource:

### Code
The code element is used to report the type of time clock used by the PHD. The PHG obtains the type of time clock and its current setting by inspecting the PHD measurement timestamp and current time. The ACOM clock types are mapped as follows:

<style>table, th, td {border: 1px solid black; border-collapse:collapse; padding: 6px;}</style>
|ACOM clock type|`Observation.code.coding`|
|--- |---|
|Wall Clock with DST and Time Zone offset|Mdc#68225|
|Wall Clock without DST and Time Zone offset|Mdc#67975|
|Time counter|Mdc#67983|

### PHG Current Time &rarr; `Observation.effectiveDateTime`
The PHG is required to have the capability to report local time and offset to UTC. The PHG records its current time in the `Observation.effectiveDateTime` element regardless of the type of time clock used by the PHD unless the PHD has superior time synchronization than the PHG. In that case, the `Observation.effective[x]` element is not populated.

### PHD Current Time &rarr; Observation.value[x]
If the PHD uses a wall clock, the current time of the PHD is reported in an `Observation.valueDateTime` element. FHIR requires the presence of an offset to UTC, so if the PHD does not provide that, the PHG adds its offset to the value. It is reasonable to assume that the PHD and PHG are in the same time zone and thus have the same offset to UTC. However, PHDs can be mobile, and if the PHD is reporting an offset, the offset reported by the PHD is used even if it is NOT the offset of the PHG.

If the PHD uses a time counter, the current tick time is reported in an `Observation.valueQuantity` element scaled to microseconds or milliseconds as appropriate for the resolution of the counter.

### Mapping Tick Counters
PHDs may also use tick counters of a specified resolution that report a tick count or relative time. GHS supports resolutions of 1 second to 100 microseconds. With relative times, there is no check for which device is better synchronized. The PHG must always map the value to UTC plus offset. The PHD's current time is reported in the `Observation.valueQuantity` element scaled to the tick counter's resolution. This time provides the anchor time allowing the PHG to map the relative times reported in measurements to its own timeline in UTC plus offset format.

A relative timestamp value in a measurement is mapped to UTC plus offset by taking the difference between the measurement timestamp and the synchronization point's relative time. That difference is added to the synchronization point's UTC time plus offset.

### PHD synchronization method &rarr; `Observation.component.valueCodeableConcept`
The PHD synchronization method is reported in the `Observation.component.valueCodeableConcept` element. The code is a code from the [MDC Time Synchronization Methods](ValueSet-MDCTimeSyncMethods.html) value set. The synchronization method is present in the timestamps supported by GHS and ACOM.

If the PHD has a time fault, the `Observation.value[x]` element is absent, and an `Observation.dataAbsentReason.coding.code` element is present with the code "unknown". A time fault is reported when the PHD reports its clock is unsynchronized and when a PHD measurement indicates an unsynchronized clock.

### Device
The `Observation.device` element is a reference to the Device resource representing the PHG that generated the coincident timestamp.

### Logic to Report Coincident Timestamps

The PHG may use the following logic to report Coincident Timestamps and adjust PHD observation timestamps, assuming the PHD and PHG are in close proximity and share the same UTC time zone and DST offset:

#### Case 1: PHD Does **Not** Report Timestamps in Measurements
- No Coincident Timestamp Observation is created for the measurement.
- *The PHG uses the time of reception as the measurement timestamp.*

#### Case 2: PHD Measurement Reports a Timestamp **Not** from Its Current Timeline
- The PHG reports its current time in the Coincident Timestamp `Observation.effectiveDateTime` element.
- The Coincident Timestamp `Observation.value[x]` element is left empty.
- The Coincident Timestamp `dataAbsentReason` is set to `unknown`.
- If the PHD measurement timestamp contains a UTC or local time and reports being externally synchronized:
  - *The PHG reports the PHD measurement timestamps, correcting only for time zone and DST offset as needed.*
- Otherwise:
  - If the PHD measurement timestamp reports a tick counter (relative time) or indicates it is not externally synchronized:
    - The PHG cannot produce a meaningful timestamp for the measurement.
    - *The PHG either reports an observation without an `effective[x]` element or chooses not to report the observation.*

#### Case 3: PHD Measurement Reports a Timestamp from Its Current Timeline
- If the PHD measurement timestamp contains a UTC or local time and reports being externally synchronized:
  - If the PHG is better synchronized than the PHD:
    - The PHG's current time is reported in the `Observation.effectiveDateTime` element.
    - The PHD's current time is reported in the `Observation.valueDateTime` element.
    - *The PHG adjusts the measurement timestamps from the PHD's current timeline by the difference.*
  - If the PHD is better synchronized than the PHG:
    - The PHG's current time is not reported, leaving the `Observation.effectiveDateTime` element empty.
    - The PHD's current time is reported in the `Observation.valueDateTime` element.
    - *The PHG reports the PHD measurement timestamps, correcting for time zone and DST offset as needed.*
- Otherwise:
  - If the PHD observation contains a tick counter (relative time) or is not externally synchronized:
    - The PHG's current time is reported in the `Observation.effectiveDateTime` element.
    - The PHD's corresponding time is reported in the `Observation.valueDateTime` or `Observation.valueQuantity` element.
    - *The PHG maps the PHD measurement timestamp to its own timeline using the Coincident Timestamp as an anchor point.*

#### Example
Suppose the PHG reads the current time of the PHD and finds it is six minutes behind its own time. If the PHG is better synchronized to NTP, it will add six minutes to all timestamps reported by the PHD on its current timeline.
