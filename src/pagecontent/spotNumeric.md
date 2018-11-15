This example shows a basic numeric observation. It does have a single component element as the measurement also contained a Supplemental Types attribute indicating the measurement is a SPOT (stable average).

Note there is no logical id in this resource as this resource is being uploaded to the server in a create operation. The server will create the logical id and return it to the sender in the response. Pulse oximeters reporting a SPOT measurement have a time stamp thus there is a reference to the coincident time stamp.

<pre>
{
	"resourceType": "Observation",
	"meta": {
		"profile": [		// Indicates resource follows the PhdNumericObservation profile
			"http://hl7.org/fhir/uv/phd/StructureDefinition/PhdNumericObservation"
		]
	},
	"extension": [
		{					// Special HL7 extension to reference a gateway, in this
							// case a Continua PHG
			"url": "http://hl7.org/fhir/StructureDefinition/observation-gatewayDevice",
			"valueReference": {
				"reference": "Device/ecde3d4e58532d31"
			}
		}
	],
	"identifier": [ // The identifier's purpose is to uniquely identify this
					// measurement on a given server for a given patient and device.
		{
			"value": "sisansarahId-urn:oid:1.2.3.4.5.6.7.8.10-74E8FFFEFF051C00-149530-20181113175902-48.0-2720-150588"
		}
	],
	"status": "final",
	"category": [	// The category is required because this measurement is a vital sign
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
				"code": "149530"
			},
			{	// A LOINC code is required because this measurement is a vital sign
				"system": "http://loinc.org",
				"code": "8867-4"
			}
		],
		"text": "MDC_PULS_OXIM_PULS_RATE"
	},
	"subject": {
		"reference": "Patient/sisansarahId.1.2.3.4.5.6.7.8.10"
	},
	"effectiveDateTime": "2018-11-13T17:59:02-05:00",
	"valueQuantity": {
		"value": 48.0,
		"system": "http://unitsofmeasure.org",
		"code": "{beat}/min"
	},
	"device": {
		"reference": "Device/74E8FFFEFF051C00.001C05FFE874"
	},
	"derivedFrom": [	// Pointer to the Coincident Time Stamps Observation
		{
			"reference": "Observation/urn:oid:3.14159.20181114065522"
		}
	],				// Supplemental types further description of measurement
	"component": [
		{
			"code": {
				"coding": [
					{
						"system": "urn:iso:std:iso:11073:10101",
						"code": "68193"
					}
				],
				"text": "MDC_ATTR_SUPPLEMENTAL_TYPES"
			},
			"valueCodeableConcept": {
				"coding": [
					{
						"system": "urn:iso:std:iso:11073:10101",
						"code": "150588"
					}
				],
				"text": "MDC_MODALITY_SPOT: stable running average"
			}
		}
	]
}
</pre>