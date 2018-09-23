---
title: Phd BITs Coded Enumeration Observation Profile
layout: default
active: BITsEnumerationObservationProfile
---

The BITs Enumeration Observation Profile is used when the PHD metric measurement contains one of the following attributes:

|Attribute|Value|Additional Information|
|-
|Enum-Observed-Value-Simple-Bit-Str|32-bit value|Each bit in the 32-bit integer signifies some item|
|Enum-Observed-Value-Basic-Bit-Str|16-bit value|Each bit in the 16-bit integer signifies some item|
|Enum-Observed-Value|32-bit term code when a BITs|When this complex attribute is used the only option is for the 32-bit BITs field|

The Enum-Observed-Value-Simple/Basic-Bit-Str attribute is used when the measurement reports one or more events or states. Each bit in the 16 or 32-bit number may represent some state or event. The most common use of this type of measurement is for reporting device status events that influence the measurement. It is also used extensively in the Independent Living specialization to report states such as 'door open', 'door closed' or 'patient in room', 'patient out of room', etc. The measurement is generally used when there is the potential for more than one event or state to be set at the same time.

The Enum-Observed-Value attribute is a complex attribute and can be any one of the three possible enumeration measurements. There is an element in the structure which indicates which type of enumeration it is. If it is a 'BITs' type it reports only the 32-bit version. The attribute also has its own metric-id value telling what it is and status value. The metric-id value replaces the term code given by the Type attribute for the *type* of measurement (*not the measurement!*) and the status value replaces the Measurement-Status attribute.

The structure definition for this profile is

{{tree:phd/BITsEnumerationObservation}}

### Mapping BITs Enumerations to FHIR
FHIR has no data type that corresponds to this kind of measurement. Consequently Continua has developed a value set which maps the BITs measurement to a set of codes. The details of the mapping and how these codes are generated from data received from the PHD are given in [ASN1 BITS Code System]({{ output }}ASN1BITsCodeSystem.html). These codes are reported in the component element; one component per reported bit setting. Thus similar to the compound numerical measurement, there is no Observation.value[x] element. There may still be an Observation.dataAbsentReason element if a measurement status indicates a measurement failure in which case no component elements representing the BITs setting are reported.

In the following table, N is the *bit position* being reported. M is the *component element number* in the Observation. Since not all bits may be reported, M is always <= N. The notation "Type" is the 32-bit code reported in Observation.code.coding.code used in the ASN1 mapping to HL7 codes. Note that the term code of this value will come from the metric-id element when an Enum-Observed-Value attribute is reported.

Recall that only set bits of type 'event' need to be reported. If of type 'state' both set and cleared states need to be reported. Undefined bits are not reported. Unsupported bits (only available in the later versions of the 20601 spec) may be indicated.

|Attribute|FHIR coding|
|-
|Enum-Observed-Value-Basic-Bit_str.*bitN* <br/> where 0 <= *N* <= 15|Observation.component*M*.code.coding.code="Type.*N*"<br/> where *M* is the *M*th setting being reported<br/>Observation.component*M*.valueCodableConcept.coding.code="Y/N" if bit *N* is set/cleared|
|Enum-Observed-Value-Simple-Bit_str.*bitN* <br/> where 0 <= *N* <= 31|Observation.component*M*.code.coding.code<br/> where *M* is the *M*th setting being reported<br/>Observation.component*M*.valueCodableConcept.coding.code="Y/N" if bit *N* is set/cleared|
|Enum-Observed-Value.*bitN*<br/><br/> where 0 <= *N* <= 31<br/>Enum-Observed-Value.*metric-id*<br/>Enum-Observed-Value.*status*|Observation.component*N*.code.coding.code="Type.*N*" where *M* is the *M*th setting being reported<br/>Observation.component*M*.valueCodableConcept.coding.code="Y/N" if bit *N* is set/cleared<br/><br/>effects the Observation.component.code.coding.code "Type" see [Obtaining the Observation.code]({{ output }}ObtainingtheObservationcode2.html) <br/>see Measurement Status in [Phd Base Observation Profile]({{ output }}PhdBaseObservationProfile.html) |
|If reporting an unsupported bit *N*|Observation.component*M*.dataAbsentReason="unsupported"|

#### Conditional Create Identifier Generation
For a general description of the PHD Profile Identifier see the "PHD Profile Identifier" section in [Phd Base Profile]({{ output }}BaseObservationProfile.html). The table below lists the items that make up the identifier.

|Entry|value|Additional information|
|-
|device|"Phd Device.identifier.value"|This value is the PHD IEEE EUI-64 system identifier|
|patient|"Patient.identifier.value-Patient.identifier.system" or<br/>provided logical id|The dashes are part of the identifier. <br/>When the service provider gives the PHG a pre-determined patient logical id the PHG creates no Patient resource and has no patient information. In that special case the provided logical id is used|
|type|"Observation.code.coding.code"|See [Obtaining the Observation.code]({{ output }}ObtainingtheObservationcode2.html)|
|value|The raw 16-bit or 32-bit integer delivered by the PHD||
|reported PHD timestamp|"timestamp"|See [Generating the PHD Reported Time Stamp]({{ output }}CoincidentTimeStamp.html)|
|supplemental types|"Supplemental-Types.*N*-"|A sequence of 32-bit MDC codes separated by a dash|

The final identifier is made by concatenating the entries above as follows:
 - "device-patient-type-value-reported PHD timestamp-supplemental types"

### Additional Enumeration Measurement Information
There are no additional descriptive attributes that are unique to the Enumeration type of measurement.

