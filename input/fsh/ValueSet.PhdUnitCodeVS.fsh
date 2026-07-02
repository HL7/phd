Alias: $Mdc = urn:iso:std:iso:11073:10101
Alias: $Ucum = http://unitsofmeasure.org

ValueSet: PhdUnitCodeVS
Id: PhdUnitCodeVS
Title: "PHD Unit Codes"
Description: "Unit codes for PHD numeric observations from either MDC or UCUM."
* ^url = "http://hl7.org/fhir/uv/phd/ValueSet/PhdUnitCodeVS"
* ^status = #active
* ^experimental = false
* include codes from system $Mdc
* include codes from valueset http://hl7.org/fhir/ValueSet/ucum-units
