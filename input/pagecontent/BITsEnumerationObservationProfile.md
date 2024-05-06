The BITs Enumeration Observation Profile is used when the PHD metric measurement is an integer where each bit represents an event or a state. PHDs typically send this kind of measurement when more than one event or state can occur simultaneously. If the event or states are mutually exclusive, the coded form of the measurement is typically used instead.

The measurement is a BITs state and/or event set when the PHD metric contains one of the following attributes:

<style>table, th, td {
border: 1px solid black;
border-collapse:collapse;
padding: 6px;}</style>

|Attribute|Value|Additional Information|
|-
|Enum-Observed-Value-Simple-Bit-Str|32-bit value|Each bit in the 32-bit integer signifies some item|
|Enum-Observed-Value-Basic-Bit-Str|16-bit value|Each bit in the 16-bit integer signifies some item|
|Enum-Observed-Value|32-bit term code when a BITs|When this complex attribute is used the only option is for the 32-bit BITs field|

The Enum-Observed-Value-Simple/Basic-Bit-Str attribute is used when the measurement reports one or more events or states. Each bit in the 16 or 32-bit number may represent some state or event. The most common use of this type of measurement is for reporting device status events that influence the measurement. It is also used extensively in the Independent Living specialization to report states such as 'door open', 'door closed' or 'patient in room', 'patient out of room', etc. The measurement is generally used when there is the potential for more than one event or state to be set at the same time.

The Enum-Observed-Value attribute is a complex attribute and can be any one of the three possible enumeration measurements. There is an element in the structure which indicates which type of enumeration it is. If it is a 'BITs' type it reports only the 32-bit version. The attribute also has its own metric-id value telling what it is and status value. The metric-id value replaces the term code given by the Type attribute for the *type* of measurement and the status value replaces the Measurement-Status attribute.

The structure definition for this profile is given [here](StructureDefinition-PhdBitsEnumerationObservation.html)

### Mapping BITs Enumerations to FHIR
FHIR has no data type that corresponds to this kind of measurement. Consequently Continua has developed a code system which maps the BITs measurement to a set of codes. The details of the mapping and how these codes are generated from data received from the PHD are given in [ASN1 BITS Code System](ASN1BITsCodeSystem.html). These codes are reported in the component element; one component per reported bit setting. Thus similar to the compound numerical measurement, there is no Observation.value[x] element. There may still be an Observation.dataAbsentReason element if a measurement status indicates a measurement failure in which case no component elements representing the BITs setting are reported.

In the following table, N is the *bit position* being reported. M is the *component element number* in the Observation. Since not all bits may be reported, M is always <= N. The notation "Type" is the 32-bit code reported in Observation.code.coding.code used in the ASN1 mapping to HL7 codes. Note that the term code of this value will come from the metric-id element when an Enum-Observed-Value attribute is reported.

Recall that only set bits of type 'event' need to be reported. If of type 'state' both set and cleared states need to be reported. Undefined bits are not reported. Unsupported bits (only available in the later versions of the 20601 spec) may be indicated.

