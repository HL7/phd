### Phd Numeric Observation JSON Example

The following JSON example is a pulse rate measurment from a Blood Pressure Cuff. 

<pre>{
    "resourceType":"Observation",
    "meta":{
        "profile": [
            "http://pchalliance.org/phdfhir/StructureDefinition/PhdNumericObservation"
        ]
    },
    "identifier": [
        {
            "value":"sisansarahId-urn:oid:1.2.3.4.5.6.7.8.10-01040302f0000000-149546-20171212091343-48-264864"
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
                "code":"149546",
                "display":"MDC_PULS_RATE_NON_INV"
            },
            {
                "system":"http://loinc.org",
                "code":"8867-4",
                "display":"Blood Pressure cuff heart rate"
            }
        ]
    },
    "subject":{
        "reference":"Patient/PatientId-sisansarahId"
    },
    "effectiveDateTime":"2017-12-12T09:13:43-05:00",
    "performer": [
        {
            "reference":"Patient/PatientId-sisansarahId"
        }
    ],
    "valueQuantity":{
        "value":"48",
        "unit":"{beat}/min",
        "system":"urn:iso:std:iso:11073:10101",
        "code":"264864"
    },
    "device":{
        "reference":"DeviceComponent/SysId-01040302f0000000"
    },
    "related": [
        {
            "id":"coincidentTimeStampRelated",
            <font style="color:green;">// The presence of this Coincident Time Stamp Observation
            // reference indicates that the PHD provided the time
            // stamp and the time is not the time of reception by the PHG.</font>

            "type":"qualified-by",
            "target":{
                "reference":"urn:oid:3.14159.20171212091339"
                <font style="color:green;">// The reason for this funny logical id is that this
                // resource is extracted from a Bundle upload where the Coincident Time Stamp
                // Observation is present. A temporary id is used and when the server receives
                // the Bundle, the server creates a logical id for the Coincident Time Stamp
                // Observation and changes all the temporary ids accordingly. When this resource
                // is saved on the server, the above temporary id will be the server-assigned
                // logical id of the Coincident Time Stamp Observation </font>
            }
        }
    ]
}</pre>