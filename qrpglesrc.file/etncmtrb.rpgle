**free
//----------------------------------------------------------
// Product(s):
//  5763-SS1
//  5769-SS1
//
// Copyright:
//  Copyright IBM Corp. 1994,1999 - All rights reserved.
//  US Government Users Restricted Rights - Use, duplication or disclosure restricted by GSA ADP 
//  Schedule Contract with IBM Corp.
//  Licensed Materials-Property of IBM
//
// Header File Name: H/ETNCMTRB
// Descriptive Name: Commitment Control Exit Program
// 
// Description:
//  Users who add API commitment resources to the commitment definition must supply a commitment
//  control exit program.
// 
// Header Files Included: None.
// 
// Macros List: None.
// 
// Structure List:
//  Qtn_Status_Info_t
//  Qtn_Return_Info_t
// 
// Function Prototype List: None.
// 
// Change Activity:
//  D2862000  1994-04-10  V3R1  New Include
//  PSA50564  1996-02-12  V3R2  Correction to the Status Inform Format Structure
//  D9750400  1999-03-09  V4R5  Add long commit cycle ID
//----------------------------------------------------------


//--------------------------------------
// Include guard
//--------------------------------------


/if defined(etncmtrb)
  /eof 
/else
  /define etncmtrb
/endif


//--------------------------------------
// Data structures
//--------------------------------------


// Typedef for Status information Format structure.
dcl-ds Qtn_Status_Info_t qualified;
  statusInfoLength            int(10);
  actionRequired              char(1);
  calledIPLRecovery           char(1);
  *n                          char(4)   inz(*allx'00');
  processErrorStatus          char(1);
  processEndStatus            char(1);
  *n                          char(1)   inz(*allx'00');
  commitOrRollbackQualifier   char(1);
  commitmentDefinitionScope   char(1);
  *n                          char(25)  inz(*allx'00');
  cycleID                     int(10);
  journalName                 char(10);
  journalLibrary              char(10);
  currentLogicalUnitOfWorkID  char(39);
  commitmentDefinitionStatus  char(1);
  *n                          char(8)   inz(*allx'00');
  cycleLongID                 char(20); 
end-ds Qtn_Status_Info_t;

// Typedef for Return information Format structure.
dcl-ds Qtn_Return_Info_t qualified;
  returnInfoLength  int(10);
  commitVote        char(1);
  classifyResult    ind;
  changesEnded      char(1);
end-ds Qtn_Return_Info_t;