This example shows a standard coincident time stamp where the PHG has superior time synchronization to the PHD. There is no identifier element in this Observation as Coincident Time Stamps are never duplicates and are always 'created'.

<pre>
{
	"resourceType": "Observation",
	"meta": {
		"profile": [
			"http://hl7.org/fhir/uv/phd/StructureDefinition/PhdCoincidentTimeStampObservation"
		]
	},
	"extension": [
		{
			"url": "http://hl7.org/fhir/StructureDefinition/observation-gatewayDevice",
			"valueReference": {
				"reference": "Device/phg-ecde3d4e58532d31.000000000000"		// Resource already on the server
			}
		}
	],
	"status": "final",
	"code": {
		"coding": [
			{
				"system": "urn:iso:std:iso:11073:10101",
				"code": "67975"
			}
		],
		"text": "MDC_ATTR_TIME_ABS: Absolute time"
	},
	"subject": {
		"reference": "Patient/sisansarahId.1.2.3.4.5.6.7.8.10" 	// Resource already on the server
	},
	"effectiveDateTime": "2018-11-11T19:07:36-05:00",
	"valueDateTime": "2018-11-11T19:07:35-05:00",
	"device": {
		"reference": "Device/711000FEFF5F49B0.B0495F001071" 	// Resource already on the server
	}
}
</pre>