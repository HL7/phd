In remote patient monitoring, data can arrive to the health care provider from any location on the planet. Given that PHDs can be unsynchronized, or have time clocks set by the user, or default factory times, or no time clock at all, and no time zone information, providing accurate timestamps to the health care provider is a challenge.  The Coincident Timestamp Observation provides a mechanism to report the PHD clock status and links it to the timeline of the PHG.

The Coincident Timestamp is a measurement taken by the PHG of the current time of the PHD at the current time of the PHG. If the PHG is better synchronized to NTP (Network Time Protocol) time than the PHD, the PHG corrects the measurement times reported by the PHD by the difference between the two timelines. In other words, the PHG places the measurements on its timeline. A PHG compliant to this IG shall have the capability to synchronize to UTC and shall support a local time and DST offset. This enables a PHG to set the PHD's clock to a synchronized state.

The time capabilities of the PHD and PHG are in the PHD Device and PHG Device resource property elements, respectively. The status of the PHD clock is present in the data elements of the Coincident Timestamp. From these elements one can determine whether the PHG or PHD is better synchronized.

### Coincident Timestamp Basics
The coincident timestamp is a measurement of the current time of the PHD at the current time of the PHG. PHD Observation resources reference the Coincident Timestamp Observation in the Observation.extension.valueReference element in the [Coincident Timestamp Reference extension](StructureDefinition-CoincidentTimeStampReference.html)

The PHG uses the following logic to report Coincident Timestamps and to adjust PHD observation timestamps under the assumption that PHD and PHG have the same UTC time zone and DST offset:

- If the PHD does **not** report timestamps in a measurement
  - there is no Coincident Timestamp Observation for the measurement 
  - *the PHG uses the time of reception as the measurement timestamp*
- If the PHD measurement does report a timestamp that **is not** from its current timeline:
  - The time of the PHG is reported in the Coincident Timestamp Observation.effectiveDateTime element
  - The Coincident Timestamp Observation.value[x] element is empty
  - The Coincident Timestamp dataAbsentReason is set to "unknown"
  - If the PHD measurement timestamp contains a UTC or local time and reports being externally synchronized 
    - *The PHG reports the timestamps of the PHD measurement, corrected for time zone and DST offset as needed*
  - Else
    - The PHD measurement times stamp reports a tick counter (releative time) or reports not being externally synchronized
    - The PHG is unable to produce a meaningful timestamp for the measurement
    - *The PHG reports an observation without an effective[x] element or chooses not to report the observation*
- If the PHD measurement does report a timestamp that **is** from its current timeline:
  - If the PHD measurement timestamp contains a UTC or local time and reports being externally synchronized
    - If the PHG is better synchronized than the PHD
      - The current time of the PHG is reported in the Observation.effectiveDateTime element
      - The current time of the PHD is reported in the Observation.valueDateTime element
      - *The PHG corrects the measurement timestamps from the PHD's current timeline by the difference*
    - If the PHD is better synchronized than the PHG 
      - The current time of the PHG is not reported and the Observation.effectiveDateTime element is empty
      - The current time of the PHD is reported in the Observation.valueDateTime element
      - *The PHG reports the timestamps of the PHD measurement, corrected for time zone and DST offset as needed*
  - Else
    - The PHD observation contains a tick counter (releative time) or is not externally synchronized
    - The time of the PHG is reported in the Observation.effectiveDateTime element
    - The corresponding time of the PHD is reported in the Observation.valueDateTime or Observation.valueQuantity element
    - *The PHG maps the PHD measurement timestamp to its own timeline by using the Coincident Timestamp as a anchor point between the two timelines*
```

As an example, say the PHG reads the current time of the PHD and sees that it is six minutes behind it's time. If the PHG is better synchronized to NTP, the PHG will add six minutes to all the timestamps reported by the PHD on its current timeline. 

### Mapping Tick Counters
PHDs may also use tick counters of a specified resolution that report a tick count or relative time. GHS supports resolutions of 1 second to 100 microseconds. With relative times there is no check for which device is better synchronized. The PHG must always map the value to UTC plus offset. The PHD's current time is reported in the Observation.valueQuantity element scaled to the tick counter's resolution. This time provides the anchor time allowing the PHG to map the relative times reported in measurements to its own timeline in UTC plus offset format.

A relative timestamp value in a measurement is mapped to UTC plus offset by taking the difference between the measurement timestamp and the synchronisation point's relative time. That difference is added to the synchronisation point's UTC time plus offset. For example, if the PHD is using the 1 millisecond relative time and the PHG obtains the current relative time 'anchor' value of 100000 at the PHG's current time 'anchor' value of 2017/11/27 05:31:44.555 -0500 then the PHG can map a measurement timestamp of 108000 to an actual time of 2017/11/27 05:31:52.555 -0500 since 108000 - 100000 = 8000 milliseconds.

