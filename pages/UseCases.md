---
title: Use Cases
layout: default
active: UseCases
---

This guide applies to any situation where Continua-compliant PHD data needs to be mapped to FHIR resources and/or such data needs to be read and interpreted by a consumer. In most cases PHDs are used in remote patient monitoring efforts but that does not mean within-enterprise uses of PHDs are excluded. 

Remote patient monitoring is remote (home-based) monitoring of vital signs, blood sugar levels, etc. on a scheduled basis, to allow care providers to observe the health of their patients. Patients are enrolled to the remote health monitoring program on request (e.g. prescription) of their care provider and obtain the necessary equipment and facilities in part or completely from the service provider. Ideally, the system should be simple enough that patients are able to install and operate the necessary equipment themselves, but that may not always be the case.

The scope of the remote patient monitoring includes:


- Automatic, device-reported measurements, obtained from the PHDs

- Manual, patient-reported measurements, such as taking their own pulse or reporting measurements obtained from non-communicating PHDs

- Association of the measurements with the correct patient, proper timestamping, and potential correction for device-specific inaccuracies

- Batch delivery of measurements to the backend server (e.g. health record server) for use by the care provider, and eventually without measurements getting lost or corrupted

- Installation and configuration of equipment (PHD, PHG) and facilities (power, phone, Internet), preferably by the patient

- Both single-user (personal) and multi-user (shared with residents) PHDs. (E.g. via multiple logical devices on a single physical device)

- Interoperability between PHD, PHG and backend server.


Example 1: Diabetes monitoring
-
A person can self-monitor and manage lifestyle aspects that affect the diabetes condition, and to enhance the value of the glucose readings from a portable glucose meter. This self-monitoring and management process is facilitated by one or more wearable monitors and interactions with one or more PHGs and back-end servers. The feedback the person receives is a function of continuous measurements collected by the monitor(s) they wear, periodic measurements about their physical state from a portable glucose meter or from the wearable monitor itself, and from manual entry of additional details. Also, the person may receive feedback about these measurements from a healthcare provider to support the treatment of that person’s diabetic condition. The purpose is both to ensure continued adherence to health monitoring and improvements in the relevant end-points such as quality of life, average measured glucose levels, etc.

Example 2: Healthcare with wearable sensor
-
One can manage his/her own health continuously by wearing sensors. A wearable sensor measures body activity, blood pressure, and/or SpO2. The wearable sensor sends the measured data to the patient’s cell-phone (PHG). The PHG receives the measurements and sends it to the healthcare provider’s back-end server. This transfer allows the healthcare provider to continuously monitor the patient’s condition with minimal impact on the patient’s daily life. Advice or further actions can be administered as needed. An application may also read the accumulated data from the healthcare provider’s server and present it to the patient in a meaningful fashion along with any advice and further courses of action from the health care provider.

Example 3: Medical research
-
Another use case is participation in medical research. For example, a medical center associated with a large university is conducting a study on memory impairment interventions in the elderly. The study involves the patients participating in adaptive on-line memory ‘games’. The data is collected in association with a home healthcare service. The use of remote monitoring allows the study to collect a large set of data with minimal impact on the involved patients. The automated approach reduces cost, increases sample size, allows the collection of larger amounts of data from each participant, and the minimal impact is likely to result in longer participation times. As a side benefit, the home healthcare service finds that the exercises are therapeutic for their patients.

 - [Next: Technical Implementation Guidance]({{ output }}technical implementation guidance.html)
 - [Previous: Scope]({{ output }}Scope.html) 