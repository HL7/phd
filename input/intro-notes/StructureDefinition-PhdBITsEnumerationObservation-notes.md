The fololwing sections give more details on the mapping of BITS to a FHIR Observation resource.

### Mapping BITs Enumerations to FHIR
FHIR has no data type that corresponds to this kind of measurement. Consequently we developed a code system which maps the BITs measurement to a set of codes. The details of the mapping and how these codes are generated from data received from the PHD are given in [ASN1 To HL7 Codesystem](CodeSystem-ASN1ToHL7.html). These codes are reported in the component element; one component per reported bit setting. Thus similar to the compound numerical measurement, there is no Observation.value[x] element. There may still be an Observation.dataAbsentReason element if a measurement status indicates a measurement failure in which case no component elements representing the BITs setting are reported. 

<style>table, th, td {
border: 1px solid black;
border-collapse:collapse;
padding: 6px;}</style>

| IEEE 11073-10206 Observation Attribute | FHIR coding |
|--|--|
| state: Boolean[0..N]  | for *i*=0..N <br/> Observation.component[*i*].code.coding.code=”Type.*i*“  <br/> Observation.component[*i*].code.coding.system=”http://hl7.org/fhir/uv/phd/CodeSystem/ASN1ToHL7”  <br/> Observation.component[*i*].valueCodableConcept.coding.code=”Y"\|"N” if bit *i* is set\|cleared  <br/> Observation.component[*i*].valueCodableConcept.coding.system=”http://terminology.hl7.org/CodeSystem/v2-0136”|

When mapping Bluetooth GHS bitstring Observation values only supported bits are reported. For bits of type 'event' only set bits need to be reported. If of type 'state' both set and cleared states need to be reported. This means that some bits can be skipped and that the index of the FHIR component *j* can be smaller than the index *i* of the bit in the GHS bitstring.

| Bluetooth GHS Observation Attribute | FHIR coding |
|--|--|
| state: Boolean[0..N]  | for *i*=0..N <br/> if supported[*i*] <br/> if isState[*i*] or isSet[*i*] <br/> &nbsp; Observation.component[*j*].code.coding.code=”Type.*i*“  <br/> &nbsp; Observation.component[*j*].code.coding.system=”http://hl7.org/fhir/uv/phd/CodeSystem/ASN1ToHL7”  <br/> &nbsp; Observation.component[*j*].valueCodableConcept.coding.code=”Y"\|"N” if bit *i* is set\|cleared  <br/> &nbsp; Observation.component[*j*].valueCodableConcept.coding.system=”http://terminology.hl7.org/CodeSystem/v2-0136” <br/> else *skip bit i* |

Below is an example of one Observation.component element containing one of the perhaps several bit settings from a pulse oximeter device and sensor status measurement:
<pre>
component": [
    {
        "code": {
            "coding": [
                {
                    "system": "http://hl7.org/fhir/uv/phd/CodeSystem/ASN1ToHL7",
                    "code": "150604.2"
                }
            ],
            "text": "sensor-displaced"
        },
        "valueCodeableConcept": {
            "coding": [
                {
                    "system": "http://terminology.hl7.org/CodeSystem/v2-0136",
                    "code": "Y"
                }
            ],
            "text": "Sensor is incorrectly placed on user"
        }
}
</pre>
There would be one such component element for every bit setting to be reported. If one examines the [ASN1 To HL7 Codesystem](CodeSystem-ASN1ToHL7.html) one will see that the code 150604.2 means "Sensor is incorrectly placed on user".

#### Conditional Create Identifier Generation
For a general description of the PHD Observation Identifier see the "PHD Observation Identifier" section in [PHD Base Observation Profile](StructureDefinition-PhdBaseObservation.html). The table below lists the items that make up the identifier.

|Entry|value|Additional information|
|-
|device|"PHD Device.identifier.value"|This value is the PHD IEEE EUI-64 system identifier|
|patient|"Patient.identifier.value-Patient.identifier.system" or<br/>provided logical id|The dashes are part of the identifier. <br/>When the service provider gives the PHG a pre-determined patient logical id the PHG creates no Patient resource and has no patient information. In that special case the provided logical id is used|
|type|"Observation.code.coding.code"|See [Obtaining the Observation.code](ObtainObservationCode.html)|
|value|The raw 16-bit or 32-bit integer delivered by the PHD||
|reported PHD timestamp|"timestamp"|See [Generating the PHD Reported Time Stamp](GeneratingtheReportedTimeStampIdentifier.html)|
|Supplemental Information|"Supplemental-Types.*N*-"|A sequence of 32-bit MDC codes separated by a dash|

The final identifier is made by concatenating the entries above as follows:
 - "device-patient-type-value-reported PHD timestamp-Supplemental Information"

### Additional Enumeration Measurement Information
There are no additional descriptive attributes that are unique to the Enumeration type of measurement.

### Examples:

A BITs observation example from a pulse oximeter is shown in [BITs Observation Example](Observation-bits-observation.html). This observation results when the pulse oximeter is having difficulty obtaining the measurement, perhaps due to motion or position of the finger in the sensor, a bad signal, etc.


