**free
//----------------------------------------------------------
// Product(s):
//  5763-SS1
//
// Copyright:
//  IBM Corp. 1994,1994 - All rights reserved.
//  US Government Users Restricted Rights - Use, duplication or disclosure restricted by GSA ADP 
//  Schedule Contract with IBM Corp.
//  Licensed Materials-Property of IBM
//
// Header File Name: H/ETEPGMST
// Descriptive Name: Program Stop Exit Program Header.
// 
// Description:
//  This is the CLE header for the ETEPGMST Exit Program.
// 
// Header Files Included: None.
// 
// Macros List: None.
// 
// Structure List: None.
// 
// Function Prototype List:
//  ETEPGMST
// 
// Change Activity:
//  D2862000  1994-05-22  V3R1  New Include
//  D9421104  1996-03-06  V3R7  Add Watch typedefs
//  D9480301  1996-12-18  V4R2  Add Thread Support
//  D9750500  1999-05-09  V4R5  Java Watch Support
//----------------------------------------------------------


//--------------------------------------
// Include guard
//--------------------------------------


/if defined(etepgmst)
  /eof 
/else
  /define etepgmst
/endif


//--------------------------------------
// Data structures
//--------------------------------------


// Structure for Format of Message Data
dcl-ds Qte_Msg_Data qualified;
  lengthOfMessageData int(10);
  messageID           char(7);
  messageFile         char(20);
  *n                  char(1)     inz(*allx'00');
  messageData         char(512);
end-ds Qte_Msg_Data;

// Typedefs for Watch Stop Reasons
dcl-ds Qte_Watch_Receiver qualified;
  watchNumber                 int(10);
  offsetToStoppedProgramInfo  int(10);
  offsetToWatchInternalInfo   int(10);
end-ds Qte_Watch_Receiver;

dcl-ds Qte_Stopped_PgmInfo qualified;
  offsetToStopProcedureName int(10);
  lengthOfStopProcedureName int(10);
  offsetToStopLocations     int(10);
  numberOfStopLocations     int(10);
  stoppedLocationFlag       char(1);
  *n                        char(3)   inz(*allx'00');
  threadID                  char(8);
end-ds Qte_Stopped_PgmInfo;

dcl-ds Qte_Watch_Int_Info qualified;
  QualifiedInternalJobName      char(26);
  objectName                    char(10);
  library                       char(10);
  InternalProgramType           char(10);
  InternalModuleName            char(10);
  InternalLocationFlag          char(1);
  *n                            char(1)   inz(*allx'00');
  OffsetToInternalProcedureName int(10);
  LengthOfInternalProcedureName int(10);
  OffsetToInternalLocations     int(10);
  NumberOfInternalLocations     int(10);
  ThreadID                      char(8);
  OffsetToInternalClassName     int(10);
  LengthOfInternalClassName     int(10);
end-ds Qte_Watch_Int_Info;