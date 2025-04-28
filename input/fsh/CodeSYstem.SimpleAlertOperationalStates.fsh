CodeSystem: SimpleAlertOperationalStatesCS
Id: SimpleAlertOperationalStatesCS
Title: "Simple Alert Operational States"
Description: "The operational states for the simple alerting system."
* ^url = "http://hl7.org/fhir/uv/phd/CodeSystem/SimpleAlertOperationalStatesCS"
* ^experimental = false
* ^publisher = "Health Level Seven International (Devices Work Group)"
* ^caseSensitive = true
* ^hierarchyMeaning = #grouped-by
* ^content = #complete
* #Limits-On "Limits On" "The alert system is checking the high and low limits."
* #Limits-Off "Limits Off" "The alert system is not checking the high and low limits."
* #Limits-Low-Off "Low Limit Off" "The alerting system is only checking the high limit."
* #Limits-High-Off "High Limit Off" "The alerting system is only checking the low limit."