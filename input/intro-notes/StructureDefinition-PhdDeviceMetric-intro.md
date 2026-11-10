ACOM and GHS provide the list of observation types that a device can generate. Accuracy can be specified as well. 
In GHS the valid range and schedule information can be present.
This information can be mapped to a PhdDeviceMetric FHIR Resource.

For FHIR R6 snapshot1, `DeviceMetric.category` uses the THO code system `http://terminology.hl7.org/CodeSystem/metric-category` (for example, `measurement`). The earlier `http://hl7.org/fhir/metric-category` URL is not defined in this snapshot package.