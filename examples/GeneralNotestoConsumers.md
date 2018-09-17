## General Notes to Consumers of FHIR Data
A consumer of the PHD profile resources will find most of the mapping is as expected if they are familar with the Patient, Device, and Observation resources. Though the specturm of PHDs is extensive, the generic modelling approach results in a similar set of elements being used in all cases, simplifying the reading task for the consumer. For example, the following elements are all that is needed to obtain the information for most measurments:


|Resource|element||
|-
|Observation|.code||
|Observation|.effectiveDateTime||
||.effectivePeriod||
|Observation|.valueQuantity.value||
||.valueCodeableConcept||
||.valueSampledData||
||--- *absent*|(*vector and BITs msmts*)|
|Observation|.component|.code|
|Observation|.component|.valueQuantity|
|||.valueCodeableConcept|