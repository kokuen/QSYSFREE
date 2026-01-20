**free
//----------------------------------------------------------
// Product(s):
//  5763-SS1
//  5722-SS1
//
// Copyright:
//  IBM Corp. 1994,2001 - All rights reserved.
//  US Government Users Restricted Rights - Use, duplication or disclosure restricted by GSA ADP 
//  Schedule Contract with IBM Corp.
//  Licensed Materials-Property of IBM
//
// Header File Name: H/ETEPSEPH
// Descriptive Name: Program Service Entry Point Stop Exit Program Header.
// 
// Description:
//  This is the CLE header for the ETEPSEPH Exit Program
// 
// Header Files Included:
//  H/QTES
// 
// Macros List: None.
// 
// Structure List: None.
// 
// Function Prototype List:
//  ETEPSEPH
// 
// Change Activity:
//  P9959932  2001-09-16  V5R2  New Include
//----------------------------------------------------------


//--------------------------------------
// Include guard
//--------------------------------------


/if defined(etepseph)
  /eof 
/else
  /define etepseph
/endif


//--------------------------------------
// Data structures
//--------------------------------------


// Typedefs for Stop Information
dcl-ds Qte_SrvEntPnt_StopInfo qualified;
  threadID                  char(8);
  offsetToInternalLocations int(10);
  numberOfInternalLocations int(10);
  stopLineNumber            int(10)   dim(3);
end-ds Qte_SrvEntPnt_StopInfo;

dcl-ds Qte_SrvEntPnt_JobName qualified;
  jobUser   char(10);
  jobID     char(10);
  jobNumber char(10);
end-ds Qte_SrvEntPnt_JobName;