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
// Header File Name: H/EUIALEX
// Descriptive Name: Action List Option/Pull-Down Field Choice Exit Program
// 
// Description:
//  Include header file for the UIM call parms for an EXIT program for action list option/
//  pull-down field choice.
// 
// Header Files Included: None.
// 
// Macros List: None.
// 
// Structure List:
//  Qui_ALX_t
// 
// Function Prototype List: None.
// 
// Change Activity:
//  D2862000  1994-04-12  V3R1  New Include
//----------------------------------------------------------


//--------------------------------------
// Include guard
//--------------------------------------


/if defined(euialex)
  /eof 
/else
  /define euialex
/endif


//--------------------------------------
// Data structures
//--------------------------------------


// Parm structure for a UIM EXIT program for a action list option and a pull-down field choice
dcl-ds Qui_ALX_t qualified;
  structureLevel    int(10);
  *n                char(8)   inz(*allx('00'));
  callType          int(10);
  applicationHandle char(8);
  panelName         char(10);
  listName          char(10);
  listEntry         char(4);
  listOption        int(10);
  functionQualifier int(10);
  result            int(10);
  fieldName         char(10);
end-ds Qui_ALX_t;
