This example results when the device reports a NaN (not a number). The important aspect of this case is that the value element is absent and replaced by a dataAbsentReason element.

<pre>
{
	"resourceType": "Observation",
	"meta": {
		"profile": [
			"http://hl7.org/fhir/uv/phd/StructureDefinition/PhdNumericObservation"
		]
	},
	"extension": [
		{
			"url": "http://hl7.org/fhir/StructureDefinition/observation-gatewayDevice",
			"valueReference": {
				"reference": "Device/ecde3d4e58532d31"
			}
		}
	],
	"status": "final",
	"code": {
		"coding": [
			{
				"system": "urn:iso:std:iso:11073:10101",
				"code": "150320"
			}
		],
		"text": "MDC_SAT_O2_QUAL: Blood oxygen saturation"
	},
	"subject": {
		"reference": "Patient/sisansarahId.1.2.3.4.5.6.7.8.10"
	},
	"effectiveDateTime": "2018-11-11T19:07:48-05:00",
	"dataAbsentReason": {
		"coding": [
			{
				"system": "http://terminology.hl7.org/CodeSystem/data-absent-reason",
				"code": "not-a-number"
			}
		],
		"text": "not-a-number (Not a number)"
	},
	"device": {
		"reference": "Device/74E8FFFEFF051C00.001C05FFE874"
	},
	"derivedFrom": [
		{
			"reference": "Observation/coincident-3.14159.20181111190736"
		}
	]
}
</pre>
