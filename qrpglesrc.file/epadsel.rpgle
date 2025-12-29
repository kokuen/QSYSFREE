**free
//----------------------------------------------------------
// Product(s):
//  5722-SS1
//
// Copyright:
//  IBM Corp. 2002 - All rights reserved.
//  US Government Users Restricted Rights - Use, duplication or disclosure restricted by GSA ADP 
//  Schedule Contract with IBM Corp.
//  Licensed Materials-Property of IBM
//
// Header File Name: EPADSEL
// Descriptive Name: Device Selection exit program structures
// 
// Description: None.
// 
// Header Files Included: None.
// 
// Macros List: None.
// 
// Structure List:
//  PDSR0100
//  PDSC0100
// 
// Function Prototype List: None.
// 
// Change Activity:
//  P9A18906, V5R2, 2002-12-04: New Include
//----------------------------------------------------------


//--------------------------------------
// Include guard
//--------------------------------------


/if defined(epadsel)
  /eof 
/else
  /define epadsel
/endif


//--------------------------------------
// Data structures
//--------------------------------------


// Type definition for PDSC0100
dcl-ds PDSR0100 qualified;
  autocreationLimit                 int(10);
  deviceNamingPattern               char(6);
  controllerNamingPattern           char(6);
  additionalControllerNamingPattern char(6);
end-ds PDSR0100;

dcl-ds PDSC0100 qualified;
  structureSize         int(10);
  QPADEVSFunction       int(10);
  requestedSpecificName int(10);
  requestedDeviceName   char(10);
  returnedDataFormat    char(8);
  *n                    char(2)   inz(x'00');
end-ds PDSC0100;

// dcl-s outputs char(22);
// dcl-s autocreationLimit                 int(10);
// dcl-s deviceNamingPattern               char(6);
// dcl-s controllerNamingPattern           char(6);
// dcl-s additionalControllerNamingPattern char(6);