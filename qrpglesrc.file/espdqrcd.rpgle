**free
//----------------------------------------------------------
// Product(s):
//  5722-SS1
//
// Copyright:
//  IBM Corp.  2002, 2007 - All rights reserved.
//  US Government Users Restricted Rights - Use, duplication or disclosure restricted by GSA ADP 
//  Schedule Contract with IBM Corp.
//  Licensed Materials-Property of IBM
//
// Header File Name: H/ESPDQRCD
// Descriptive Name: Spool data queue entries
// 
// Description:
//  Describes the format of the entries placed on a data queue when a spooled file is placed on an
//  output queue.
// 
// Header Files Included: None.
// 
// Macros List: None.
// 
// Structure List:
//  Qsp_DTAQ_01_E_t
//  Qsp_DTAQ_02_E_t
//  Qsp_DTAQ_03_E_t
// 
// Function Prototype List: None.
// 
// Change Activity:
//  D9822500  1999-12-10  V5R1  New Include
//  D97260    2001-01-05  V5R2  Decouple Splf from Job.
//  D9339101  2006-04-06  V5R5  Add new format for UTC
//----------------------------------------------------------


//--------------------------------------
// Include guard
//--------------------------------------


/if defined(espdqrcd)
  /eof 
/else
  /define espdqrcd
/endif


//--------------------------------------
// Data structures
//--------------------------------------


// Format of entry placed on a data queue specified on the output queue the spooled was placed on.
dcl-ds Qsp_DTAQ_01_E_t qualified;
  function                    char(10);
  recordType                  char(2);
  qualifiedJobName            char(26);
  spooledFileName             char(10);
  spooledFileNumber           int(10);
  outputQueueName             char(10);
  outputQueueLibrary          char(10);
  jobSystemName               char(8);
  spooledFileCreationDate     char(7);
  *n                          char(1)   inz(*allx'00');
  spooledFileCreationTime     char(6);
  spooledFileCreationDateUTC  char(7);
  *n                          char(1)   inz(*allx'00');
  spooledFileCreationTimeUTC  char(6);
  *n                          char(20)  inz(*allx'00');
end-ds Qsp_DTAQ_01_E_t;

// Format of entry placed on a data queue specified in the environment variable QIBM_NOTIFY_CRTSPLF
//   when the first 5 bytes of the environment variable are *DTAQ.
dcl-ds Qsp_DTAQ_02_E_t qualified;
  function                  char(10);
  recordType                char(2);
  qualifiedJobName          char(26);
  spooledFileName           char(10);
  spooledFileNumber         int(10);
  outputQueueName           char(10);
  outputQueueLibrary        char(10);
  creatingQualifiedJobName  char(26);
  userData                  char(10);
  auxiliaryStoragePool      int(10);
  threadID                  char(8);
  systemName                char(10);
  creationDate              char(7);
  creationTime              char(6);
  *n                        char(1)   inz(*allx'00');
end-ds Qsp_DTAQ_02_E_t;

// Format of entry placed on a data queue specified in the environment variable QIBM_NOTIFY_CRTSPLF
//   when the first 5 bytes of the environment variable are *DTA2.
dcl-ds Qsp_DTAQ_03_E_t qualified;
  function                  char(10);
  recordType                char(2);
  qualifiedJobName          char(26);
  spooledFileName           char(10);
  spooledFileNumber         int(10);
  outputQueueName           char(10);
  outputQueueLibrary        char(10);
  creatingQualifiedJobName  char(26);
  userData                  char(10);
  auxiliaryStoragePool      int(10);
  threadID                  char(8);
  systemName                char(10);
  creationDateUTC           char(7);
  creationTimeUTC           char(6);
  *n                        char(1)   inz(*allx'00');
end-ds Qsp_DTAQ_03_E_t;