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
// Header File Name: H/EUIILEX
// Descriptive Name: Incomplete List Exit Program
// 
// Description:
//  Include header file for the UIM call parms for an EXIT program for incomplete list processing.
// 
// Header Files Included: None.
// 
// Macros List: None.
// 
// Structure List:
//  Qui_ILX_t
// 
// Function Prototype List: None.
// 
// Change Activity:
//  D2862000	1994-04-12	V3R1	New Include
//----------------------------------------------------------


//--------------------------------------
// Include guard
//--------------------------------------


/if defined(euiilex)
  /eof 
/else
  /define euiilex
/endif


//--------------------------------------
// Data structures
//--------------------------------------


// Parm structure for a UIM EXIT program for an incomplete list processing
dcl-ds Qui_ILX_t qualified;
  structureLevel    int(10);
  *n                char(10)  inz(*allx('00'));
  callType          int(10);
  applicationHandle char(8);
  *n                char(10)  inz(*allx('00'));
  listName          char(10);
  direction         int(10);
  entries           int(10);
end-ds Qui_ILX_t;
