**free
//----------------------------------------------------------
// Product(s):
//  5716-SS1
//
// Copyright:
//  Copyright IBM Corp. 1995 - All rights reserved.
//  US Government Users Restricted Rights - Use, duplication or disclosure restricted by GSA ADP 
//  Schedule Contract with IBM Corp.
//  Licensed Materials-Property of IBM
//
// Header File Name: EZSOEP
// Descriptive Name: Socket SIGNON Server Exit Program Structure
// 
// Description:
//  This include defines the parameter structures for the exit point defined for the socket signon
//  server.
// 
// Header Files Included: None.
// 
// Macros List: None.
// 
// Structure List:
//  Qzso_Signon_Format
// 
// Function Prototype List: None.
// 
// Change Activity:
//  P3978167	1995-02-01	V3R6	New Include
//----------------------------------------------------------


//--------------------------------------
// Include guard
//--------------------------------------


/if defined(ezsoep)
  /eof 
/else
  /define ezsoep
/endif


//--------------------------------------
// Data structures
//--------------------------------------


// Structure for signon server exit program structure
dcl-ds Qzso_Signon_Format qualified;
  userProfile        char(10);
  serverID           char(10);
  formatName         char(8);
  requestedFunction  int(10);
end-ds Qzso_Signon_Format;
