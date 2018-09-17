### Phd Patient JSON Example
An example patient resource using XDSb type enterprise and patient identifier with optionak name data is shown below.
 
<pre>
{
	"resourceType": "Patient",
	"id": "sisansarahId-1.2.3.4.5.6.7.8.10",
	"meta": {
		"profile": "placeholder/phdPatient"
	},
	"identifier": [{
		"type": {
			"coding": [{
				"system": "http://hl7.org/fhir/v2/0203",
				"code": "MR"
			}]
		},
		"system": "urn:oid:1.2.3.4.5.6.7.8.10",
		"value": "sisansarahId"
	}],
	"name": [{
		"family": "Longstrump",
		"given": ["Sisansarah",
		"Lorianthah"]
	}
}

Unknown patient

{
	"resourceType": "Patient",
	"id": "sisansarahId-1.2.3.4.5.6.7.8.10",
	"meta": {
		"profile": "placeholder/phdPatient"
	},
	"identifier": [{
		"type": {
			"coding": [{
				"system": "http://hl7.org/fhir/v2/0203",
				"code": "U"
			}]
		},
		"system": "http://hl7.org/fhir/v2/0004",
		"value": "U"
	}],
	"name": [{
		"family": "Doe",
		"given": ["Jane"]
	}
}
</pre>