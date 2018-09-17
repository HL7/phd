### Phd Device JSON Example

The following is an example of a Phd Device resource from a Blood Pressure Cuff.

<pre>
{
	"resourceType": "Device",
	"id": "SysId-01040302f0000000",         // This resource is being uploaded as an Update
	"meta": {
		"profile": ["http://pchalliance.org/phdfhir/StructureDefinition/PhdDevice"]
	},
	"identifier": [{
		"system": "urn:oid:1.2.840.10004.1.1.1.0.0.1.0.0.1.2680",
		"value": "01-04-03-02-f0-00-00-00",
		"assigner": {
			"display": "EUI-64"
		}
	},
	{
		"system": "urn:oid:1.2.840.10004.1.1.1.0.0.1.0.0.1.2680",
		"value": "12:34:56:78:9A:BC",
		"assigner": {
			"display": "EUI-48"
		}
	}],
	"manufacturer": "Renesas Electronics",
	"serialNumber": "13456-BPM-BTLE",
	"deviceName":[{
	    "name": "Continua BP Monitor",
		"type": "user-friendly-name"
		}],
	"modelNumber": "Synergy-12345-Demo",
	"partNumber": "63-555",
	"type": {
		"coding": [{
			"system": "urn:iso:std:iso:11073:10101",
			"code": "65573",
			"display": "MDC_MOC_VMS_MDS_SIMP: Continua Personal Health Device"
		}]
	},
	"specialization": [{
		"systemType": {
		    "coding":[{
				"system": "urn:iso:std:iso:11073:10101",
			    "code": "528391",
			    "display": "MDC_DEV_SPEC_PROFILE_BP: Blood pressure Monitor"
			}]
		},
		"version": "1"
	}],
	"version":[
	{
		"type": {
			"coding": [{
				"system": "urn:iso:std:iso:11073:10101",
				"code": "531976",
				"display": "MDC_ID_PROD_SPEC_FW: Firmware revision"
			}]
		},
		"value": "1.0.0"
	},
	{
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
				"code": "531974",
				"display": "MDC_ID_PROD_SPEC_HW: Hardware revision"
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
		"value": "6.1"
	}],
	"property": [{
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
				"code": "32775"
				<font color="green">// In HEX this is 0x8007 Tcode = 8 which is the code
				// for Bluetooth Low Energy and 4096 + 7 = 4103 which is the term code in partition
				// Infra for the Blood Pressure specialization</font>
			}]
		}]
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
	},
	{
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
				"code": "532224",
				"display": "MDC_TIME_SYNC_NONE: "
			}]
		}]
	}]
}</pre>



</pre>