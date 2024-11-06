
<!-- https://stackoverflow.com/questions/27977078/how-do-i-reference-the-root-directory-of-my-site-and-why-wont-jekyll-render-so -->

This Guide has the following main chapters:

#### IG Home
[Home page](index.html)

#### Table of Contents
[Table of Contents](toc.html)

#### Introduction
These sections introduce this implementation guide, its scope, what it is meant to do as well as what it is not meant to do, who it is of interest for, and some use cases. 
 - [Purpose]({{ output }}Purpose.html)
 - [Audience]({{ output }}Audience.html)
 - [Scope]({{ output }}Scope.html)
 - [Use Cases]({{ output }}UseCases.html)

#### Profile Consumers
Readers primarily interested in using data from PHD devices are directed to [this chapter](ProfileConsumers.html).
Unlike resource generation, consumption of the resources described in this IG should not require in-depth knowledge of the IEEE 11073 Information Model and PHD communication protocol. Similarly, a reader focusing on consumption of data may find less value in those parts of the IG focused on mapping of PHD data to FHIR, as that process will have already occured before consumption.

#### PHG Implementation Guidance
This informative [chapter](TechnicalImplementationGuidance.html) provides an introduction and overview of the IEEE 11073 topics used in the profile mappings, such as the IEEE 11073-10206 Abstract Content Information Model (ACOM), ACOM objects and attributes, nomenclature codes, and Mder FLOATs, among others. This chapter also discusses some of the reasons behind the generic modeling approach used by this guide. 

#### Profiles
This [chapter](profiles.html) contains the normative content for PHG implementation. It provides the Structure Definitions for each of the defined profiles as well as sections giving the mapping details. It is here where the PHG implementer needs to go to develop the software. For convenience, there are links back to sections in the PHG Implementation Guidance in the Profile Details sections when some of the trickier topics come up.

#### Artifact Index
This [chapter](artifacts.html) lists all the Structure Definitions, Code Systems, Value Sets, Capability Statements, and Examples included in this guide. It should be noted that the non-Bundle examples illustrate the resources once on the FHIR server. These examples will always have logical ids, but in many cases, the uploaded example should NOT have logical ids. The PHG implementer should use the examples in the normative profile sections describing the mapping for guidance instead of those in this chapter.

#### History
The [list]({{site.data.fhir.canonical}}/history.html) of all published versions of this IG.

#### FHIR
Link to the used [FHIR specification]({{site.data.fhir.path}}index.html)


 - [Next: Purpose](Purpose.html)
 - [Previous: Homepage](index.html)
