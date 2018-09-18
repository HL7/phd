### Phd Coincident Time Stamp Observation JSON Example
The following JSON example is the Coincident Time Stamp Observation associated with a Blood Pressure measurement. 

<pre>{
    "resourceType":"Observation",
    "meta":{
        "profile": [
            "http: //pchalliance.org/phdfhir/StructureDefinition/PhdCoincidentTimeStampObservation"
        ]
    },
    "status":"final",
    "code":{
        "coding": [
            {
                "system":"urn:iso:std:iso:11073:10101",
                "code":"67975",
                "display":"MDC_ATTR_TIME_ABS"
            }
        ]
    },
    "subject":{
        "reference":"Patient/PatientId-sisansarahId"
    },
    "effectiveDateTime":"2017-12-12T09:13:39-05:00",
    <font color="green">// If the effectiveDateTime is absent, it means that the PHD has superior
    // time synchronization than the PHG. All reported times stamps are then taken directly from
    // the PHD and reported in the metric Observations unmodified. To date there are no PHDs that
    // have external synchronization</font>

    "valueDateTime":"2017-12-12T09:13:39-05:00",
    <font color="green">// If the value[x] element is absent, it means that the PHD has experienced
    // a time fault or is non-compliant by reporting a time stamp but no current time. All reported 
    // times stamps are then taken directly from the PHD and reported in the metric Observations 
    // unmodified. However, the time stamps are not reliable.</font>

    <font color="green">// A consumer of this resource can restore the original time reported by the PHD
    // by taking  (effectiveDateTime - valueDateTime) and subtracting it from the time stamp reported in
    // times stamps are then taken directly from the PHD and reported in the metric Observations 
    // the metric Observation. If there is a valueQuantity element for the PHD time, the PHD uses 
    // a relative time stamp. One can use a similar approach to find the relative time sent by the PHD
    // but the value is already reported in a component element of the metric Observation</font>
    
    "device":{
        "reference":"DeviceComponent/SysId-01040302f0000000"
    }
}</pre>
