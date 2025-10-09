Alias: $restful-security-service = http://terminology.hl7.org/CodeSystem/restful-security-service

Instance: PhdFHIRServerR4
InstanceOf: CapabilityStatement
Usage: #definition
* name = "PhdFHIRServerR4"
* title = "PHD IG FHIR Observation Server requirements"
* description = "Capability statement. This statement indicates what the server must support and accept to work with this Guide. Though the CapabilityStatement indicates, for example, that the server must support the Device resource, it does not mean the server must save the Device resource. The use case may only be interested in the Observation and Patient resources. What it does mean is that the server cannot generate an error when the PHG uploads a Device resource or references a Device resource that it has uploaded."
* status = #active
* date = "2018-10-27"
* contact.telecom.system = #url
* contact.telecom.value = "http://hl7.org/fhir"
// * description = "Specifies the capabilities of a FHIR server supporting the PHD IG."
* kind = #requirements
* fhirVersion = #4.0.1
* format[0] = #json
* format[+] = #xml
* rest.mode = #server
* rest.documentation = "PHD IG FHIR Observation Server requirements"
* rest.security.service.coding[0] = $restful-security-service#OAuth
* rest.security.service.coding[+] = $restful-security-service#Basic
* rest.security.description = "The OAuth security model is described elsewhere."
* rest.resource[0].type = #Bundle
* rest.resource[=].documentation = "The server is required to support the transaction Bundle and the resolution of temporal logical ids."
* rest.resource[=].interaction.code = #create
* rest.resource[+].type = #Patient
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