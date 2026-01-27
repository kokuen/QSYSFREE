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
// Header File Name: H/EUITAEX
// Descriptive Name: Text Area Data Exit Program
// 
// Description:
//  Include header file for the UIM call parms for an EXIT program for text area processing.
// 
// Header Files Included: None.
// 
// Macros List: None.
// 
// Structure List:
//  Qui_TAX_t
// 
// Function Prototype List: None.
// 
// Change Activity:
//  D2862000	1994-04-11	V3R1	New Include
//----------------------------------------------------------


//--------------------------------------
// Include guard
//--------------------------------------


/if defined(euitaex)
  /eof 
/else
  /define euitaex
/endif


//--------------------------------------
// Data structures
//--------------------------------------


// Parm structure for a UIM EXIT program for a text area
dcl-ds Qui_TAX_t qualified;
  structureLevel            int(10);
  *n                        char(8)   inz(*allx('00'));
  callType                  int(10);
  applicationHandle         char(8);
  panelName                 char(10);
  functionKey               int(10);
  functionKeyQualifier      int(10);
  width                     int(10);
  depth                     int(10);
  bidirectionalOrientation  char(1);
  codePage                  int(10);
end-ds Qui_TAX_t;
