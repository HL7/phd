The PhdLocalTime extension indicates that an associated `dateTime` value was reported as local time by the source device and that the relationship between that local time and UTC is unknown.

The extension is used as a modifier extension on the containing `Observation`. Its value is a required boolean and SHALL be `true` when the extension is present. The extension does not provide a time-zone offset or identify a time zone.

For a [PhdCoincidentTimeStampObservation](StructureDefinition-PhdCoincidentTimeStampObservation.html) with an absolute-time clock (`MDC_ATTR_TIME_ABS`, code `67975`) and a `valueDateTime`, the PHG SHALL include this modifier extension. In JSON, it is represented in the Observation's `modifierExtension` array:

```json
"valueDateTime": "2018-11-11T11:38:10-00:00",
"modifierExtension": [
  {
    "url": "http://hl7.org/fhir/uv/phd/StructureDefinition/phd-local-time",
    "valueBoolean": true
  }
]
```
