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
// Header File Name: EJOBNTFY
// Descriptive Name: Job Notification Exit Point Declares
// 
// Description: 
//  The Job Notification Exit Point can be used to log notification messages to data queues when an 
//  OS/400 job goes through certain transitions.
//  Refer to the exit point documentation in the information center for additional information.
// 
// Header Files Included: None.
//
// Macros List: None.
//
// Structure List: 
//  Qwt_Job_Start_End_Notify_t
//  Qwt_Job_Queue_Notify_t
// 
// Function Prototype List: None.
// 
// Change Activity:
//  D98603    2001-04-03  V5R2  New Include
//  D98359    2002-07-19  V5R3  Add new fields
//  P9A10011  2002-08-12  V5R3  Add job type/subtype
//  D93793    2006-06-29  V5R5  Add JOBQ ASP
//----------------------------------------------------------


//--------------------------------------
// Include guard
//--------------------------------------


/if defined(ejobntfy)
  /eof
/else
  /define ejobntfy
/endif


//--------------------------------------
// Data structures
//--------------------------------------


// Type Definition for the Job Start and Job End Notification Messages
dcl-ds Qwt_Job_Start_End_Notify_t qualified;
  messageID               char(10);
  messageFormat           char(2);
  internalJobID           char(16);
  qualifiedJob            char(26);
  qualifiedJobQueue       char(20);
  jobSystemEntryTimestamp char(8);
  jobStartTimestamp       char(8);
  jobEndTimestamp         char(8);
  jobType                 char(1);
  jobSubtype              char(1);
  jobEndSeverity          int(10);
  processingUnitTime      int(20);
  jobQueueASPDevice       char(10);
  *n                      char(22)    inz(*allx'00'); // Reserved by the system
end-ds Qwt_Job_Start_End_Notify_t;

// Type Definition for the Job Queue Notification Messages
dcl-ds Qwt_Job_Queue_Notify_t qualified dim;
  messageID               char(10);
  messageFormat           char(2);
  internalJobID           char(16);
  qualifiedJob            char(26);
  qualifiedJobQueue       char(20);
  jobSystemEntryTimestamp char(8);
  *n                      char(16)  inz(*allx'00'); // Reserved by the system
  jobType                 char(1);
  jobSubtype              char(1);
  *n                      char(12)  inz(*allx'00'); // Reserved by the system
  jobQueueASPDevice       char(10);
  *n                      char(22)  inz(*allx'00'); // Reserved by the system
end-ds Qwt_Job_Queue_Notify_t;