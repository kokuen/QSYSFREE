**free
//----------------------------------------------------------
// Product(s):
//  5716-SS1
//
// Copyright:
//  Copyright IBM Corp. 1995 - All rights reserved.
//  US Government Users Restricted Rights - Use, duplication or disclosure restricted by GSA ADP 
//  Schedule Contract with IBM Corp.
//  Licensed Materials-Property of IBM
//
// Header File Name: EZSCEP
// Descriptive Name: Central Server Exit Program Structures
// 
// Description:
//  This include defines the parameter structures for the three exit points defined for the central
//  server. 
//  1) QIBM_QZSC_LM format ZSCL0100 - Called for license management requests.
//  2) QIBM_QZSC_SM format ZSCS0100 - Called for system (or client) management requests.
//  3) QIBM_QZSC_NLS format ZSCN0100 - Called for conversion map requests.
// 
// Header Files Included: None.
// 
// Macros List: None.
// 
// Structure List:
//  Qzsc_Lic_Mgmt_Format
//  Qzsc_Sys_Mgmt_Format
//  Qzsc_Nls_Mgmt_Format
// 
// Function Prototype List: None.
// 
// Change Activity:
//  P3978167	1995-01-31	V3R6	New Include
//----------------------------------------------------------


//--------------------------------------
// Include guard
//--------------------------------------


/if defined(ezscep)
  /eof 
/else
  /define ezscep
/endif


//--------------------------------------
// Data structures
//--------------------------------------


// Structure for License Management exit point format
dcl-ds Qzsc_Lic_Mgmt_Format qualified;
  userProfileName     char(10);
  serverID            char(10);
  userExitFormatName  char(8);
  requestedFunctionID int(10);
  clientName          char(255);
  licenseUserHandle   char(8);
  productID           char(7);
  feature             char(4);
  release             char(6);
  LicenseInfoType     int(5);
end-ds Qzsc_Lic_Mgmt_Format;

// Structure for System (or Client) Management exit point format
dcl-ds Qzsc_Sys_Mgmt_Format qualified;
  userProfileName     char(10);
  serverID            char(10);
  userExitFormatName  char(8);
  requestedFunctionID int(10);
  clientName          char(255);
  communityName       char(255);
  nodeType            char(1);
  nodeName            char(255);
end-ds Qzsc_Sys_Mgmt_Format;

// Structure for Retrieve Conversion Map exit point format
dcl-ds Qzsc_Nls_Mgmt_Format qualified;
  userProfileName     char(10);
  serverID            char(10);
  userExitFormatName  char(8);
  requestedFunctionID int(10);
  sourceDataCCSID     int(10);
  targetDataCCSID     int(10);
  ConversionType      int(3);
end-ds Qzsc_Nls_Mgmt_Format;
