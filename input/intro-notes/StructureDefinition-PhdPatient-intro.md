All PHD-related Observation resources reference a Patient resource containing minimal information sufficient to identify the patient. Additional information linking the patient to a person is only available to authorized entities, ensuring PHI protection.

The only required element is the `identifier`, which can be made opaque to third-party viewers. This IG supports scenarios where the PHG is provided a logical ID for a Patient resource out-of-band. In such cases, the PHG does not upload a Patient resource but uses the provided logical ID in Observation resources, ensuring no identifiers are sent over the wire.

The PHD Patient Profile may or may not include patient-identifiable information, depending on the use case. For example, in Remote Patient Monitoring, PHI protection may be critical, while in other cases, such as fitness tracking by a coach monitoring team performance. In such cases, protecting fitness data may not justify the associated effort and inconvenience. This profile supports both scenarios.

If a Patient resource is created, only `Patient.identifier.system`, `Patient.identifier.value`, `Patient.identifier.type.coding.code`, and `Patient.identifier.type.coding.system` are required. The `Patient.name` element is optional, allowing PHI protection since required fields cannot be linked to a person without a dictionary available only to the healthcare provider.

