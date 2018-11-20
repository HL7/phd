This example shows a standard coincident time stamp where the PHG has superior time synchronization to the PHD. There is no identifier element in this Observation as Coincident Time Stamps are never duplicates and are always 'created'.

<pre>
{
	"resourceType": "Observation",
	"meta": {
		"profile": [
			"http://hl7.org/fhir/uv/phd/StructureDefinition/PhdCoincidentTimeStampObservation"
		]
	},
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
	"effectiveDateTime": "2018-11-11T19:07:36-05:00",
	"valueDateTime": "2018-11-11T19:07:35-05:00"
}
</pre>