## Why `unit.text` is used

This example uses `unit.text` for the human-readable label "beats per minute" while `unit.coding` carries the machine-readable unit codes. The UCUM coding uses `/min` and intentionally omits `Coding.display`: when a UCUM display is supplied, it must be a canonical UCUM display (such as `/min`), not a custom phrase like "beats per minute". Keeping the familiar label in `unit.text` avoids a UCUM display-name validation error while still making the unit understandable to readers.

The second coding, MDC code `2720` (`MDC_DIM_BEAT_PER_MIN`), provides the corresponding IEEE 11073 unit code. The MDC coding has its own canonical display and does not change the UCUM display requirement.