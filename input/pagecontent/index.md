### Plain Language Summary 
HL7 (Health Level Seven International) is a global organization that develops standards for the exchange of health information. These standards ensure that healthcare systems can communicate effectively, enabling better care for patients.

This **Personal Health Device Implementation Guide (PHD IG)** is based on the IEEE 11073-10206 standard, which defines a generic and extensible model for observations and ensures consistent time management. The guide explains how data from Personal Health Devices (PHDs)—like blood pressure monitors, glucose meters, and fitness trackers—can be represented in a standardized format called FHIR (Fast Healthcare Interoperability Resources). FHIR is a modern standard that makes it easier to share health data between devices, apps, and healthcare systems.

The guide is designed for two main audiences:

- **Developers of Personal Health Gateways (PHGs)**: These are systems or apps that collect data from PHDs, process it, and upload it to healthcare systems.
- **Consumers of FHIR Data**: These are healthcare providers, researchers, or apps that use the data uploaded by PHGs.

The guide ensures that data from PHDs is mapped to FHIR in a consistent way, regardless of the device or protocol used. It supports devices using the Bluetooth Generic Health Sensor (GHS) profile, which follows the IEEE 11073-10206 model. This ensures compatibility with a broad range of Bluetooth-enabled health devices, facilitating interoperability and consistent data exchange across different platforms and ecosystems.

By following this guide, developers can ensure that PHD data is accurate, interoperable, and ready for use in modern healthcare systems.

### Overview

This Implementation Guide (IG) defines the use of FHIR resources to convey measurements and supporting data from *communicating* Personal Health Devices (PHDs) to receiving systems for various purposes such as electronic medical record keeping, clinical decision support, medical data archiving, aggregate quality measurements and research purposes. PHDs are typically *consumer* devices designed to be used by people without medical background. These devices are often used in the home and on the patient's body and are a key element in remote patient monitoring program. In most cases there is a Personal Health Gateway (PHG) that handles the PHD communications. The PHG translates the PHD data to the appropriate form and uploads it to the receiving systems. Uploads generated by compliant PHGs shall use this implementation guide when transforming the PHD data to FHIR resources.

<img src="PHD-context-simple-new.png" alt="PHD IG context diagram" style="width:90%" class="center">
<BR CLEAR="all">

A partner IG is the [Point of Care Devices (PoCD) Implementation Guide](http://build.fhir.org/ig/HL7/uv-pocd/). PoCDs focus on acute care and are operated by medical professionals. PoCDs are more complex than PHDs but both are based upon the IEEE 11073 Domain Information Model (DIM). The PoCD DIM is based upon the IEEE 11073-10201 standard while the PHD DIM is based upon the IEEE 11073-10206 Abstract Content Information Model (ACOM) standard. The purpose of both the PHD and PoCD IG is to assure that the DIM is mapped to FHIR in a complete, standardized and consistent manner. Given that both IGs are based upon the IEEE 11073 DIM, the IGs are harmonized to the extent possible. Neither IG interprets the data or indicates what is to be done with the data once in FHIR form.

Those readers who are interested in *consuming* the uploaded data do not need to know much about the IEEE 11073-10206 standard or the mapping algorithms defined in this IG. Instead one can go directly to the [Profile Consumers](ProfileConsumers.html) chapter. The [Overview](overview.html) chapter may also be of interest.

Those readers who *are* implementing a PHG are going to need an understanding of the IEEE 11073-10206 standard and the communication protocol used by the PHD being mapped. The Technical Implementation Guidance section gives an overview of the essential components of the IEEE 11073-10206 model and how its concepts are related to FHIR, but it is not a tutorial. The Profiles section gives the normative mapping between IEEE 11073-10206 concepts and FHIR resources, making several references to sub-sections in the Technical Implementation Guidance section for reminders. The IEEE 11073-10206 model is supported by the [Bluetooth SIG Generic Health Seonsor profile](https://www.bluetooth.com/specifications/specs/?types=adopted&keyword=GHS&filter=) (GHS).

It should be noted that this implementation guide bases its mapping algorithm on the IEEE 11073-10206 model and standard (IEEE 11073-10206 Personal health device communication - Abstract Content Model). This standard provides a generic and extensible model for observations and a means to assure a consistent time management.

However, this choice does not mean that this guide is only of use for IEEE 11073-10206 compliant PHDs that use one of the mentioned protocols. This guide can be used with any PHD that provides a means to establish a PHG-validated timestamp for its observations. The mapping in this guide can be used with many existing PHDs including Bluetooth Low Energy PHDs, both proprietary and those following one of the specific Bluetooth Low Energy Health Device Profiles. See [Non-IEEE 11073 PHD Devices](Non11073PHDDevices.html) for more information.

A PHG-validated timestamp can be generated if a PHD gives access to its clock and the PHD is capable of reporting its clock status. The PHG can then use this information to generate a timestamp that is consistent with the PHG's externally synchronnized UTC clock. This is important for ensuring that the data from the PHD is accurate and reliable.

The IEEE 11073-20601 specification is a predecessor of the IEEE 11073-10206 standard that supports almost the same DIM and in addition defines a binary presentation of the objects and a stateful application layer protocol. This standard was the basis for the Continua Design Guidelines and a certification programme by the PCHA. This programme failed to gain a significant market position and is no longer operational, but nevertheless this IG can to a large extent also be used with PHDs and PHGs supporting the IEEE 11073-20601 specification. Where appropriate, this IG will explain the differences between the two standards.

### References used throughout this IG
- ACOM - IEEE 11073-10206: Personal Health Device Communication—Abstract Content Information Model
- GHS - Bluetooth SIG Generic Health Sensor Profile and Service Specifications


