This example shows a coded enumeration Observation. Coded enumerations are used when the measurement itself is a code. In this case, the measurement is the meal context associated with a glucose measurement. There is a limited set of possible entries for this measurement, this one indicating after lunch or dinner. In the future, this measurement will contain a source-handle reference pointing to the measurement containing the glucose concentration. For now, the associated Observation has to be determined by time stamp and the PHD and patient references.

Note there is no logical id in this resource as this resource is being uploaded to the server in a conditional create operation. The server will use the identifier to check that no other Observation resource exists on the server with the same identfier. If there is not such resource present, the server will create the logical id and return it to the sender in the response.

{
	"resourceType": "Observation",
	"meta": {
		"profile": [
			"http://hl7.org/fhir/uv/phd/StructureDefinition/PhdCodedEnumerationObservation"
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
	"identifier": [
		{
			"value": "sisansarahId-urn:oid:1.2.3.4.5.6.7.8.10-00601900010E9234-8417864-20170602150227-8417872"
		}
	],
	"status": "final",
	"code": {
		"coding": [
			{
				"system": "urn:iso:std:iso:11073:10101",
				"code": "8417864"
			}
		],
		"text": "MDC_CTXT_GLU_MEAL: Meal context"
	},
	"subject": {
		"reference": "Patient/sisansarahId.1.2.3.4.5.6.7.8.10"
	},
	"effectiveDateTime": "2017-06-02T15:02:35-04:00",
	"valueCodeableConcept": {
		"coding": [
			{
				"system": "urn:iso:std:iso:11073:10101",
				"code": "8417872"
			}
		],
		"text": "MDC_CTXT_GLU_MEAL_POSTPRANDIAL: After lunch/dinner"
	},
	"device": {
		"reference": "Device/00601900010E9234.F45EABA80832"
	},
	"derivedFrom": [
		{
			"reference": "Observation/coin-1234"
		}
	]
}