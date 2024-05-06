This example maps a Blood Pressure PHD unit to a Device Resource. All the information mapped is provided by the protocol exchange. None of the information is provided by patient entry.

<pre>
{
    "resourceType": "Device",
    "id": "711000FEFF5F49B0.B0495F001071",
    "meta": {
        "profile": [
            "http://hl7.org/fhir/uv/phd/StructureDefinition/PhdDevice"
        ]
    },
    "identifier": [
        {
            "system": "urn:oid:1.2.840.10004.1.1.1.0.0.1.0.0.1.2680",
            "value": "71-10-00-FE-FF-5F-49-B0"    // System Id
        },
        {
            "system": "http://hl7.org/fhir/sid/eui-48/bluetooth",
            "value": "B0-49-5F-00-10-71"    // Bluetooth Address
        }
    ],
    "manufacturer": "OMRONHEALTHCARE",
    "serialNumber": "20150200002A",
    "modelNumber": "HEM-9200T",
    "type": {
        "coding": [
            {
                "system": "urn:iso:std:iso:11073:10101",
                "code": "65573"
            }
        ],
        "text": "MDC_MOC_VMS_MDS_SIMP"
    },
    "specialization": [
        {
            "systemType": {
                "coding": [
                    {
                        "system": "urn:iso:std:iso:11073:10101",
                        "code": "528391"
                    }
                ],
                "text": "MDC_DEV_SPEC_PROFILE_BP: Blood Pressure Cuff"
            },
            "version":"1"
        }
    ],
    "version": [
        {
            "type": {
                "coding": [
                    {
                        "system": "urn:iso:std:iso:11073:10101",
                        "code": "531976"
                    }
                ],
                "text": "MDC_ID_PROD_SPEC_FW: Firmware revision"
            },
            "value": "C.00.7AJ-02"
        },
        {
            "type": {
                "coding": [
                    {
                        "system": "urn:iso:std:iso:11073:10101",
                        "code": "531975"
                    }
                ],
                "text": "MDC_ID_PROD_SPEC_SW: Software revision"
            },
            "value": "0000000000000101"
        },
        {
            "type": {
                "coding": [
                    {
                        "system": "urn:iso:std:iso:11073:10101",
                        "code": "531974"
                    }
                ],
                "text": "MDC_ID_PROD_SPEC_HW: Hardware revision"
            },
            "value": "0000000000000100"
        }
    ],
    // This device did not report a Reg-Cert-Data-List so their is no regulation status information
    // or certification information
    "property": [
        {
            "type": {
                "coding": [
                    {
                        "system": "urn:iso:std:iso:11073:10101",
                        "code": "68220"
                    }
                ],
                "text": "MDC_TIME_SYNC_PROTOCOL: Time synchronization protocol"
            },
            "valueCode": [
                {
                    "coding": [
                        {
                            "system": "urn:iso:std:iso:11073:10101",
                            "code": "532224"
                        }
                    ],
                    "text": "MDC_TIME_SYNC_NONE: No time synchronization"
                }
            ]
        }
    ]
}
</pre>