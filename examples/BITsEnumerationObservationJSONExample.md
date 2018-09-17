### Phd BITs Enumeration Observation JSON Example

The following JSON example is from a Glucose Monitor. The context measurement is in regard to the device status events recorded at the time of the measurement. The measurement itself is an ASN1 BITs value. The BITs value is 0x10D0 or 4304 decimal. That value amounts to *Mder* bits 3, 8, 9, and 11 being set. In the future this measurement will contain a second related element due to a Source-Handle-Reference attribute pointing to the Glucose Concentration measurement. It has been added by hand below. In a real case the logical id of the Observation would be known.

<pre>
{
	"resourceType": "Observation",
	"meta": {
		"profile": ["http://pchalliance.org/phdfhir/StructureDefinition/PhdBitsEnumerationObservation"]
	},
	"identifier": [{
		"value": "sisansarahId-urn:oid:1.2.3.4.5.6.7.8.10-01040302f4000000-8417752-20171214103727-10D0"
	}],
	"status": "final",
	"code": {
		"coding": [{
			"system": "urn:iso:std:iso:11073:10101",
			"code": "8417752",
			"display": "MDC_GLU_METER_DEV_STATUS"
		}]
	},
	"subject": {
		"reference": "Patient/PatientId-sisansarahId"
	},
	"effectiveDateTime": "2017-12-14T10:37:25-05:00",
	"performer": [{
		"reference": "Patient/PatientId-sisansarahId"
	}],
	"device": {
		"reference": "DeviceComponent/SysId-01040302f4000000"
	},
	"related": [{
		"id": "coincidentTimeStampRelated",
		"type": "qualified-by",
		"target": {
			"reference": "urn:oid:3.14159.20171214103753"
		},
		{
		"id": "SourceHandleReferenceRelated",
		"type": "qualified-by",
		"target": {
			"reference": "Observation/logical-id of Glucose concentration measurement"
		}
	}],
	"component": [{
		"code": {
			"coding": [{
				"system": "http://hl7.org/fhir/IEEE.ASN1",
				"code": "8417752.3",
				"display": "sensor-strip-insertion"
			}]
		},
		"valueCodeableConcept": {
			"coding": [{
				"system": "http://hl7.org/fhir/v2/0136",
				"code": "Y",
				"display": "Strip inserted incorrectly"
			}]
		}
	},
	{
		"code": {
			"coding": [{
				"system": "http://hl7.org/fhir/IEEE.ASN1",
				"code": "8417752.8",
				"display": "sensor-temp-too-low"
			}]
		},
		"valueCodeableConcept": {
			"coding": [{
				"system": "http://hl7.org/fhir/v2/0136",
				"code": "Y",
				"display": "Temperature too low"
			}]
		}
	},
	{
		"code": {
			"coding": [{
				"system": "http://hl7.org/fhir/IEEE.ASN1",
				"code": "8417752.9",
				"display": "sensor-read-interrupt"
			}]
		},
		"valueCodeableConcept": {
			"coding": [{
				"system": "http://hl7.org/fhir/v2/0136",
				"code": "Y",
				"display": "Process interrupted"
			}]
		}
	},
	{
		"code": {
			"coding": [{
				"system": "http://hl7.org/fhir/IEEE.ASN1",
				"code": "8417752.11",
				"display": "sensor-temp-out-of-range"
			}]
		},
		"valueCodeableConcept": {
			"coding": [{
				"system": "http://hl7.org/fhir/v2/0136",
				"code": "Y",
				"display": "Temperature out of range"
			}]
		}
	}]
},

</pre>