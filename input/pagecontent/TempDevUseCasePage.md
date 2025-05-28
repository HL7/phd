This page is a placeholder for the TempDevUseCasePage. It is intended to be used as a template for future development of use cases related to FHIR devices and their relations with other FHIR resources for the Device Module.

The darker colored boxes in the diagram link to the FHIR resource definitions, while the lighter colored boxes link to examples of those resources. 

To do: the diagram is created using DrawIO and uses absolute links in the SVG file. This should be changed to relative links so that the diagram can be used in other contexts without modification. 

<figure>
{% capture svg %}{% include use-case-a-defective-device-with-resource-examples.svg %}{% endcapture %}
{% assign svgsplit = svg | split: 'svg11.dtd">' %}
{% assign svgpart = svgsplit[1] %}
{{ svgpart }}
<figcaption><i>Example Device Usecase Diagram</i></figcaption>
</figure>