Some PHDs will resend old data repeatedly. To prevent excessive resource duplication on the RESTful FHIR server this IG specifies an Observation.identifier whose sole purpose is to perform a conditional create transaction. The identifier is not to be interpreted by a consumer of the resource.

The idea is that the identifier uniquely describes the measurement such that if the same measurement were resent at a later time, the identifier would be the same. At the same time it needs to be selective enough such that no other newly taken measurement will produce the same identifier.

In practice it is preferred that the uploader filter the data in some application dependent manner such that duplicates are not sent. Duplicates, even if armed with a conditional create transaction, waste bandwidth and conditional create operations are more demanding on the server than simple create transactions.

The identifier is generated from a combination of the basic measurement components, such as the type, value, timestamp, units, and contributions from extra descriptors should they be present. The specifics on how to create this identifier can be found in [this section of the PhdBaseObservation profile](StructureDefinition-PhdBaseObservation.html#unique-observation-identifier---prevention-of-data-duplication).

 - [Next: Generating the Reported Timestamp Observation Identifier](GeneratingtheReportedTimeStampIdentifier.html)
 - [Previous: ASN1 To HL7 Codesystem](CodeSystem-ASN1ToHL7.html)