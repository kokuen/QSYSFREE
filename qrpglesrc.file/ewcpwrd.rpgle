**free
//----------------------------------------------------------
// Product(s):
//  5722-SS1
//
// Copyright:
//  Copyright IBM Corp. 2005, 2005 - All rights reserved.
//  US Government Users Restricted Rights - Use, duplication or disclosure restricted by GSA ADP 
//  Schedule Contract with IBM Corp.
//  Licensed Materials-Property of IBM
//
// Header File Name: H/EWCPWRD
// Descriptive Name: Pre-power down state exit program structure
// 
// Description:
//  This include defines the parameter structures for the exit point
//  QIBM_QWC_PWRDWNSYS format PWRD0200.
// 
// Header Files Included: None.
// 
// Macros List: None.
// 
// Structure List:
//  Qwc_PDPF0100_Format_t
//  Qwc_PDPF0200_Format_t
// 
// Function Prototype List: None.
// 
// Change Activity:
//  D99843	2004-08-10	V5R4	New Include
//----------------------------------------------------------


//--------------------------------------
// Include guard
//--------------------------------------


/if defined(ewcpwrd)
  /eof 
/else
  /define ewcpwrd
/endif


//--------------------------------------
// Data structures
//--------------------------------------


// Typedef for exit program structure - Qwc PDPF0100 Format
dcl-ds Qwc_PDPF0100_Format_t qualified;
  exitInformationLength  int(10);
  statusFlag             int(10);
  waitTime               int(10);
end-ds Qwc_PDPF0100_Format_t;

// Typedef for exit program structure - Qwc PDPF0200 Format
dcl-ds Qwc_PDPF0200_Format_t qualified;
  exitInformationLength  int(10);
  executeWaitTime        int(10);
end-ds Qwc_PDPF0200_Format_t;
