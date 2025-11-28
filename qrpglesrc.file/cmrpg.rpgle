**free
//----------------------------------------------------------
// Title: CMRPG 
// Role: CLE header for the CPI-C API.
//
// All original rights and credits goes to IBM
//----------------------------------------------------------


/if defined(cmrpg)
  /eof
/else
  /define cmrpg
/endif


//--------------------------------------


// ILE/RPG INCLUDE FOR SAA COMMUNICATIONS SUPPORT
dcl-ds CommunicationConstants end-ds;


//--------------------------------------


dcl-enum conversation_security qualified;
  NONE 0;
  SAME 1;
  PROGRAM 2;
  PROGRAM_STRONG 5;
end-enum;

dcl-enum conversation_state qualified;
  INITIALIZE 2;
  SEND 3;
  RECEIVE 4;
  SEND_PENDING 5;
  CONFIRM 6;
  CONFIRM_SEND 7;
  CONFIRM_DEALLOCATE 8;
  DEFER_RECEIVE 9;
  DEFER_DEALLOCATE 10;
  DEFER_DEALLOCATE 11;
  SYNC_POINT_SEND 12;
  SYNC_POINT_DEALLOCATE 13;
end-enum;

dcl-enum conversation_type qualified;
  BASIC 0;
  MAPPED 1;
end-enum;

dcl-enum data_received qualified;
  NO_DATA 0;
  DATA 1;
  COMPLETE_DATA 2;
  INCOMPLETE_DATA 3;
end-enum;

dcl-enum deallocate_type qualified;
  SYNC_LEVEL 0;
  FLUSH 1;
  CONFIRM 2;
  ABEND 3;
end-enum;

dcl-enum error_direction qualified;
  RECEIVE 0;
  SEND 1;
end-enum;

dcl-enum fill qualified;
  LL 0;
  BUFFER 1;
end-enum;

dcl-enum prepare_to_receive_type qualified;
  SYNC_LEVEL 0;
  FLUSH 1;
  CONFIRM 2;
end-enum;

dcl-enum receive_type qualified;
  RECEIVE_AND_WAIT 0;
  IMMEDIATE 1;
end-enum;

dcl-enum request_to_send_received qualified;
  NOT_RECEIVED 0;
  RECEIVED 1;
end-enum;

dcl-enum return_code qualified;
  OK 0;
  ALLOCATE_FAILURE_NO_RETRY 1;
  ALLOCATE_FAILURE_RETRY 2;
  CONVERSATION_TYPE_MISMATCH 3;
  PIP_NOT_SPECIFIED_CORRECTLY 5;
  CM_SECURITY_NOT_VALID 6;
  CM_SYNC_LVL_NOT_SUPPORTED_LU 7;
  CM_SYNC_LVL_NOT_SUPPORTED_PGM 8;
  CM_TPN_NOT_RECOGNIZED 9;
  CM_TP_NOT_AVAILABLE_NO_RETRY 10;
  CM_TP_NOT_AVAILABLE_RETRY 11;
  CM_DEALLOCATED_ABEND 17;
  CM_DEALLOCATED_NORMAL 18;
  CM_PARAMETER_ERROR 19;
  CM_PRODUCT_SPECIFIC_ERROR 20;
  CM_PROGRAM_ERROR_NO_TRUNC 21;
  CM_PROGRAM_ERROR_PURGING 22;
  CM_PROGRAM_ERROR_TRUNC 23;
  CM_PROGRAM_PARAMETER_CHECK 24;
  CM_PROGRAM_STATE_CHECK 25;
  CM_RESOURCE_FAILURE_NO_RETRY 26;
  CM_RESOURCE_FAILURE_RETRY 27;
  CM_UNSUCCESSFUL 28;
  CM_DEALLOCATED_ABEND_SVC 30;
  CM_DEALLOCATED_ABEND_TIMER 31;
  CM_SVC_ERROR_NO_TRUNC 32;
  CM_SVC_ERROR_PURGING 33;
  CM_SVC_ERROR_TRUNC 34;
  CM_PARM_VALUE_NOT_SUPPORTED 49;
  CM_TAKE_BACKOUT 100;
  CM_DEALLOCATED_ABEND_BO 130;
  CM_DEALLOCATED_ABEND_SVC_BO 131;
  CM_DEALLOCATED_ABEND_TIMER_BO 132;
  CM_RESOURCE_FAIL_NO_RETRY_BO 133;
  CM_RESOURCE_FAILURE_RETRY_BO 134;
end-enum;

dcl-enum return_control qualified;
  WHEN_SESSION_ALLOCATED 0;
  IMMEDIATE 1;
end-enum;

dcl-enum send_type qualified;
  BUFFER_DATA 0;
  SEND_AND_FLUSH 1;
  SEND_AND_CONFIRM 2;
  SEND_AND_PREP_TO_RECEIVE 3;
  SEND_AND_DEALLOCATE 4;
end-enum;

dcl-enum status_received qualified;
  NO_STATUS_RECEIVED 0;
  SEND_RECEIVED 1;
  CONFIRM_RECEIVED 2;
  CONFIRM_SEND_RECEIVED 3;
  CONFIRM_DEALLOC_RECEIVED 4;
  TAKE_COMMIT 5;
  TAKE_COMMIT_SEND 6;
  TAKE_COMMIT_DEALLOCATE 7;
end-enum;

dcl-enum sync_level qualified;
  dcl-c NONE 0;
  dcl-c CONFIRM 1;
  dcl-c COMMIT 2;
end-enum;
