### Major Updates in version 2.0.0 since version 1.1.0

#### Standards Foundation Updates

1. **IEEE 11073-10206 Support**: The IG now focuses on comprehensive support for IEEE 11073-10206 ACOM (Abstract Communication Object Model) specifications, moving away from the original IEEE 11073-20601 focus.

2. **Bluetooth GHS Integration**: Added support for Bluetooth Generic Health Sensor (GHS) specifications, broadening the scope of supported personal health devices.

#### Documentation and Profile Improvements

3. **Enhanced Profile Consumer Documentation**: Significantly rewritten consumer guidance with better explanations of how to use PHD-generated FHIR resources, including clearer guidance on measurement types, status handling, and device information.

4. **Reorganized Technical Content**: 
   - Consolidated IEEE 11073 FLOAT/SFLOAT documentation 
   - Integrated coincident timestamp content into profile documentation
   - Updated guidance for better clarity

#### Terminology Updates

5. **Code System Migration**: Updated to use official HL7 terminology server versions of ASN1ToHL7 and Continua Device Identifiers code systems.

6. **Missing MDC Codes**: Added support for MDC codes not yet available in standard terminology, including Spirometer device specialization.

#### Profile Enhancements

7. **IEEE 11073-10206 Mapping**: Added formal mappings showing how ACOM elements map to FHIR elements in the PhdDeviceMetric profile.

8. **Profile Documentation**: Enhanced explanations across all profiles with clearer guidance on when elements are used and how they relate to IEEE 11073 standards.

#### Example Updates

9. **Improved Examples**: Updated observation examples with better documentation and clarifications about identifier usage in real implementations.

### Content Quality Improvements

The changes focus on improving documentation quality, clarifying the relationship between IEEE 11073 standards and FHIR profiles, and ensuring terminology consistency. The updates make the IG more consumable for implementers while expanding support for both IEEE 11073-10206 ACOM and Bluetooth GHS specifications.

### Resolved Issues
Issues reported against this IG are tracked in the HL7 Jira system. The following table lists the issues that have been "resolved" and "applied" in this release of the PHD IG:

