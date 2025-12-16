**free
//----------------------------------------------------------
// All original rights and credits goes to IBM.
//
// Header File Name: EDLTKR
// Descriptive Name: Delete Key Store Record Exit Program
// 
// Description: The Delete Key Store Record exit program is called both before and after a keystore 
//  record is deleted. See exit point QIBM_QC3_DLT_KREC.
// 
// Header Files Included: None.
// Macros List: None.
// Structure List: Qc3_Dlt_Keystore_Rec_Info_t, Qc3_Dlt_Keystore_Rec_Status_t
// Function Prototype List: None.
//----------------------------------------------------------


/if defined(edltkr)
  /eof
/else
  /define edltkr
/endif


//--------------------------------------
// Data structures
//--------------------------------------


// Type Definition for the Delete Key Store Record Exit Program information
dcl-ds DeleteKeystoreRecordInfo qualified;
  exitInfoLength int(10);
  keyLabel char(32);
  keyStoreFile char(20);
end-ds;

// Type Definition for the Delete Key Store Record Exit Program returned Status Information
dcl-ds DeleteKeystoreRecordStatus qualified dim;
  statusInfoLength int(10);
  status char(1);
end-ds;