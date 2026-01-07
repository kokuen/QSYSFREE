**free
//----------------------------------------------------------
// Product(s):
//  5763-SS1
//
// Copyright:
//  IBM Corp.  1989, 1994 - All rights reserved.
//  US Government Users Restricted Rights - Use, duplication or disclosure restricted by GSA ADP 
//  Schedule Contract with IBM Corp.
//  Licensed Materials-Property of IBM
// 
// Header File Name: DSQCOMMR
// Descriptive Name: IBM Query Management/400 interface include file.
// 
// Description: 
//  This include file contains the declarations needed by an RPG/400 application program for 
//  interfacing with the Query Manager/400 Callable Interface.
//  Query Management is the AS/400 implementation of the Systems Application Architecture Query 
//  Callable Programming Interface.
// 
// Header Files Included: None.
// 
// Macros List: None.
// 
// Structure List: None.
// 
// Function Prototype List: None.
// 
// Change Activity: None.
//----------------------------------------------------------


//--------------------------------------
// Include guard
//--------------------------------------


/if defined(dsqcommr)
  /eof
/else
  /define dsqcommr
/endif


//--------------------------------------
// Data structures
//--------------------------------------


dcl-ds Dsq_Query_Communication_Interface qualified;
  queryExecutionStatus      int(10);
  SAAQueryIdentifier        int(10);
  *n                        char(44)  inz(*allx'00'); // Reserved by the system
  completionMessageId       char(8);
  queryMessageId            char(8);
  failAtStartParameterError char(8);
  commandIsCanceled         ind;
  *n                        char(17)  inz(*allx'00'); // Reserved by the system
  queryDerivedFromQRYDFN    ind;
  formDerivedFromQRYDFN     ind;
  environmentDeletion       char(4);
  *n                        char(256) inz(*allx'00'); // Reserved by the system
  *n                        char(256) inz(*allx'00'); // Reserved by the system
  *n                        char(256) inz(*allx'00'); // Reserved by the system
  *n                        char(156) inz(*allx'00'); // Reserved by the system
end-ds Dsq_Query_Communication_Interface;


//--------------------------------------
// Special values
//--------------------------------------


// Return code meanings
dcl-c QUERY_STATUS_SUCCESS  const(0);
dcl-c QUERY_STATUS_WARNING  const(4);
dcl-c QUERY_STATUS_FAILURE  const(8);
dcl-c QUERY_STATUS_SEVERE   const(16);

// Cancel indicator meanings
dcl-c CANCEL_YES  const('1');
dcl-c CANCEL_NO   const('0');

// QRYDFN derivation indicator meanings
dcl-c DERIVED_YES const('1');
dcl-c DERIVED_NO  const('0');

// Constants for the values returned for the DSQCATTN and DSQAROWC global variables
dcl-c DSQ_YES const('1');
dcl-c DSQ_NO  const('0');

// Interface program call name definition
dcl-c INTERFACE_PROGRAM const('QQXMAIN');

// Miscellaneous
dcl-c CHAR  const('CHAR');
dcl-c FINT  const('FINT');