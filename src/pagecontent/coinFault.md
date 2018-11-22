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
		"reference": "Patient/sisansarahId.1.2.3.4.5.6.7.8.10"
	},
	"effectiveDateTime": "2018-11-20T04:50:47-05:00",
	"dataAbsentReason": {
		"coding": [
			{
				"system": "http://terminology.hl7.org/CodeSystem/data-absent-reason",
				"code": "unknown"
			}
		],
		"text": "Sensor Time Fault"
	},
	"device": {
		"reference": "Device/711000FEFF5F49B0.B0495F001071"
	}
}
</pre>
