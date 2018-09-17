### Phg Device JSON Example
The following is an example of a Phg Device resource. 

<pre>{
	"resourceType": "Device",
	"id": "SysId-ecde3d4e58532d31",
	"identifier": [{
		"system": "urn:oid:1.2.840.10004.1.1.1.0.0.1.0.0.1.2680",
		"value": "ec-de-3d-4e-58-53-2d-31",
		"assigner": {
			"display": "EUI-64"
		}
	}],
	"manufacturer": "Continua Medical PHGs",
	"type": {
		"coding": [{
			"system": "urn:iso:std:iso:11073:10101",
			"code": "531981",
			"display": "MDC_MOC_VMS_MDS_AHD"
		}]
	},
	"specialization": [{
		"systemType": {
			"coding": [{
				"system": "urn:iso:std:iso:11073:10101",
				"code": "528457",
				"display": "MDC_DEV_SPEC_PROFILE_GENERIC: Blood pressure Monitor"
			}]
		},
		"version": "2"
	}],
	"version": [{
			"type": {
				"coding": [{
					"system": "urn:iso:std:iso:11073:10101",
					"code": "531975",
					"display": "MDC_ID_PROD_SPEC_SW: Software revision"
				}]
			},
			"value": "1.0.0"
		},
		{
			"type": {
				"coding": [{
					"system": "urn:iso:std:iso:11073:10101",
					"code": "532352",
					"display": "MDC_REG_CERT_DATA_CONTINUA_VERSION: Continua version"
				}]
			},
			"value": "6.0"
		}
	],
	"property": [{
			"type": {
				"coding": [{
					"system": "urn:iso:std:iso:11073:10101",
					"code": "68220",
					"display": "MDC_TIME_SYNC_PROTOCOL: Time synchronization protocol"
				}]
			},
			"valueCode": [{
				"coding": [{
					"system": "urn:iso:std:iso:11073:10101",
					"code": "532233",
					"display": "MDC_TIME_SYNC_GSM: "
				}]
			}]
		},
		{
			"type": {
				"coding": [{
					"system": "urn:iso:std:iso:11073:10101",
					"code": "532353",
					"display": "MDC_REG_CERT_DATA_CONTINUA_CERT_DEV_LIST: certified device list as transport-specialization combo"
				}]
			},
			"valueCode": [{
				"coding": [{
					"system": "http://pcha.org/phd/documents/reg-cert-codes",
					"code": "4"
				}]
			}]
		},
		{
			"type": {
				"coding": [{
					"system": "urn:iso:std:iso:11073:10101",
					"code": "532355",
					"display": "MDC_REG_CERT_DATA_CONTINUA_AHD_CERT_LIST: certified Upload classes"
				}]
			},
			"valueCode": [{
					"coding": [{
						"system": "http://pcha.org/phd/documents/reg-cert-wan-codes",
						"code": "2"
					}]
				},
				{
					"coding": [{
						"system": "http://pcha.org/phd/documents/reg-cert-wan-codes",
						"code": "7"
					}]
				}
			]
		},
		{
			"type": {
				"coding": [{
					"system": "http://hl7.org/fhir/IEEE.ASN1",
					"code": "532354.0",
					"display": "regulation-status"
				}]
			},
			"valueCode": [{
				"coding": [{
					"system": "http://hl7.org/fhir/v2/0136",
					"code": "Y",
					"display": "Device is not regulated"
				}]
			}]
		}
	]
}</pre>
