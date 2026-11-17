# PHD Jira change log — draft

> **Not a verified or policy-compliant release change log.** These tables are a
> review aid, grouped by Jira **Resolved** date as requested. Resolution is not
> evidence of when a change was applied or published. Verify each ticket against
> its actual release, including changes made on parallel release branches.

The export contains 408 issues marked Published. Tickets with a Change Impact
are grouped under the policy's **Not-Compatible**, **Compatible, Substantive**,
and **Non-Substantive** headings. The 31 tickets with no Change Impact remain
**unclassified** and must be classified before publication. The export does
not provide a release assignment or the actual change description.
The descriptions below are Jira summary titles, not verified descriptions of
the implemented changes. Where the actual change differs substantially from
the title, replace or supplement it with the actual change.

Release dates and labels come from the [PHD publication history](https://hl7.org/fhir/uv/phd/history.html).
Except for the 2.0.1 and 3.0.0 assignments noted below, each table includes
tickets resolved after the immediately preceding date in that history and on or
before the table's date, regardless of branch. Ballot and STU release tracks
overlap; chronological adjacency does not establish release ancestry.
Resolved timestamps in the export have no time zone, so grouping uses the
calendar date only. No tickets were resolved on a release boundary date.

Source: Jira CSV export dated 2026-11-16, filtered to Published issues.
The export contains no applied-but-unpublished issues, so it cannot establish
the complete contents of the 3.0.0 draft or subsequent releases.

## [0.1.0](https://hl7.org/fhir/uv/phd/2018Jan) — 2018-01-01

Initial draft for comment.

This is the initial publication of the specification.

## [0.2.0](https://hl7.org/fhir/uv/phd/2019Jan) — 2018-12-04

STU 1 first ballot.

Resolved-date window: after 2018-01-01 through 2018-12-04.

### Not-Compatible

No exported tickets in this date window.

### Compatible, Substantive

| Jira ticket | Jira summary | Resolved |
| --- | --- | --- |
| [FHIR-15408](https://jira.hl7.org/browse/FHIR-15408) | IG lacks CapabilityStatements - 2018-Jan PHD #29 | 2018-02-25 |
| [FHIR-15383](https://jira.hl7.org/browse/FHIR-15383) | Pointing to the PHG in the Observation resource instead of the DeviceComponent will allow the presence of a single DeviceComponent to represent the PHD regardless of the uploading application as it will contain information ONLY about the PHD. As it is now | 2018-02-27 |
| [FHIR-15379](https://jira.hl7.org/browse/FHIR-15379) | **website comment** - 2018-Jan PHD #1 | 2018-09-28 |
| [FHIR-15380](https://jira.hl7.org/browse/FHIR-15380) | The approach for handling multiple specializations and the use of a ChildDeviceComponent does not work in the PHD infrastructure. In order for the uploader to perform this task, the PHD would need to provide a handle to the VMD so the uploader would know | 2018-09-28 |
| [FHIR-15393](https://jira.hl7.org/browse/FHIR-15393) | All observation and other profiles show the 110073 MDC code ordered to be the first coding in Observation.coding, This sets an bad precedent on future implementatins that are similar to, but not 11073 or Continua based, for positional dependencies. Modern | 2018-09-28 |
| [FHIR-15398](https://jira.hl7.org/browse/FHIR-15398) | Bad link - 2018-Jan PHD #19 | 2018-09-28 |
| [FHIR-15406](https://jira.hl7.org/browse/FHIR-15406) | IG lacks references to the technical artifacts, i.e. StructureDefinitions - 2018-Jan PHD #27 | 2018-09-28 |
| [FHIR-15409](https://jira.hl7.org/browse/FHIR-15409) | I could not find any justification for oredering the slices. Relax this constraint here and on other elements where there is ordered slicing ( such as here http://hl7.org/fhir/uv/phd/2018Jan/PhdRtsaObservationProfile.html for identifiers) to put less of a | 2018-09-28 |
| [FHIR-15411](https://jira.hl7.org/browse/FHIR-15411) | UCUM is preferred in FHIR and I recommend using itof MDC instead. At least provide a conceptMap from MDC to UCUM. - 2018-Jan PHD #32 | 2018-09-28 |
| [FHIR-15392](https://jira.hl7.org/browse/FHIR-15392) | Phd Parent DeviceComponent profile is described as a profile that *has* a parent DeviceComponent (the PHG). This is confusing. This profile should be the "PHD DeviceComponent profile", and the PHG profile should be called "PHG Parent DeviceComponent profi | 2018-10-12 |
| [FHIR-15401](https://jira.hl7.org/browse/FHIR-15401) | Reference needed - 2018-Jan PHD #22 | 2018-10-12 |
| [FHIR-15460](https://jira.hl7.org/browse/FHIR-15460) | Question about structural changes in FHIR versions. - 2018-Jan PHD #81 | 2018-10-12 |
| [FHIR-15465](https://jira.hl7.org/browse/FHIR-15465) | creating DeviceMetric resources could be of interest as well - see email discussion - 2018-Jan PHD #86 | 2018-10-12 |
| [FHIR-15479](https://jira.hl7.org/browse/FHIR-15479) | There should be an attribute in DeviceComponent and/or Device that can carry multiple device types. E.g. DeviceComponent.type with 1..* multiplicity - 2018-Jan PHD #100 | 2018-10-12 |
| [FHIR-15493](https://jira.hl7.org/browse/FHIR-15493) | Observation.related will be replaces with Observation.derivedFormat and Observation.hasMember (as it is announed on build.fhir.org). Should this be mentioned here as well? - 2018-Jan PHD #114 | 2018-10-12 |
| [FHIR-15500](https://jira.hl7.org/browse/FHIR-15500) | You should not take Device completely out of the workflow. We should not condemn potential consumers to mulitple query iterations to get at the same observation (one looking at Device and one at Device Component) to save bandwitdh for the reporter on some | 2018-10-12 |
| [FHIR-15501](https://jira.hl7.org/browse/FHIR-15501) | You should not take Device completely out of the workflow. We should not condemn potential consumers to mulitple query iterations to get at the same observation (one looking at Device and one at Device Component) to save bandwitdh for the reporter on some | 2018-10-12 |
| [FHIR-15502](https://jira.hl7.org/browse/FHIR-15502) | You should not take Device completely out of the workflow. We should not condemn potential consumers to mulitple query iterations to get at the same observation (one looking at Device and one at Device Component) to save bandwitdh for the reporter on some | 2018-10-12 |
| [FHIR-15503](https://jira.hl7.org/browse/FHIR-15503) | You should not take Device completely out of the workflow. We should not condemn potential consumers to mulitple query iterations to get at the same observation (one looking at Device and one at Device Component) to save bandwitdh for the reporter on some | 2018-10-12 |
| [FHIR-15505](https://jira.hl7.org/browse/FHIR-15505) | Harmonization of PHD FHIR Resource Usage to the PoCD Resource model. - 2018-Jan PHD #126 | 2018-10-12 |
| [FHIR-15506](https://jira.hl7.org/browse/FHIR-15506) | PHD IG Should Fully Integrate UCUM - 2018-Jan PHD #127 | 2018-10-12 |

### Non-Substantive

| Jira ticket | Jira summary | Resolved |
| --- | --- | --- |
| [FHIR-15407](https://jira.hl7.org/browse/FHIR-15407) | IG lacks example instances - 2018-Jan PHD #28 | 2018-03-03 |
| [FHIR-15488](https://jira.hl7.org/browse/FHIR-15488) | Structure question - 2018-Jan PHD #109 | 2018-06-06 |
| [FHIR-14547](https://jira.hl7.org/browse/FHIR-14547) | Typo in DefinitionofaMetricMeasurement | 2018-07-08 |
| [FHIR-14548](https://jira.hl7.org/browse/FHIR-14548) | Typoe in DIMtoFHIRMappingBasics | 2018-07-08 |
| [FHIR-15384](https://jira.hl7.org/browse/FHIR-15384) | The ASN.1 code system has no definitions. The section describes how to create the code from the PHD but this information is of no value to the consumer. The consumer needs to know where these codes are defined. There are a limited set which are defined in | 2018-09-28 |
| [FHIR-15386](https://jira.hl7.org/browse/FHIR-15386) | Typo - 2018-Jan PHD #7 | 2018-09-28 |
| [FHIR-15387](https://jira.hl7.org/browse/FHIR-15387) | PHDs such as glucometers also provide remote monitoring of measurements not included in the "vital signs panel" definition given by LOINC 85353-1 used elsewhere, and directly contradicts other FHIR useage. Should remove "vital signs" reference as confusin | 2018-09-28 |
| [FHIR-15388](https://jira.hl7.org/browse/FHIR-15388) | Typo - 2018-Jan PHD #9 | 2018-09-28 |
| [FHIR-15389](https://jira.hl7.org/browse/FHIR-15389) | Question about Metric object. - 2018-Jan PHD #10 | 2018-09-28 |
| [FHIR-15390](https://jira.hl7.org/browse/FHIR-15390) | Mder Measurement Status as used in the 11073 stds represents a blending of concepts - as mapped, some that can be mapped to DataAbsentReason, Status, as well as some that are relagated to a MeasurementStatus extension on Observation. Thosee shown as a "co | 2018-09-28 |
| [FHIR-15394](https://jira.hl7.org/browse/FHIR-15394) | Typo - 2018-Jan PHD #15 | 2018-09-28 |
| [FHIR-15395](https://jira.hl7.org/browse/FHIR-15395) | Typo - 2018-Jan PHD #16 | 2018-09-28 |
| [FHIR-15396](https://jira.hl7.org/browse/FHIR-15396) | suggested clarification - 2018-Jan PHD #17 | 2018-09-28 |
| [FHIR-15399](https://jira.hl7.org/browse/FHIR-15399) | Bad link - 2018-Jan PHD #20 | 2018-09-28 |
| [FHIR-15400](https://jira.hl7.org/browse/FHIR-15400) | Bad link - 2018-Jan PHD #21 | 2018-09-28 |
| [FHIR-15402](https://jira.hl7.org/browse/FHIR-15402) | clarify language - 2018-Jan PHD #23 | 2018-09-28 |
| [FHIR-15410](https://jira.hl7.org/browse/FHIR-15410) | it is not obvious to reader that these elements are extensions. Call them out as such and provide the supporting structureDefinition links. - 2018-Jan PHD #31 | 2018-09-28 |
| [FHIR-15412](https://jira.hl7.org/browse/FHIR-15412) | "home" entry should be capitalized to be consistent with the other items. - 2018-Jan PHD #33 | 2018-09-28 |
| [FHIR-15413](https://jira.hl7.org/browse/FHIR-15413) | Consider rewording for clarity - 2018-Jan PHD #34 | 2018-09-28 |
| [FHIR-15414](https://jira.hl7.org/browse/FHIR-15414) | "capabilitties" should be "capabilities" - 2018-Jan PHD #35 | 2018-09-28 |
| [FHIR-15415](https://jira.hl7.org/browse/FHIR-15415) | "chronically-ill" should be "chronically ill" - 2018-Jan PHD #36 | 2018-09-28 |
| [FHIR-15416](https://jira.hl7.org/browse/FHIR-15416) | Suggest displaying the differences between 3.0.1 and 3.2.0 in a table, instead of a set of bullets - 2018-Jan PHD #37 | 2018-09-28 |
| [FHIR-15418](https://jira.hl7.org/browse/FHIR-15418) | Most instances of Quantity use .unit. In this case, you use .code. If possible, suggest populating .unit in addition to .code so that it can be interpreted by implementers more easily. This may require a mapping between commonly used units (perhaps from U | 2018-09-28 |
| [FHIR-15419](https://jira.hl7.org/browse/FHIR-15419) | Version History case correction for "Implementation Guide" - 2018-Jan PHD #40 | 2018-09-28 |
| [FHIR-15420](https://jira.hl7.org/browse/FHIR-15420) | Version History correction for device "thermometer" - 2018-Jan PHD #41 | 2018-09-28 |
| [FHIR-15421](https://jira.hl7.org/browse/FHIR-15421) | Version History correction to change to "HL7 Health Care Devices (HCD) Work Group" - 2018-Jan PHD #42 | 2018-09-28 |
| [FHIR-15422](https://jira.hl7.org/browse/FHIR-15422) | Version History correction to make column headers align with column data for "Date, Version, Description and Current Versions" columns. - 2018-Jan PHD #43 | 2018-09-28 |
| [FHIR-15423](https://jira.hl7.org/browse/FHIR-15423) | "Purpose" page correction to camel case for consistency - 2018-Jan PHD #44 | 2018-09-28 |
| [FHIR-15424](https://jira.hl7.org/browse/FHIR-15424) | "Purpose" page spelling and grammer corrections - 2018-Jan PHD #45 | 2018-09-28 |
| [FHIR-15425](https://jira.hl7.org/browse/FHIR-15425) | "Audience" page spelling and grammer corrections - 2018-Jan PHD #46 | 2018-09-28 |
| [FHIR-15426](https://jira.hl7.org/browse/FHIR-15426) | "Scope" page spelling and grammer corrections - 2018-Jan PHD #47 | 2018-09-28 |
| [FHIR-15427](https://jira.hl7.org/browse/FHIR-15427) | "Use Cases" page wording corrections - 2018-Jan PHD #48 | 2018-09-28 |
| [FHIR-15428](https://jira.hl7.org/browse/FHIR-15428) | "Use Cases" page request on more details for Example 3 - Medical Research - 2018-Jan PHD #49 | 2018-09-28 |
| [FHIR-15429](https://jira.hl7.org/browse/FHIR-15429) | "Technical Implementation Guidance" page consistency in specifying the standard before the version. - 2018-Jan PHD #50 | 2018-09-28 |
| [FHIR-15430](https://jira.hl7.org/browse/FHIR-15430) | "Technical Implementation Guidance-Generic and Extensible Model" page spelling and grammar corrections - 2018-Jan PHD #51 | 2018-09-28 |
| [FHIR-15431](https://jira.hl7.org/browse/FHIR-15431) | "Technical Implementation Guidance -DIM to FHIR Mapping: Basic" spelling and grammar corrections - 2018-Jan PHD #52 | 2018-09-28 |
| [FHIR-15432](https://jira.hl7.org/browse/FHIR-15432) | "Technical Implementation Guidance -DIM to FHIR Mapping: Basic" paragraphing correction. - 2018-Jan PHD #53 | 2018-09-28 |
| [FHIR-15433](https://jira.hl7.org/browse/FHIR-15433) | "Technical Implementation Guidance General Note to Consumers" wording correction. - 2018-Jan PHD #54 | 2018-09-28 |
| [FHIR-15434](https://jira.hl7.org/browse/FHIR-15434) | "Technical Implementation Guidance -DIM to FHIR Mapping: Details" spelling corrections. - 2018-Jan PHD #55 | 2018-09-28 |
| [FHIR-15435](https://jira.hl7.org/browse/FHIR-15435) | "Technical Implementation Guidance -Coincident Time Stamp" spelling corrections. - 2018-Jan PHD #56 | 2018-09-28 |
| [FHIR-15436](https://jira.hl7.org/browse/FHIR-15436) | "Technical Implementation Guidance -Non 11073 20601 Devices" spelling corrections - 2018-Jan PHD #57 | 2018-09-28 |
| [FHIR-15437](https://jira.hl7.org/browse/FHIR-15437) | "Value Sets" page links not working - 2018-Jan PHD #58 | 2018-09-28 |
| [FHIR-15438](https://jira.hl7.org/browse/FHIR-15438) | Correct spelling errors on main Profile page - 2018-Jan PHD #59 | 2018-09-28 |
| [FHIR-15439](https://jira.hl7.org/browse/FHIR-15439) | Remove strike-through text in DeviceComponent Profiles and Rationalle for Child DeviceComponent areas of the Profiles main page. - 2018-Jan PHD #60 | 2018-09-28 |
| [FHIR-15440](https://jira.hl7.org/browse/FHIR-15440) | Correct spelling errors on PhdBaseObservationProfile page - 2018-Jan PHD #61 | 2018-09-28 |
| [FHIR-15441](https://jira.hl7.org/browse/FHIR-15441) | Correct the link to http://hl7.org/fhir/IEEE.ASN1 on PhdBaseObservationProfile page - 2018-Jan PHD #62 | 2018-09-28 |
| [FHIR-15443](https://jira.hl7.org/browse/FHIR-15443) | Correct spelling errors on PhdNumericObservationProfile page - 2018-Jan PHD #64 | 2018-09-28 |
| [FHIR-15445](https://jira.hl7.org/browse/FHIR-15445) | Correct the title on the PhdCompound NumericObservationProfile page - 2018-Jan PHD #66 | 2018-09-28 |
| [FHIR-15446](https://jira.hl7.org/browse/FHIR-15446) | Correct spelling errors on PhdCompoundNumericObservationProfile page - 2018-Jan PHD #67 | 2018-09-28 |
| [FHIR-15447](https://jira.hl7.org/browse/FHIR-15447) | Correct spelling error on Phd Coded Enumeration Observation Profile page - 2018-Jan PHD #68 | 2018-09-28 |
| [FHIR-15448](https://jira.hl7.org/browse/FHIR-15448) | Correct the link to "Generating the PHD Reported Time Stamp" on the Phd Coded Enumeration Observation Profile page - 2018-Jan PHD #69 | 2018-09-28 |
| [FHIR-15449](https://jira.hl7.org/browse/FHIR-15449) | urn:iso:std:iso:11073:10101 should have a URL, or at least update the descriptive text to indicate "URN" instead of "URL". - 2018-Jan PHD #70 | 2018-09-28 |
| [FHIR-15450](https://jira.hl7.org/browse/FHIR-15450) | Some of the URLs for the value sets don't work. The URLs should work, or the links should be removed and a description should be provided for how to access the contents of the value sets. - 2018-Jan PHD #71 | 2018-09-28 |
| [FHIR-15451](https://jira.hl7.org/browse/FHIR-15451) | the mapping is from PHD to FHIR not the other way around - 2018-Jan PHD #72 | 2018-09-28 |
| [FHIR-15452](https://jira.hl7.org/browse/FHIR-15452) | word change - 2018-Jan PHD #73 | 2018-09-28 |
| [FHIR-15453](https://jira.hl7.org/browse/FHIR-15453) | Typo - 2018-Jan PHD #74 | 2018-09-28 |
| [FHIR-15454](https://jira.hl7.org/browse/FHIR-15454) | Reference needed - 2018-Jan PHD #75 | 2018-10-12 |
| [FHIR-15455](https://jira.hl7.org/browse/FHIR-15455) | Request for clarifying text. - 2018-Jan PHD #76 | 2018-10-12 |
| [FHIR-15456](https://jira.hl7.org/browse/FHIR-15456) | Suggested word change. - 2018-Jan PHD #77 | 2018-10-12 |
| [FHIR-15457](https://jira.hl7.org/browse/FHIR-15457) | Typo - 2018-Jan PHD #78 | 2018-10-12 |
| [FHIR-15458](https://jira.hl7.org/browse/FHIR-15458) | link needed - 2018-Jan PHD #79 | 2018-10-12 |
| [FHIR-15459](https://jira.hl7.org/browse/FHIR-15459) | the table with the measurement profiles should include the base measurement profile and the name of the FHIR profiles and maybe even the IEEE class name - 2018-Jan PHD #80 | 2018-10-12 |
| [FHIR-15461](https://jira.hl7.org/browse/FHIR-15461) | word change - 2018-Jan PHD #82 | 2018-10-12 |
| [FHIR-15462](https://jira.hl7.org/browse/FHIR-15462) | word change - 2018-Jan PHD #83 | 2018-10-12 |
| [FHIR-15463](https://jira.hl7.org/browse/FHIR-15463) | can the leading "." for all FHIR attributes in the tables be deleted? - 2018-Jan PHD #84 | 2018-10-12 |
| [FHIR-15464](https://jira.hl7.org/browse/FHIR-15464) | structure suggestion - 2018-Jan PHD #85 | 2018-10-12 |
| [FHIR-15466](https://jira.hl7.org/browse/FHIR-15466) | BLE GATT protocols are extensible, just not in a generic way. Please rephrase. - 2018-Jan PHD #87 | 2018-10-12 |
| [FHIR-15469](https://jira.hl7.org/browse/FHIR-15469) | Clarifying suggestion - 2018-Jan PHD #90 | 2018-10-12 |
| [FHIR-15470](https://jira.hl7.org/browse/FHIR-15470) | structure suggestion - 2018-Jan PHD #91 | 2018-10-12 |
| [FHIR-15471](https://jira.hl7.org/browse/FHIR-15471) | structure suggestion / question - 2018-Jan PHD #92 | 2018-10-12 |
| [FHIR-15472](https://jira.hl7.org/browse/FHIR-15472) | correct BTLE acronym - 2018-Jan PHD #93 | 2018-10-12 |
| [FHIR-15473](https://jira.hl7.org/browse/FHIR-15473) | structure definition missing - 2018-Jan PHD #94 | 2018-10-12 |
| [FHIR-15474](https://jira.hl7.org/browse/FHIR-15474) | editorial / language improvement - 2018-Jan PHD #95 | 2018-10-12 |
| [FHIR-15475](https://jira.hl7.org/browse/FHIR-15475) | This empty profile and the strike-through text in the profile page and superfluous table should be removed. - 2018-Jan PHD #96 | 2018-10-12 |
| [FHIR-15476](https://jira.hl7.org/browse/FHIR-15476) | Typo - 2018-Jan PHD #97 | 2018-10-12 |
| [FHIR-15478](https://jira.hl7.org/browse/FHIR-15478) | Seeking clarification. - 2018-Jan PHD #99 | 2018-10-12 |
| [FHIR-15480](https://jira.hl7.org/browse/FHIR-15480) | Clarification suggestion / question - 2018-Jan PHD #101 | 2018-10-12 |
| [FHIR-15482](https://jira.hl7.org/browse/FHIR-15482) | Confusing text - 2018-Jan PHD #103 | 2018-10-12 |
| [FHIR-15484](https://jira.hl7.org/browse/FHIR-15484) | Typo - 2018-Jan PHD #105 | 2018-10-12 |
| [FHIR-15485](https://jira.hl7.org/browse/FHIR-15485) | Structure question - 2018-Jan PHD #106 | 2018-10-12 |
| [FHIR-15486](https://jira.hl7.org/browse/FHIR-15486) | Structure question - 2018-Jan PHD #107 | 2018-10-12 |
| [FHIR-15487](https://jira.hl7.org/browse/FHIR-15487) | Clarifying text - 2018-Jan PHD #108 | 2018-10-12 |
| [FHIR-15489](https://jira.hl7.org/browse/FHIR-15489) | Mapping the device information into deviceComponent resource is mentioned, but no exmaple is given - 2018-Jan PHD #110 | 2018-10-12 |
| [FHIR-15490](https://jira.hl7.org/browse/FHIR-15490) | Confusing text - 2018-Jan PHD #111 | 2018-10-12 |
| [FHIR-15491](https://jira.hl7.org/browse/FHIR-15491) | Consumer of FHIR resources, Consumer of PHD data, PHD decoder and creator of the FHIR resources are mentioned several times in the IG but no explanation is provided. So, I suggest short explanation/dictionary to avoid confusion when using the therms - 201 | 2018-10-12 |
| [FHIR-15492](https://jira.hl7.org/browse/FHIR-15492) | Question - 2018-Jan PHD #113 | 2018-10-12 |
| [FHIR-15494](https://jira.hl7.org/browse/FHIR-15494) | The hierarchy of the profiles is missing. It is not mentioned that the defined Observation profiles are subclassed from the PHD Base Profile - 2018-Jan PHD #115 | 2018-10-12 |
| [FHIR-15495](https://jira.hl7.org/browse/FHIR-15495) | In the structure definition, shouldn't the effectivePeriod be under effective[x]? - 2018-Jan PHD #116 | 2018-10-12 |
| [FHIR-15497](https://jira.hl7.org/browse/FHIR-15497) | Structure definition is missing - 2018-Jan PHD #118 | 2018-10-12 |
| [FHIR-15498](https://jira.hl7.org/browse/FHIR-15498) | Empty profile. If the profile is removed, is there a replacement defined (as extension, or deviceComponent.type 0..*)? - 2018-Jan PHD #119 | 2018-10-12 |

### Unclassified — Change Impact missing

No exported tickets in this date window.

## [0.3.0](https://hl7.org/fhir/uv/phd/2019May) — 2019-03-27

STU 1 second ballot.

Resolved-date window: after 2018-12-04 through 2019-03-27.

### Not-Compatible

No exported tickets in this date window.

### Compatible, Substantive

| Jira ticket | Jira summary | Resolved |
| --- | --- | --- |
| [FHIR-15397](https://jira.hl7.org/browse/FHIR-15397) | Reference needed - 2018-Jan PHD #18 | 2019-02-09 |
| [FHIR-15417](https://jira.hl7.org/browse/FHIR-15417) | The structure definition (table) of elemnts for each profile should always show the description of the elements. Using mouse-hover to show the description of the elements/attributes is not ideal, and does not display when printing. I also suggest automati | 2019-02-09 |
| [FHIR-20264](https://jira.hl7.org/browse/FHIR-20264) | The profile PhdBaseObservation is missing slicing on the meta.profile element - PHD #52 | 2019-03-01 |
| [FHIR-20265](https://jira.hl7.org/browse/FHIR-20265) | The profile PhdNumericObservation is missing slicing on the meta.profile element - PHD #53 | 2019-03-01 |
| [FHIR-20266](https://jira.hl7.org/browse/FHIR-20266) | The profile PhdCompoundNumericObservation is missing slicing on the meta.profile element - PHD #54 | 2019-03-01 |
| [FHIR-20267](https://jira.hl7.org/browse/FHIR-20267) | The profile PhdBitsEnumerationObservation is missing slicing on the meta.profile element - PHD #55 | 2019-03-01 |
| [FHIR-20268](https://jira.hl7.org/browse/FHIR-20268) | The profile PhdRtsaObservation is missing slicing on the meta.profile element - PHD #56 | 2019-03-01 |
| [FHIR-20269](https://jira.hl7.org/browse/FHIR-20269) | Instead of specifying fixed value for the profile, slicing should be done - PHD #57 | 2019-03-01 |
| [FHIR-20280](https://jira.hl7.org/browse/FHIR-20280) | Clarify IEEE spec date - PHD #68 | 2019-03-13 |

### Non-Substantive

| Jira ticket | Jira summary | Resolved |
| --- | --- | --- |
| [FHIR-15442](https://jira.hl7.org/browse/FHIR-15442) | Hover-over tool tip does not appear for some of the elements in the structure definition e.g. Patient -&gt; reference on PhdBaseObservationProfile page - 2018-Jan PHD #63 | 2019-02-09 |
| [FHIR-20232](https://jira.hl7.org/browse/FHIR-20232) | This profile is not a Structured Definition so it's unclear if it's describing a set of extensions or constraints. - PHD #20 | 2019-03-01 |
| [FHIR-20236](https://jira.hl7.org/browse/FHIR-20236) | The Base Observation profile is missing a StructureDefinition. - PHD #24 | 2019-03-01 |
| [FHIR-20237](https://jira.hl7.org/browse/FHIR-20237) | The Numeric Observation profile is missing a StructureDefinition. - PHD #25 | 2019-03-01 |
| [FHIR-20238](https://jira.hl7.org/browse/FHIR-20238) | The BITs Coded Enumeration profile is missing a StructureDefinition. - PHD #26 | 2019-03-01 |
| [FHIR-20241](https://jira.hl7.org/browse/FHIR-20241) | The PHD Compound Numeric Observation Profile is missing a StructureDefinition - PHD #29 | 2019-03-01 |
| [FHIR-20244](https://jira.hl7.org/browse/FHIR-20244) | What does the accuracy mean to patients or clinicians? According to the use cases this data is intended to be used by patients, clinicians, or researchers/ - PHD #32 | 2019-03-01 |
| [FHIR-20245](https://jira.hl7.org/browse/FHIR-20245) | PHD Device Profile is missing a StructureDefinition - PHD #33 | 2019-03-01 |
| [FHIR-20250](https://jira.hl7.org/browse/FHIR-20250) | Explicitly exclude PHI-related fields in the PhdPatient profile. - PHD #38 | 2019-03-01 |
| [FHIR-20258](https://jira.hl7.org/browse/FHIR-20258) | The profiles in this IG should make use of the "must support" flag. - PHD #46 | 2019-03-01 |
| [FHIR-20259](https://jira.hl7.org/browse/FHIR-20259) | Add more guidance in the form of ValueSet resources for things like Observation.component.code. - PHD #47 | 2019-03-01 |
| [FHIR-20260](https://jira.hl7.org/browse/FHIR-20260) | Should be mentioned here that BLE devices are supported as well - PHD #48 | 2019-03-01 |
| [FHIR-20261](https://jira.hl7.org/browse/FHIR-20261) | I propose to have the navigation menu included - PHD #49 | 2019-03-01 |
| [FHIR-20263](https://jira.hl7.org/browse/FHIR-20263) | Sections on mapping the data about the PHD and the PHG are missing. - PHD #51 | 2019-03-01 |
| [FHIR-20270](https://jira.hl7.org/browse/FHIR-20270) | Exmaples of resources for every profile are missing. (I included URL to only one of the profiles, but applies to all) - PHD #58 | 2019-03-01 |
| [FHIR-20293](https://jira.hl7.org/browse/FHIR-20293) | The code system still has the old FHIR value - PHD #81 | 2019-03-01 |
| [FHIR-20294](https://jira.hl7.org/browse/FHIR-20294) | The example for the coded enumeration is not expanded in a 'pretty print' form - PHD #82 | 2019-03-01 |
| [FHIR-20297](https://jira.hl7.org/browse/FHIR-20297) | Suggest to change the title page to reflect the general cse of usability of this IG - PHD #85 | 2019-03-01 |
| [FHIR-20295](https://jira.hl7.org/browse/FHIR-20295) | The code system still has an older FHIR value - PHD #83 | 2019-03-02 |
| [FHIR-20296](https://jira.hl7.org/browse/FHIR-20296) | The Continua code systems need to have some note in them indcating that more codes to this system may be added as the standards are developed. - PHD #84 | 2019-03-02 |
| [FHIR-20213](https://jira.hl7.org/browse/FHIR-20213) | Is local device timestamp or time zone also collected? How to ensure we know time relative to patient's perspective? - PHD #1 | 2019-03-13 |
| [FHIR-20214](https://jira.hl7.org/browse/FHIR-20214) | Qualify standard name - PHD #2 | 2019-03-13 |
| [FHIR-20215](https://jira.hl7.org/browse/FHIR-20215) | Expand IG title - PHD #3 | 2019-03-13 |
| [FHIR-20216](https://jira.hl7.org/browse/FHIR-20216) | Align description of scope - PHD #4 | 2019-03-13 |
| [FHIR-20217](https://jira.hl7.org/browse/FHIR-20217) | 11073 10101 nomenclature reference not qualified - assume IHEEE. - PHD #5 | 2019-03-13 |
| [FHIR-20218](https://jira.hl7.org/browse/FHIR-20218) | Acronym APDU should be spelled out with first reference in this section - PHD #6 | 2019-03-13 |
| [FHIR-20219](https://jira.hl7.org/browse/FHIR-20219) | 5th row of the table, Unit-Code. - PHD #7 | 2019-03-13 |
| [FHIR-20221](https://jira.hl7.org/browse/FHIR-20221) | Suggest providing the name/url of the code system the BITs integer - PHD #9 | 2019-03-13 |
| [FHIR-20222](https://jira.hl7.org/browse/FHIR-20222) | The reference to the ASN.1 code set is vague - PHD #10 | 2019-03-13 |
| [FHIR-20223](https://jira.hl7.org/browse/FHIR-20223) | Consider a reference to the data (maybe a link to 1.2.5.3) type definition - PHD #11 | 2019-03-13 |
| [FHIR-20224](https://jira.hl7.org/browse/FHIR-20224) | last paragraph - PHD #12 | 2019-03-13 |
| [FHIR-20225](https://jira.hl7.org/browse/FHIR-20225) | Suggest providing a reference to what LOINC magic codes means - PHD #13 | 2019-03-13 |
| [FHIR-20226](https://jira.hl7.org/browse/FHIR-20226) | First reference - PHD #14 | 2019-03-13 |
| [FHIR-20227](https://jira.hl7.org/browse/FHIR-20227) | Consider providing a more specific reference to "the white paper" if possible - PHD #15 | 2019-03-13 |
| [FHIR-20228](https://jira.hl7.org/browse/FHIR-20228) | Missing a "previous" link (All the pages in Profile Details are missing that link, as is the main 1.3 Profiles page) - PHD #16 | 2019-03-13 |
| [FHIR-20229](https://jira.hl7.org/browse/FHIR-20229) | Is this page supposed to list a set of extensions to the Device resource? - PHD #17 | 2019-03-13 |
| [FHIR-20231](https://jira.hl7.org/browse/FHIR-20231) | Clarify how the data is used and what data is needed by each type of user. - PHD #19 | 2019-03-13 |
| [FHIR-20234](https://jira.hl7.org/browse/FHIR-20234) | Is this profile intended to be used by smart phones (e.g. Android, iOS) ... It's very hard to decode this page. - PHD #22 | 2019-03-13 |
| [FHIR-20239](https://jira.hl7.org/browse/FHIR-20239) | Clarify how the BITs dataset is intended to be used by patients, clinicians, or researchers. - PHD #27 | 2019-03-13 |
| [FHIR-20242](https://jira.hl7.org/browse/FHIR-20242) | The PHD BITs Coded Enumeration Observation Profile is missing a StructureDefinition - PHD #30 | 2019-03-13 |
| [FHIR-20251](https://jira.hl7.org/browse/FHIR-20251) | UML diagrams please - PHD #39 | 2019-03-13 |
| [FHIR-20253](https://jira.hl7.org/browse/FHIR-20253) | No description on profile page - PHD #41 | 2019-03-13 |
| [FHIR-20254](https://jira.hl7.org/browse/FHIR-20254) | Separating run-on sentence. - PHD #42 | 2019-03-13 |
| [FHIR-20272](https://jira.hl7.org/browse/FHIR-20272) | The IEEE standard(s) should be properly introduced, and with a proper reference. - PHD #60 | 2019-03-13 |
| [FHIR-20273](https://jira.hl7.org/browse/FHIR-20273) | What is the intention of this alternative phrasing? - PHD #61 | 2019-03-13 |
| [FHIR-20274](https://jira.hl7.org/browse/FHIR-20274) | Is PHI a form of PII? PII is a wider used term and could be used here as well. - PHD #62 | 2019-03-13 |
| [FHIR-20275](https://jira.hl7.org/browse/FHIR-20275) | ambiguous language - PHD #63 | 2019-03-13 |
| [FHIR-20276](https://jira.hl7.org/browse/FHIR-20276) | proper reference should be used - PHD #64 | 2019-03-13 |
| [FHIR-20277](https://jira.hl7.org/browse/FHIR-20277) | proper reference should be used - PHD #65 | 2019-03-13 |
| [FHIR-20278](https://jira.hl7.org/browse/FHIR-20278) | Is the IG just an "illustration" or is it - PHD #66 | 2019-03-13 |
| [FHIR-20279](https://jira.hl7.org/browse/FHIR-20279) | Where is the mapping from 10101 unit codes to UCUM defined? - PHD #67 | 2019-03-13 |
| [FHIR-20281](https://jira.hl7.org/browse/FHIR-20281) | Where are the ASN.1 vocabulary and the ASN.1 mapping tables? Also, "ASN1" should be replaced by "ASN.1". - PHD #69 | 2019-03-13 |
| [FHIR-20282](https://jira.hl7.org/browse/FHIR-20282) | MDER is an abbreviation and should be capitalized. - PHD #70 | 2019-03-13 |
| [FHIR-20283](https://jira.hl7.org/browse/FHIR-20283) | Bluetooth LE profiles and services DO require timestamps for stored measurements! - PHD #71 | 2019-03-13 |
| [FHIR-20284](https://jira.hl7.org/browse/FHIR-20284) | This is not relevant in the scope of this IG! - PHD #72 | 2019-03-13 |
| [FHIR-20286](https://jira.hl7.org/browse/FHIR-20286) | The list of profiles at the top is in a different order than the Profile Details list at the bottom. Please align. - PHD #74 | 2019-03-13 |
| [FHIR-20287](https://jira.hl7.org/browse/FHIR-20287) | The IG defines 11 profiles, not 10. - PHD #75 | 2019-03-13 |
| [FHIR-20288](https://jira.hl7.org/browse/FHIR-20288) | Can the cells in tables in 1.3.1.0.2 Measurement Observation Profiles and 1.3.1.0.2.3 PHD Device Profile get visible borders? - PHD #76 | 2019-03-13 |
| [FHIR-20289](https://jira.hl7.org/browse/FHIR-20289) | a specification should not be a history lesson. - PHD #77 | 2019-03-13 |
| [FHIR-20291](https://jira.hl7.org/browse/FHIR-20291) | colon at the end should be deleted - PHD #79 | 2019-03-13 |
| [FHIR-20299](https://jira.hl7.org/browse/FHIR-20299) | Is local device timestamp or time zone also collected? How to ensure we know time relative to patient's perspective? - PHD #87 | 2019-03-13 |
| [FHIR-20302](https://jira.hl7.org/browse/FHIR-20302) | Could there bee own paragraph for text about units ("Only scalar and vector values may have a unit. In earlier...")? - PHD #90 | 2019-03-13 |
| [FHIR-20303](https://jira.hl7.org/browse/FHIR-20303) | Observation ... .component.valueQuantity gives the sub value when the measurement is a vector - PHD #91 | 2019-03-13 |
| [FHIR-20305](https://jira.hl7.org/browse/FHIR-20305) | Does all "measurment" observations belong under vital-signs category? - PHD #93 | 2019-03-13 |

### Unclassified — Change Impact missing

No exported tickets in this date window.

## [1.0.0](https://hl7.org/fhir/uv/phd/STU1) — 2022-05-12

STU 1 accepted version.

Resolved-date window: after 2019-03-27 through 2022-05-12.

### Not-Compatible

No exported tickets in this date window.

### Compatible, Substantive

No exported tickets in this date window.

### Non-Substantive

| Jira ticket | Jira summary | Resolved |
| --- | --- | --- |
| [FHIR-23746](https://jira.hl7.org/browse/FHIR-23746) | Markdown error - PHD #20 | 2019-09-11 |
| [FHIR-23755](https://jira.hl7.org/browse/FHIR-23755) | typo - PHD #29 | 2019-09-11 |
| [FHIR-21080](https://jira.hl7.org/browse/FHIR-21080) | Add additional text to distinguish from Observation ID | 2019-10-24 |
| [FHIR-21081](https://jira.hl7.org/browse/FHIR-21081) | Measurement status important information and maybe should be loaded as multiple codes in one field | 2019-10-24 |
| [FHIR-21082](https://jira.hl7.org/browse/FHIR-21082) | Do ANS1 names represent an orthogonal set of status codes and are they also stored as bits? | 2019-10-24 |
| [FHIR-21083](https://jira.hl7.org/browse/FHIR-21083) | Needs more detail and better justification as to why they don't use simple FHIR communication | 2019-10-24 |
| [FHIR-21084](https://jira.hl7.org/browse/FHIR-21084) | Does High Resolution Relative Time Stamp tie to MDC_MODALITY_FAST? | 2019-10-24 |
| [FHIR-21085](https://jira.hl7.org/browse/FHIR-21085) | Needs some discussion of how the PHD content gets into the Observation resource | 2019-10-24 |
| [FHIR-21086](https://jira.hl7.org/browse/FHIR-21086) | Not conforming to FHIR data types | 2019-10-24 |
| [FHIR-21087](https://jira.hl7.org/browse/FHIR-21087) | Who does the mapping and where does it happen? | 2019-10-24 |
| [FHIR-21090](https://jira.hl7.org/browse/FHIR-21090) | Question on expression of Nu_observation values | 2019-10-24 |
| [FHIR-21093](https://jira.hl7.org/browse/FHIR-21093) | Additional Numberical Measurement Information is not clear | 2019-10-24 |
| [FHIR-21095](https://jira.hl7.org/browse/FHIR-21095) | Representing accuracy in FHIR | 2019-10-24 |
| [FHIR-21100](https://jira.hl7.org/browse/FHIR-21100) | dataAbsentReason should be own attribute to align with FHIR | 2019-10-24 |
| [FHIR-21112](https://jira.hl7.org/browse/FHIR-21112) | Should explicitly state context is for loading into a FHIR observation | 2019-10-24 |
| [FHIR-21113](https://jira.hl7.org/browse/FHIR-21113) | Link to MDC to LOINC mappings URL | 2019-10-24 |
| [FHIR-21079](https://jira.hl7.org/browse/FHIR-21079) | 16- and 32- bit is very non-standard and will hinder, break interoperability | 2019-11-14 |
| [FHIR-23743](https://jira.hl7.org/browse/FHIR-23743) | Grammar - PHD #17 | 2019-11-14 |
| [FHIR-23744](https://jira.hl7.org/browse/FHIR-23744) | More complete description of implementation options. - PHD #18 | 2019-11-14 |
| [FHIR-23745](https://jira.hl7.org/browse/FHIR-23745) | Add comma - PHD #19 | 2019-11-14 |
| [FHIR-23747](https://jira.hl7.org/browse/FHIR-23747) | Correction - there is one extension - PHD #21 | 2019-11-14 |
| [FHIR-23748](https://jira.hl7.org/browse/FHIR-23748) | Wording change to improve accuracy - PHD #22 | 2019-11-14 |
| [FHIR-23749](https://jira.hl7.org/browse/FHIR-23749) | Add more motivation behind the BTLE callout. - PHD #23 | 2019-11-14 |
| [FHIR-23750](https://jira.hl7.org/browse/FHIR-23750) | (typo) - PHD #24 | 2019-11-14 |
| [FHIR-23751](https://jira.hl7.org/browse/FHIR-23751) | Clearer explanation of the MDC partition use. Make a proper link in the last sentence after this paragraph - PHD #25 | 2019-11-14 |
| [FHIR-23753](https://jira.hl7.org/browse/FHIR-23753) | reference - PHD #27 | 2019-11-14 |
| [FHIR-23754](https://jira.hl7.org/browse/FHIR-23754) | reference - PHD #28 | 2019-11-14 |
| [FHIR-23761](https://jira.hl7.org/browse/FHIR-23761) | reference - PHD #35 | 2019-11-14 |

### Unclassified — Change Impact missing

No exported tickets in this date window.

## [2.0.0-ballot](https://hl7.org/fhir/uv/phd/2024Sep) — 2024-08-16

STU 2 working draft based on IEEE 11073-10206 ACOM with Bluetooth GHS support.

Resolved-date window: after 2022-05-12 through 2024-08-16.

### Not-Compatible

| Jira ticket | Jira summary | Resolved |
| --- | --- | --- |
| [FHIR-24875](https://jira.hl7.org/browse/FHIR-24875) | Profile shouldn't be mandatory | 2024-03-05 |
| [FHIR-24873](https://jira.hl7.org/browse/FHIR-24873) | Why are you recommending non-UCUM codes? | 2024-03-27 |

### Compatible, Substantive

No exported tickets in this date window.

### Non-Substantive

| Jira ticket | Jira summary | Resolved |
| --- | --- | --- |
| [FHIR-24876](https://jira.hl7.org/browse/FHIR-24876) | LOINC magic code is unclear | 2024-02-28 |
| [FHIR-34275](https://jira.hl7.org/browse/FHIR-34275) | CLONE - Need a definition or a hyperlink on definition of out of band, examples | 2024-03-05 |
| [FHIR-34357](https://jira.hl7.org/browse/FHIR-34357) | CLONE - All data needs a time stamp to be relevant | 2024-03-06 |
| [FHIR-45196](https://jira.hl7.org/browse/FHIR-45196) | incorrect code in Quantity11073MDC | 2024-04-17 |

### Unclassified — Change Impact missing

No exported tickets in this date window.

## [1.1.0](https://hl7.org/fhir/uv/phd/STU1.1) — 2024-10-18

STU 1 update; the publication history describes its Jira issue cutoff as 2024-07-09.

Resolved-date window: after 2024-08-16 through 2024-10-18.

### Not-Compatible

| Jira ticket | Jira summary | Resolved |
| --- | --- | --- |
| [FHIR-46767](https://jira.hl7.org/browse/FHIR-46767) | Meta.profile mandatory or not? | 2024-10-16 |

### Compatible, Substantive

No exported tickets in this date window.

### Non-Substantive

| Jira ticket | Jira summary | Resolved |
| --- | --- | --- |
| [FHIR-47576](https://jira.hl7.org/browse/FHIR-47576) | PHG Implementation Guidance page should have PHG spelled out | 2024-10-08 |
| [FHIR-48123](https://jira.hl7.org/browse/FHIR-48123) | Link to published PoCD guide | 2024-10-08 |
| [FHIR-48126](https://jira.hl7.org/browse/FHIR-48126) | IGs cannot interpret. | 2024-10-08 |
| [FHIR-48127](https://jira.hl7.org/browse/FHIR-48127) | Link to referenced sections | 2024-10-08 |
| [FHIR-48128](https://jira.hl7.org/browse/FHIR-48128) | Combine paragraphs | 2024-10-08 |
| [FHIR-48129](https://jira.hl7.org/browse/FHIR-48129) | Clarify mentions of Bluetooth LE | 2024-10-08 |
| [FHIR-48130](https://jira.hl7.org/browse/FHIR-48130) | Provide links to IEEE 11073 | 2024-10-08 |
| [FHIR-48131](https://jira.hl7.org/browse/FHIR-48131) | Remove gratuitious links at bottom of page. | 2024-10-08 |
| [FHIR-48132](https://jira.hl7.org/browse/FHIR-48132) | Include Appendix in menu | 2024-10-08 |
| [FHIR-48133](https://jira.hl7.org/browse/FHIR-48133) | IG Menu should be more complete | 2024-10-08 |
| [FHIR-48134](https://jira.hl7.org/browse/FHIR-48134) | Overview page is largely redundant | 2024-10-08 |
| [FHIR-48135](https://jira.hl7.org/browse/FHIR-48135) | Remove history and FHIR overview sections | 2024-10-08 |
| [FHIR-48136](https://jira.hl7.org/browse/FHIR-48136) | State Profile Consumer section more positively for audience. | 2024-10-08 |
| [FHIR-48137](https://jira.hl7.org/browse/FHIR-48137) | Correct section numbering. | 2024-10-08 |
| [FHIR-48138](https://jira.hl7.org/browse/FHIR-48138) | Purpose is (almost) duplicative of Home page. | 2024-10-08 |
| [FHIR-48139](https://jira.hl7.org/browse/FHIR-48139) | Remove Continua references | 2024-10-08 |
| [FHIR-48140](https://jira.hl7.org/browse/FHIR-48140) | Clarify ACOM | 2024-10-08 |
| [FHIR-48141](https://jira.hl7.org/browse/FHIR-48141) | Clarify patient information | 2024-10-08 |
| [FHIR-48142](https://jira.hl7.org/browse/FHIR-48142) | Ensure protection of PII. | 2024-10-08 |
| [FHIR-48146](https://jira.hl7.org/browse/FHIR-48146) | Clarify audience introductory sentence. | 2024-10-08 |
| [FHIR-48147](https://jira.hl7.org/browse/FHIR-48147) | Justify 95% reference | 2024-10-08 |
| [FHIR-48148](https://jira.hl7.org/browse/FHIR-48148) | Add link to H.812.5 | 2024-10-08 |
| [FHIR-48149](https://jira.hl7.org/browse/FHIR-48149) | Clarify point of reference to Continua guidelines | 2024-10-08 |
| [FHIR-48150](https://jira.hl7.org/browse/FHIR-48150) | Add link to IHE | 2024-10-08 |
| [FHIR-48152](https://jira.hl7.org/browse/FHIR-48152) | Define "communicating PHD" | 2024-10-08 |
| [FHIR-48153](https://jira.hl7.org/browse/FHIR-48153) | Remove unnecessary capitalization | 2024-10-08 |
| [FHIR-48154](https://jira.hl7.org/browse/FHIR-48154) | Confirm most PHDs used for RPM. | 2024-10-08 |
| [FHIR-48155](https://jira.hl7.org/browse/FHIR-48155) | Clarify whether asserted statements are general or part of a use case. | 2024-10-08 |
| [FHIR-48156](https://jira.hl7.org/browse/FHIR-48156) | Clarify multiple RPM scope bullets | 2024-10-08 |
| [FHIR-48157](https://jira.hl7.org/browse/FHIR-48157) | Clarify diabetes use case | 2024-10-08 |
| [FHIR-48158](https://jira.hl7.org/browse/FHIR-48158) | Correct physical state | 2024-10-08 |
| [FHIR-48159](https://jira.hl7.org/browse/FHIR-48159) | Clarify protection of PHI | 2024-10-08 |
| [FHIR-48160](https://jira.hl7.org/browse/FHIR-48160) | Clarify use of manually entered data | 2024-10-08 |
| [FHIR-48163](https://jira.hl7.org/browse/FHIR-48163) | Timestamp is one word | 2024-10-08 |
| [FHIR-48168](https://jira.hl7.org/browse/FHIR-48168) | Correct description of profile element | 2024-10-08 |
| [FHIR-48174](https://jira.hl7.org/browse/FHIR-48174) | Do not link to build.fhir.org. | 2024-10-08 |
| [FHIR-48180](https://jira.hl7.org/browse/FHIR-48180) | Correct spelling of valueCodeableConcept | 2024-10-08 |
| [FHIR-48185](https://jira.hl7.org/browse/FHIR-48185) | Clarify drivers of relative timestamp adoption | 2024-10-08 |
| [FHIR-48186](https://jira.hl7.org/browse/FHIR-48186) | Assorted spelling errors | 2024-10-08 |
| [FHIR-48189](https://jira.hl7.org/browse/FHIR-48189) | Do not expect clients to ignore identifiers | 2024-10-08 |
| [FHIR-48190](https://jira.hl7.org/browse/FHIR-48190) | Correct numbering of section 1.2.4.1 | 2024-10-08 |
| [FHIR-48191](https://jira.hl7.org/browse/FHIR-48191) | "Two other values" should be enumerated | 2024-10-08 |
| [FHIR-48193](https://jira.hl7.org/browse/FHIR-48193) | dataAbsentReason misspelled | 2024-10-08 |
| [FHIR-48196](https://jira.hl7.org/browse/FHIR-48196) | Correct spelling of "indicating" | 2024-10-08 |
| [FHIR-48202](https://jira.hl7.org/browse/FHIR-48202) | Document device identifier formats | 2024-10-08 |
| [FHIR-48207](https://jira.hl7.org/browse/FHIR-48207) | Correct spelling of Artifacts | 2024-10-08 |
| [FHIR-48208](https://jira.hl7.org/browse/FHIR-48208) | Missing word | 2024-10-08 |
| [FHIR-48211](https://jira.hl7.org/browse/FHIR-48211) | Clarify accuracy units | 2024-10-08 |
| [FHIR-48218](https://jira.hl7.org/browse/FHIR-48218) | Correct "current" misspelling | 2024-10-08 |
| [FHIR-48221](https://jira.hl7.org/browse/FHIR-48221) | Complete IG needs proofreading | 2024-10-08 |
| [FHIR-48222](https://jira.hl7.org/browse/FHIR-48222) | Remove box around "threshold error" | 2024-10-08 |

### Unclassified — Change Impact missing

| Jira ticket | Jira summary | Resolved |
| --- | --- | --- |
| [FHIR-47574](https://jira.hl7.org/browse/FHIR-47574) | Continuous Build note (in salmon) should be removed | 2024-10-08 |
| [FHIR-48001](https://jira.hl7.org/browse/FHIR-48001) | "Uploads generated by compliant PHGs.." - what are compliant PHGs? | 2024-10-08 |
| [FHIR-48005](https://jira.hl7.org/browse/FHIR-48005) | References to the IEEE specs would be useful | 2024-10-08 |
| [FHIR-48006](https://jira.hl7.org/browse/FHIR-48006) | Looks like random words are with italic style | 2024-10-08 |
| [FHIR-48008](https://jira.hl7.org/browse/FHIR-48008) | Refrence missing for "The Technical Implementation Guidance section ..." and "The Profiles section" | 2024-10-08 |
| [FHIR-48015](https://jira.hl7.org/browse/FHIR-48015) | Typo - " Abstract COntent Model" | 2024-10-08 |
| [FHIR-48017](https://jira.hl7.org/browse/FHIR-48017) | Inconsistent references to ACOM spec | 2024-10-08 |
| [FHIR-48018](https://jira.hl7.org/browse/FHIR-48018) | References to the IEEE specs and Bluetooth would be useful | 2024-10-08 |
| [FHIR-48020](https://jira.hl7.org/browse/FHIR-48020) | I would remove the italics and bold on this page | 2024-10-08 |
| [FHIR-48125](https://jira.hl7.org/browse/FHIR-48125) | IG should be plural. | 2024-10-08 |
| [FHIR-48161](https://jira.hl7.org/browse/FHIR-48161) | Add missing hyphens | 2024-10-08 |

## [2.0.0-ballot2](https://hl7.org/fhir/uv/phd/2025Sep) — 2025-08-06

Second STU 2 ballot based on IEEE 11073-10206 ACOM with Bluetooth GHS support.

Resolved-date window: after 2024-10-18 through 2025-08-06.

### Not-Compatible

| Jira ticket | Jira summary | Resolved |
| --- | --- | --- |
| [FHIR-46820](https://jira.hl7.org/browse/FHIR-46820) | Wrong MDC code (3) | 2025-04-07 |
| [FHIR-48237](https://jira.hl7.org/browse/FHIR-48237) | PhdCoincidentTimeStampObservation profiling | 2025-04-14 |
| [FHIR-48240](https://jira.hl7.org/browse/FHIR-48240) | PhdRtsaObservation profiling | 2025-04-14 |
| [FHIR-48238](https://jira.hl7.org/browse/FHIR-48238) | Profiled resources can reference non-profiled resources | 2025-04-23 |
| [FHIR-48228](https://jira.hl7.org/browse/FHIR-48228) | Remove unused CodeSystem ASN1EventOrState | 2025-04-28 |
| [FHIR-48225](https://jira.hl7.org/browse/FHIR-48225) | Fix Numeric Observation profile | 2025-04-29 |
| [FHIR-48215](https://jira.hl7.org/browse/FHIR-48215) | Assorted BaseObservation profile recommendations | 2025-04-30 |
| [FHIR-48216](https://jira.hl7.org/browse/FHIR-48216) | Section duplicates content. | 2025-04-30 |
| [FHIR-48214](https://jira.hl7.org/browse/FHIR-48214) | Slicing for identifier is incorrect. | 2025-05-05 |
| [FHIR-48165](https://jira.hl7.org/browse/FHIR-48165) | Do not require profile declarations | 2025-05-07 |
| [FHIR-48205](https://jira.hl7.org/browse/FHIR-48205) | Use boolean rather than coded Y/N | 2025-05-07 |
| [FHIR-48181](https://jira.hl7.org/browse/FHIR-48181) | V2 Binary needs codesystem | 2025-05-10 |
| [FHIR-48183](https://jira.hl7.org/browse/FHIR-48183) | Clarify referenced specification and tick resolution | 2025-05-10 |
| [FHIR-48197](https://jira.hl7.org/browse/FHIR-48197) | ReferenceRange not for recording min/max values | 2025-05-10 |
| [FHIR-48201](https://jira.hl7.org/browse/FHIR-48201) | Clean up UDI language | 2025-05-10 |
| [FHIR-48203](https://jira.hl7.org/browse/FHIR-48203) | USB PID/VID are not identifiers | 2025-05-10 |
| [FHIR-48171](https://jira.hl7.org/browse/FHIR-48171) | Don't use derivedFrom for coincident time stamp | 2025-05-13 |
| [FHIR-48179](https://jira.hl7.org/browse/FHIR-48179) | Use of derivedFrom is incorrect | 2025-05-13 |
| [FHIR-46831](https://jira.hl7.org/browse/FHIR-46831) | Reduce the ties to 20601 | 2025-05-17 |
| [FHIR-46964](https://jira.hl7.org/browse/FHIR-46964) | Link to / use of "Continua" | 2025-05-17 |
| [FHIR-48188](https://jira.hl7.org/browse/FHIR-48188) | Quantity can record "off-scale" values | 2025-06-19 |
| [FHIR-48236](https://jira.hl7.org/browse/FHIR-48236) | Review and correct PhdDevice and PhgDevice profiling | 2025-06-26 |

### Compatible, Substantive

| Jira ticket | Jira summary | Resolved |
| --- | --- | --- |
| [FHIR-48231](https://jira.hl7.org/browse/FHIR-48231) | ContinuaPHD Codesystem cleanup | 2025-04-07 |
| [FHIR-48242](https://jira.hl7.org/browse/FHIR-48242) | PhdCodedEnumerationObservation | 2025-04-07 |
| [FHIR-48239](https://jira.hl7.org/browse/FHIR-48239) | PhdStringEnumerationObservation profiling | 2025-04-14 |
| [FHIR-48241](https://jira.hl7.org/browse/FHIR-48241) | PhdBitsEnumerationObservation profiling | 2025-04-14 |
| [FHIR-48243](https://jira.hl7.org/browse/FHIR-48243) | PhdCompoundNumericObservation | 2025-04-14 |
| [FHIR-48229](https://jira.hl7.org/browse/FHIR-48229) | Correct CapabilityStatement kind | 2025-04-23 |
| [FHIR-48224](https://jira.hl7.org/browse/FHIR-48224) | PhdPatient is overly constrained. | 2025-04-29 |
| [FHIR-48210](https://jira.hl7.org/browse/FHIR-48210) | Clarify conditional create identifier generation. | 2025-05-06 |
| [FHIR-48212](https://jira.hl7.org/browse/FHIR-48212) | BaseObservation require presence of unused meta | 2025-05-06 |
| [FHIR-47657](https://jira.hl7.org/browse/FHIR-47657) | Need further alignment with latest IEEE ACOM specification | 2025-05-07 |
| [FHIR-48144](https://jira.hl7.org/browse/FHIR-48144) | Clarify mapping of all data by PHG | 2025-05-07 |
| [FHIR-48200](https://jira.hl7.org/browse/FHIR-48200) | Review coincident timestamp for use in sometimes-connected environments | 2025-05-10 |

### Non-Substantive

| Jira ticket | Jira summary | Resolved |
| --- | --- | --- |
| [FHIR-48227](https://jira.hl7.org/browse/FHIR-48227) | Revert gratuitous change to R4B | 2025-03-10 |
| [FHIR-48233](https://jira.hl7.org/browse/FHIR-48233) | Valueset incorrectly claims to have exactly 1000 concepts | 2025-03-10 |
| [FHIR-48187](https://jira.hl7.org/browse/FHIR-48187) | Text ascribes actions to the IG itself | 2025-03-12 |
| [FHIR-48192](https://jira.hl7.org/browse/FHIR-48192) | PHD IG is unnecessarily large | 2025-03-12 |
| [FHIR-48397](https://jira.hl7.org/browse/FHIR-48397) | Ensure appropriate copyright on IEEE codesystems | 2025-03-12 |
| [FHIR-48195](https://jira.hl7.org/browse/FHIR-48195) | Should populate coding.display. | 2025-03-17 |
| [FHIR-46586](https://jira.hl7.org/browse/FHIR-46586) | derivedFrom pointing to a coincident timestamp conflicts with vital signs constraints | 2025-03-19 |
| [FHIR-47609](https://jira.hl7.org/browse/FHIR-47609) | Consider support for UDI in PHD | 2025-03-20 |
| [FHIR-48244](https://jira.hl7.org/browse/FHIR-48244) | Streamline PHD IG | 2025-03-20 |
| [FHIR-48280](https://jira.hl7.org/browse/FHIR-48280) | Examples need modification- current stories are repetitive. | 2025-03-20 |
| [FHIR-46764](https://jira.hl7.org/browse/FHIR-46764) | Conditional-create identifier | 2025-04-07 |
| [FHIR-46765](https://jira.hl7.org/browse/FHIR-46765) | Esoteric language | 2025-04-07 |
| [FHIR-46766](https://jira.hl7.org/browse/FHIR-46766) | LOINC "magic" codes (still) | 2025-04-07 |
| [FHIR-46768](https://jira.hl7.org/browse/FHIR-46768) | remove "Fixme" | 2025-04-07 |
| [FHIR-46818](https://jira.hl7.org/browse/FHIR-46818) | Wrong MDC code | 2025-04-07 |
| [FHIR-46819](https://jira.hl7.org/browse/FHIR-46819) | Wrong MDC code (2) | 2025-04-07 |
| [FHIR-46821](https://jira.hl7.org/browse/FHIR-46821) | Wrong MDC code (4) | 2025-04-07 |
| [FHIR-46829](https://jira.hl7.org/browse/FHIR-46829) | Wrong MDC code (5) | 2025-04-07 |
| [FHIR-46828](https://jira.hl7.org/browse/FHIR-46828) | Non-context-free MDC codes | 2025-04-10 |
| [FHIR-48232](https://jira.hl7.org/browse/FHIR-48232) | ASN1ToHL7 Codesystem cleanup | 2025-04-17 |
| [FHIR-48230](https://jira.hl7.org/browse/FHIR-48230) | Remove non-existant code hierarchies | 2025-04-23 |
| [FHIR-48226](https://jira.hl7.org/browse/FHIR-48226) | Correct MDCnotObject VS definition | 2025-04-28 |
| [FHIR-47575](https://jira.hl7.org/browse/FHIR-47575) | Plain Language Summary about HL7 and this Guide to the Home Page. | 2025-04-29 |
| [FHIR-48220](https://jira.hl7.org/browse/FHIR-48220) | Clarify GHS and Source-handle-reference | 2025-04-29 |
| [FHIR-48223](https://jira.hl7.org/browse/FHIR-48223) | Inconsistent use of ® mark | 2025-04-29 |
| [FHIR-48199](https://jira.hl7.org/browse/FHIR-48199) | Correct "timeline" | 2025-04-30 |
| [FHIR-48217](https://jira.hl7.org/browse/FHIR-48217) | Assorted performer corrections | 2025-04-30 |
| [FHIR-48219](https://jira.hl7.org/browse/FHIR-48219) | Clarify current timeline. | 2025-04-30 |
| [FHIR-48206](https://jira.hl7.org/browse/FHIR-48206) | Assorted issues with Patient resource discussion | 2025-05-06 |
| [FHIR-48209](https://jira.hl7.org/browse/FHIR-48209) | Include discussion of additional PHG behavior | 2025-05-06 |
| [FHIR-48213](https://jira.hl7.org/browse/FHIR-48213) | Profiling should contain mappings | 2025-05-06 |
| [FHIR-48178](https://jira.hl7.org/browse/FHIR-48178) | Coincident timestamp inconsistent with FHIR expectations | 2025-05-07 |
| [FHIR-48182](https://jira.hl7.org/browse/FHIR-48182) | Much simpler needs a comparison | 2025-05-10 |
| [FHIR-48198](https://jira.hl7.org/browse/FHIR-48198) | PHDs may support external time sync | 2025-05-10 |
| [FHIR-48169](https://jira.hl7.org/browse/FHIR-48169) | Use coding style for elements and resource content | 2025-05-13 |
| [FHIR-48170](https://jira.hl7.org/browse/FHIR-48170) | Clarify extension description | 2025-05-13 |
| [FHIR-48173](https://jira.hl7.org/browse/FHIR-48173) | Do not require ignoring identifier | 2025-05-13 |
| [FHIR-48176](https://jira.hl7.org/browse/FHIR-48176) | Clarify effective[x] can be two datatypes | 2025-05-13 |
| [FHIR-48167](https://jira.hl7.org/browse/FHIR-48167) | Clarify non-processing of string measurements | 2025-05-14 |
| [FHIR-48172](https://jira.hl7.org/browse/FHIR-48172) | Technique should be in method not component | 2025-05-14 |
| [FHIR-48177](https://jira.hl7.org/browse/FHIR-48177) | Reasons for disallowing Instant datatype do not make sense | 2025-05-14 |
| [FHIR-46822](https://jira.hl7.org/browse/FHIR-46822) | Dead link to LOINC | 2025-05-17 |
| [FHIR-46823](https://jira.hl7.org/browse/FHIR-46823) | Dead link to RTMMS | 2025-05-17 |
| [FHIR-46830](https://jira.hl7.org/browse/FHIR-46830) | Duplicated contents | 2025-05-17 |
| [FHIR-46832](https://jira.hl7.org/browse/FHIR-46832) | Minor typos | 2025-05-17 |
| [FHIR-47493](https://jira.hl7.org/browse/FHIR-47493) | Data element provenance seems to be missing | 2025-05-19 |
| [FHIR-48010](https://jira.hl7.org/browse/FHIR-48010) | Confusing text about -20601 | 2025-05-20 |
| [FHIR-48011](https://jira.hl7.org/browse/FHIR-48011) | What is " a PHG-validated consistent time stamp"? | 2025-05-20 |
| [FHIR-48013](https://jira.hl7.org/browse/FHIR-48013) | Second paragraph - "Implementations following this IG are likely to be done on PHGs." - what does this mean? | 2025-05-20 |
| [FHIR-48121](https://jira.hl7.org/browse/FHIR-48121) | Call out box incorrectly flags IG as CI build | 2025-05-20 |
| [FHIR-48162](https://jira.hl7.org/browse/FHIR-48162) | Simplify Coincident timestamp mention. | 2025-05-21 |
| [FHIR-48164](https://jira.hl7.org/browse/FHIR-48164) | Clarify use of "text" entries | 2025-05-21 |
| [FHIR-48151](https://jira.hl7.org/browse/FHIR-48151) | Glossary or list of organizations would be helpful | 2025-05-22 |
| [FHIR-48122](https://jira.hl7.org/browse/FHIR-48122) | Clarify whether IG scope is beyond quality and research | 2025-05-26 |
| [FHIR-48145](https://jira.hl7.org/browse/FHIR-48145) | Github link broken | 2025-05-26 |
| [FHIR-48124](https://jira.hl7.org/browse/FHIR-48124) | Consistent formatting for IEEE standard names | 2025-05-27 |
| [FHIR-48143](https://jira.hl7.org/browse/FHIR-48143) | FHIR components is not clear | 2025-05-27 |
| [FHIR-48166](https://jira.hl7.org/browse/FHIR-48166) | Justify state or event measurement profile | 2025-05-27 |
| [FHIR-48194](https://jira.hl7.org/browse/FHIR-48194) | Choosing components vs separate Observations. | 2025-06-23 |
| [FHIR-48234](https://jira.hl7.org/browse/FHIR-48234) | DeviceTypes11073MDC should be intensionally defined. | 2025-06-26 |

### Unclassified — Change Impact missing

| Jira ticket | Jira summary | Resolved |
| --- | --- | --- |
| [FHIR-48012](https://jira.hl7.org/browse/FHIR-48012) | Suggestion for home page diagram | 2025-05-20 |

## [2.0.0](https://hl7.org/fhir/uv/phd/STU2) — 2026-04-01

STU 2 release based on IEEE 11073-10206 ACOM with Bluetooth GHS support.

Resolved-date window: after 2025-08-06 through 2026-04-01.

### Not-Compatible

| Jira ticket | Jira summary | Resolved |
| --- | --- | --- |
| [FHIR-52861](https://jira.hl7.org/browse/FHIR-52861) | PhdDeviceMetric should have source as mandatory element | 2025-10-01 |

### Compatible, Substantive

No exported tickets in this date window.

### Non-Substantive

| Jira ticket | Jira summary | Resolved |
| --- | --- | --- |
| [FHIR-52115](https://jira.hl7.org/browse/FHIR-52115) | please characterize major changes in your change log | 2025-10-01 |

### Unclassified — Change Impact missing

No exported tickets in this date window.

## [2.0.1](https://hl7.org/fhir/uv/phd/2.0.1) — 2026-11-11

STU 2 erratum correction restoring missing Coincident Timestamp Observation pages.

FHIR-59376 is retained in this release; the other tickets previously grouped
here by resolved date have been assigned to 3.0.0.

### Not-Compatible

No tickets assigned.

### Compatible, Substantive

No tickets assigned.

### Non-Substantive

No tickets assigned.

### Unclassified — Change Impact missing

| Jira ticket | Jira summary | Resolved |
| --- | --- | --- |
| [FHIR-59376](https://jira.hl7.org/browse/FHIR-59376) | intro and notes missing in PhdCoincidentTimeStampObservation | 2026-10-20 |

## 3.0.0 — unpublished draft

The draft includes the FHIR R6 migration and updates to alerts, units,
timestamps, examples, and guidance; see [the change summary](input/pagecontent/changes.md).

Tickets below were reassigned from 2.0.1 based on release information; their
resolved dates precede the 2.0.1 publication date.

### Not-Compatible

| Jira ticket | Jira summary | Resolved |
| --- | --- | --- |
| [FHIR-48204](https://jira.hl7.org/browse/FHIR-48204) | Do not require all devices to be PHD type | 2026-08-24 |
| [FHIR-53344](https://jira.hl7.org/browse/FHIR-53344) | Do not map relative time to UTC, and is inconsistent with later rule | 2026-09-24 |

### Compatible, Substantive

| Jira ticket | Jira summary | Resolved |
| --- | --- | --- |
| [FHIR-55491](https://jira.hl7.org/browse/FHIR-55491) | Non-UCUM units not supported by profiling | 2026-08-24 |

### Non-Substantive

| Jira ticket | Jira summary | Resolved |
| --- | --- | --- |
| [FHIR-53365](https://jira.hl7.org/browse/FHIR-53365) | PHD Reported Timestamp Identifier - not defined | 2026-04-30 |
| [FHIR-53360](https://jira.hl7.org/browse/FHIR-53360) | Grammar | 2026-05-06 |
| [FHIR-53361](https://jira.hl7.org/browse/FHIR-53361) | Not all systems include patient information - not mandatory - remove | 2026-05-06 |
| [FHIR-53362](https://jira.hl7.org/browse/FHIR-53362) | Float used to provide wide range of measurement, and can also provide precision if used correctly | 2026-05-06 |
| [FHIR-53359](https://jira.hl7.org/browse/FHIR-53359) | Do not expect text or display field | 2026-05-13 |
| [FHIR-55492](https://jira.hl7.org/browse/FHIR-55492) | There is no Observation.Type | 2026-05-13 |
| [FHIR-56054](https://jira.hl7.org/browse/FHIR-56054) | typos in timestamp section | 2026-05-13 |
| [FHIR-59324](https://jira.hl7.org/browse/FHIR-59324) | Add a UCUM-based DeviceMetric worked example (the IG prefers UCUM, but the only shipped example uses MDC, which misleads implementers into an invalid unit.coding.display) | 2026-09-28 |

### Unclassified — Change Impact missing

| Jira ticket | Jira summary | Resolved |
| --- | --- | --- |
| [FHIR-53366](https://jira.hl7.org/browse/FHIR-53366) | Timezone in UTC needs a format that provides a resolution of at least 15 minutes | 2026-04-30 |
| [FHIR-53358](https://jira.hl7.org/browse/FHIR-53358) | Add CE marking for regulation | 2026-08-24 |
| [FHIR-53326](https://jira.hl7.org/browse/FHIR-53326) | Greater emphasis on support for proprietary devices that use 10206 and 10101 to form compliant objects in PGD | 2026-09-03 |
| [FHIR-53352](https://jira.hl7.org/browse/FHIR-53352) | Text field not mandatory | 2026-09-03 |
| [FHIR-53336](https://jira.hl7.org/browse/FHIR-53336) | Incorrect example | 2026-09-07 |
| [FHIR-53356](https://jira.hl7.org/browse/FHIR-53356) | Status of clock and timestamps not addressed | 2026-09-22 |
| [FHIR-53345](https://jira.hl7.org/browse/FHIR-53345) | Observation.effectivePeriod end time to coincide with timestamp | 2026-09-23 |
| [FHIR-53348](https://jira.hl7.org/browse/FHIR-53348) | UTC offset not always available | 2026-09-23 |
| [FHIR-53349](https://jira.hl7.org/browse/FHIR-53349) | Relative time not defined consistently | 2026-09-23 |
| [FHIR-53355](https://jira.hl7.org/browse/FHIR-53355) | Confusion between capability and status of clock | 2026-09-23 |
| [FHIR-53330](https://jira.hl7.org/browse/FHIR-53330) | Clarify reference to time from PHD | 2026-09-24 |
| [FHIR-53334](https://jira.hl7.org/browse/FHIR-53334) | Timestamp status | 2026-09-24 |
| [FHIR-53337](https://jira.hl7.org/browse/FHIR-53337) | Invalid assumptions on types of device | 2026-09-24 |
| [FHIR-53339](https://jira.hl7.org/browse/FHIR-53339) | Confusing mix of terms | 2026-09-24 |
| [FHIR-53340](https://jira.hl7.org/browse/FHIR-53340) | Refer to PHG rather than PHD | 2026-09-24 |
| [FHIR-53341](https://jira.hl7.org/browse/FHIR-53341) | Clarify reference to "items" | 2026-09-24 |
| [FHIR-53346](https://jira.hl7.org/browse/FHIR-53346) | Clarify use of GHS schedule | 2026-09-24 |
| [FHIR-53328](https://jira.hl7.org/browse/FHIR-53328) | Note proprietary devices can be mapped to this IG | 2026-09-28 |
