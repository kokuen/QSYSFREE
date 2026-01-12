**free
//----------------------------------------------------------
// Product(s):
//  5722-SS1
//
// Copyright:
//  IBM Corp.  2007, 2007 - All rights reserved.
//  US Government Users Restricted Rights - Use, duplication or disclosure restricted by GSA ADP 
//  Schedule Contract with IBM Corp.
//  Licensed Materials-Property of IBM
//
// Header File Name: H/ESPXPTS
// Descriptive Name: Spool exit point structure definitions
// 
// Description:
//  Describes the formats of structures used with defined spool exit points.
// 
// Header Files Included: None.
// 
// Macros List: None.
// 
// Structure List:
//  Qsp_LASP0100_t
// 
// Function Prototype List: None.
// 
// Change Activity:
//  D9374800  2006-09-08  V5R5  New Include
//----------------------------------------------------------


//--------------------------------------
// Include guard
//--------------------------------------


/if defined(espxpts)
  /eof 
/else
  /define espxpts
/endif


//--------------------------------------
// Data structures
//--------------------------------------


// Format of data passed to registered exit point QIBM_QSP_SPLF_LSTACT for user-defined list 
// actions in Spool interfaces WRKSPLF, WRKOUTQ, WRKJOB OPTION(*SPLF) and System/36 environment D P
// spooled file listing support.
dcl-ds Qsp_LASP0100_t qualified;
  jobName                 char(10);
  userName                char(10);
  jobNumber               char(6);
  spooledFileName         char(10);
  spooledFileNumber       int(10);
  jobSystemName           char(8);
  spooledFileCreationDate char(7);
  spooledFileCreationTime char(6);
  outputQueueName         char(10);
  outputQueueLibrary      char(10);
end-ds Qsp_LASP0100_t;