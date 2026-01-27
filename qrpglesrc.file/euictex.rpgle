**free
//----------------------------------------------------------
// Product(s):
//  5763-SS1
//  5722-SS1
//
// Copyright:
//  Copyright IBM Corp. 1994, 2001 - All rights reserved.
//  US Government Users Restricted Rights - Use, duplication or disclosure restricted by GSA ADP 
//  Schedule Contract with IBM Corp.
//  Licensed Materials-Property of IBM
//
// Header File Name: H/EUICTEX
// Descriptive Name: Conditioning Tag Exit Program
// 
// Description:
//  Include header file for the UIM call parms for an EXIT program for a condition tag.
// 
// Header Files Included: None.
// 
// Macros List: None.
// 
// Structure List:
//  Qui_CTX_t
// 
// Function Prototype List: None.
// 
// Change Activity:
//  P9942426	2001-02-02	V5R2	New Include
//----------------------------------------------------------


//--------------------------------------
// Include guard
//--------------------------------------


/if defined(euictex)
  /eof 
/else
  /define euictex
/endif


//--------------------------------------
// Data structures
//--------------------------------------


// Parm structure for a UIM EXIT program for condition tag checking
dcl-ds Qui_CTX_t qualified;
  structureLevel    int(10);
  *n                char(8)   inz(*allx('00'));
  callType          int(10);
  applicationHandle char(8);
  objectName        char(10);
  libraryName       char(10);
  objectType        char(10);
  moduleName        char(32);
  panelName         char(10);
  conditionName     char(10);
  returnCode        char(1);
end-ds Qui_CTX_t;
