Note that this time stamp identifier is part of the Observation.identifier whose sole purpose is to perform a conditional create transaction. The identifier is not to be interpreted by a consumer of the resource and it should not be used for informational content.

This algorithm shows how a gateway generates the time stamp as reported by the PHD for use in the Observation.identifier element. The Observation.identifier element is used in the PHD profiles to perform conditional creates and thus eliminate data duplication.

- If the PHD timestamp reports a tick counter the reported value will be encoded as the number of seconds it represents according to its resolution. 
   - For example, when a Bluetooth GHS sensor reports a tick counter of 12345678 with a millisecond resolution this will be encoded as "12345.678".

- If the PHD timestamp reports local or UTC time the reported value will be encoded as the number of seconds it represents since 2000-01-01  according to its resolution.
   - For example, when a Bluetooth GHS sensor reports a local or UTC time of 2021-11-22 11:56:30 with a milliseconds resolution this will be encoded as "690897360.567"

- If the PHD timestamp reports a TZ/DST offset the reported value will be appended as a decimal value, including a + or - sign.
   - For example, when a Bluetooth GHS timestamp reports an offset of +4 (1 hour) this will be appended as "+4". Combined with the previous examples, this becomes "690897360.567+4"

- If the PHD Observation also includes a Measurement-duration attribute this will be appended to the endcoded timestamp as a ".." followed by the duration encoded according to the timestamp resolution.
   - For example a duration of 1 second with a millisecond resolution will be appended as "..1.000". Combined with the previous example this becomes "690897360.567+4..1.000"
 
 - [Next: The Coincident Time Stamp](CoincidentTimeStamp.html)
 - [Previous: The Observation Identifier](ObservationIdentifier.html)
