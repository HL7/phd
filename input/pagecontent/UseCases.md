This guide applies to any situation where IEEE 11073-10206 ACOM compliant PHD data needs to be mapped to FHIR resources and/or such data needs to be read and interpreted by a consumer. This IG has primarily been developed for PHDs that are used in remote patient monitoring efforts but that does not mean within-enterprise uses of PHDs are excluded. However, it is important to emphasize that this guide does NOT specify anything about how the collected data is used.

Remote patient monitoring involving the use of PHDs typically involves monitoring of vital signs, blood sugar levels, etc. on a scheduled basis, to allow care providers to observe the health of their patients. Typically, patients are enrolled to the remote health monitoring program on request (e.g. prescription) of their care provider and obtain the necessary equipment and facilities in part or completely from the service provider. Ideally, patients are able to install and operate the necessary equipment themselves, but that may not always be the case. Remote patient monitoring could also be fitness related, and the 'provider' may be a health care provider, a coach, or the individual. The need to collect data from PHDs applies here as well.

The scope of the remote patient monitoring includes:

* Automatic, device-reported measurements, obtained from the PHDs
* Association of the measurements with the correct patient, proper timestamping, and potential correction for device-specific inaccuracies
* Batch delivery of measurements to the backend server (e.g. health record server) for use by the care provider, without measurements getting lost or corrupted
* Installation and configuration of equipment (PHD, PHG) and facilities (power, phone, Internet)
* Both single-user (personal) and multi-user (shared with residents) PHDs. (E.g. via multiple logical devices on a single physical device)
* Interoperability between PHD, PHG and backend server.


Use Case: Diabetes monitoring
-
A person can self-monitor and manage lifestyle aspects that affect his diabetes condition. Recording details of his lifestyle can enhance the value of the glucose readings from a portable glucose meter. This self-monitoring and management process is facilitated by one or more wearable monitors and interactions with one or more PHGs and back-end servers. The feedback the person receives is a function of continuous measurements collected by the monitor(s) they wear, periodic measurements about their physiological state from a portable glucose meter or from the wearable monitor itself, and from manual entry of additional details. Also, the person may receive feedback about these measurements from a healthcare provider to support the treatment of that person’s diabetic condition. The purpose is both to ensure continued adherence to health monitoring and improvements in the relevant end-points such as quality of life, average measured glucose levels, etc.

Use Case: Healthcare with OTC sensors
-
Individuals can proactively manage their health and fitness outside of traditional clinical settings by using Over-the-Counter (OTC) sensors and wearable devices. These devices, which include weighing scales, health thermometers, heart-rate monitors, blood pressure monitors, glucose meters, and pulse oximeters, are designed for consumer use and typically require minimal training. They enable users to self-monitor and manage various health and fitness conditions such as obesity, insomnia, hypertension, diabetes, respiratory issues, and general physical fitness.

Other types of wearable sensors continuously track metrics like body activity, blood pressure, and SpO2, sending the data to the user’s smartphone (PHG). The PHG then forwards this information to service providers, such as healthcare organizations, fitness coaches, or wellness platforms, for remote monitoring and personalized feedback. This approach allows for ongoing support and intervention with minimal disruption to daily life. Users may also access their accumulated data through applications, gaining insights and recommendations to support their health and fitness goals.

Depending on the service, data privacy requirements may vary—from strict protection of Personal Health Information (PHI) for medical monitoring (e.g., Automated Insulin Delivery systems) to more open sharing for fitness tracking or coaching purposes. This use case highlights the growing role of connected health and fitness services in empowering individuals to take charge of their well-being outside of hospital environments.

Use Case: Medical research
-
Another use case is participation in medical research. For example, a medical center associated with a large university is conducting a study on memory impairment interventions in the elderly. The study involves the patients participating in adaptive on-line memory ‘games’. The data is collected in association with a home healthcare service. The use of remote monitoring allows the study to collect a large set of data with minimal impact on the involved patients. The automated approach reduces cost, increases sample size, allows the collection of larger amounts of data from each participant, and the minimal impact is likely to result in longer participation times. Data anonymity is often important in such studies. 
