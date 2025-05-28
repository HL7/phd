The fololwing section gives more details on the mapping of BITS to a FHIR Observation resource.

### Mapping BITs Enumerations to FHIR
FHIR has no data type that corresponds to this kind of measurement. Consequently we developed a code system which maps the BITs measurement to a set of codes. The details of the mapping and how these codes are generated from data received from the PHD are given in [ASN1 To HL7 Codesystem](CodeSystem-ASN1ToHL7.html). Basically each component has a code consisting of the MDC code followed by the bit number. There is one component per reported bit setting. And similar to the compound measurement, there is no Observation.value[x] element. Each component has a value of "Y" or "N", corresponding to the bit being set or cleared.

There may be an Observation.dataAbsentReason element if a measurement status indicates a measurement failure in which case no component elements representing the BITs setting are reported. 

When mapping Bluetooth GHS bitstring Observation values only supported bits are reported. For bits of type 'event' only set bits need to be reported. If of type 'state' both set and cleared states need to be reported. This means that some bits can be skipped and that the number FHIR Observation can be smaller than the number of bits in the GHS bitstring.

Below is an example of one Observation.component element containing one of the perhaps several bit settings from a measurement:
{% fragment Observation/bpm-status JSON EXCEPT:component[0] %}


