This example results when the device sends a String Enumeration. It is just an arbitrary human readable string and is mapped to a valueString element. This type of measurement is rare in PHDs and there is only one specialization that uses it.

Note there is no logical id in this resource as this resource is being uploaded to the server in a create operation. The server will create the logical id and return it to the sender in the response.

<pre>
{
	"resourceType": "Observation",
	"meta": {
		"profile": [
			"http://hl7.org/fhir/uv/phd/StructureDefinition/PhdStringEnumerationObservation"
		]
	},
	"category" : [
		{
		  "coding" : [
			{
			  "system" : "http://hl7.org/fhir/uv/phd/CodeSystem/PhdObservationCategories",
			  "code" : "phd-observation"
			}
		  ]
		}
	],
	"extension": [
		{
			"url": "http://hl7.org/fhir/StructureDefinition/observation-gatewayDevice",
			"valueReference": {
				"reference": "Device/phg-ecde3d4e58532d31.000000000000"
			}
		}
	],
	"status": "final",
	"code": {
		"coding": [
			{
				"system": "urn:iso:std:iso:11073:10101",
				"code": "8452096"
			}
		],
		"text": "Private Attribute: Unknown Private Attribute"
	},
	"subject": {
		"reference": "Patient/sisansarahId.1.2.3.4.5.6.7.8.10"
	},
	"effectiveDateTime": "2018-08-02T03:25:24.000-04:00",
	"valueString": "Test Strip Buckled",
	"device": {
		"reference": "Device/phd-00601900010E9234.F45EABA80832"
	},
	"derivedFrom": [
		{
			"reference": "Observation/coin-1234"
		}
	]
}
</pre>