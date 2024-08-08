This example shows a PHD Patient resource including the optional patient name entry. This particular resource was uploaded using a update-create transaction and thus the logical id is specified.

<pre>
{
	"resourceType": "Patient",
	"id": "patientExample-1",
	"meta": {
		"profile": [
			"http://hl7.org/fhir/uv/phd/StructureDefinition/PhdPatient"
		]
	},
	"identifier": [
		{
			"type": {
				"coding": [
					{
						"system": "http://terminology.hl7.org/CodeSystem/v2-0203",
						"code": "MR"
					}
				]
			},
			"system": "urn:oid:1.2.3.4.5.6.7.8.10",
			"value": "sisansarahId"
		}
	],
	"name": [		// This entry is optional
		{
			"family": "Piggy",
			"given": [
				"Sisansarah",
				"Lorianthah"
			]
		}
	]
}
</pre>