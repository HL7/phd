### Phd Coded Enumeration Observation JSON Example
The following JSON example is from a Glucose Monitor. The context measurement is in regard to the meal status at the time of the measurement. The measurement itself is an MDC code. In the future this measurement will contain a second related element due to a Source-Handle-Reference attribute pointing to the Glucose Concentration measurement. It has been added by hand below. In a real case the logical id of the Observation would be known.

<pre>
{
	"resourceType": "Observation",
	"meta": {
		"profile": ["http://pchalliance.org/phdfhir/StructureDefinition/PhdCodedEnumerationObservation"]
	},
	"identifier": [{
		"value": "sisansarahId-urn:oid:1.2.3.4.5.6.7.8.10-01040302f4000000-8417864-20171214103752-8417868"
	}],
	"status": "final",
	"code": {
		"coding": [{
			"system": "urn:iso:std:iso:11073:10101",
			"code": "8417864",
			"display": "MDC_CTXT_GLU_MEAL"
		}]
	},
	"subject": {
		"reference": "Patient/PatientId-sisansarahId"
	},
	"effectiveDateTime": "2017-12-14T10:37:50-05:00",
	"performer": [{
		"reference": "Patient/PatientId-sisansarahId"
	}],
	"valueCodeableConcept": {
		"coding": [{
			"system": "urn:iso:std:iso:11073:10101",
			"code": "8417868",
			"display": "MDC_CTXT_GLU_MEAL_PREPRANDIAL"
		}]
	},
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
	}]
}
</pre>