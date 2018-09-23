---
title: Remote Patient Monitoring Considerations
layout: default
active: RemotePatientMonitoringConsiderations
---

The design of this mapping is influenced by the needs of remote patient monitoring. In this case patients are typically at home using personal health devices (PHDs) to take medical measurements on themselves and uploading that data in digitized form with a personal health gateway (PHG) to a repository where the health care provider can examine that data. There are variations on this basic theme but in general it is assumed that

* Patients are at home or outside of the Health Care Provider Enterprise
* Non-medical professionals, typically the patient, are taking the measurements using Continua PHDs and PHGs
* Continua PHDs are consumer devices
  * Low cost
  * Often battery powered and portable
  * Typically, do not support external time synchronization except from the PHG or patient
* Continua PHGs are consumer devices or applications running on consumer devices
  * Are expected to work with most if not all Continua PHDs
  * Low cost
  * Maybe a dedicated set top box, mobile phone, or personal computer
  * Have more computational resources than PHDs
  * Are capable of being externally synchronized to UTC and local offset
  * In many cases will need to work with PHDs without user intervention
* Health Care Providers may be monitoring thousands of remotely located patients
  * Servicing and support of the remote stations needs to be minimized
  * To the extent possible Continua PHGs should work with future Continua PHDs
* Patients may have more than one PHD and may change PHDs
* Data will be transferred over the public network
  * Patients may be paying for data rates

Based upon these assumptions it is advantageous to design an infrastructure which needs as little maintenance as possible and a mapping algorithm which handles as many types of PHD specializations as possible including specializations developed in the future.




