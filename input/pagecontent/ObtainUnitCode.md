Observations and Observation Components that report quantities (Numerics and Sample Arrays) have units. 

Obtaining the unit in most cases is as simple as decoding the Unit-Code attribute. 

IEEE 11073-10206 unit codes are MDC values from partition 4 of IEEE 11073-10101. The FHIR encoder need to map these codes to the appropriate UCUM codes. 
A mapping can be found in the [RTMMS](https://rtmms.nist.gov/rtmms/index.htm) and in the latest version of IEEE 11073-10101.

In case the rare situation arises where a new unit has been introduced or the PHD uses a unit code that has not been previously used in PHD specializations, the FHIR encoder may use the MDC code in place of the UCUM code. In that case the FHIR encoder will need to create the 32-bit code from the 16-bit term code and the assumed partition value of 4.

 - [Next:ASN1 To HL7 Codesystem](CodeSystem-ASN1ToHL7.html)
 - [Previous: Obtaining the Observation.code](ObtainObservationCode.html)