Alias: $restful-security-service = http://terminology.hl7.org/CodeSystem/restful-security-service

Instance: PhdServerCapabilityStatement
InstanceOf: CapabilityStatement
Usage: #definition
* name = "PhdServerCapabilityStatement"
* title = "Continua FHIR Observation Server requirements"
* status = #active
* date = "2018-10-27"
* publisher = "Continua-Personal Connected Health Alliance"
* contact.telecom.system = #url
* contact.telecom.value = "http://hl7.org/fhir"
* description = "Specifies the capabilities of a server supporting the Continua FHIR Observation Server class. The Continua FHIR Observation Server supports the Continua FHIR Observation Client as specified in the Continua H.812-5 Design Guidelines. This class of uploaders transcodes data from medical devices following the IEEE 11073-10206 data model to FHIR as profiled in the Personal Health Device Implementation Guide with the authentication, security, and transaction protocols specified in H.812-5. The Continua FHIR Observation Server is a RESTFul FHIR server subject to the additional requirements of H.812-5. This capability statement specifies only those capabilities needed to receive data from a Continua FHIR Observation Client."
* kind = #capability
* software.name = "Continua FHIR Observation Server"
* fhirVersion = #4.0.1
* format[0] = #json
* format[+] = #xml
* rest.mode = #server
* rest.documentation = "PHD IG FHIR Observation Server requirements"
* rest.security.service.coding[0] = $restful-security-service#OAuth
* rest.security.service.coding[+] = $restful-security-service#Basic
* rest.security.description = "Describe the oauth model ..."
* rest.resource[0].type = #Bundle
* rest.resource[=].documentation = "The server is required to support the transaction Bundle and the resolution of temporary logical ids."
* rest.resource[=].interaction.code = #create
* rest.resource[+].type = #Patient
* rest.resource[=].documentation = "A server may refuse the upload of a Patient resource to protect Personal Health Information (PHI). Administrators of such servers provide the uploader the logical id of the Patient resource by an unspecified means. The client uses the logical id in its Observation resources as needed. The Patient resource may or may not exist on the server but the Observation resource shall not be rejected by the server due to a resource not found error if it uses the provided logical id. In those situations where the Patient resource is uploaded by the client the resource is only required to contain an opaque identifier. In this manner, PHI is still protected as only the service provider has the key linking the identifier to an actual patient."
* rest.resource[=].interaction[0].code = #update
* rest.resource[=].interaction[+].code = #create
* rest.resource[=].updateCreate = true
* rest.resource[=].conditionalCreate = true
* rest.resource[=].conditionalUpdate = true
* rest.resource[+].type = #Device
* rest.resource[=].interaction[0].code = #update
* rest.resource[=].interaction[+].code = #create
* rest.resource[=].updateCreate = true
* rest.resource[=].conditionalCreate = true
* rest.resource[=].conditionalUpdate = true
* rest.resource[+].type = #Observation
* rest.resource[=].interaction.code = #create
* rest.resource[=].conditionalCreate = true
* rest.interaction.code = #transaction