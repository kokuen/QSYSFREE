**free
//----------------------------------------------------------
// Product(s):
//  5722-SS1
//  5770-SS1
// 
// Copyright:
//  IBM Corp.  1999, 2013 - All rights reserved.
//  US Government Users Restricted Rights - Use, duplication or disclosure restricted by GSA ADP 
//  Schedule Contract with IBM Corp.
//  Licensed Materials-Property of IBM
// 
// Header File Name: H/ECARTCMD
// Descriptive Name: Command Analyzer Retrieve Exit Program
// 
// Description:
//  This header file describes the structure that is passed to an exit program associated with the
//  QIBM_QCA_RTV_COMMAND exit point for a command being run by Command Analyzer.
// 
// Header Files Included: None.
// 
// Macros List: None.
// 
// Structure List:
//  Qca_Rtv_RTVC0100_t
// 
// Function Prototype List: None.
// 
// Change Activity:
//  D95252, V4R5, 1999-03-03: New Include
//  D98212.1, V5R1, 1999-11-07: Teraspace stage 2
//  D99697, V5R4, 2004-10-31: Proxy Command Support
//  PFW579939, V7R2, 2012-01-31: Call registered exit program AFTER the CL command runs
//----------------------------------------------------------


//--------------------------------------
// Include guard
//--------------------------------------


/if defined(ecartcmd)
  /eof
/else
  /define ecartcmd
/endif


//--------------------------------------
// Data structures
//--------------------------------------


// Type definition for format RTVC0100
dcl-ds Qca_Rtv_RTVC0100_t qualified;
  exitPointName                     char(20);
  exitPointFormat                   char(8);
  commandName                       char(10);
  libraryName                       char(10);
  *n                                char(2)   inz(x'00'); // Reserved by the system
  calledAfterCommand                ind;
  *n                                char(1)   inz(x'00'); // Reserved by the system
  offsetToOriginalCommandString     int(10);
  originalCommandStringLength       int(10);
  offsetToReplacementCommandString  int(10);
  replacementCommandStringLength    int(10);
  offsetToProxyChain                int(10);
  proxyChainEntries                 int(10);
  // originalCommandString          char(*)
  // replacementCommandString       char(*)
  // proxyChain                     char(*) 
end-ds Qca_Rtv_RTVC0100_t;