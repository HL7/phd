---
title: Mder FLOATs and SFLOATs
layout: default
active: MderFLOATsandSFLOATs-2
---

Mder FLOATs and SFLOATs are the 11073 20601 means of encoding floating point numbers. The primary reason for this encoding is to indicate the precision of the measurement. The SFLOAT is 16-bits and the FLOAT is 32-bits. In the SFLOAT, the most significant 4 bits is the exponent and the remaining 12 bits the mantissa. In the FLOAT, the most significant byte is the exponent and the remaining 24 bits the mantissa. Both the exponent and mantissa are signed.

The exponent gives the precision. It indicates where the decimal point goes in the mantissa. A negative exponent of -*N* moves the decimal point to the left *N* places and a positive exponent of +*N* moves the decimal point to the right *N* places.

Thus, it is possible in this encoding to distinguish between the value 2, 2.0, 2.00, etc. Numerically, they all have the same value, but 2.00 indicates that the value is two but taken with a sensor that has a precision to the hundredths.

The table below gives some examples of SFLOAT values and how they shall be encoded into the FHIR valueQuantity.value:

|SFLOAT Hex|SFLOAT decimal|exponent|mantissa|FHIR encoding|
|-
|0x0002|2|0|2|2|
|0xF014|61460|-1|20|2.0|
|0xE0C8|57544|-2|200|2.00|
|0x1002|4098|1|2|20|
|0x2002|8194|2|2|200|
|0x00C8|200|0|200|200|
|0x04D2|1234|0|1234|1234|
|0x0B2E|2862|0|-1234|-1234|

In the FLOAT case the above values would be encoded as follows:

|FLOAT Hex|FLOAT decimal|exponent|mantissa|FHIR encoding|
|-
|0x00000002|2|0|2|2|
|0xFF000014|4278190100|-1|20|2.0|
|0xFE0000C8|4261413064|-2|200|2.00|
|0x01000002|4098|1|2|20|
|0x02000002|33554434|2|2|200|
|0x000000C8|200|0|200|200|
|0x000004D2|1234|0|1234|1234|
|0x00FFFB2E|16775982|0|-1234|-1234|

#### Special Values
The Mder encoding also has a set of 5 reserved special values which represent some type of error condition. They are as follows:

|FLOAT Case|SFLOAT case|meaning|FHIR encoding|
|-
|0x007FFFFF|0x7FF|Not a Number (NaN)|.dataAbsentReason set to 'NaN'|
|0x007FFFFE|0x7FE|Positive Infinity (+inf)|dataAbsentReason set to 'PINF'|
|0x00800002|0x802|Negative Infinity (-inf)|dataAbsentReason set to 'NINF'|
|0x00800000|0x800|Not at this resolution|dataAbsentReason set to 'error'|
|0x00800001|0x801|Reserved for future use|dataAbsentReason set to 'error'|