**free
//----------------------------------------------------------
// Product(s):
//  5722-SS1
//
// Copyright:
//  Copyright IBM Corp. 2007, 2007 - All rights reserved.
//  US Government Users Restricted Rights - Use, duplication or disclosure restricted by GSA ADP 
//  Schedule Contract with IBM Corp.
//  Licensed Materials-Property of IBM
//
// Header File Name: H/ETOCSVRE
// Descriptive Name: User-defined Server Exit Declarations
// 
// Description:
//  The Start TCP/IP, Start TCP/IP Server, End TCP/IP, and End TCP/IP Server commands call
//  user-written program for user-defined servers.
// 
// Header Files Included: None.
// 
// Macros List: None.
// 
// Structure List:
//  Qtoc_Server_Action
// 
// Function Prototype List: None.
// 
// Change Activity:
//  D93424  2003-02-24  V5R5  New part
//----------------------------------------------------------


//--------------------------------------
// Include guard
//--------------------------------------


/if defined(etocsvre)
  /eof 
/else
  /define etocsvre
/endif


//--------------------------------------
// Data structures
//--------------------------------------


// Structure for user-defined server exit program call
dcl-ds Qtoc_Server_Action qualified;
  action                char(10);
  *n                    char(22)  inz(*allx'00');
  instanceName          char(32);
  offsetToStartupValues int(10);
  lengthOfStartupValues int(10);
  // StartupValues      char(1);  // Variable length
end-ds Qtoc_Server_Action;
