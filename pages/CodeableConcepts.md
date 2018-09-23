---
title: Codeable Concepts
layout: default
active: CodeableConcepts
---

In this guide there will be several instances where the 11073 10101 nomenclature (MDC) codes are mapped to FHIR. In almost all cases this mapping involves an element that is a CodeableConcepts data type. The mapping is as follows:

 - CodeableConcept.coding.code = *partition* * 2<sup>16</sup> + *term code*
 - CodeableConcept.coding.system = urn:iso:std:iso:11073:10101
 - CodeableConcept.coding.display = reference identifier (*optional*)

The display element is optional since the uploader may not know what the code means; for example, if the uploader works with a PHD specialization developed after the uploader had been released. However, this guide strongly encourages that the display element contains at least the normative reference identifier for the MDC code if it is known.