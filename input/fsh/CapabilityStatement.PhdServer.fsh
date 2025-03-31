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
* description = "Specifies the capabilities of a server supporting the Continua FHIR Observation Server class."
* kind = #capability
* software.name = "Continua FHIR Observation Server"
* fhirVersion = #4.0.1
* format[0] = #json
* format[+] = #xml
* rest.mode = #server
* rest.documentation = "PHD IG FHIR Observation Server requirements"
* rest.security.service.coding[0] = $restful-security-service#OAuth
* rest.security.service.coding[+] = $restful-security-service#Basic
* rest.security.description = "The OAuth security model is described elsewhere."
* rest.resource[0].type = #Bundle
* rest.resource[=].documentation = "The server is required to support the transaction Bundle and the resolution of temporary logical ids."
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