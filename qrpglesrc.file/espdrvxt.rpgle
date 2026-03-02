**free
//----------------------------------------------------------
// Product(s):
//  5716-SS1
//  5722-SS1
//
// Copyright:
//  IBM Corp. 1994,2002 - All rights reserved.
//  US Government Users Restricted Rights - Use, duplication or disclosure restricted by GSA ADP 
//  Schedule Contract with IBM Corp.
//  Licensed Materials-Property of IBM
//
// Header File Name: H/ESPDRVXT
// Descriptive Name: Print Driver Exit Interface
// 
// Description:
//  The Print Driver Exit Interface - Describes the interface between a user defined print driver 
//  exit proogram (print driver) and an AS/400 printer writer (writer).
// 
// Header Files Included:
//  H/ESPDRVXT
// 
// Macros List: None.
// 
// Structure List:
//  Qsp_Driver_Exit_I_t
//  Qsp_Driver_Exit_O_t
// 
// Function Prototype List: None.
// 
// Change Activity:
//  D91710  1995-01-11  V3R6  New Include
//  D97260  2001-01-05  V5R2  Decouple Splf from Job
//----------------------------------------------------------


//--------------------------------------
// Include guard
//--------------------------------------


/if defined(espdrvxt)
  /eof 
/else
  /define espdrvxt
/endif


//--------------------------------------
// Data structures
//--------------------------------------


// Structure for Option Specific input information to print driver
dcl-ds Qsp_Driver_Exit_I_t qualified;
  writerHandle            char(16);
  writerName              char(10);
  printerDeviceName       char(10);
  writerOutqName          char(10);
  writerOutqLibraryName   char(10);
  writerMsgqName          char(10);
  writerMsgqLibraryName   char(10);
  alignFile               char(10);
  spooledFileHandle       char(10);
  internalJobID           char(16);
  internalSpoolID         char(16);
  qualifiedJobName        char(26);
  spooledFileName         char(10);
  spooledFileNumber       int(10);
  startingPageNumber      int(10);
  drawerForSeparatorPages int(10);
  JobSeparatorsNumber     int(10);
  FileSeparatorsNumber    int(10);
  terminationType         int(10);
  currentWriterFormType   char(10);
  jobSystemName           char(8);
  spooledFileCreationDate char(7);
  *n                      char(1)   inz(*allx'00');
  spooledFileCreationTime char(6);
  *n                      char(23)  inz(*allx'00');
end-ds Qsp_Driver_Exit_I_t;

// Structure for Option Specific Output Information From Print Driver
dcl-ds Qsp_Driver_Exit_O_t qualified;
  errorCode       int(10);
  initialStatus   int(10);
  idleTimer       int(10);
  allowInterrupt  char(1);
  *n              char(3)   inz(*allx'00');
  LANToStart      char(10);
end-ds Qsp_Driver_Exit_O_t;