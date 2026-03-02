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
// Header File Name: ESETMST
// Descriptive Name: Set Master Key Exit Program  
// 
// Description:
//  The Set Master Key exit program is called both before and after a master key has been set.
//  See exit point QIBM_QC3_SET_MSTKEY.
// 
// Header Files Included: None.
// 
// Macros List: None.
// 
// Structure List:
//  Qc3_Set_MstKey_Info_t
//  Qc3_Set_MstKey_Status_t
// 
// Function Prototype List: None.
// 
// Change Activity:
//  N/A 2006-09-15  V6R1  New Include
//----------------------------------------------------------


//--------------------------------------
// Include guard
//--------------------------------------


/if defined(esetmst)
  /eof 
/else
  /define esetmst
/endif


//--------------------------------------
// Data structures
//--------------------------------------


// Type Definition for the Set Master Key Exit Program information
dcl-ds Qc3_Set_MstKey_Info_t qualified;
  exitInfoLength        int(10);
  masterKeyId           int(10);
  keyVerificationValue  char(20);
end-ds Qc3_Set_MstKey_Info_t;

// Type Definition for the Set Master Key Exit Program returned Status Information$
dcl-ds Qc3_Set_MstKey_Status_t qualified;
  statusInfoLength  int(10);
  setStatus         char(1);
end-ds Qc3_Set_MstKey_Status_t;