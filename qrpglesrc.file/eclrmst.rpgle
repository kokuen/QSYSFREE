**free
//----------------------------------------------------------
// All original rights and credits goes to IBM.
//
// Header File Name: ECLRMST
// Descriptive Name: Clear Master Key Exit Program
// 
// Description: The Clear Master Key exit program is called both and after a master key version is 
//  cleared. See exit point QIBM_QC3_CLR_MSTKEY.
// 
// Header Files Included: None.
// Macros List: None.
// Structure List: Qc3_Clr_MstKey_Info_t, Qc3_Clr_MstKey_Status_t
// Function Prototype List: None.
//----------------------------------------------------------


/if defined(eclrmst)
  /eof
/else
  /define eclrmst
/endif


//--------------------------------------
// Data structures
//--------------------------------------


dcl-ds MasterKeyInfo qualified;
  exitInfoLength int(10);
  masterKeyID int(10);
  version char(1);
end-ds;

dcl-ds MasterKeyStatus qualified;
  statusInfoLength int(10);
  clearStatus char(1);
end-ds;