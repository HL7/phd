---
title: Generating the PHD Reported Time Stamp Identifier
layout: default
active: GeneratingtheReportedTimeStampIdentifier
---

This algorithm shows how one generates the time stamp as reported by the PHD for use in the Observation.identifier element. The Observation.identifier element is used in the PHD profiles to perform conditional creates and thus eliminate data duplication.

 - If the sensor reports absolute time this string will be encoded as an HL7 DTM YYYYMMDDTHHMMSS.ss.
   - Example 1: The sensor reports absolute time as an 8-byte Binary Coded Decimal (BCD) Mder OCTET STRING:
0x20 0x07 0x02 0x01 0x12 0x05 0x20 0x86 which is the date and then the time.
reported_sensor_timestamp = 20070201120520.86
   - Example 2: The BTLE sensor reports absolute time as a 7-byte string with no hundredths and it is not BCD or Mder. The year is the first two bytes in little endian thus 0x7E0 = 2016:
0xE0, 0x07, 0x05, 0x17, 0x11, 0x34, 0x11
reported_sensor_timestamp = 20160523T175217.00
 - If the sensor reports base-offset time this string will be encoded as seconds.fractional_seconds.offset. The sensor reports base offset time as an 8-byte string. The first four bytes are the seconds since 1900/01/01 00:00:00 (not the Unix Epoch!), the next two bytes the fractional seconds in units of 1/65536th of a second and the last two bytes are the offset in minutes. Only the offset is signed.
   - Example:
8-byte Mder OCTET STRING: 0xD4 0x67 0x40 0x38 0x13 0x14 0xFE 0xD4.
The seconds are 0xD4674038 = 3563536440,
fractional seconds 0x1314 = 4884, and
offset -300. 
     - The reported_sensor_timestamp = 3563536440.4884.-300.
     - If offset is positive: reported_sensor_timestamp = 3563536440.4884.+300
 - If the sensor reports relative time the string will be the reported value in units of 1/8th seconds as a decimal unsigned integer with no leading zeros. On the wire this value is an Mder sequence of 4 bytes with the MSB to the left.
 - If the sensor reports high resolution relative time, the string will be the number of microseconds as an unsigned integer with no leading zeros. On the wire this value is an Mder sequence of 8 bytes with the MSB to the left.
 
 - [Next: The Coincident Time Stamp]({{ output }}CoincidentTimeStamp.html)
 - [Previous: The Observation Identifier]({{ output }}TheObservationIdentifier.html)
