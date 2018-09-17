### Phd Compound Numeric Observation JSON Example

The following JSON example is from a Blood Pressure Cuff. The Blood Pressure is an interesting case as the generic, systolic, and disatolic blood pressure all qualify for one of the LOINC magic codes but the MAP pressure does not. The presence of the Coincident Time Stamp Observation in the 'related' element indicates that the PHD provided the time stamp and the time is not the time of reception by the PHG. 

Though present, the 'category' and 'performer' are not required in the Phd Compound Numeric Observation profile.
<pre>{
    "resourceType":"Observation",
    "meta":{
        "profile": [
            "http://pchalliance.org/phdfhir/StructureDefinition/PhdCompoundNumericObservation"
        ]
    },
    "identifier": [
        {
            "value":"sisansarahId-urn:oid:1.2.3.4.5.6.7.8.10-01040302f0000000-150020-20171212091343-104-66-92-266016"
            <font style="color:green;">// Note that 104, 66, and 92 are the three constituents of the compound
            // measurement followed by the unit code 266016. Now if this were a Compound-Nu-Observed-Value 
            // attribute then there might have been a different unit for each constituent and it would
            // have looked like this: 104-units1-66-units2-92-units3 for whatever unit codes they are</font>
        }
    ],
    "status":"final",
    "category": [
        {
            "coding": [
                {
                    "system":"http://hl7.org/fhir/observation-category",
                    "code":"vital-signs",
                    "display":"Vital Signs"
                }
            ]
        }
    ],
    "code":{
        "coding": [
            {
                "system":"urn:iso:std:iso:11073:10101",
                "code":"150020",
                "display":"MDC_PRESS_BLD_NONINV"
            },
            {
                "system":"http://loinc.org",
                "code":"55284-4",
                "display":"Blood Pressure"
            }
        ]
    },
    "subject":{
        "reference":"Patient/PatientId-sisansarahId"
    },
    "effectiveDateTime":"2017-12-12T09:13:43-05:00",
    "performer": [      <font style="color:green;">// This entry is optional </font> 
        {
            "reference":"Patient/PatientId-sisansarahId"
        }
    ],
    "device":{
        "reference":"DeviceComponent/SysId-01040302f0000000"
    },
    "related": [
        {
            "id":"coincidentTimeStampRelated",
            "type":"qualified-by",
            "target":{
                "reference":"urn:oid:3.14159.20171212091339"
            }
        }
    ],
    "component": [
        {
            "code":{
                "coding": [
                    {
                        "system":"urn:iso:std:iso:11073:10101",
                        "code":"150021",
                        "display":"MDC_PRESS_BLD_NONINV_SYS"
                    },
                    {
                        "system":"http://loinc.org",
                        "code":"8480-6",
                        "display":"Systolic blood pressure"
                    }
                ]
            },
            "valueQuantity":{
                "value":"104",
                "unit":"mmHg",
                "system":"urn:iso:std:iso:11073:10101",
                "code":"266016"
            }
        },
        {
            "code":{
                "coding": [
                    {
                        "system":"urn:iso:std:iso:11073:10101",
                        "code":"150022",
                        "display":"MDC_PRESS_BLD_NONINV_DIA"
                    },
                    {
                        "system":"http://loinc.org",
                        "code":"8462-4",
                        "display":"Diastolic blood pressure"
                    }
                ]
            },
            "valueQuantity":{
                "value":"66",
                "unit":"mmHg",
                "system":"urn:iso:std:iso:11073:10101",
                "code":"266016"
            }
        },
        {
            "code":{
                "coding": [
                    {
                        "system":"urn:iso:std:iso:11073:10101",
                        "code":"150023",
                        "display":"MDC_PRESS_BLD_NONINV_MEAN"
                    }
                ]
            },
            "valueQuantity":{
                "value":"92",
                "unit":"mmHg",
                "system":"urn:iso:std:iso:11073:10101",
                "code":"266016"
            }
        }
    ]
}</pre>