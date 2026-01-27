**free
//----------------------------------------------------------
// Product(s):
//  5763-SS1
//
// Copyright:
//  Copyright IBM Corp. 1994, 1994 - All rights reserved.
//  US Government Users Restricted Rights - Use, duplication or disclosure restricted by GSA ADP 
//  Schedule Contract with IBM Corp.
//  Licensed Materials-Property of IBM
//
// Header File Name: H/EUIGPEX
// Descriptive Name: General Panel Exit Program
// 
// Description:
//  Include header file for the UIM call parms for an EXIT program for general panel checking.
// 
// Header Files Included: None.
// 
// Macros List: None.
// 
// Structure List:
//  Qui_GPX_t
// 
// Function Prototype List: None.
// 
// Change Activity:
//  D2862000	1994-04-12	V3R1	New Include
//----------------------------------------------------------


//--------------------------------------
// Include guard
//--------------------------------------


/if defined(euigpex)
  /eof 
/else
  /define euigpex
/endif


//--------------------------------------
// Data structures
//--------------------------------------


// Parm structure for a UIM EXIT program for a general panel checking
dcl-ds Qui_GPX_t qualified;
  structureLevel    int(10);
  *n                char(8)   inz(*allx('00'));
  callType          int(10);
  applicationHandle char(8);
  panelName         char(10);
  functionKey       int(10);
  functionQualifier int(10);
  menuOption        int(10);
  fieldName         char(10);
end-ds Qui_GPX_t;
