Specifies the capabilities of a FHIR server supporting the PHG uploading FHIR data from PHDs as defined by this IG.

Such PHGs transcode data from PHDs following the IEEE 11073-10206 data model to FHIR resources as profiled in this Implementation Guide and upload these resources to a FHIR server with adequate authentication, security, and reliable transaction protocols. 
This capability statement specifies only those capabilities needed for a FHIR server to receive data from a PHG following this IG.

### Patient Upload
A server may refuse the upload of a Patient resource to protect health information (PHI). Administrators of such servers provide the uploader the logical id of the Patient resource by an unspecified means. The client uses the logical id in its Observation resources as needed. The Patient resource may or may not exist on the server but the Observation resource will not be rejected by the server due to a resource not found error if it uses the provided logical id. In those situations where the Patient resource is uploaded by the client the resource is only required to contain an opaque identifier. In this manner, PHI is still protected as only the service provider has the key linking the identifier to an actual patient.
