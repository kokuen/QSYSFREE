**free
//----------------------------------------------------------
// All original rights and credits goes to IBM.
//
// Header File Name: EJOBNTFY
// Descriptive Name: Job Notification Exit Point Declares
// 
// Description: The Job Notification Exit Point can be used to log notification messages to data
//  queues when an OS/400 job goes through certain transitions.
//  Refer to the exit point documentation in the information center for additional information.
// 
// Header Files Included: None.
// Macros List: None.
// Structure List: Qwt_Job_Start_End_Notify_t, Qwt_Job_Queue_Notify_t
// Function Prototype List: None.
//----------------------------------------------------------


/if defined(ejobntfy)
  /eof
/else
  /define ejobntfy
/endif


//--------------------------------------
// Data structures
//--------------------------------------


// Type Definition for the Job Start and Job End Notification Messages
dcl-ds JobStartEndNotify qualified;
  messageID char(10);
  messageFormat char(2);
  internalJobID char(16);
  qualifiedJob char(26);
  qualifiedJobQueue char(20);
  jobSystemEntryTimestamp char(8);
  jobStartTimestamp char(8);
  jobEndTimestamp char(8);
  jobType char(1);
  jobSubtype char(1);
  jobEndSeverity int(10);
  processingUnitTime int(20);
  jobQueueASPDevice char(10);
  *n char(22) inz(x'00'); // Reserved by the system
end-ds;

// Type Definition for the Job Queue Notification Messages
dcl-ds JobQueueNotify qualified dim;
  messageID char(10);
  messageFormat char(2);
  internalJobID char(16);
  qualifiedJob char(26);
  qualifiedJobQueue char(20);
  jobSystemEntryTimestamp char(8);
  *n char(16) inz(x'00'); // Reserved by the system
  jobType char(1);
  jobSubtype char(1);
  *n char(12) inz(x'00'); // Reserved by the system
  jobQueueASPDevice char(10);
  *n char(22) inz(x'00'); // Reserved by the system
end-ds;