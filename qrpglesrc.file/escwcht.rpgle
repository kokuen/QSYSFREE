**free
//----------------------------------------------------------
// Product(s):
//  5722-SS1
//  5761-SS1
//  5770-SS1
//
// Copyright:
//  IBM Corp.  2002, 2009 - All rights reserved.
//  US Government Users Restricted Rights - Use, duplication or disclosure restricted by GSA ADP 
//  Schedule Contract with IBM Corp.
//  Licensed Materials-Property of IBM
//
// Header File Name: H/ESCWCHT
// Descriptive Name: Watch Exit Program  
// 
// Description:
//  The Trace Internal, Trace connection, Start communication trace, Star Trace and Trace TCP
//  Application commands call a user-written program, if one was specified on the Trace Program 
//  (TRCPGM) parameter.
//  STRWCH command and Start Watch (QSCSWCH) API also call a user exit program specified on the 
//  Watch program parameter
// 
// Header Files Included: None.
// 
// Macros List: None.
// 
// Structure List:
//  Qsc_Watch_For_Msg_Trace
//  Qsc_Watch_For_LIClog_Trace
//  Qsc_Watch_For_Msg
//  Qsc_Watch_For_LICLOG
//  Qsc_Watch_For_PAL
// 
// Function Prototype List: None.
// 
// Change Activity:
//  D99284    2003-02-02  V5R3  New Include
//  D99930.1  2004-08-01  V5R4  Add structures for watch for event
//  D93207.4  2005-01-09  V5R4  Correct User Exit Program structure
//  D93708    2007-01-21  V5R5  Watch for PAL
//  D92219    2008-08-08  V7R1  Add original repl data length
//----------------------------------------------------------


//--------------------------------------
// Include guard
//--------------------------------------


/if defined(escwcht)
  /eof 
/else
  /define escwcht
/endif


//--------------------------------------
// Data structures
//--------------------------------------


// Trace Exit Program call because a message id is reached
dcl-ds Qsc_Watch_For_Msg_Trace qualified;
  traceInformationLength  int(10);
  messageID               char(7);  // Can be *IMMED
  *n                      char(9)   inz(x'00');
  offsetToComparisonData  int(10);
  comparisonDataLength    int(10);
  // data                 char(1);  // Varying size
end-ds Qsc_Watch_For_Msg_Trace;

// Trace Exit Program call because a LIC log id is reached
dcl-ds Qsc_Watch_For_LIClog_Trace qualified;
  traceInformationLength  int(10);
  LICLogMajorCode         char(4);
  LICLogMinorCode         char(4);
  LICLogIdentifier        char(8);
  offsetToComparisonData  int(10);
  comparisonDataLength    int(10);
  // comparisonData       char(1);  // Varying size
end-ds Qsc_Watch_For_LIClog_Trace;

// Watch Exit Program called because a message id and any associated comparison data is matched.
//  This structure is for the user exit program called by STRWCH cmd or Start Watch (QSCSWCH) API.
dcl-ds Qsc_Watch_For_Msg qualified;
  watchInformationLength      int(10);
  messageID                   char(7);
  *n                          char(1)   inz(x'00');
  messageQueueName            char(10);
  messageQueueLibrary         char(10);
  jobName                     char(10);
  userName                    char(10);
  jobNumber                   char(6);
  originalReplDataLength      int(10);
  sendingProgramName          char(10);
  sendingProgramModule        char(10);
  offsetToSendingProcedure    int(10);
  sendingProcedureLength      int(10);
  recevingProgramName         char(10);
  receivingProgramModule      char(10);
  offsetToReceivingProcedure  int(10);
  receivingProcedureLength    int(10);
  messageSeverity             int(10);
  messageType                 char(10);
  messageTimestamp            char(8);
  messageKey                  char(4);
  messageFileName             char(10);
  messageFileLibrary          char(10);
  *n                          char(2)   inz(x'00');
  offsetToComparisonData      int(10);
  comparisonDataLength        int(10);
  compareAgainst              char(10);
  *n                          char(2)   inz(x'00');
  comparisonDataCCSID         int(10);
  offsetToComparisonDataFound int(10);
  offsetToReplacementData     int(10);
  replacementDataLength       int(10);
  replacementDataCCSID        int(10);
  sendingUserProfile          char(10);
  targetJobName               char(10);
  targetJobUserName           char(10);
  targetJobNumber             char(6);
  // sendingProcedureName     char(1);  // Varying size
  // receivingProcedureName   char(1);  // Varying size
  // messageComparisonData    char(1);  // Varying size
  // messageReplacementData   char(1);  // Varying size
end-ds Qsc_Watch_For_Msg;

// Watch Exit Program called because a LIC log is reached.
//  This structure is for the user exit program called by STRWCH cmd or Start Watch (QSCSWCH) API
dcl-ds Qsc_Watch_For_LICLOG qualified dim;
  watchInformationLength        int(10);
  LICLogMajorCode               char(4);
  LICLogMinorCode               char(4);
  LICLogID                      char(8);
  LICLogTimestamp               char(8);
  TDENumber                     char(8);
  taskName                      char(16);
  serverType                    char(30);
  exceptionID                   char(2);
  LICLogJobName                 char(10);
  LICLogUserName                char(10);
  LICLogJobNumber               char(6);
  *n                            char(4)   inz(x'00');
  threadID                      char(8);
  LICModuleCompileTimestamp     char(8);
  offsetToLICModule             char(8);
  LICModuleRUName               char(8);
  LICModuleName                 char(48);
  LICModuleEntryPointName       char(128);
  LICLogCompareAgainstSpecified ind;
  *n                            char(1)   inz(x'00');
  offsetToComparisonData        int(10);
  comparisonDataLength          int(10);
  compareAgainst                char(10);
  // comparisonData             char(1);  // Varying size
end-ds Qsc_Watch_For_LICLOG;

// Watch Exit Program called because a PAL entry is reached.
//  This structure is for the user exit program called by STRWCH cmd or Start Watch (QSCSWCH) API, 
//  as well as for watch session started by trace commands
dcl-ds Qsc_Watch_For_PAL qualified;
  watchInformationLength  int(10);
  systemReferenceCode     char(8);
  deviceName              char(10);
  deviceType              char(4);
  model                   char(4);
  serialNumber            char(15);
  resourceName            char(10);
  logIdentifier           char(8);
  PALTimestamp            char(8);
  referenceCode           char(4);
  secondaryCode           char(8);
  tableIdentifier         char(8);
  *n                      char(1)   inz(x'00');
  Sequence                int(10);
  offsetToComparisonData  int(10);
  comparisonDataLength    int(10);
  compareAgainst          char(10);
  // comparisonData       char(1);  // Varying size
end-ds Qsc_Watch_For_PAL;