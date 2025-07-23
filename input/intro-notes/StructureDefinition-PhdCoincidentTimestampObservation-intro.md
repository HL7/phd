The Coincident Timestamp Observation Profile is used to compare the timelines of the PHD with the timeline of the PHG. The primary elements are the `Observation.effectiveDateTime`, which has the time of the PHG at the moment of generating the observation, and the `Observation.valueDateTime` or `Observation.valueQuantity`, which has the corresponding time of the PHD. The `valueDateTime` is used when the PHD uses a time-of-day clock, and the `valueQuantity` is used when the PHD uses a tick counter (relative time). The PHG reports its current time at the time it reads the current time of the PHD.

In remote patient monitoring, data can arrive from any location on the planet. Given that PHDs can be unsynchronized, have time clocks set by the user, default factory times, or no time clock at all, providing accurate timestamps to the healthcare provider is a challenge. The Coincident Timestamp Observation provides a mechanism to report the PHD clock status and links it to the timeline of the PHG.

For more details on the interpretation of the Coincident Timestamp, see the notes section below.

A PHD Observation may reference a Coincident Timestamp Observation if the measurement reported from the PHD contains a timestamp and is from the current timeline of the PHD and needed correction. It will not reference a Coincident Timestamp Observation if the measurement reported from the PHD contains no timestamp or is from an older timeline after which a time adjustment occurred.

A Coincident Timestamp Observation is created for every connection between PHG and PHD, so data duplication is not an issue. Therefore, the conditional create identifier element of this resource is not used in this profile.

If a PHD has its time clock altered during a connection, a new Coincident Timestamp Observation is generated, and all data sent after the adjustment will reference the new Coincident Timestamp Observation.
