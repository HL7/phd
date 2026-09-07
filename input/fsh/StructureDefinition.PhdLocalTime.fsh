Extension: PhdLocalTime
Id: phd-local-time
Title: "Local Time"
Description: "Indicates that the associated dateTime value represents a local time reported by the source device. The relationship between the local time and UTC is unknown to the source device."

* ^status = #draft
* . ^isModifier = true
* . ^isModifierReason = "If ignored, the associated dateTime may be misinterpreted as UTC rather than source-reported local time."
* ^context[0].type = #element
* ^context[0].expression = "Observation"

* value[x] only boolean
* valueBoolean 1..1

* valueBoolean ^short = "DateTime represents source local time"
* valueBoolean ^definition = "A value of true indicates that the associated dateTime value represents a local time reported by the source device."