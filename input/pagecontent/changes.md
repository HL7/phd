
## Major Updates in version 2.0.0 since version 1.1.0
Based on the change log, here is a summary of the significant changes in the PHD (Personal Health Device) Implementation Guide.

### Standards Foundation Updates

1. **IEEE 11073-10206 Support**: The IG now focuses on comprehensive support for IEEE 11073-10206 ACOM (Abstract Communication Object Model) specifications, moving away from the original IEEE 11073-20601 focus.

2. **Bluetooth GHS Integration**: Added support for Bluetooth Generic Health Sensor (GHS) specifications, broadening the scope of supported personal health devices.

### Documentation and Profile Improvements

3. **Enhanced Profile Consumer Documentation**: Significantly rewrite of the `ProfileConsumers.md` file with better explanations of how to consume PHD-generated FHIR resources, including clearer guidance on measurement types, status handling, and device information.

4. **Reorganized Technical Content**: 
   - Moved IEEE 11073 FLOAT/SFLOAT documentation from `MderFLOATsandSFLOATs.md` to `FLOATS.md`
   - Removed separate `CoincidentTimeStamp.md` page and integrated content into profile documentation
   - Updated various intro and notes files for better clarity

### Code System and Terminology Updates

5. **ASN1ToHL7 Code System Migration**: Updated references from the local implementation guide code system (`http://hl7.org/fhir/uv/phd/CodeSystem/ASN1ToHL7`) to the terminology server version (`http://terminology.hl7.org/CodeSystem/ASN1ToHL7`).

6. **Continua Device Identifiers Migration**: Updated the Continua Device Identifiers code system URL from the local IG to the terminology server (`http://terminology.hl7.org/CodeSystem/ContinuaDeviceIdentifiers`).

7. **Missing MDC Codes**: Added a new code system `MissingMDCCodes` to handle MDC codes not yet available in the standard terminology, specifically for the Spirometer device specialization.

### Profile Enhancements

8. **IEEE 11073-10206 Mapping**: Added formal mappings to the PhdDeviceMetric profile showing how ACOM (Abstract Communication Object Model) elements map to FHIR elements.

9. **Profile Documentation Improvements**: Enhanced comments and definitions across multiple profiles (PhdBaseObservation, PhdNumericObservation, PhdCompoundObservation, etc.) with clearer explanations of when elements are used and how they relate to IEEE 11073 standards.

### Example Updates

10. **Example Identifiers**: Added logical IDs to various observation examples (glucose, meal-context, RTSA, string, temperature observations) to address publishing process limitations while noting these aren't needed for actual create operations.

11. **Example Documentation**: Updated intro notes for examples to clarify when logical IDs are and aren't needed in real implementations.

### Technical Corrections

12. **Standards Status Extensions**: Commented out some standards status extensions that were causing validation issues.

13. **Constraint and Warning Fixes**: Updated `ignoreWarnings.txt` to address new validation warnings in FHIR R4 and added explanatory comments.

14. **Version Updates**: Updated the implementation guide version to "STU 2 - Ballot" and various profile versions to "2.0.0-ballot2".

## Content Quality Improvements

The changes focus heavily on improving documentation quality, clarifying the relationship between IEEE 11073 standards and FHIR profiles, and ensuring terminology consistency across the implementation guide. The updates make the IG more consumable for implementers while maintaining technical accuracy and expanding support for both IEEE 11073-10206 ACOM and Bluetooth GHS specifications.

## Issue Tracking
Issues reported against this IG are tracked in the HL7 Jira system.
- A list of resolved issues and agreed changes published in this version of the IG can be retrieved via [this link](https://jira.hl7.org/issues/?jql=Specification%20%3D%20FHIR-phd%20AND%20project%20in%20(CDA%2C%20FHIR%2C%20OTHER%2C%20V2)%20AND%20status%20%3D%20Published%20%20ORDER%20BY%20resolutiondate%20%20DESC).

- A list of changes applied to the current, not yet published version of the IG can be retrieved via [this link](https://jira.hl7.org/issues/?jql=Specification%20%3D%20FHIR-phd%20AND%20project%20in%20(CDA%2C%20FHIR%2C%20OTHER%2C%20V2)%20AND%20status%20%3D%20Applied%20%20ORDER%20BY%20updatedDate%20%20DESC).

// ...existing code...
Based on the provided change log, here's a summary of the significant changes in the PHD (Personal Health Device) Implementation Guide:

## Major Updates in version 2.0.0 since version 1.1.0 - shorter version

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