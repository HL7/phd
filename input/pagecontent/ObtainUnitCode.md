Measurements that are quantities (numerics and real-time-sample-arrays) may have units.

Obtaining the units in most cases is a simple as decoding the Unit-Code attribute. However, the Nu-Observed-Value and Compound-Nu-Observed-Value attributes have their own unit code, and this value overrides the value in the Unit-Code attribute. When these attributes are received applications will need to obtain the unit code from the unit-code substructure.

11073-20601 unit codes are 11073-10101 MDC values in partition DIM which has a value of 4. The partition value is assumed in the 20601 exchanges and only the term code value of the units is sent. The FHIR encoder will, nevertheless, need to map these codes to the appropriate UCUM codes. In case the rare situation arises where a new unit has been introduced or the PHD uses a unit code that has not been previously used in PHD specializations, the FHIR encoder may use the MDC code in place of the UCUM code. In that case the FHIR encoder will need to create the 32-bit code from the term code and the assumed partition value of 4.

At the current time there is no balloted mapping of MDC to UCUM but there is ongoing work in the [RTMMS](https://rtmms.nist.gov/rtmms/index.htm) and the latest version of IEEE 11073-10101.

 - [Next: ASN1 BITS Code System](ASN1BITsCodeSystem.html)
 - [Previous: Obtaining the Observation.code](ObtainObservationCode.html)