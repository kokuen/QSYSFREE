**free
//----------------------------------------------------------
// Product(s):
//  5761-SS1
//
// Copyright:
//  IBM Corp.  2007, 2007 - All rights reserved.
//  US Government Users Restricted Rights - Use, duplication or disclosure restricted by GSA ADP 
//  Schedule Contract with IBM Corp.
//  Licensed Materials-Property of IBM
//
// Header File Name: ECLRMST
// Descriptive Name: Clear Master Key Exit Program
// 
// Description:  
//  The Clear Master Key exit program is called both and after a master key version is cleared.
//  See exit point QIBM_QC3_CLR_MSTKEY.
// 
// Header Files Included: None.
// 
// Macros List: None.
// 
// Structure List: 
//  Qc3_Clr_MstKey_Info_t
//  Qc3_Clr_MstKey_Status_t
// 
// Function Prototype List: None.
// 
// Change Activity:
//  Dxxxxxxxx, V6R1,2006-09-15: New Include
//----------------------------------------------------------


//--------------------------------------
// Include guard
//--------------------------------------


/if defined(eclrmst)
  /eof
/else
  /define eclrmst
/endif


//--------------------------------------
// Data structures
//--------------------------------------


// Type Definition for the Clear Master Key Exit Program information
dcl-ds Qc3_Clr_MstKey_Info_t qualified;
  exitInfoLength  int(10);
  masterKeyID     int(10);
  version         char(1);
end-ds Qc3_Clr_MstKey_Info_t;

// Type Definition for the Clear Master Key Exit Program returned Status Information
dcl-ds Qc3_Clr_MstKey_Status_t qualified;
  statusInfoLength  int(10);
  clearStatus       char(1);
end-ds Qc3_Clr_MstKey_Status_t;