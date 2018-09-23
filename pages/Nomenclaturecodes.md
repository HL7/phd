---
title: Nomenclature codes
layout: default
active: Nomenclaturecodes
---

11073 20601 uses nomenclature codes to represent and entity that needs to be machine readable. Nomenclature codes are 32-bit unsigned integers. The most significant 16 bits give the *partition* and the least significant 16 bits give the *term code*. Partitions group the term codes into sets with a common meaning. For example, in PHD there is a health and fitness partition which groups terms assoicated with health and fitness, such as term codes for activities like run, bike, swim, altitude gained, distance, etc.

In FHIR, the 32-bit value of the code is always used. In the PHD to PHG exchange, the 16-bit code is used when the partition can be inferred from the attribute to decrease bandwidth.