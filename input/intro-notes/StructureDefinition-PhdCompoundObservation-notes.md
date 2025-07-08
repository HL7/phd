The Phd Compound Observation Profile can be used when the PHD metric measurement is a vector or a set of related numeric concepts. Examples would be the x, y, and z components of the acceleration, the systolic, diastolic, and mean components of a blood pressure measurement, or the set of package positions and associated questions in the Advanced Medication Monitor.

The IEEE 11073-10206 model supports more generic compounds where the components can be numeric, codeable concepts, sample arrays or strings. Each individual entry of the compound value is reported in an Observation.component element.

The Observation.code element comes from the Type attribute and gives the general type of measurement. For example, the Type attribute might indicate "acceleration" or "non-invasive blood pressure". For each component the Observation.component.code element is obtained from the Component-type attribute.

There is no Observation.value[x] entry. There may still be an Observation.dataAbsentReason element if, say, the Measurement-Status attribute indicates an invalid or otherwise overall failure value. If there is such an overall failure of the measurement, then there is no need to report the components.

The FLOAT encoding of the numeric components indicates both precision and the number of significant digits. The Observation.component.valueQuantity.value element is required to honor the reported precision as indicated by the  FLOAT. See the section [Mder FLOATs and SFLOATs](MderFLOATsandSFLOATs.html) for instructions on handling FLOATs and their encoding to the valueQuantity.

The structure definition is given [here](StructureDefinition-PhdCompoundObservation.html)

### Additional Numerical Measurement Information
IEEE 11073-10206 ACOM numeric measurement values may have some additional optional attributes that are used only for numerics. An example of such a numeric-only additional attribute is one that describes the accuracy of the measurement value. 

In FHIR these attributes are reported in extensions. The same extensions that are used as for [non-compoud numeric measurements](StructureDefinition-PhdNumericObservation.html) can be used for the numeric components. 

### Examples:
This example shows a [blood pressure](Observation-compound-numeric-blood-pressure.html) measurement. Note that there is no value[x] element in the 'primary' measurement. The set of values describing the compound are in the value[x] elements of the Observation.component elements.
