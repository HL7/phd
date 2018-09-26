---
title: General Notes to Consumers of FHIR Data
layout: default
active: GeneralNotestoConsumers
---

A consumer of the PHD profile resources will find most of the mapping is as expected if they are familiar with the Patient, Device, and Observation resources. Though the spectrum of PHDs is extensive, the generic modeling approach results in a similar set of elements being used in all cases, simplifying the reading task for the consumer. For example, the following elements are all that is needed to obtain the information for most measurements:


|Resource|element|Meaning|
|-
|Observation|.code|Tells what the measurement is|
|Observation|.effectiveDateTime|Tells when the measurement was taken|
||.effectivePeriod||
|Observation|.valueQuantity.value|Gives the value of the measurement if a number|
||.valueCodeableConcept|Gives the value of the measurement if a code|
||.valueSampledData|Gives the values when the measurements are a periodic sequence|
||*absent with dataAbsentReason*|value has an error|
||*absent with no dataAbsentReason*|indicates the measurement is a vector or set of binary (set/cleared) events or states and is found in component elements|
|Observation|.component.code|Tells what the individual vector sub-value is or event/state is|
|Observation|.component.valueQuantity|gives the sub value when the measurement is a vector|
||.valueCodeableConcept|gives whether the event or state is set or cleared|
||*absent*|a dataAbsentReason indicates the sub value is in error or the event/state is unsupported|

 - [Next: DIM to FHIR Mapping Details]({{ output }}DIMtoFHIRMappingDetails.html)
 - [Previous: DIM to FHIR Mapping; Basics]({{ output }}DIMtoFHIRMapping.html)
