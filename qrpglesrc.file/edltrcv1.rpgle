**free
//----------------------------------------------------------
// All original rights and credits goes to IBM.
//
// Header File Name: EDLTRCV1
// Descriptive Name: Delete Journal Receiver Exit Program
// 
// Description:
//  The Delete Journal Receiver exit program allows code to determine whether a journal receiver 
//  can be deleted or not. See exit point QIBM_QJO_DLT_JRNRCV. 
// 
// Header Files Included: None.
// Macros List: None.
// Structure List:
//  Qjo_Dlt_JrnRcv_Info_DRCV0100_t, Qjo_Dlt_JrnRcv_Status_t
// Function Prototype List: None.
//----------------------------------------------------------


/if defined(edltrcv1)
  /eof
/else
  /define edltrcv1
/endif


//--------------------------------------
// Data structures
//--------------------------------------


// Type Definition for the Delete Journal Receiver Exit Program information for format DRCV0100
dcl-ds Qjo_Dlt_JrnRcv_Info_DRCV0100_t qualified;
  exitinfoLength int(10);
  exitPoint char(20);
  exitPointFormat char(8);
  journalReceiver char(10);
  journalReceiverLibrary char(10);
  journal char(10);
  journalLibrary char(10);
  callSysJob char(1);
  callIPL char(1);
  ProcedureEnd char(1);
  journalType char(1);
  remoteJournalType char(1);
  saveStatus char(1);
  partialStatus char(1);
  detachTimestamp char(13);
end-ds;

// Type Definition for the Delete Journal Receiver Exit Program returned Status Information
dcl-ds Qjo_Dlt_JrnRcv_Status_t qualified;
  statusInfoLength int(10);
  deleteStatus char(1);
end-ds;