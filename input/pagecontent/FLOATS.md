IEEE 11073 uses ASN.1 MDER (Medical Device Encoding Rules) to encode floating point numbers in FLOAT or SFLOAT structures. The primary reason for this encoding is to indicate the precision of the measurement. The FLOAT is 32-bits and the SFLOAT is 16-bits. In the FLOAT, the most significant byte is the exponent and the remaining 24 bits the mantissa. Both the exponent and mantissa are signed. In the SFLOAT, the most significant 4 bits is the exponent and the remaining 12 bits the mantissa.

The exponent gives the precision. It indicates where the decimal point goes in the mantissa. A negative exponent of -*N* moves the decimal point to the left *N* places and a positive exponent of +*N* moves the decimal point to the right *N* places.

Thus, it is possible in this encoding to distinguish between the value 2, 2.0, 2.00, etc. Numerically, they all have the same value, but 2.00 indicates that the value is two but taken with a sensor that has a precision to the hundredths.

The Bluetooth GHS specifications only use FLOATs to encode quantitative values; the IEEE 11073-20601 specification uses both FLOATs and SFLOATs.

#### FLOAT Encoding
The table below gives some examples of FLOAT values and how they shall be encoded into the FHIR valueQuantity.value:

<style>table, th, td {
border: 1px solid black;
border-collapse:collapse;
padding: 6px;}</style>
|FLOAT Hex|FLOAT decimal|exponent|mantissa|FHIR encoding|
|---|---|---|---|---|
|0x00000002|2|0|2|2|
|0xFF000014|4278190100|-1|20|2.0|
|0xFE0000C8|4261413064|-2|200|2.00|
|0x01000002|4098|1|2|20|
|0x02000002|33554434|2|2|200|
|0x000000C8|200|0|200|200|
|0x000004D2|1234|0|1234|1234|
|0x00FFFB2E|16775982|0|-1234|-1234|


#### SFLOAT Encoding
In the SFLOAT case the above values would be encoded as follows:

|SFLOAT Hex|SFLOAT decimal|exponent|mantissa|FHIR encoding|
|---|---|---|---|---|
|0x0002|2|0|2|2|
|0xF014|61460|-1|20|2.0|
|0xE0C8|57544|-2|200|2.00|
|0x1002|4098|1|2|20|
|0x2002|8194|2|2|200|
|0x00C8|200|0|200|200|
|0x04D2|1234|0|1234|1234|
|0x0B2E|2862|0|-1234|-1234|

#### Special FLOAT and SFLOAT Values
The special values are used to indicate that the sensor was unable to acquire a valid measurement. The `Observation.dataAbsentReason` element is used to indicate the meaning of the special value. The `Observation.value[x]` element is not populated when a special value is reported.

<style>table, th, td {
border: 1px solid black;
border-collapse:collapse;
padding: 6px;}</style>
|FLOAT Hex|SFLOAT Hex|Meaning|FHIR Mapping|
|---|---|---|---|
|0x007FFFFF|0x7FF|Not a Number (NaN)|`not-a-number`|
|0x007FFFFE|0x7FE|Positive Infinity (+Inf)|`positive-infinity`|
|0x00800002|0x802|Negative Infinity (-Inf)|`negative-infinity`|
|0x00800000|0x800|Not at this resolution (NRes)|`error`|
|0x00800001|0x801|Reserved for future use (RFU)|`error`|

**Explanation of Special Values:**
- **NaN (Not a Number)**: Indicates an invalid result from the measurement process used by the PHD.
- **NRes (Not at this resolution)**: Indicates that the value cannot be represented with the supported range and resolution of the PHD. For example, a body thermometer supporting values between 30°C and 45°C may report NRes if used in freezing or boiling water.
