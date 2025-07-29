
A compound numeric observation reports a measurement value that is described by a set of multiple numbers such as the x, y, and z components of an acceleration. It is NOT used to report an array of measurements but only where the quantity being measured requires more than one number to describe it. Each individual entry of the compound value is reported in an `Observation.component` element. The  encoding of each entry should indicate both precision and the number of significant figures. The `Observation.component.valueQuantity.value` element is required to honor the reported precision as indicated by the encoding. See the section [FLOATs and SFLOATs](FLOATS.html) for instructions on handling IEEE 11073 FLOATs and their encoding to the valueQuantity.

In IEEE 11073-20601 the `Observation.component.code` –element is obtained from the Metric-Id-List attribute unless the measurement reported is a Compound-Nu-Observed-Value attribute. In that case the attribute itself has the metric type for each entry and that is used instead of the Metric-Id-List entries. The order of the entries in the Metric-Id-List are one-to-one with the order of the compound attribute entries. For example, if the Metric-Id-List in the Blood Pressure measurement has MDC codes for 'systolic", "diastolic" and "mean" in that order, the quantities in the compound attribute are the systolic, diastolic, and mean values, respectively.

The `Observation.code` element comes from the Type attribute and gives the general type of measurement. For example, the Type attribute might indicate "acceleration" or "non-invasive blood pressure". There is no `Observation.value[x]`  entry. There may still be an `Observation.dataAbsentReason` element if, say, the Measurement-Status attribute indicates an invalid or otherwise overall failure value. If there is such an overall failure of the measurement, then there is no need to report the components.

The structure definition is given [here](StructureDefinition-PhdCompoundNumericObservation.html)

### Additional Numerical Measurement Information
IEEE 11073-20601 numeric measurement values may have some additional optional attributes that are used only for numerics. An example of such a numeric-only additional attribute is one that describes the accuracy of the measurement value. 

In FHIR these attributes are reported in extensions. The same extensions that are used as for [non-compound numeric measurements](StructureDefinition-PhdNumericObservation.html) can be used for the numeric components. 

