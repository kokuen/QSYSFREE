**free
//----------------------------------------------------------
// Product(s):
//  5761-SS1
//
// Copyright:
//  IBM Corp. 1996,1996 - All rights reserved.
//  US Government Users Restricted Rights - Use, duplication or disclosure restricted by GSA ADP 
//  Schedule Contract with IBM Corp.
//  Licensed Materials-Property of IBM
// 
// Header File Name: ECHGRCV1
// Descriptive Name: Change Journal Receiver Exit Program
// 
// Description: 
//  The Change Journal Receiver exit program allows code to be notified of a journal receiver that
//  has been detached. See exit point QIBM_QJO_CHG_JRNRCV.
// 
// Header Files Included: None.
// 
// Macros List: None.
// 
// Structure List:
//  Qjo_Chg_JrnRcv_Info_CRCV0100_t
// 
// Function Prototype List: None.
// 
// Change Activity:
//  D9346800  2006-01-06  V6R1  New Include
//----------------------------------------------------------


//--------------------------------------
// Include guard
//--------------------------------------


/if defined(echgrcv1)
  /eof
/else
  /define echgrcv1
/endif


//--------------------------------------
// Data structures
//--------------------------------------


// Type Definition for the Change Journal Receiver Exit Program information for format CRCV0100
dcl-ds Qjo_Chg_JrnRcv_Info_CRCV0100_t qualified;
  exitInfoLength          int(10);
  exitPoint               char(20);
  exitPointFormat         char(8);
  journalReceiver         char(10);
  journalReceiverLibrary  char(10);
  journal                 char(10);
  journalLibrary          char(10);
  ASPDevice               char(10);
  journalType             char(1);
  remoteJournalType       char(1);
  detachTimestamp         char(13);
end-ds Qjo_Chg_JrnRcv_Info_CRCV0100_t;