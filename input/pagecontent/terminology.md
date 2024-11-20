## Terminology

The ISO/IEEE 11073-10101 Nomenclature standard (11073 MDC) provides a comprehensive terminology for device models according to the ISO/IEEE 11073-10201 and 11073-10206 Domain information models (DIM). 
It is the required code system for profiles in this implementation guide. Other additional coding systems expressing the same concepts may also be used.
Reference identifiers, terminology codes, and descriptions are available at the <a href="https://rtmms.nist.gov/rtmms/index.htm">Rosetta Terminology Mapping Management System</a> (RTMMS).

<p>The PHD profiles define rules for terminology usage:</p>
<ul>
<li>
  <code>Device.specializations</code> shall have a coding from the 11073 MDC Infra partition describing the device specializations and sub-profile standards the PHD conforms to. As the specialization elements are of type CodeableConcept there can be additional codings from other code systems.
</li>
</ul>
<p>The <a href="http://hl7.org/fhir/observation-vitalsigns.html">Vital Signs Profile</a>, which is part of FHIR core specification, applies for some commonly used measurement observations (e. g., heart rate, blood pressure, respiratory rate, oxygen saturation, body temperature). The main impact this core requirement imposes on the PHD profiles is that for measurements that are considered vital signs, the LOINC code for that vital sign must be present. 
</p><p>
Consequently for vital signs measurements the <code>Observation.code</code> and, for compound metrics, the <code>Observation.component.code</code> elements must contain a matching <a href="http://hl7.org/fhir/loinc.html">LOINC</a> code in addition to the required 11073 MDC code. 
</p><p>
The Vital Signs Profile also specifies that the Quantity data type in <code>Observation.value[x]</code> and <code>Observation.component.value[x]</code> contains the units of measure which shall be <a href="http://hl7.org/fhir/ucum.html">UCUM</a>. The PHD profiles extends this requirement for all measurements that are of type Quantity, with the exception of rare cases where no UCUM code is defined.
</p>

### Code Systems

<table class="table-striped" style="width:100%">
<col style="width:40%"/>
<col style="width:60%"/>
{% include table-codesystems.xhtml %}
</table>

### Value Sets

<table class="table-striped" style="width:100%">
<col style="width:40%"/>
<col style="width:60%"/>
{% include table-valuesets.xhtml %}
</table>
