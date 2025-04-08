This profile is used to map ACOM Numeric Observations.  The measured value is reported as a floating number with an optional accuracy. In GHS the value is encoded as an IEEE 11073 FLOAT that indicates both precision and the number of significant digits. The Observation.valueQuantity.value element is required to honor the reported precision. See [Mder FLOATs and SFLOATs](MderFLOATsandSFLOATs.html) for instructions on handling S/FLOATs and their encoding to the valueQuantity .

### Mapping Numerics to FHIR
The following table shows how the numeric attributes are mapped to FHIR. Since the FHIR Quantity also contains the units the Unit-Code attribute value is required to complete the picture. The MDC unit code needs to be mapped to UCUM. In most cases this mapping is straight forward, but there can be some examples which are tricky. The MDC_DIM_TICK for the RR interval is just the number of ticks. However, the tick unit is given by the MDS attribute MDC_ATTR_TICK_RES which is the number of ticks per second. So if MDC_ATTR_TICK_RES is 2048 and the RR measurement is 3092, that means the RR interval is 1.5 seconds. One could also express the measurement in Hertz. When the units are converted in this manner, the value must be converted appropriately.

<style>table, th, td {
border: 1px solid black;
border-collapse:collapse;
padding: 6px;}</style>

|Attribute|FHIR coding|
|-
|Basic-Nu-Observed-Value.*value*<br/>Unit-Code.*code*|Observation.valueQuantity.value<br/>Observation.valueQuantity.code (as UCUM)<br/>Observation.valueQuantity.system="http://unitsofmeasure.org"|
|Simple-Nu-Observed-Value.*value*<br/>Unit-Code.*code*|Observation.valueQuantity.value<br/>Observation.valueQuantity.code (as UCUM)<br/>Observation.valueQuantity.system="http://unitsofmeasure.org"|
|Nu-Observed-Value.*value*<br/>Nu-Observed-Value.*unit*<br/>Nu-Observed-Value.*metric-id*<br/>Nu-Observed-Value.*status*|Observation.valueQuantity.value<br/>Observation.valueQuantity.system="http://unitsofmeasure.org"<br/>Observation.valueQuantity.code<br/>effects Observation.code see [Obtaining the Observation.code](ObtainObservationCode.html) <br/>handle measurement status see [PHD Base Observation Profile](StructureDefinition-PhdBaseObservation.html) |


### Additional Numerical Measurement Information
IEEE 11073 numeric observations have some additional optional attributes that are used only for numerics and provide further information about the measurement. 
These optional attributes are seldom used directly by PHDs and are mapped to FHIR extensions. 

##### Accuracy
Accuracy information of quantities can be indicacted using an extension. It gives the maximum deviation as an absolute value of the reported measurement value from the actual measurement over the entire range of the measurement. It is reported in the units of the measurement itself. An example of an accuracy entry for a thermometer is shown below:

{% fragment Observation/temperature-observation JSON EXCEPT:extension[3] %}

##### Simple Alerting
The Simple Alerting extension can be supported for a simple alerting mechanism for numeric values (quantities in FHIR). The PHD pulse oximeter and the continuous glucose monitor specialization support this.
The extension defines a current limits range for the quantity, an operational state and optional strings for the operational state  and the semantics of the quantity being outside the range. 

This mechanism is used in combination with the Observation.interpretation value being set to "in-alarm" when the quantity is outside the limits. 

The presence of the extension in an Observation with a numeric quantity informs the consumer of the use of the alerting mechanism.

An example of an observation with an alert can be found [here](Observation-numeric-spo2-alarm.json.html).

##### Measurement Confidence 95
TheIEEE 11073  Measurement-Confidence-95 component is currently used only in the Continuous Glucose specialization. The compoent gives a lower and upper bound between which the manufacturer is 95% confident that the actual reported measurement is within that bounds. The Measurement Confidence 95 applies only to measurement values that are quantities. 

The entry is indicated by the Observation.extension "http://hl7.org/fhir/uv/phd/StructureDefinition/Confidence95". The accuracy is encoded in an Extension.valueRange element. The ranges have the same units as the primary measurement. An example of a Measurement Confidence 95 entry is shown below:

