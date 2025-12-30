**free
//----------------------------------------------------------
// Product(s):
//  5763-SS1
//
// Copyright:
//  IBM Corp. 1994,1995 - All rights reserved.
//  US Government Users Restricted Rights - Use, duplication or disclosure restricted by GSA ADP 
//  Schedule Contract with IBM Corp.
//  Licensed Materials-Property of IBM
//
// Header File Name: H/EPDTRCJB
// Descriptive Name: Trace Job Exit Program
// 
// Description:
//  The Trace Job command calls a user-written program, if one was specified on the Trace Job 
//  (TRCJOB) command.
// 
// Header Files Included: None.
// 
// Macros List: None.
// 
// Structure List:
//  Qsc_Program_Flow_Trace_Data_t
//  Qsc_Data_Trace_Data_t
//  Qsc_DataManagement_Trace_Data_t
//  Qsc_MessageHandler_Trace_Data_t
//  Qsc_CmdAnalyzer_Trace_Data_t
//  Qsc_Other_Trace_Data_t
//  Qsc_Suspend_Trace_Data_t
//  Qsc_Resume_Trace_Data_t
//  Qsc_Trace_Record_Format_t
// 
// Function Prototype List: None.
// 
// Change Activity:
//  P3954178, V3R1, 1994-05-13: New Include
//  P3981592, V3R6, 1995-02-13: Changes for DCR 91834
//----------------------------------------------------------


//--------------------------------------
// Include guard
//--------------------------------------


/if defined(epdtrcjb)
  /eof 
/else
  /define epdtrcjb
/endif


//--------------------------------------
// Data structures
//--------------------------------------


// Record structure for program flow trace record data
dcl-ds Qsc_Program_Flow_Trace_Data_t qualified;
  dcl-s programFlowType             char(1);
  dcl-s timeStamp                   char(8);
  dcl-s programName                 char(10);
  dcl-s programLibraryName          char(10);
  dcl-s callStackCounter            int(5);
  dcl-s numberDeletedRecords        int(5);
  dcl-s newInstructionNumber        char(2);
  dcl-s oldInstructionNumber        char(2);
  dcl-s CPUTimeUsed                 char(4);
  dcl-s numberDatabasePagesRead     int(10);
  dcl-s numberNonDatabasePagesRead  int(10);
  dcl-s numberPagesWritten          int(10);
  dcl-s numberTransferToWaitStat    int(5);
  dcl-s ILEModuleName               char(10);
  dcl-s ILEModuleLibraryName        char(10);
  dcl-s procedureName               char(256);
  dcl-s offsetToLongProcedureName   int(10);
  dcl-s longProcedureNameLength     int(10);
  // dcl-s longProcedureName        char(1); // Varying length
end-ds Qsc_Program_Flow_Trace_Data_t;

// Record structure for data management trace record data
dcl-ds Qsc_DataManagement_Trace_Data_t qualified;
  dcl-s dataSource            char(1);
  dcl-s timeStamp             char(8);
  dcl-s internalFileName      char(10);
  dcl-s actualFileName        char(10);
  dcl-s actualFileLibraryName char(10);
  dcl-s deviceDescriptionName char(10);
  dcl-s programDeviceName     char(10);
end-ds Qsc_DataManagement_Trace_Data_t;

// Record structure for message handler trace record data
dcl-ds Qsc_MessageHandler_Trace_Data_t qualified;
  dcl-s dataSource                  char(1);
  dcl-s timeStamp                   char(8);
  dcl-s traceRecordType             char(1);
  dcl-s messageIdentifier           char(7);
  dcl-s messageType                 char(1);
  dcl-s messageSeverity             int(5);
  dcl-s messageQueueName            char(10);
  dcl-s callStackNumber             int(5);
  dcl-s procedureName               char(256);
  dcl-s ILEModuleName               char(10);
  dcl-s ILEModuleLibraryName        char(10);
  dcl-s messageQueueType            char(1);
  *n                                char(2)     inz(x'00'); // Reserved by the system
  dcl-s offsetToLongProcedureName   int(10);
  dcl-s longProcedureNameLength     int(10);
  // dcl-s longProcedureName        char(1);  // Varying length
end-ds Qsc_MessageHandler_Trace_Data_t;

// Record structure for command analyzer trace record data
dcl-ds Qsc_CmdAnalyzer_Trace_Data_t qualified;
  dcl-s dataSource                          char(1);
  dcl-s timeStamp                           char(8);
  dcl-s commandName                         char(10);
  dcl-s commandLibraryName                  char(10);
  dcl-s commandProcessingProgramName        char(10);
  dcl-s commandProcessingProgramLibraryName char(10);
