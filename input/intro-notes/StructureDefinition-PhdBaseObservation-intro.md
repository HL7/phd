
The PHD Base Observation profile contains the elements that are common to all PHD Observation profiles describing measurements. These element are: 
 - gatewayDevice extension: the PHG responsible for generating the upload
 - code: what the measurement is, 
 - subject: the patient this measurement refers to,
 - effective[x]: the time stamp and perhaps duration of the measurement,
 - device: the PHD taking the measurement, 
 - derivedFrom: references to any coincident time stamp and/or refenced other observations, and 
 - components: contains any additional measurement descriptions (Supplemental Information and relative time stamps)
 - category: a fixed value identifying observations generated by PHDs
 - measurement status
- performer[ ]: optional, when the patient is known to be the performer this may refer to the patient

