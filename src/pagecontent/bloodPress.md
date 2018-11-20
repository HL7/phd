This example shows a compound numeric observation. The most common type of compound measurement is the Blood Pressure. The systolic, diastolic, and mean values are treated as parts of the same measurement. The compound elements are reported in Observation.component elements. Note that there is **no** value[x] in the 'primary' observation. Note, in addition, that the 'mean' component is not considered as one of FHIR's vital signs and no LOINC code is present for that component code.

Note there is no logical id in this resource as this resource is being uploaded to the server in a conditional create operation. The server will use the identifier to check that no other Observation resource exists on the server with the same identifier. If there is not such resource present, the server will create the logical id and return it to the sender in the response. 

<pre>
{
	"resourceType": "Observation",
	"meta": {
		"profile": [
			"http://hl7.org/fhir/uv/phd/StructureDefinition/PhdCompoundNumericObservation"
		]
	},
	"extension": [
		{
			"url": "http://hl7.org/fhir/StructureDefinition/observation-gatewayDevice",
			"valueReference": {
				"reference": "Device/ecde3d4e58532d31.000000000000"
			}
		}
	],
	"status": "final",
	"category": [
		{
			"coding": [
				{
					"system": "http://terminology.hl7.org/CodeSystem/observation-category",
					"code": "vital-signs"
				}
			],
			"text": "Vital Signs"
		}
	],
	"code": {
		"coding": [
			{
				"system": "urn:iso:std:iso:11073:10101",
				"code": "150020"
			},
			{
				"system": "http://loinc.org",
				"code": "55284-4"
			}
		],
		"text": "MDC_PRESS_BLD_NONINV: Blood pressure"
	},
	"subject": {
		"reference": "Patient/sisansarahId.1.2.3.4.5.6.7.8.10"
	},
	"effectiveDateTime": "2018-11-11T11:38:15-05:00",
	"device": {
		"reference": "Device/711000FEFF5F49B0.B0495F001071"
	},
	"derivedFrom": [
		{
			"reference": "Observation/coin-20181119174911"
		}
	],
	"component": [
		{
			"code": {
				"coding": [
					{
						"system": "urn:iso:std:iso:11073:10101",
						"code": "150021"
					},
					{
						"system": "http://loinc.org",
						"code": "8480-6"
					}
				],
				"text": "MDC_PRESS_BLD_NONINV_SYS: Systolic blood pressure"
			},
			"valueQuantity": {
				"value": 116,
				"system": "http://unitsofmeasure.org",
				"code": "mmHg"
			}
		},
		{
			"code": {
				"coding": [
					{
						"system": "urn:iso:std:iso:11073:10101",
						"code": "150022"
					},
					{
						"system": "http://loinc.org",
						"code": "8462-4"
					}
				],
				"text": "MDC_PRESS_BLD_NONINV_DIA: Diastolic blood pressure"
			},
			"valueQuantity": {
				"value": 71,
				"system": "http://unitsofmeasure.org",
				"code": "mmHg"
			}
		},
		{
			"code": {
				"coding": [
					{
						"system": "urn:iso:std:iso:11073:10101",
						"code": "150023"
					}
				],
				"text": "MDC_PRESS_BLD_NONINV_MEAN: Mean blood pressure"
			},
			"valueQuantity": {
				"value": 86,
				"system": "http://unitsofmeasure.org",
				"code": "mmHg"
			}
		}
	]
}
</pre>