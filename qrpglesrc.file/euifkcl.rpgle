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
// Header File Name: H/EUIFKCL
// Descriptive Name: Function Key Exit Program
// 
// Description:
//  Include header file for the UIM call parms for a CALL program for a function key.
// 
// Header Files Included: None.
// 
// Macros List: None.
// 
// Structure List:
//  Qui_FKC_t
// 
// Function Prototype List: None.
// 
// Change Activity:
//  D2862000	1994-04-12	V3R1	New Include
//----------------------------------------------------------


//--------------------------------------
// Include guard
//--------------------------------------


/if defined(euifkcl)
  /eof 
/else
  /define euifkcl
/endif


//--------------------------------------
// Data structures
//--------------------------------------


// Parm structure for a UIM CALL program for a function key
dcl-ds Qui_FKC_t qualified;
  structureLevel    int(10);
  *n                char(8)   inz(*allx('00'));
  callType          int(10);
  applicationHandle char(8);
  panelName         char(10);
  functionKey       int(10);
end-ds Qui_FKC_t;