{% fragment Observation/glucose-observation JSON EXCEPT:extension[2] %}

The above states that the Continuous Glucose Monitor PHG is 95% sure that the reported measurement of (say 99 mg/dL) lies between 98 and 100 mg/dL.

##### Threshold Notification String
This component contains a human readable string regarding the various threshold settings a PHD might have. Currently, only the Continuous Glucose Monitor specialization defines the use of this string with respect to its threhold settings. The Threshold Notification String applies only to measurement values that are quantities. 

The entry is indicated by the Observation.component.code.coding.code element having the value 68232. The text string is limited to US ASCII. The value is encoded in the Observation.component.valueString element.

An example of a component entry is as follows:

    "component": [
        {
            "code": {
                "coding": [
                    {
                        "system": "urn:iso:std:iso:11073:10101",
                        "code": "68232"
                    }
                ],
                "text": " MDC_ATTR_THRES_NOTIF_TEXT_STRING: PHD provided information about the threshold"
            },
            "valueString": "Glucose concentration has gone under the minimum"
        }
    ]




#### Accuracy
The Accuracy attribute gives the maximum deviation as an absolute value of the reported measurement from the actual measurement. It shall be reported if the PHD provides it. When static it can be reported as an extension in a Device Metric, otherwise it is reported as an extension of an Observation.  See [Accuracy extension](StructureDefinition-Accuracy.html).

### Measurement Confidence 95
The Measurement-Confidence-95 gives a lower and upper bound with which the manufacturer is 95% confident that the actual reported measurement is within that bounds. It shall be reported if the PHD provides it. When static it can be reported as an extension in a Device Metric, otherwise it is reported as an extension of an Observation. See [Confidence95 extension](StructureDefinition-Confidence95.html).

### Simple Alerting
The simple alerting extension supports monitoring a numerical value and provisioning of an alarm is the value is outside a defined threshold or limiting range.The extension includes the range, the operational state of the monitoring and text strings desribing these. See [Simple Alerting](StructureDefinition-SimpleAlerting.html)

### Examples:
A basic simple numeric observation with a time stamp and a supplemental types attribute is shown in [Pulse Rate Spot Measurement](Observation-numeric-spotnumeric.html). Simple numeric measurements are common in PHDs.

An example of a NaN (not a number) measurement is shown in [NaN Example](Observation-numeric-observation-not-a-number.html). Note that the value element is absent and replaced by a dataAbsentReason element.

### Consumer of the PHD Numeric Observation Profile
The consumer of this profile does not need to concern itself with the mapping complexities or the PHD-related entry for the Observation.identifier which is used by the uploader to prevent data duplication. There are no extensions introduced by this profile except for the HL7 gateway extension so the resource is consumable by any reader that understands the Observation resource. The following table summarizes the elements used describing the measurement:

|Measurement item|element|Additional Information|
|-
|measurement type|Observation.code.coding.code|There shall be one coding element using the MDC coding system<br>If a vital sign, there will be an additional coding element using one of the LOINC 'magic' codes.|
|measurement value|Observation.valueQuantity.value|Value has precision of original measurement|
|measurement units|Observation.valueQuantity.code|Uses UCUM coding system.|
|error|Observation.dataAbsentReason|Contains error code. If present no Observation.valueQuantity is present |
|time stamp|Observation.dateTimeEffective<br/><br/>Observation.period|If the measurement is a point in time.<br/><br/>If the measurement has a duration.|
|coincident time stamp reference|Observation.extension.valueReference|Points to Observation following the Coincident Time Stamp Observation profile. For time quality auditing purposes. Not present if the sensor provides NO time stamp |
|related measurement|Observation.derivedFrom|Points to a PHD Observations that are related to this Observation such as a height observation related to a BMI measurement. Not present if the observation did not reference other observations it is derived from.|
|related measurement|Observation.memberOf|Points to a PHD Observation that reports a group of related Observations such as a cardio session. Not present if the observation is not a member of a group of related measurements.|
|additional descriptions|Observation.component|If a component element exists it contains additional information about the measurement|
|patient|Observation.subject|Points to the Patient resource|
|sensor device|Observation.device|Points to the Device resource|
