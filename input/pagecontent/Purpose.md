The Personal Health Device Implementation Guide (IG) describes how information from Personal Health Devices (PHDs) shall be represented in FHIR. PHDs are devices that are mostly used in home-care contexts and include devices such as glucose meters, blood pressure cuffs, weight scales, thermometers, etc. The PHD 'information' in this context means both the measurements taken by the PHD and data about the PHD itself. The PHD data includes characteristics, operational status and capabilities of the device, such as the serial number, manufacturer name, and firmware revision. Typically, the PHD is in the patient's home or on the patient's person.

In most cases a Personal Health Gateway (PHG) is responsible for receiving and decoding the information from the PHD. Implementations following this IG are likely to be done on PHGs. When a PHG is involved, information about the PHG shall also be generated.

<img src="GHS-overall.jpg" alt="PHD IG context diagram" style="width:100%">

This IG assumes that PHDs use a protocol based on IEEE 11073-10206 or IEEE 11073-20601 when communicating with a PHG or that the PHG is capable of mapping received data into an IEEE 11073-10206  compliant format.  

IEEE 11073-10206 or ACOM defines an Abstract COntent Model for personal health devices and is supported on Bluetooth by the Generic Health Sensor specifications defined by the Bluetooth SIG. ACOM is protocol agnostic and can be implemented on other transport protocols as well. This IG can be used for any PHD for which a mapping can be defined to the IEEE 11073-10206 Abstract Content Model.

IEEE 11073-20601 is an older specification that defines an application layer protocol that assumes an underlying transport protocol stack such as USB PHDC (Personal Health Device Class).  The [Continua guidelines](https://www.pchalliance.org/continua-design-guidelines) defined guidelines for such devices. 
 Implementers could certify their devices following the [Continua Certification Process](https://www.pchalliance.org/continua-certified-continua-compliant-process). This IG still covers mapping IEEE 11073-20601 compliant PHD information into FHIR resources. 

Patient information, such as demographic and administrative information about the patient, is treated separately. First, patient information is not provided by PHDs through standardized protocols and therefore must be supplied and associated by out-of-band means to a PHG. Second, PHD measurements are typically taken remotely requiring that any patient information be transferred across the public network. For protection of Personally Identifiable Information (PII) the Continua guidelines allows PHGs to be supplied with opaque and unique 'keys' by out-of-band means that only the health care provider can link to a patient. In addition, there is a more extreme option where a Patient resource is never generated, allowing a PHG to exist with no PII located anywhere on it. Using these approaches PII is never exchanged on the wire and furthermore, does not need to be present on the PHD or PHG. That being said, this IG does not require that PII be protected. Implementations are free to populate any of the other fields of the Patient resource. A common case where PII is of little concern and even desired is in the handling of fitness data from activity monitors and related fitness devices.

The purpose of this Implementation Guide is to specify the mapping of PHD information to FHIR components. *No interpretations of the data or assumptions about what data is important are specified*. Implementations following this guide map **all** viable data provided by the PHDs. The receiver may handle the data as it sees fit for its use case. For example, a consumer may only be interested in the Observation and Patient resources and therefore discards the Device resources. For this reason, there is no use of the must-support criteria made by this IG.

For consumers (readers) of FHIR data, this Implementation Guide specifies the FHIR resources that contain the PHD information and what elements contain what fields. Readers interested in using the FHIR resources specified by this IG can read the  [Profile Consumers](ProfileConsumers.html) chapter.

 - [Next: Audience](Audience.html)
 - [Previous: Organization](Organization.html)

HL7 GitHub location: https://github.com/HL7/phd
