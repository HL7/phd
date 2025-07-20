The sections below describe the profiled elements in more detail.

#### **System Identifier**
PHGs are required to have a system identifier.  This identifier follows the same rules as the [PHD system identifier](StructureDefinition-PhdDevice.html#system-identifier--deviceidentifier). The system identifier is a unique identifier for the PHG and is used to identify the PHG in the FHIR server. The system identifier is represented as a `Device.identifier` element.
 
 An example of a gateway reporting both its Bluetooth and MAC addresses is shown [here](Device-phg-ecde3d4e58532d31.000000000000.html)

#### **Device type**
The PHG `Device.type` is given by the MDC code 531981. The reference identifier for this code is `MDC_MOC_VMS_MDS_AHD`. "AHD" stands for Application Hosting Device and is the name Continua gave to what is commonly known as a PHG.

#### **Time synchronization**
The time synchronization is mapped to a device property element with as type the MDC code 68220. The possible codes for the time synchronization method come from the [MDC Time Synchronization Methods value set](ValueSet-MDCTimeSyncMethodCodes.html).

#### **Remaining Optional Data**
The treatment of further optional information in a mock SystemInfo object is similar as in the Phd Device Profile.

If these fields are present they shall be encoded as follows:

##### **Specializations**
The specializations supported by the PHG may be reported. If reported, they shall be reported in the Device.specializations element for each specialization in the same way as in the Phd Device Profile. The `specialization.systemType` element is populated with the MDC code for the specialization and the `specialization.version` element is populated with the version of the specialization.

If the PHG supports multiple versions of the specialization and the uploader wants to report this information, additional specializations entries for the additional versions are made. Alternatively the uploader can leave the version field empty.

A PHG is often designed to support all current and future PHDs that support a given version of the IEEE 11073-10206 standard. Instead of listing all the specializations individually (which could greatly increase the size of the message) one can use the 'generic' device code. In this case, the `specialization.version` element, if populated, indicates the version of the IEEE 11073-10206 standard. If multiple versions of the IEEE 11073-10206 standard are supported and the uploader wants to report this information, a separate 'generic' entries for each version are reported. Alternatively, the version element can be left empty.

An example of generic code use would be as follows

{% fragment Device/phg-example JSON EXCEPT:specialization %}

All defined IEEE PHD device specializations can be found in the [MDC Device Types value set](ValueSet-DeviceTypes11073MDC.html).

##### **PHG Product Information**
The PHG product information is reported in the same way as in the Phd Device Profile for the following elements:

 - `Device.manufacturer` = *manufacturer name*
 - `Device.modelNumber` = *model number*
 - `Device.serialNumber` = *serial number*
 - `Device.version` = *version* (optional)


##### **Continua Certified PHD interfaces**
The list of Continua Certified PHD interfaces can be provided by PHGs based on the IEEE 11073-20601 standard. It is not supported by the IEEE 11073-10206 ACOM standard. It is the complement of the same attribute in the Phd Device Profile and encoded in `property` elements in the same way.

##### **Continua Certified Health & Fitness interfaces**
The list of Continua Certified PHD interfaces can be provided by PHGs based on the IEEE 11073-20601 standard. It is not supported by the IEEE 11073-10206 ACOM standard. 

The Health and Fitness codes are mapped to a list of `property` elements. The codes are from the [MDC Health and Fitness Codes value set](ValueSet-MDCHealthFitnessCodes.html). 

##### **Regulation Status**
The PHG regulation status is reported in the same way as in the Phd Device Profile. 

##### **Further time capabilities**
One could enter further time capabilities as additional `property` elements similar to those of a PHD if desired.



