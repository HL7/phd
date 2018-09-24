---
title: Purpose
layout: default
active: Purpose
---

The Personal Connected Health Alliance (PCHA) Continua Implementation Guide describes how information from Continua-certified personal health devices (PHDs) is represented in FHIR. PHDs are devices that are mostly used in home-care contexts and include Continua-certified devices such as glucose meters, blood pressure cuffs, weight scales, thermometers, etc. The PHD 'information' in this context means both the measurements taken by the PHD and data about the PHD itself. The PHD data includes characteristics, operational status and capabilities for the device, such as the serial number, manufacturer name, and firmware revision. Typically, the PHD is in the patient's home or on the patient's person.

In most cases a Continua-certified personal health gateway (PHG) is responsible for receiving and decoding the information from the PHD and either generating and uploading the FHIR resources or providing sufficient information to a backend server such that the backend server can generate the FHIR resources. When a PHG is involved, information about the PHG is also generated.

Patient information, such as demographic and administrative information about the patient, is treated separately. First, patient information is not provided by PHDs through standardized protocols and therefore must be supplied and associated by out-of-band means to a PHG. Second, PHD measurements are typically taken remotely requiring that any patient information be transferred across the public network. For protection of Personal Health Information (PHI) the Continua profile allows PHGs to be supplied with opaque and unique 'keys' by out-of-band means that only the health care provider can link to a patient. Using this approach PHI is never exchanged on the wire and furthermore, does not need to be present on the PHD or PHG.

The purpose of this Implementation Guide is to specify the mapping of PHD information to FHIR components. For consumers (readers) of FHIR data, this Implementation Guide specifies the FHIR components that contain the PHD information.

New GitHub location: https://github.com/HL7/uv-pocd