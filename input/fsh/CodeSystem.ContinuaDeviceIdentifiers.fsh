CodeSystem: ContinuaDeviceIdentifiers
Id: ContinuaDeviceIdentifiers
Title: "Continua Device Identifiers"
Description: "Codes used to describe the Device (PHD or PHG) Identifiers, such as the system id or Bluetooth Address. More codes maybe added to this list in the future."
* ^meta.profile = "http://hl7.org/fhir/StructureDefinition/shareablecodesystem"
* ^url = "http://hl7.org/fhir/uv/phd/CodeSystem/ContinuaDeviceIdentifiers"
* ^version = "0.3.0"
* ^status = #draft
* ^experimental = true
* ^date = "2018-11-25"
* ^publisher = "Health Level Seven International (Health Care Devices Work Group)"
* ^caseSensitive = true
* ^hierarchyMeaning = #grouped-by
* ^content = #complete
* #SYSID "IEEE 11073 System Identifier" "This code indicates that the identifier is the IEEE 11073 SystemId from the equivalent of the System-Id attribute"
* #BTMAC "Bluetooth MAC address" "This code indicates that the identifier is the Bluetooth MAC address, either classic or low energy"
* #ETHMAC "Ethernet MAC address" "This code indicates that the identifier is the Ethernet MAC address"
* #USB "USB PID and VID designators" "This code indicates that the identifier is the USB Pid and Vid values"
* #ZIGBEE "ZigBee MAC address" "This code indicates that the identifier is the ZigBee MAC address"
