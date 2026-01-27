**free
//----------------------------------------------------------
// Product(s):
//  5761-SS1
//
// Copyright:
//  Copyright IBM Corp. 2007, 2007 - All rights reserved.
//  US Government Users Restricted Rights - Use, duplication or disclosure restricted by GSA ADP 
//  Schedule Contract with IBM Corp.
//  Licensed Materials-Property of IBM
//
// Header File Name: ETRNKSF
// Descriptive Name: Translate Key Store Exit Program
// 
// Description:
//  The Translate Key Store exit program is called both before and after a keystore file is
//  translated. See exit point QIBM_QC3_TRN_KSF.
// 
// Header Files Included: None.
// 
// Macros List: None.
// 
// Structure List:
//  Qc3_Translate_Keystore_Info_t
//  Qc3_Translate_Keystore_Status_t
// 
// Function Prototype List: None.
// 
// Change Activity:
//  N/A 2006-09-15  V6R1  New Include
//----------------------------------------------------------


//--------------------------------------
// Include guard
//--------------------------------------


/if defined(etrnksf)
  /eof 
/else
  /define etrnksf
/endif


//--------------------------------------
// Data structures
//--------------------------------------


// Type Definition for the Translate Key Store Exit Program information
dcl-ds Qc3_Translate_Keystore_Info_t qualified;
  exitinfoLength      int(10);
  offsetToMasterKeyId int(10);  
  keyStoreFile        char(20);
end-ds Qc3_Translate_Keystore_Info_t;

// Type Definition for the Translate Key Store Exit Program returned Status Information
dcl-ds Qc3_Translate_Keystore_Status_t qualified;
  statusinfoLength  int(10);
  translateStatus   char(1);
end-ds Qc3_Translate_Keystore_Status_t;