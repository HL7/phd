---
title: Coincident Time Stamp
layout: default
active: CoincidentTimeStamp
---

In remote patient monitoring, data can arrive to the health care provider from any location on the planet. Given that PHDs are often unsynchronized, or have time clocks set by the user, or default factory times, or no time clock at all, and no time zone information, providing accurate time stamps to the health care provider is a challenge. There is an article published “Designing robust and reliable timestamps for remote patient monitoring”, J of Biomedical and Health Informatics, 19(5): 1718-1723, 2015 by Clarke, et.al. concerning this topic. Continua introduced additional guidelines to address this time reporting issue when propagating PHD data to remote destinations. The guidelines also address a means to report how reliable the time stamps are and a means to recover the original time stamps as reported by the PHD. This information is contained in the Coincident Time Stamp and appears in both Continua PCD-01 HL7 V2 messages and now FHIR.

The Coincident Time Stamp is a measurement taken by the PHG of the current time of the PHD at the current time of the PHG. If the PHG is better synchronized to NTP time than the PHD (which is currently the case for every market device), the PHG corrects the measurement times reported by the PHD by the difference between the two timelines. In other words, the PHG places the measurements on its time line. Since a Continua PHG is required to have the capability to synchronize to UTC and local time offset, many PHDs simply require the PHG to set its time, automatically synchronizing the two time lines. 11073 20601 PHDs are required to provide all measurements on a contiguous time line, so any time adjustment, whether by user or PHG, is reported in base-time offsets or date-time-adjustments. These events may require the PHG to create new Coincident Time Stamps.

The time properties of the PHD and PHG are in the PHD Device and PHG Device resource property elements, respectively. From these properties one can determine whether the PHG or PHD is better synchronized to NTP.

Observation resources reference the Coincident Time Stamp Observation in the Observation.derivedFrom element.

### Coincident Time Stamp Basics
The coincident time stamp is a measurement of the current time of the PHD at the current time of the PHG. The information is reported in a special Observation resource following the Coincident Time Stamp Observation profile and referenced in the PHD Observation.derivedFrom element. When the PHG uses Absolute time or Base Offset time or no time at all the algorithm is as follows:

- If the PHG is better synchronized to NTP than the PHD
  - The current time of the PHG is reported in the Observation.effectiveDateTime element
  - The current time of the PHD is reported in the Observation.valueDateTime element
  - *The PHG corrects the measurement time stamps of the PHD by the difference*
- If the PHD is better synchronized to NTP than the PHG 
  - The current time of the PHG is not reported and the Observation.effectiveDateTime element is empty
  - The current time of the PHD is reported in the Observation.valueDateTime element
  - *The PHG reports the time stamps of the PHD unchanged*
- If the PHD does not report time stamps in its measurements, there is no Coincident Time Stamp Observation for this measurement and *the PHG uses the time of reception as the measurement time stamp*
- If the PHD does not report a current time but still reports time stamps in its measurement a **time fault** is indicated and
  - The current time of the PHG is reported in the Observation.effectiveDateTime element
  - The Observation.valueDateTime element is empty
  - The dataAbsentReason is set to "unknown"
  - *The PHG reports the time stamps of the PHD unchanged*
- If the PHD indicates a time fault
  - The current time of the PHG is reported in the Observation.effectiveDateTime element
  - The Observation.valueDateTime element is empty
  - The dataAbsentReason is set to "unknown"
  - *The PHG reports the time stamps of the PHD unchanged*

As an example, say the PHG reads the current time of the PHD and sees that it is six minutes behind it's time. If the PHG is better synchronized to NTP, the PHG will add six minutes to all the time stamps reported by the PHD. Note that the 'Observation' indicated above is for the Coincident Time Stamp Observation and not the measurement Observation.
### Handling Relative times
PHDs may also use one of two relative time clocks. One clock uses a 32-bit number to report time ticks in units of 1/8th millisecond and the other uses a 64-bit number to report time ticks in microseconds. With relative times there is no check for which device is better synchronized to NTP. The PHG must always map the value to UTC plus offset. The PHD's current time is reported in the Observation.valueQuantity element scaled to units of microseconds. This time provides the anchor time allowing the PHG to map the relative times reported in measurements to UTC plus offset.

A relative time stamp value in a measurement is mapped to UTC plus offset by taking the difference between the measurement time stamp and the anchor relative time. That difference is added to the anchor UTC time plus offset. For example, if the PHD is using the 1/8th millisecond relative time and the PHG obtains the current relative time 'anchor' value of 100000 at the PHG's current time 'anchor' value of 2017/11/27 05:31:44.555 -0500 then the PHG can map a measurement time stamp of 108000 to an actual time of 2017/11/27 05:31:45.555 -0500 since 108000 - 100000 = 8000 (one second).

Time faults are reported in the same manner as when PHDs use Absolute or Base-Offset time; the Observation.valueQuantity is empty and the dataAbsentReason is set to "unknown".

 - [Next: Non-11073 20601 Devices]({{ output }}Non1107320601Devices.html)
 - [Previous: Generating the Reported Time Stamp Observation Identifier]({{ output }}GeneratingtheReportedTimeStampIdentifier.html)

