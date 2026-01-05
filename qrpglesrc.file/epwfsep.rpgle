**free
//----------------------------------------------------------
// Product(s):
//  5716-SS1
//  5722-SS1
//  5770-SS1
//
// Copyright:
//  IBM Corp.  1995, 2015 - All rights reserved.
//  US Government Users Restricted Rights - Use, duplication or disclosure restricted by GSA ADP 
//  Schedule Contract with IBM Corp.
//  Licensed Materials-Property of IBM
//
// Header File Name: H/EPWFSEP
// Descriptive Name: File Server Exit Program Parameters.
// 
// Description:
//  The File Server Exit Program Parameters define the parameters passed to the File Server exit 
//  program.
// 
// Header Files Included: None.
// 
// Macros List: None.
// 
// Structure List:
//  EPWQEP
//  EPWEP200
// 
// Function Prototype List: None.
// 
// Change Activity:
//  D9193500, V3R6, 1995-01-31: New Include
//  D98212.1, V5R1, 2000-10-06: Teraspace stage 2
//  RFW629185, V7R3, 2014-10-07: PWFS0200, QPWFS_COPY, Qpwfs_Exit_Parms200_t
//----------------------------------------------------------


//--------------------------------------
// Include guard
//--------------------------------------


/if defined(epwfsep)
  /eof 
/else
  /define epwfsep
/endif


// Type Definition for the File Server Exit Program Parameters for the PWFS0100 format.
// NOTE: The following type definition only defines the fixed portion of the format.  
//  Any varying length field will have to be defined by the user.
dcl-ds Qpwfs_Exit_Parms100_t qualified;
  User profile        char(10);
  serverID            char(10);
  requestedFunctionID int(10);
  formatName          char(8);
  readAccess          ind;
  writeAccess         ind;
  readAndWriteAccess  ind;
  deleteAllowed       ind;
  fileNameLength      int(10);
  // fileName         char(1);  // Varying length
end-ds Qpwfs_Exit_Parms100_t;

// Type Definition for the File Server Exit Program Parameters for the PWFS0200 format
// NOTE: The following type definition only defines the fixed portion of the format.
//  Any varying length field will have to be defined by the user.
dcl-ds Qpwfs_Exit_Parms200_t qualified;
  User profile          char(10);
  serverID              char(10);
  requestedFunctionID   int(10);
  formatName            char(8);
  readAccess            ind;
  writeAccess           ind;
  readAndWriteAccess    ind;
  deleteAllowed         ind;
  creationObjectType    char(10);
  *n                    char(6)   inz(x'00'); // Reserved by the system
  offsetToSource        uns(10);
  sourceFileNameLength  uns(10);
  offsetToTarget        uns(10);
  targetFileNameLength  uns(10);
  *n                    char(64)  inz(x'00'); // Reserved by the system
  // sourceFileName     char(1);  // Varying length
  // targetFileName     char(1);  // Varying length
end-ds Qpwfs_Exit_Parms200_t;