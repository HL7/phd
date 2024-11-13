
This Implementation Guide specifies profiles on the FHIR <a href="http://hl7.org/fhir/patient.html">Patient</a>, <a href="http://hl7.org/fhir/device.html">Device</a>, and <a href="http://hl7.org/fhir/observation.html">Observation</a> resources. 
Each profile defines constraints, extensions, and terminology requirements for an implementation that claims conformance to this guide.

### Profile Implementation Details
The following profiles are defined in this IG and have their own descriptive page: 

 - [Profiles Overview](ProfilesOverview.html), gives more information on the set of profiles.

 - [Base Observation Profile](StructureDefinition-PhdBaseObservation.html), the base profile for the observation profiles in this IG:
   - [Phd Numeric Observation Profile](StructureDefinition-PhdNumericObservation.html)
   - [Phd Compound Numeric Observation Profile](CompoundNumericObservationProfile.html)
   - [Phd Coded Enumeration Observation Profile](StructureDefinition-PhdCodedEnumerationObservation.html)
   - [Phd BITs Enumeration Observation Profile](BITsEnumerationObservationProfile.html)
   - [Phd Real Time Sample Array Observation Profile](RtsaObservationProfile.html)
   - [Phd String Enumeration Observation Profile](StructureDefinition-PhdStringEnumerationObservation.html)
   

 - [Phd Coincident Time Stamp Observation Profile](CoincidentTimeStampObservationProfile.html), profile to associate two time lines
 
 - [Phd Device Profile](PhdDeviceProfile.html), the profile for a personal health sensor device generating observations
 - [Phg Device Profile](PhgDeviceProfile.html), the profile for a personal health gateway receiving such observations and uploading them to a FHIR server
 - [Phd Patient Profile](PhdPatientProfile.html), the profile for a patient using a PHD


### Alphabetic list of Profile Structure Definitions used in this Guide

These structure definition profiles, along with all the resources used by this Guide, are also found in the Artifacts page.

<style>table, th, td {
border: 1px solid black;
border-collapse:collapse;
padding: 6px;}</style>

<table class="table-striped" style="width:100%">
<col style="width:40%"/>
<col style="width:60%"/>
{% include table-structuredefinitions.xhtml %}
</table>

<!-- https://stackoverflow.com/questions/27977078/how-do-i-reference-the-root-directory-of-my-site-and-why-wont-jekyll-render-so -->

