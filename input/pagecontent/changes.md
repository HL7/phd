
## Major Updates in version 3.0.0 since version 2.0.1

### FHIR R6 Migration

1. **FHIR R6 Support**: Migrated the IG from FHIR R4 (4.0.1) to FHIR R6. Updated the PHD, PHG, Observation, and DeviceMetric profiles and examples to match the R6 resource model, including Device fields such as `conformsTo`, `deviceVersion`, and multiple `type` codings.

2. **Updated Gateway References**: Updated PHD Observation profiles to use the R6 `device-gateway` extension with a `CodeableReference` to the PHG Device.

### Alert Modeling

3. **Dedicated Device Alert Profile**: Added the `PhdDeviceAlert` profile to represent alert conditions as separate FHIR `DeviceAlert` resources. It supports both threshold alerts associated with measurements and technical alerts derived from device or sensor status bits.

4. **Alert Terminology and Examples**: Added alert condition and category value sets, plus examples for a blood-pressure threshold alert and a sensor-displaced alert. Alerts can reference their source observation and, where applicable, the component that triggered them.

### Measurement and Time Handling

5. **Explicit Unit Validation**: Added `PhdUnitCodeVS`, combining UCUM and MDC units, and profile constraints to keep the unit system and code coherent. UCUM remains preferred; MDC units are also supported.

6. **Local-Time Timestamp Support**: Coincident Timestamp Observations can now carry a PHD wall-clock time as a string when it has no time-zone offset. Constraints validate that this form is used only for absolute-time clocks and follows the specified local-time format.

### Examples and Guidance

7. **Expanded R6 Examples and Documentation**: Updated examples and implementation guidance for R6, including a blood-pressure `ObservationDefinition`, DeviceMetric examples, and additional detail on alert generation and consumers of PHD profiles.

## Updates in version 2.0.1 since version 2.0.0

Restored the missing introduction and notes pages for the Coincident Timestamp Observation profile.

## Major Updates in version 2.0.0 since version 1.1.0

### Standards Foundation Updates

1. **IEEE 11073-10206 Support**: The IG now focuses on comprehensive support for IEEE 11073-10206 ACOM (Abstract Communication Object Model) specifications, moving away from the original IEEE 11073-20601 focus.

2. **Bluetooth GHS Integration**: Added support for Bluetooth Generic Health Sensor (GHS) specifications, broadening the scope of supported personal health devices.

### Documentation and Profile Improvements

3. **Enhanced Profile Consumer Documentation**: Significantly rewritten consumer guidance with better explanations of how to use PHD-generated FHIR resources, including clearer guidance on measurement types, status handling, and device information.

4. **Reorganized Technical Content**: 
   - Consolidated IEEE 11073 FLOAT/SFLOAT documentation 
   - Integrated coincident timestamp content into profile documentation
   - Updated guidance for better clarity

### Terminology Updates

5. **Code System Migration**: Updated to use official HL7 terminology server versions of ASN1ToHL7 and Continua Device Identifiers code systems.

6. **Missing MDC Codes**: Added support for MDC codes not yet available in standard terminology, including Spirometer device specialization.

### Profile Enhancements

7. **IEEE 11073-10206 Mapping**: Added formal mappings showing how ACOM elements map to FHIR elements in the PhdDeviceMetric profile.

8. **Profile Documentation**: Enhanced explanations across all profiles with clearer guidance on when elements are used and how they relate to IEEE 11073 standards.

### Example Updates

9. **Improved Examples**: Updated observation examples with better documentation and clarifications about identifier usage in real implementations.

## Content Quality Improvements

The changes focus on improving documentation quality, clarifying the relationship between IEEE 11073 standards and FHIR profiles, and ensuring terminology consistency. The updates make the IG more consumable for implementers while expanding support for both IEEE 11073-10206 ACOM and Bluetooth GHS specifications.

## Issue Tracking
Issues reported against this IG are tracked in the HL7 Jira system.
- A list of resolved issues and agreed changes published in this version of the IG can be retrieved via [this link](https://jira.hl7.org/issues/?jql=Specification%20%3D%20FHIR-phd%20AND%20project%20in%20(CDA%2C%20FHIR%2C%20OTHER%2C%20V2)%20AND%20status%20%3D%20Published%20%20ORDER%20BY%20resolutiondate%20%20DESC).

- A list of changes applied to the current, not yet published version of the IG can be retrieved via [this link](https://jira.hl7.org/issues/?jql=Specification%20%3D%20FHIR-phd%20AND%20project%20in%20(CDA%2C%20FHIR%2C%20OTHER%2C%20V2)%20AND%20status%20%3D%20Applied%20%20ORDER%20BY%20updatedDate%20%20DESC)