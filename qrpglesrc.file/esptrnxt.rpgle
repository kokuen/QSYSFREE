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
// Header File Name: H/ESPTRNXT
// Descriptive Name: Writer Transform Exit Interface
// 
// Description:
//  The Writer Transform Exit Interface - Describes the interface between a user defined writer
//  transform exit program and an AS/400 printer writer (writer).
// 
// Header Files Included: None.
// 
// Macros List: None.
// 
// Structure List:
//  Esp_Transform_Exit_I_t
//  Esp_Transform_Exit_O_t
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


/if defined(esptrnxt)
  /eof 
/else
  /define esptrnxt
/endif


//--------------------------------------
// Data structures
//--------------------------------------


// Structure for Option Specific input information to transform
dcl-ds Esp_Transform_Exit_I_t qualified;
  writerHandle                        char(16);
  writerName                          char(10);
  printerDeviceName                   char(10);
  writerOutQueueName                  char(10);
  writerOutQueueLibraryName           char(10);
  writerMessageQueueName              char(10);
  writerMessageQueueLibraryName       char(10);
  *n                                  char(10)  inz(*allx'00');
  spooledFileHandle                   char(10);
  internalJobID                       char(16);
  internalSpoolID                     char(16);
  qualifiedJobName                    char(26);
  spooledFileName                     char(10);
  spooledFileNumber                   int(10);
  *n                                  char(12)  inz(*allx'00');
  endFileType                         int(10);
  terminationType                     int(10);
  currentWriterFormType               char(10);
  returnAlignData                     char(1);
  *n                                  char(5)   inz(*allx'00');
  numberOfCompletePages               int(10);
  workstationCustomizingObjectName    char(10);
  workstationCustomizingObjectLibrary char(10);
  manufacturerTypeModel               char(15);
  *n                                  char(31)  inz(*allx'00');
  jobSystemName                       char(8);
  spooledFileCreationDate             char(7);
  *n                                  char(1)   inz(*allx'00');
  spooledFileCreationTime             char(6);
end-ds Esp_Transform_Exit_I_t;

// Structure for Option Specific Output Information From Transform
//  Note:  The following type definition only defines the fixed portion of the format.
//  Any varying length fields must be defined by the user.
dcl-ds Esp_Transform_Exit_O_t qualified;
  returnCode                          int(10);
  transformFile                       ind
  passInputData                       ind;
  sendSingleCopy                      ind;
  sendOpenTimeCommands                ind;
  doneTransformingFile                ind;
  *n                                  char(3)   inz(*allx'00');
  offsetToVerticalPositioningCommands int(10);
  verticalPositioningCommandsLength   int(10);
  offsetToPrintData                   int(10);
  printDataLength                     int(10);
  offsetToCarriageReturnCommands      int(10);
  carriageReturnCommandsLength        int(10);
  offsetToFormFeedCommands            int(10);
  formFeedCommandsLength              int(10);
  // carriageReturnCommands           char(*);  // Varying length
  // formFeedCommands                 char(*);  // Varying length
end-ds Esp_Transform_Exit_O_t;