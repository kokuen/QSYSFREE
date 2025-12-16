**free
//----------------------------------------------------------
// All original rights and credits goes to IBM.
//
// Header File Name: H/ENPSEP
// Descriptive Name: Network Print Server Exit Program structures
// 
// Description: 
//  This include defines the parameter structures for the two exit points defined for the Network
//  Print Server.
//  1) QIBM_QNPS_ENTRY format ENTR0100
//    Called when a conversation is allocated for the Network Print Server
//  2) QIBM_QNPS_SPLF format SPLF0100
//    Called for a specified spooled file
// 
// Header Files Included: None.
// Macros List: None.
// Structure List:
//  Qnps_Server_Info_t, Qnps_Exit_Pgm_RC_t, Qnps_Splf_ID_t, Qnps_Exit_Pgm_Data_t
// Function Prototype List: None.
//----------------------------------------------------------


/if defined(enpsep)
  /eof 
/else
  /define enpsep
/endif


//--------------------------------------
// Data structures
//--------------------------------------


// Typedef for Entry exit point format and typedef for Spooled File exit point format
dcl-ds Qnps_Server_Info_t qualified;
  userProfile char(10);
  serverID char(10);
  userExitFormat char(8);
  requestedFunctionId int(10);
end-ds;

// Typedef for Spooled File return code format common to all NPS Exit Points
dcl-ds Qnps_Exit_Pgm_RC_t qualified;
  dcl-s value char(1);
end-ds;

// Typedef for Spooled File ID 
// Specific to QIBM_QNPS_SPLF
dcl-ds Qnps_Splf_ID_t qualified;
  jobName char(10);
  userProfile char(10);
  jobNumber char(6);
  spoolName char(10);
  spoolNumber int(10);
  jobSystemName char(8);
  creationDate char(7);
  creationTime char(6);
end-ds;

// Typedef for Exit Program Data
// Specific to QIBM_QNPS_SPLF
dcl-ds Qnps_Exit_Pgm_Data_t qualified;
  dataLength int(10);
  data char(1); // Intended to be a variable length array but it can not be easily defined
end-ds;