|Attribute|FHIR coding|
|-
|Enum-Observed-Value-Basic-Bit_str.*bitN* <br/> where 0 <= *N* <= 15|Observation.component*M*.code.coding.code="Type.*N*"<br/> where *M* is the *M*th setting being reported<br/>Observation.component*M*.code.coding.system="http://hl7.org/fhir/uv/phd/CodeSystem/ASN1ToHL7"<br/> where *M* is the *M*th setting being reported<br/>Observation.component*M*.valueCodableConcept.coding.code="Y/N" if bit *N* is set/cleared</br>Observation.component*M*.valueCodableConcept.coding.system="http://terminology.hl7.org/CodeSystem/v2-0136"<br/> where *M* is the *M*th setting being reported|
|Enum-Observed-Value-Simple-Bit_str.*bitN* <br/> where 0 <= *N* <= 31|Observation.component*M*.code.coding.code<br/> where *M* is the *M*th setting being reported<br/>Observation.component*M*.code.coding.system="http://hl7.org/fhir/uv/phd/CodeSystem/ASN1ToHL7"<br/> where *M* is the *M*th setting being reported<br/>Observation.component*M*.valueCodableConcept.coding.code="Y/N" if bit *N* is set/cleared</br>Observation.component*M*.valueCodableConcept.coding.system="http://terminology.hl7.org/CodeSystem/v2-0136"<br/> where *M* is the *M*th setting being reported|
|Enum-Observed-Value.*bitN*<br/><br/> where 0 <= *N* <= 31<br/>Enum-Observed-Value.*metric-id*<br/>Enum-Observed-Value.*status*|Observation.component*N*.code.coding.code="Type.*N*" where *M* is the *M*th setting being reported<br/>Observation.component*M*.code.coding.system="http://hl7.org/fhir/uv/phd/CodeSystem/ASN1ToHL7"<br/> where *M* is the *M*th setting being reported<br/>Observation.component*M*.valueCodableConcept.coding.code="Y/N" if bit *N* is set/cleared<br/>Observation.component*M*.valueCodableConcept.coding.system="http://terminology.hl7.org/CodeSystem/v2-0136"<br/> where *M* is the *M*th setting being reported<br/><br/>effects the Observation.component.code.coding.code "Type" see [Obtaining the Observation.code](ObtainObservationCode.html) <br/>see Measurement Status in [Phd Base Observation Profile](BaseObservationProfile.html) |
|If reporting an unsupported bit *N*|Observation.component*M*.dataAbsentReason="unsupported"|

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
There would be one such component element for every bit setting to be reported. Of one examines the ASN1ToHL7 code system [here](ASN1BITsCodeSystem.html) one will see that the code 150604.2 means "Sensor is incorrectly placed on user".

#### Conditional Create Identifier Generation
For a general description of the PHD Observation Identifier see the "PHD Observation Identifier" section in [PHD Base Observation Profile](BaseObservationProfile.html). The table below lists the items that make up the identifier.

|Entry|value|Additional information|
|-
|device|"PHD Device.identifier.value"|This value is the PHD IEEE EUI-64 system identifier|
|patient|"Patient.identifier.value-Patient.identifier.system" or<br/>provided logical id|The dashes are part of the identifier. <br/>When the service provider gives the PHG a pre-determined patient logical id the PHG creates no Patient resource and has no patient information. In that special case the provided logical id is used|
|type|"Observation.code.coding.code"|See [Obtaining the Observation.code](ObtainObservationCode.html)|
|value|The raw 16-bit or 32-bit integer delivered by the PHD||
|reported PHD timestamp|"timestamp"|See [Generating the PHD Reported Time Stamp](GeneratingtheReportedTimeStampIdentifier.html)|
|supplemental types|"Supplemental-Types.*N*-"|A sequence of 32-bit MDC codes separated by a dash|

The final identifier is made by concatenating the entries above as follows:
 - "device-patient-type-value-reported PHD timestamp-supplemental types"

### Additional Enumeration Measurement Information
There are no additional descriptive attributes that are unique to the Enumeration type of measurement.

### Examples:

A BITs observation example from a pulse oximeter is shown in [Device Sensor Issues](BITsDevSensor.html). This observation results when the pulse oximeter is having difficulty obtaining the measurement, perhaps due to motion or position of the finger in the sensor, a bad signal, etc.

### The Other Profiles

 - [Profiles Overview](ProfilesOverview.html)
 - [Base Observation Profile](BaseObservationProfile.html)
 - [Numeric Observation Profile](NumericObservationProfile.html)
 - [Compound Numeric Observation Profile](CompoundNumericObservationProfile.html)
 - [Coded Enumeration Observation Profile](CodedEnumerationObservationProfile.html)
 - [Rtsa Observation Profile](RtsaObservationProfile.html)
 - [String Enumeration Observation Profile](StringEnumerationObservationProfile.html)
 - [Coincident Time Stamp Observation Profile](CoincidentTimeStampObservationProfile.html)
 - [Phd Device Profile](PhdDeviceProfile.html)
 - [Phg Device Profile](PhgDeviceProfile.html)
 - [Patient Profile](PhdPatientProfile.html)

