### Dependencies
{% lang-fragment dependency-table.xhtml %}

### Cross Version Analysis
{% lang-fragment cross-version-analysis.xhtml %}

### Global Profiles
{% lang-fragment globals-table.xhtml %}

### IP Statements
{% lang-fragment ip-statements.xhtml %}

### Github 
The source for this Implementation Guide is available on [HL7 GitHub](https://github.com/HL7/phd).

### Downloads

#### Package File

The following package file includes an NPM package file used by many of the FHIR tools.  It contains all the value sets, profiles, extensions, list of pages and urls in the IG, etc defined as part of this version of the Implementation Guides. This file should be the first choice whenever generating any implementation artifacts since it contains all of the rules about what makes the profiles valid. Implementers will still need to be familiar with the content of the specification and profiles that apply in order to make a conformant implementation. See the overview on validating [FHIR profiles and resources]({{site.data.fhir.path}}validation.html):

- [Package](../package.tgz){::download="true"}

#### Examples

All the examples that are used in this Implementation Guide available for download:

- [XML](../examples.xml.zip)
- [JSON](../examples.json.zip)

#### Downloadable Copy of Entire Specification

A downloadable version of this IG is available so it can be hosted locally:

- [Downloadable Copy](full-ig.zip)

### Issues
Reported issues can be found on the [HL7 FHIR PHD JIRA Dashboard](https://jira.hl7.org/secure/Dashboard.jspa?selectPageId=17103).
New issues can be reported there as well.

### Used Jekyll/Liquid variables:
<style>table, th, td {
border: 1px solid black;
border-collapse:collapse;
padding: 6px;}</style>

| Variable Name | Liquid | Value |
|---------------|-------|--|
| path          | page.path | {{ page.path }} |
| FHIR path     | site.data.fhir.path | {{ site.data.fhir.path }} |
| FHIR version  | site.data.fhir.version | {{ site.data.fhir.version }} |
| canonical     | site.data.fhir.canonical | {{ site.data.fhir.canonical }} |
| ig            | site.data.fhir.ig | {{ site.data.fhir.ig }} |
| igId          | site.data.fhir.igId | {{ site.data.fhir.igId }} |
| ig.version    | site.data.fhir.ig.version | {{ site.data.fhir.ig.version }} |
| ig.name       | site.data.fhir.ig.name | {{ site.data.fhir.ig.name }} |
| ig.title      | site.data.fhir.ig.title | {{ site.data.fhir.ig.title }} |
| ig.tx-server  | site.data.fhir.ig.tx-server | {{ site.data.fhir.ig.tx-server }} |