### Purpose
This Implementation Guide defines the use of FHIR resources to convey measurements and supporting data from personal health devices (PHDs) to a receiving systems for electronic medical records, clinical decision support, and medical data archiving for aggregate quality measurement and research purposes. In most cases there is a Personal Health Gateway (PHG) that handles the PHD communications. The PHG translates the PHD data to the appropriate form and uploads it to the receiving systems. 

Other related implementation guides focus on home-based personal health devices, and physiological and technical alerts from medical devices.

## Table of structure definitions

{% include table-structuredefinitions.xhtml %}

## Differential

{% include StructureDefinition-PhdDevice-diff.xhtml %}
{% include StructureDefinition-PhdNumericObservation-diff.xhtml %}

## Snapshot

{% include StructureDefinition-PhdDevice-snapshot.xhtml %}

{% include StructureDefinition-PhdDevice-dict.xhtml %}