| Key | Summary |
|-----|---------|
| [FHIR-52861](https://jira.hl7.org/browse/FHIR-52861) | PhdDeviceMetric should have source as mandatory element |
| [FHIR-52115](https://jira.hl7.org/browse/FHIR-52115) | please characterize major changes in your change log |
| [FHIR-48397](https://jira.hl7.org/browse/FHIR-48397) | Ensure appropriate copyright on IEEE codesystems |
| [FHIR-48280](https://jira.hl7.org/browse/FHIR-48280) | Examples need modification- current stories are repetitive. |
| [FHIR-48244](https://jira.hl7.org/browse/FHIR-48244) | Streamline PHD IG |
| [FHIR-48243](https://jira.hl7.org/browse/FHIR-48243) | PhdCompoundNumericObservation |
| [FHIR-48242](https://jira.hl7.org/browse/FHIR-48242) | PhdCodedEnumerationObservation |
| [FHIR-48241](https://jira.hl7.org/browse/FHIR-48241) | PhdBitsEnumerationObservation profiling |
| [FHIR-48240](https://jira.hl7.org/browse/FHIR-48240) | PhdRtsaObservation profiling |
| [FHIR-48239](https://jira.hl7.org/browse/FHIR-48239) | PhdStringEnumerationObservation profiling |
| [FHIR-48238](https://jira.hl7.org/browse/FHIR-48238) | Profiled resources can reference non-profiled resources |
| [FHIR-48237](https://jira.hl7.org/browse/FHIR-48237) | PhdCoincidentTimeStampObservation profiling |
| [FHIR-48236](https://jira.hl7.org/browse/FHIR-48236) | Review and correct PhdDevice and PhgDevice profiling |
| [FHIR-48234](https://jira.hl7.org/browse/FHIR-48234) | DeviceTypes11073MDC should be intensionally defined. |
| [FHIR-48233](https://jira.hl7.org/browse/FHIR-48233) | Valueset incorrectly claims to have exactly 1000 concepts |
| [FHIR-48232](https://jira.hl7.org/browse/FHIR-48232) | ASN1ToHL7 Codesystem cleanup |
| [FHIR-48231](https://jira.hl7.org/browse/FHIR-48231) | ContinuaPHD Codesystem cleanup |
| [FHIR-48230](https://jira.hl7.org/browse/FHIR-48230) | Remove non-existant code hierarchies |
| [FHIR-48229](https://jira.hl7.org/browse/FHIR-48229) | Correct CapabilityStatement kind |
| [FHIR-48228](https://jira.hl7.org/browse/FHIR-48228) | Remove unused CodeSystem ASN1EventOrState |
| [FHIR-48227](https://jira.hl7.org/browse/FHIR-48227) | Revert gratuitous change to R4B |
| [FHIR-48226](https://jira.hl7.org/browse/FHIR-48226) | Correct MDCnotObject VS definition |
| [FHIR-48225](https://jira.hl7.org/browse/FHIR-48225) | Fix Numeric Observation profile |
| [FHIR-48224](https://jira.hl7.org/browse/FHIR-48224) | PhdPatient is overly constrained. |
| [FHIR-48223](https://jira.hl7.org/browse/FHIR-48223) | Inconsistent use of ® mark |
| [FHIR-48222](https://jira.hl7.org/browse/FHIR-48222) | Remove box around "threshold error" |
| [FHIR-48221](https://jira.hl7.org/browse/FHIR-48221) | Complete IG needs proofreading |
| [FHIR-48220](https://jira.hl7.org/browse/FHIR-48220) | Clarify GHS and Source-handle-reference |
| [FHIR-48219](https://jira.hl7.org/browse/FHIR-48219) | Clarify current timeline. |
| [FHIR-48218](https://jira.hl7.org/browse/FHIR-48218) | Correct "current" misspelling |
| [FHIR-48217](https://jira.hl7.org/browse/FHIR-48217) | Assorted performer corrections |
| [FHIR-48216](https://jira.hl7.org/browse/FHIR-48216) | Section duplicates content. |
| [FHIR-48215](https://jira.hl7.org/browse/FHIR-48215) | Assorted BaseObservation profile recommendations |
| [FHIR-48214](https://jira.hl7.org/browse/FHIR-48214) | Slicing for identifier is incorrect. |
| [FHIR-48213](https://jira.hl7.org/browse/FHIR-48213) | Profiling should contain mappings |
| [FHIR-48212](https://jira.hl7.org/browse/FHIR-48212) | BaseObservation require presence of unused meta |
| [FHIR-48211](https://jira.hl7.org/browse/FHIR-48211) | Clarify accuracy units |
| [FHIR-48210](https://jira.hl7.org/browse/FHIR-48210) | Clarify conditional create identifier generation. |
| [FHIR-48209](https://jira.hl7.org/browse/FHIR-48209) | Include discussion of additional PHG behavior |
| [FHIR-48208](https://jira.hl7.org/browse/FHIR-48208) | Missing word |
| [FHIR-48207](https://jira.hl7.org/browse/FHIR-48207) | Correct spelling of Artifacts |
| [FHIR-48206](https://jira.hl7.org/browse/FHIR-48206) | Assorted issues with Patient resource discussion |
| [FHIR-48205](https://jira.hl7.org/browse/FHIR-48205) | Use boolean rather than coded Y/N |
| [FHIR-48203](https://jira.hl7.org/browse/FHIR-48203) | USB PID/VID are not identifiers |
| [FHIR-48202](https://jira.hl7.org/browse/FHIR-48202) | Document device identifier formats |
| [FHIR-48201](https://jira.hl7.org/browse/FHIR-48201) | Clean up UDI language |
| [FHIR-48200](https://jira.hl7.org/browse/FHIR-48200) | Review coincident timestamp for use in sometimes-connected environments |
| [FHIR-48199](https://jira.hl7.org/browse/FHIR-48199) | Correct "timeline" |
| [FHIR-48198](https://jira.hl7.org/browse/FHIR-48198) | PHDs may support external time sync |
| [FHIR-48197](https://jira.hl7.org/browse/FHIR-48197) | ReferenceRange not for recording min/max values |
| [FHIR-48196](https://jira.hl7.org/browse/FHIR-48196) | Correct spelling of "indicating" |
| [FHIR-48195](https://jira.hl7.org/browse/FHIR-48195) | Should populate coding.display. |
| [FHIR-48194](https://jira.hl7.org/browse/FHIR-48194) | Choosing components vs separate Observations. |
| [FHIR-48193](https://jira.hl7.org/browse/FHIR-48193) | dataAbsentReason misspelled |
| [FHIR-48192](https://jira.hl7.org/browse/FHIR-48192) | PHD IG is unnecessarily large |
| [FHIR-48191](https://jira.hl7.org/browse/FHIR-48191) | "Two other values" should be enumerated |
| [FHIR-48190](https://jira.hl7.org/browse/FHIR-48190) | Correct numbering of section 1.2.4.1 |
| [FHIR-48189](https://jira.hl7.org/browse/FHIR-48189) | Do not expect clients to ignore identifiers |
| [FHIR-48188](https://jira.hl7.org/browse/FHIR-48188) | Quantity can record "off-scale" values |
| [FHIR-48187](https://jira.hl7.org/browse/FHIR-48187) | Text ascribes actions to the IG itself |
| [FHIR-48186](https://jira.hl7.org/browse/FHIR-48186) | Assorted spelling errors |
| [FHIR-48185](https://jira.hl7.org/browse/FHIR-48185) | Clarify drivers of relative timestamp adoption |
| [FHIR-48183](https://jira.hl7.org/browse/FHIR-48183) | Clarify referenced specification and tick resolution |
| [FHIR-48182](https://jira.hl7.org/browse/FHIR-48182) | Much simpler needs a comparison |
| [FHIR-48181](https://jira.hl7.org/browse/FHIR-48181) | V2 Binary needs codesystem |
| [FHIR-48180](https://jira.hl7.org/browse/FHIR-48180) | Correct spelling of valueCodeableConcept |
| [FHIR-48179](https://jira.hl7.org/browse/FHIR-48179) | Use of derivedFrom is incorrect |
| [FHIR-48178](https://jira.hl7.org/browse/FHIR-48178) | Coincident timestamp inconsistent with FHIR expectations |
| [FHIR-48177](https://jira.hl7.org/browse/FHIR-48177) | Reasons for disallowing Instant datatype do not make sense |
| [FHIR-48176](https://jira.hl7.org/browse/FHIR-48176) | Clarify effective[x] can be two datatypes |
| [FHIR-48174](https://jira.hl7.org/browse/FHIR-48174) | Do not link to build.fhir.org. |
| [FHIR-48173](https://jira.hl7.org/browse/FHIR-48173) | Do not require ignoring identifier |
| [FHIR-48172](https://jira.hl7.org/browse/FHIR-48172) | Technique should be in method not component |
| [FHIR-48171](https://jira.hl7.org/browse/FHIR-48171) | Don't use derivedFrom for coincident time stamp |
| [FHIR-48170](https://jira.hl7.org/browse/FHIR-48170) | Clarify extension description |
| [FHIR-48169](https://jira.hl7.org/browse/FHIR-48169) | Use coding style for elements and resource content |
| [FHIR-48168](https://jira.hl7.org/browse/FHIR-48168) | Correct description of profile element |
| [FHIR-48167](https://jira.hl7.org/browse/FHIR-48167) | Clarify non-processing of string measurements |
| [FHIR-48166](https://jira.hl7.org/browse/FHIR-48166) | Justify state or event measurement profile |
| [FHIR-48165](https://jira.hl7.org/browse/FHIR-48165) | Do not require profile declarations |
| [FHIR-48164](https://jira.hl7.org/browse/FHIR-48164) | Clarify use of "text" entries |
| [FHIR-48163](https://jira.hl7.org/browse/FHIR-48163) | Timestamp is one word |
| [FHIR-48162](https://jira.hl7.org/browse/FHIR-48162) | Simplify Coincident timestamp mention. |
| [FHIR-48161](https://jira.hl7.org/browse/FHIR-48161) | Add missing hyphens |
| [FHIR-48160](https://jira.hl7.org/browse/FHIR-48160) | Clarify use of manually entered data |
| [FHIR-48159](https://jira.hl7.org/browse/FHIR-48159) | Clarify protection of PHI |
| [FHIR-48158](https://jira.hl7.org/browse/FHIR-48158) | Correct physical state |
| [FHIR-48157](https://jira.hl7.org/browse/FHIR-48157) | Clarify diabetes use case |
| [FHIR-48156](https://jira.hl7.org/browse/FHIR-48156) | Clarify multiple RPM scope bullets |
| [FHIR-48155](https://jira.hl7.org/browse/FHIR-48155) | Clarify whether asserted statements are general or part of a use case. |
| [FHIR-48154](https://jira.hl7.org/browse/FHIR-48154) | Confirm most PHDs used for RPM. |
| [FHIR-48153](https://jira.hl7.org/browse/FHIR-48153) | Remove unnecessary capitalization |
| [FHIR-48152](https://jira.hl7.org/browse/FHIR-48152) | Define "communicating PHD" |
| [FHIR-48151](https://jira.hl7.org/browse/FHIR-48151) | Glossary or list of organizations would be helpful |
| [FHIR-48150](https://jira.hl7.org/browse/FHIR-48150) | Add link to IHE |
| [FHIR-48149](https://jira.hl7.org/browse/FHIR-48149) | Clarify point of reference to Continua guidelines |
| [FHIR-48148](https://jira.hl7.org/browse/FHIR-48148) | Add link to H.812.5 |
| [FHIR-48147](https://jira.hl7.org/browse/FHIR-48147) | Justify 95% reference |
| [FHIR-48146](https://jira.hl7.org/browse/FHIR-48146) | Clarify audience introductory sentence. |
| [FHIR-48145](https://jira.hl7.org/browse/FHIR-48145) | Github link broken |
| [FHIR-48144](https://jira.hl7.org/browse/FHIR-48144) | Clarify mapping of all data by PHG |
| [FHIR-48143](https://jira.hl7.org/browse/FHIR-48143) | FHIR components is not clear |
| [FHIR-48142](https://jira.hl7.org/browse/FHIR-48142) | Ensure protection of PII. |
| [FHIR-48141](https://jira.hl7.org/browse/FHIR-48141) | Clarify patient information |
| [FHIR-48140](https://jira.hl7.org/browse/FHIR-48140) | Clarify ACOM |
| [FHIR-48139](https://jira.hl7.org/browse/FHIR-48139) | Remove Continua references |
| [FHIR-48138](https://jira.hl7.org/browse/FHIR-48138) | Purpose is (almost) duplicative of Home page. |
| [FHIR-48137](https://jira.hl7.org/browse/FHIR-48137) | Correct section numbering. |
| [FHIR-48136](https://jira.hl7.org/browse/FHIR-48136) | State Profile Consumer section more positively for audience. |
| [FHIR-48135](https://jira.hl7.org/browse/FHIR-48135) | Remove history and FHIR overview sections |
| [FHIR-48134](https://jira.hl7.org/browse/FHIR-48134) | Overview page is largely redundant |
| [FHIR-48133](https://jira.hl7.org/browse/FHIR-48133) | IG Menu should be more complete |
| [FHIR-48132](https://jira.hl7.org/browse/FHIR-48132) | Include Appendix in menu |
| [FHIR-48131](https://jira.hl7.org/browse/FHIR-48131) | Remove gratuitious links at bottom of page. |
| [FHIR-48130](https://jira.hl7.org/browse/FHIR-48130) | Provide links to IEEE 11073 |
| [FHIR-48129](https://jira.hl7.org/browse/FHIR-48129) | Clarify mentions of Bluetooth LE |
| [FHIR-48128](https://jira.hl7.org/browse/FHIR-48128) | Combine paragraphs |
| [FHIR-48127](https://jira.hl7.org/browse/FHIR-48127) | Link to referenced sections |
| [FHIR-48126](https://jira.hl7.org/browse/FHIR-48126) | IGs cannot interpret. |
| [FHIR-48125](https://jira.hl7.org/browse/FHIR-48125) | IG should be plural. |
| [FHIR-48124](https://jira.hl7.org/browse/FHIR-48124) | Consistent formatting for IEEE standard names |
| [FHIR-48123](https://jira.hl7.org/browse/FHIR-48123) | Link to published PoCD guide |
| [FHIR-48122](https://jira.hl7.org/browse/FHIR-48122) | Clarify whether IG scope is beyond quality and research |
| [FHIR-48121](https://jira.hl7.org/browse/FHIR-48121) | Call out box incorrectly flags IG as CI build |
| [FHIR-48020](https://jira.hl7.org/browse/FHIR-48020) | I would remove the italics and bold on this page |
| [FHIR-48018](https://jira.hl7.org/browse/FHIR-48018) | References to the IEEE specs and Bluetooth would be useful |
| [FHIR-48017](https://jira.hl7.org/browse/FHIR-48017) | Inconsistent references to ACOM spec |
| [FHIR-48015](https://jira.hl7.org/browse/FHIR-48015) | Typo - " Abstract COntent Model" |
| [FHIR-48013](https://jira.hl7.org/browse/FHIR-48013) | Second paragraph - "Implementations following this IG are likely to be done on PHGs." - what does this mean? |
| [FHIR-48012](https://jira.hl7.org/browse/FHIR-48012) | Suggestion for home page diagram |
| [FHIR-48011](https://jira.hl7.org/browse/FHIR-48011) | What is " a PHG-validated consistent time stamp"? |
| [FHIR-48010](https://jira.hl7.org/browse/FHIR-48010) | Confusing text about -20601 |
| [FHIR-48008](https://jira.hl7.org/browse/FHIR-48008) | Reference missing for "The Technical Implementation Guidance section ..." and "The Profiles section" |
| [FHIR-48006](https://jira.hl7.org/browse/FHIR-48006) | Looks like random words are with italic style |
| [FHIR-48005](https://jira.hl7.org/browse/FHIR-48005) | References to the IEEE specs would be useful |
| [FHIR-48001](https://jira.hl7.org/browse/FHIR-48001) | "Uploads generated by compliant PHGs.." - what are compliant PHGs? |
| [FHIR-47657](https://jira.hl7.org/browse/FHIR-47657) | Need further alignment with latest IEEE ACOM specification |
| [FHIR-47609](https://jira.hl7.org/browse/FHIR-47609) | Consider support for UDI in PHD |
| [FHIR-47576](https://jira.hl7.org/browse/FHIR-47576) | PHG Implementation Guidance page should have PHG spelled out |
| [FHIR-47575](https://jira.hl7.org/browse/FHIR-47575) | Plain Language Summary about HL7 and this Guide to the Home Page. |
| [FHIR-47574](https://jira.hl7.org/browse/FHIR-47574) | Continuous Build note (in salmon) should be removed |
| [FHIR-47493](https://jira.hl7.org/browse/FHIR-47493) | Data element provenance seems to be missing |
| [FHIR-46964](https://jira.hl7.org/browse/FHIR-46964) | Link to / use of "Continua" |
| [FHIR-46832](https://jira.hl7.org/browse/FHIR-46832) | Minor typos |
| [FHIR-46831](https://jira.hl7.org/browse/FHIR-46831) | Reduce the ties to 20601 |
| [FHIR-46830](https://jira.hl7.org/browse/FHIR-46830) | Duplicated contents |
| [FHIR-46829](https://jira.hl7.org/browse/FHIR-46829) | Wrong MDC code (5) |
| [FHIR-46828](https://jira.hl7.org/browse/FHIR-46828) | Non-context-free MDC codes |
| [FHIR-46823](https://jira.hl7.org/browse/FHIR-46823) | Dead link to RTMMS |
| [FHIR-46822](https://jira.hl7.org/browse/FHIR-46822) | Dead link to LOINC |
| [FHIR-46821](https://jira.hl7.org/browse/FHIR-46821) | Wrong MDC code (4) |
| [FHIR-46820](https://jira.hl7.org/browse/FHIR-46820) | Wrong MDC code (3) |
| [FHIR-46819](https://jira.hl7.org/browse/FHIR-46819) | Wrong MDC code (2) |
| [FHIR-46818](https://jira.hl7.org/browse/FHIR-46818) | Wrong MDC code |
| [FHIR-46768](https://jira.hl7.org/browse/FHIR-46768) | remove "Fixme" |
| [FHIR-46767](https://jira.hl7.org/browse/FHIR-46767) | Meta.profile mandatory or not? |
| [FHIR-46766](https://jira.hl7.org/browse/FHIR-46766) | LOINC "magic" codes (still) |
| [FHIR-46765](https://jira.hl7.org/browse/FHIR-46765) | Esoteric language |
| [FHIR-46764](https://jira.hl7.org/browse/FHIR-46764) | Conditional-create identifier |
| [FHIR-46586](https://jira.hl7.org/browse/FHIR-46586) | derivedFrom pointing to a coincident timestamp conflicts with vital signs constraints |

