**free
//----------------------------------------------------------
// Product(s):
//  5763-SS1
//  5722-SS1
//
// Copyright:
//  IBM Corp. 1994,2002 - All rights reserved.
//  US Government Users Restricted Rights - Use, duplication or disclosure restricted by GSA ADP 
//  Schedule Contract with IBM Corp.
//  Licensed Materials-Property of IBM
//
// Header File Name: H/ESPBLSEP
// Descriptive Name: Build Customized Separator Page Exit Program
// 
// Description:
//  An exit program can be specified on the separator program parameter of the printer device 
//  description. If a separator exit program is specified on the printer device description, the 
//  system printer calls this program to create the separator page.  This separator page is used 
//  instead of the system separator page.
// 
// Header Files Included: None.
// 
// Macros List: None.
// 
// Structure List:
//  Qsp_Sep_Data_Format_t
//  Qsp_Sep_Info_Format_t
// 
// Function Prototype List: None.
// 
// Change Activity:
//  D2862000  1994-04-24  V3R1  New Include
//  D97260    2001-01-05  V5R2  Decouple Splf from Job.
//----------------------------------------------------------


//--------------------------------------
// Include guard
//--------------------------------------


/if defined(espblsep)
  /eof 
/else
  /define espblsep
/endif


//--------------------------------------
// Data structures
//--------------------------------------


// Typedef for Separator Data Format structure
dcl-ds Qsp_Sep_Data_Format_t qualified;
  transformOption       char(10);
  *n                    char(2)   inz(*allx'00'); // Reserved by the system
  pageRotation          int(10);
  pageLength            int(10);
  pageWidth             int(10);
  linesPerInch          int(10);
  charactersPerInch     int(10);
  DBCSCharactersPerInch int(10);
  DBCSCharacterRotation char(10);
  pageMeasurementMethod char(10);
  printQuality          char(10);
  overlayName           char(10);
  overlayLibraryName    char(10);
  *n                    char(98)  inz(*allx'00'); // Reserved by the system
  userDataLength        int(10);
  userDataRecordLength  int(10);
  // userData           char(*);  // Varying length
end-ds Qsp_Sep_Data_Format_t;

// Typedef for Separator Information structure
dcl-ds Qsp_Sep_Info_Format_t qualified;
  internalJobID           char(16);
  internalSpooledFileID   char(16);
  jobName                 char(10);
  userName                char(10);
  jobNumber               char(6);
  spooledFileName         char(10);
  spooledFileNumber       char(10);
  printerDeviceName       char(10);
  printerDataStreamType   char(10);
  typeSeparactor          char(10);
  jobSystemName           char(8);
  spooledFileCreationDate char(7);
  *n                      char(1)   inz(*allx'00'); // Reserved by the system
  spooledFileCreationTime char(6);
  *n                      char(50)  inz(*allx'00'); // Reserved by the system
end-ds Qsp_Sep_Info_Format_t;