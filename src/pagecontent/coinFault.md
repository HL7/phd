This example shows a coincident time stamp in the case where the PHD has a time fault. Note that only the current time of the PHG is reported as the current time of the PHD could not be obtained. In place of the current time of the PHD one has a data absent reason stating the current time is unknown. The time fault tells the reader of the received data that the time stamp of the measurement cannot be trusted. The PHD reported a time stamp but there was no means to check the validity of that time stamp.

<pre>
{
	"resourceType": "Observation",
	"meta": {
		"profile": [
			"http://hl7.org/fhir/uv/phd/StructureDefinition/PhdCoincidentTimeStampObservation"
		]
	},
	"status": "final",
	"effectiveDateTime": "2018-11-20T04:50:47-05:00",
	"dataAbsentReason": {
		"coding": [
			{
				"system": "http://terminology.hl7.org/CodeSystem/data-absent-reason",
				"code": "unknown"
			}
		],
		"text": "Sensor Time Fault"
	}
}
</pre>
