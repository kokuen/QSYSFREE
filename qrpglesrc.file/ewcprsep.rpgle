**free
//----------------------------------------------------------
// Product(s):
//  5722-SS1
//
// Copyright:
//  Copyright IBM Corp. 2003, 2003 - All rights reserved.
//  US Government Users Restricted Rights - Use, duplication or disclosure restricted by GSA ADP 
//  Schedule Contract with IBM Corp.
//  Licensed Materials-Property of IBM
//
// Header File Name: H/EWCPRSEP
// Descriptive Name: Pre-restricted State Exit Program Structure
// 
// Description:
//  This include defines the parameter structures for the exit point QIBM_QWC_PRERESTRICT format.
//  PRER0100.
// 
// Header Files Included: None.
// 
// Macros List: None.
// 
// Structure List:
//  Qwc_prse0100_Format_t
//  Qwc_prse0200_Format_t
// 
// Function Prototype List: None.
// 
// Change Activity:
//  D99530	2003-03-28	V5R3	New Include
//----------------------------------------------------------


//--------------------------------------
// Include guard
//--------------------------------------


/if defined(ewcprsep)
  /eof 
/else
  /define ewcprsep
/endif


//--------------------------------------
// Data structures
//--------------------------------------


// Typedef for exit program structure
dcl-ds Qwc_prse0100_Format_t qualified;
  returnInformationLength  int(10);
  statusFlag               int(10);
  waitTime                 int(10);
end-ds Qwc_prse0100_Format_t;

dcl-ds Qwc_prse0200_Format_t qualified;
  returnInformationLength  int(10);
end-ds Qwc_prse0200_Format_t;
