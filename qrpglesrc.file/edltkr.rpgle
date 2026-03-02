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
// Header File Name: EDLTKR
// Descriptive Name: Delete Key Store Record Exit Program
// 
// Description:
//  The Delete Key Store Record exit program is called both before and after a keystore record is 
//  deleted. See exit point QIBM_QC3_DLT_KREC.
// 
// Header Files Included: None.
// 
// Macros List: None.
// 
// Structure List: 
//  Qc3_Dlt_Keystore_Rec_Info_t
//  Qc3_Dlt_Keystore_Rec_Status_t
// 
// Function Prototype List: None.
// 
// Change Activity:
//  N/A 2006-09-15  V6R1  New Include
//----------------------------------------------------------


//--------------------------------------
// Include guard
//--------------------------------------


/if defined(edltkr)
  /eof
/else
  /define edltkr
/endif


//--------------------------------------
// Data structures
//--------------------------------------


// Type Definition for the Delete Key Store Record Exit Program information
dcl-ds Qc3_Dlt_Keystore_Rec_Info_t qualified;
  exitInfoLength  int(10);
  keyLabel        char(32);
  keyStoreFile    char(20);
end-ds Qc3_Dlt_Keystore_Rec_Info_t;

// Type Definition for the Delete Key Store Record Exit Program returned Status Information
dcl-ds Qc3_Dlt_Keystore_Rec_Status_t qualified dim;
  statusInfoLength  int(10);
  status            char(1);
end-ds Qc3_Dlt_Keystore_Rec_Status_t;