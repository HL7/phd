This example shows a coded enumeration Observation. Coded enumerations are used when the measurement itself is a code. In this case, the measurement is the meal context associated with a glucose measurement. There is a limited set of possible entries for this measurement, this one indicating after lunch or dinner. In the future, this measurement will contain a source-handle reference pointing to the measurement containing the glucose concentration. For now, the associated Observation has to be determined by time stamp and the PHD and patient references.

Note there is no logical id in this resource as this resource is being uploaded to the server in a conditional create operation. The server will use the identifier to check that no other Observation resource exists on the server with the same identfier. If there is not such resource present, the server will create the logical id and return it to the sender in the response.