end-ds Qsc_CmdAnalyzer_Trace_Data_t;

// Record structure for other trace record data
dcl-ds Qsc_Other_Trace_Data_t qualified;
  dcl-s dataSource  char(1);
  dcl-s timeStamp   char(8);
  dcl-s data        char(300);
end-ds Qsc_Other_Trace_Data_t;

// Record structure for data trace record data
dcl-ds Qsc_Data_Trace_Data_t qualified;
  dataTraceDataCategories             char(320);
  dataSource                          char(1);
  dataTimeStamp                       char(8);
  internalFileName                    char(10);
  actualFileName                      char(10);
  actualFileLibraryName               char(10);
  deviceDescriptionName               char(10);
  programDeviceName                   char(10);
  messageSource                       char(1);
  messageTimeStamp                    char(8);
  traceRecordType                     char(1);
  messageIdentifier                   char(7);
  messageType                         char(1);
  messageSeverity                     int(5);
  messageQueueName                    char(10);
  callStackNumber                     int(5);
  procedureName                       char(256);
  ILEModuleName                       char(10);
  ILEModuleLibraryName                char(10);
  messageQueueType                    char(1);
  *n                                  char(2)     inz(x'00'); // Reserved by the system
  offsetToLongProcedureName           int(10);
  longProcedureNameLength             int(10);
  longProcedureName                   char(1);
  commandSource                       char(1);
  commandTimeStamp                    char(8);
  commandName                         char(10);
  commandLibraryName                  char(10);
  commandProcessingProgramName        char(10);
  commandProcessingProgramLibraryName char(10);
  otherDataSource                     char(1);
  otherDataTimeStamp                  char(8);
  otherData                           char(300);
end-ds Qsc_Data_Trace_Data_t;

// Record structure for suspend trace record data
dcl-ds Qsc_Suspend_Trace_Data_t qualified;
  dcl-s dataSource  char(1);
  dcl-s timeStamp   char(8);
end-ds Qsc_Suspend_Trace_Data_t;

// Record structure for resume trace record data
dcl-ds Qsc_Resume_Trace_Data_t qualified;
  dcl-s dataSource  char(1);
  dcl-s timeStamp   char(8);
end-ds Qsc_Resume_Trace_Data_t;

// Record structure for trace record format
dcl-ds Qsc_Trace_Record_Format_t qualified;
  traceRecordType                     char(1);
  traceRecordData                     char(340); 
  programFlowType                     char(1);
  programTimeStamp                    char(8);
  programName                         char(10);
  programLibraryName                  char(10);
  callStackCounter                    int(5);
  numberDeletedRecords                int(5);
  newInstructionNumber                char(2);
  oldInstructionNumber                char(2);
  CPUTimeUsed                         char(4);
  numberDatabasePagesRead             int(10);
  numberNonDatabasePagesRead          int(10);
  numberPagesWritten                  int(10);
  numberTransferToWaitStat            int(5);
  programILEModuleName                char(10);
  programILEModuleLibraryName         char(10);
  programProcedureName                char(256);
  offsetToProgramLongProcedureName    int(10);
  programLongProcedureNameLength      int(10);
  programLongProcedureName            char(1);
  dataTraceDataCategories             char(320);
  dataSource                          char(1);
  dataTimeStamp                       char(8);
  internalFileName                    char(10);
  actualFileName                      char(10);
  actualFileLibraryName               char(10);
  deviceDescriptionName               char(10);
  programDeviceName                   char(10);
  messageSource                       char(1);
  messageTimeStamp                    char(8);
  traceRecordType                     char(1);
  messageIdentifier                   char(7);
  messageType                         char(1);
  messageSeverity                     int(5);
  messageQueueName                    char(10);
  callStackNumber                     int(5);
  messageProcedureName                char(256);
  messageILEModuleName                char(10);
  messageILEModuleLibraryName         char(10);
  messageQueueType                    char(1);
  *n                                  char(2)     inz(x'00'); // Reserved by the system
  offsetToMessageLongProcedureName    int(10);
  messageLongProcedureNameLength      int(10);
  messageLongProcedureName            char(1);
  commandSource                       char(1);
  commandTimeStamp                    char(8);
  commandName                         char(10);
  commandLibraryName                  char(10);
  commandProcessingProgramName        char(10);
  commandProcessingProgramLibraryName char(10);
  otherDataSource                     char(1);
  otherDataTimeStamp                  char(8);
  otherData                           char(300);
end-ds;