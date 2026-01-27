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
// Header File Name: H/EUICSEX
// Descriptive Name: Cursor-Sensitive Prompt Exit Program
// 
// Description:
//  Include header file for the UIM call parms for an EXIT program for an EXIT program for
//  cursor-sensitive prompting.
// 
// Header Files Included: None.
// 
// Macros List: None.
// 
// Structure List:
//  Qui_CSX_t
// 
// Function Prototype List: None.
// 
// Change Activity:
//  D2862000  1994-04-12  V3R1  New Include
//----------------------------------------------------------


//--------------------------------------
// Include guard
//--------------------------------------


/if defined(euicsex)
  /eof 
/else
  /define euicsex
/endif


//--------------------------------------
// Data structures
//--------------------------------------


// Parm structure for a UIM EXIT program for a cursor-sensitive prompting
dcl-ds Qui_CSX_t qualified;
  structureLevel    int(10);
  *n                char(8)   inz(*allx('00'));
  callType          int(10);
  applicationHandle char(8);
  panelName         char(10);
  element           char(1);
  *n                char(1)   inz(*allx('00'));
  varName           char(10);
  listName          char(10);
  listEntry         char(4);
end-ds Qui_CSX_t;
