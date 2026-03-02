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
// Header File Name: EZHQEP
// Descriptive Name: Data Queue Server Exit Program Structure
// 
// Description:
//  This include defines the parameter structures for the exit point defined for the Data Queue
//  server. QIBM_QZHQ_DATA_QUEUE format ZHQ00100.
// 
// Header Files Included: None.
// 
// Macros List: None.
// 
// Structure List:
//  Qzhq_DataQueue_Format_t
// 
// Function Prototype List: None.
// 
// Change Activity:
//  P3978167	1995-02-03	V3R6	New Include
//----------------------------------------------------------


//--------------------------------------
// Include guard
//--------------------------------------


/if defined(ezhqep)
  /eof 
/else
  /define ezhqep
/endif


//--------------------------------------
// Data structures
//--------------------------------------


// Structure for Data Queue Server exit program structure
dcl-ds Qzhq_DataQueue_Format_t qualified;
  userProfile       char(10);
  serverID          char(10);
  formatName        char(8);
  requestedFunction int(10);
  objectName        char(10);
  objectLibraryName char(10);
  keyOperator       char(2);
  keyLength         int(10);
  keyValue          char(256);
end-ds Ezhqdqf_t;
