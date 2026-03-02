**free
//----------------------------------------------------------
// Product(s):
//  5716-SS1
//  5722-SS1
//  5761-SS1
//
// Copyright:
//  Copyright IBM Corp. 1995, 2007 - All rights reserved.
//  US Government Users Restricted Rights - Use, duplication or disclosure restricted by GSA ADP 
//  Schedule Contract with IBM Corp.
//  Licensed Materials-Property of IBM
//
// Header File Name: H/EZRCEP
// Descriptive Name: Remote Command/Remote Program Call Exit Program Structure
// 
// Description:
//  This include defines the parameter structure for the exit point defined for the Remote Command/
//  Remote Program Call server. 
//  QIBM_QZRC_RMT format CZRC0100.
// 
// Header Files Included: None.
// 
// Macros List: None.
// 
// Structure List:
//  Qzrc_Rmtsrv_Format_t
//  Qzrc_Rmtsrv_Format2_t
// 
// Function Prototype List: None.
// 
// Change Activity:
//  P3978167	1995-01-31	V3R6	New Include
//  P9934931	2000-11-05	V5R1	Teraspace stage 2
//  D93674	  2006-08-30	V6R1	Unicode-enabled commands
//----------------------------------------------------------


//--------------------------------------
// Include guard
//--------------------------------------


/if defined(ezrcep)
  /eof 
/else
  /define ezrcep
/endif


//--------------------------------------
// Data structures
//--------------------------------------


// Typedef for Remote Command/Program Call Server exit program structure
dcl-ds Qzrc_Rmtsrv_Format_t qualified;
  userProfile       char(10);
  serverID          char(10);
  formatName        char(8);
  requestedFunction int(10);
  objectName        char(10);
  objectLibraryName char(10);
  lengthOfLastField int(10);
  remainingData     char(6000);
end-ds Qzrc_Rmtsrv_Format_t;

// Updated Typedef for Remote Cmd/Pgm Call Server exit program structure.
// This typedef supports Unicode-enabled commands and removes the 6000-byte limit on commands and
//  parameters.
dcl-ds Qzrc_Rmtsrv_Format2_t qualified;
  userProfile         char(10);
  serverID            char(10);
  formatName          char(8);
  requestedFunction   int(10);
  remoteServerFormat2 char(10);
  commandCCSID        int(10)   overlay(remoteServerFormat2);
  objectName          char(10)  overlay(remoteServerFormat2);
  objectLibraryName   char(10);
  lengthOfLastField   int(10);
  // other            char(*);  // Varying length data for the command or the program parameters.
                                // The space for this data must be provided by the user's program.

end-ds Qzrc_Rmtsrv_Format2_t;
