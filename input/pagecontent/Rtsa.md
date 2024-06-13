This example results when the device sends a waveform. The value[x] becomes a valueSampledData data type.

Note there is no logical id in this resource as this resource is being uploaded to the server in a create operation. The server will create the logical id and return it to the sender in the response.

<pre>
{
	"resourceType": "Observation",
	"meta": {
		"profile": [
			"http://hl7.org/fhir/uv/phd/StructureDefinition/PhdRtsaObservation"
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
				"code": "150452"
			},
			{
				"code": "SampledData",
				"display": "Data is a periodic array"
			}
		],
		"text": "MDC_PULS_OXIM_PLETH: Pleth Wave"
	},
	"subject": {
		"reference": "Patient/patientExample-1"
	},
	"effectiveDateTime": "2018-08-02T02:25:24-04:00",
	"valueSampledData": {
		"origin": {
			"value": 0,
			"system": "http://unitsofmeasure.org",
			"code": "{unitless} 1"
		},
		"period": 0.01,
		"factor": 3.0,
		"dimensions": 1,
		"data": "123 110 97 99 112 118"
	},
	"device": {
		"reference": "Device/phd-00601900010E9234.F45EABA80832"
	},
	"derivedFrom": [
		{
			"reference": "Observation/coin-example-1"
		}
	]
}
</pre>