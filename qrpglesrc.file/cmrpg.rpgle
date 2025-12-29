**free
//----------------------------------------------------------
// Product(s):
//  5763-SS1
//
// Copyright:
//  IBM Corp.  1994,1994 - All rights reserved.
//  US Government Users Restricted Rights - Use, duplication or disclosure restricted by GSA ADP 
//  Schedule Contract with IBM Corp.
//  Licensed Materials-Property of IBM
// 
// Header File Name: H/CMRPG
// Descriptive Name: CPI-C Header.
// 
// Description: 
//  This is the CLE header for the CPI-C API.
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


/if defined(cmrpg)
  /eof
/else
  /define cmrpg
/endif


//--------------------------------------
// Data structures
//--------------------------------------


// ILE/RPG INCLUDE FOR SAA COMMUNICATIONS SUPPORT
dcl-ds CommunicationConstants end-ds;


//--------------------------------------
// Special values
//--------------------------------------


// Conversation Security
dcl-c SECURITY_NONE const(0);
dcl-c SECURITY_SAME const(1);
dcl-c SECURITY_PROGRAM const(2);
dcl-c SECURITY_PROGRAM_STRONG const(5);

// Conversation State
dcl-c STATE_INITIALIZE const(2);
dcl-c STATE_SEND const(3);
dcl-c STATE_RECEIVE const(4);
dcl-c STATE_SEND_PENDING const(5);
dcl-c STATE_CONFIRM const(6);
dcl-c STATE_CONFIRM_SEND const(7);
dcl-c STATE_CONFIRM_DEALLOCATE const(8);
dcl-c STATE_DEFER_RECEIVE const(9);
dcl-c STATE_DEFER_DEALLOCATE const(10);
dcl-c STATE_SYNC_POINT const(11);
dcl-c STATE_SYNC_POINT_SEND const(12);
dcl-c STATE_SYNC_POINT_DEALLOCATE const(13);

// Conversation Type
dcl-c CONVERSATION_BASIC const(0);
dcl-c CONVERSATION_MAPPED const(1);

// Data Received
dcl-c DATA_NONE_RECEIVED const(0);
dcl-c DATA_RECEIVED const(1);
dcl-c DATA_RECEIVED_COMPLETE const(2);
dcl-c DATA_RECEIVED_INCOMPLETE const(3);

// Deallocate Type
dcl-c DEALLOCATE_SYNC_LEVEL const(0);
dcl-c DEALLOCATE_FLUSH const(1);
dcl-c DEALLOCATE_CONFIRM const(2);
dcl-c DEALLOCATE_ABNORMAL_END const(3);

// Error Direction
dcl-c ERROR_RECEIVE const(0);
dcl-c ERROR_SEND const(1);

// Fill
dcl-c FILL_LL const(0);
dcl-c FILL_BUFFER const(1);

// Prepare To Receive Type
dcl-c PREPARE_TO_RECEIVE_SYNC_LEVEL const(0);
dcl-c PREPARE_TO_RECEIVE_FLUSH const(1);
dcl-c PREPARE_TO_RECEIVE_CONFIRM const(2);

// Receive Type
dcl-c RECEIVE_AND_WAIT const(0);
dcl-c RECEIVE_IMMEDIATE const(1);

// Request To Send Received
dcl-c REQUEST_TO_SEND_NOT_RECEIVED const(0);
dcl-c REQUEST_TO_SEND_RECEIVED const(1);

// Return Code
dcl-c RETURN_ CODE_OK const(0);
dcl-c RETURN_CODE_ALLOCATE_FAILURE_NO_RETRY const(1);
dcl-c RETURN_CODE_ALLOCATE_FAILURE_RETRY const(2);
dcl-c RETURN_CODE_TYPE_MISMATCH const(3);
dcl-c RETURN_CODE_PIP_NOT_SPECIFIED_CORRECTLY const(5);
dcl-c RETURN_CODE_SECURITY_NOT_VALID const(6);
dcl-c RETURN_CODE_SYNC_LVL_NOT_SUPPORTED_LU const(7);
dcl-c RETURN_CODE_SYNC_LVL_NOT_SUPPORTED_PGM const(8);
dcl-c RETURN_CODE_TPN_NOT_RECOGNIZED const(9);
dcl-c RETURN_CODE_TP_NOT_AVAILABLE_NO_RETRY const(10);
dcl-c RETURN_CODE_TP_NOT_AVAILABLE_RETRY const(11);
dcl-c RETURN_CODE_DEALLOCATED_ABEND const(17);
dcl-c RETURN_CODE_DEALLOCATED_NORMAL const(18);
dcl-c RETURN_CODE_PARAMETER_ERROR const(19);
dcl-c RETURN_CODE_PRODUCT_SPECIFIC_ERROR const(20);
dcl-c RETURN_CODE_PROGRAM_ERROR_NO_TRUNC const(21);
dcl-c RETURN_CODE_PROGRAM_ERROR_PURGING const(22);
dcl-c RETURN_CODE_PROGRAM_ERROR_TRUNC const(23);
dcl-c RETURN_CODE_PROGRAM_PARAMETER_CHECK const(24);
dcl-c RETURN_CODE_PROGRAM_STATE_CHECK const(25);
dcl-c RETURN_CODE_RESOURCE_FAILURE_NO_RETRY const(26);
dcl-c RETURN_CODE_RESOURCE_FAILURE_RETRY const(27);
dcl-c RETURN_CODE_UNSUCCESSFUL const(28);
dcl-c RETURN_CODE_DEALLOCATED_ABEND_SVC const(30);
dcl-c RETURN_CODE_DEALLOCATED_ABEND_TIMER const(31);
dcl-c RETURN_CODE_SVC_ERROR_NO_TRUNC const(32);
dcl-c RETURN_CODE_SVC_ERROR_PURGING const(33);
dcl-c RETURN_CODE_SVC_ERROR_TRUNC const(34);
dcl-c RETURN_CODE_PARM_VALUE_NOT_SUPPORTED const(49);
dcl-c RETURN_CODE_TAKE_BACKOUT const(100);
dcl-c RETURN_CODE_DEALLOCATED_ABEND const(130);
dcl-c RETURN_CODE_DEALLOCATED_ABEND_SVC const(131);
dcl-c RETURN_CODE_DEALLOCATED_ABEND_TIMER const(132);
dcl-c RETURN_CODE_RESOURCE_FAIL_NO_RETRY const(133);
dcl-c RETURN_CODE_RESOURCE_FAILURE_RETRY const(134);

// Return Control
dcl-c RETURN_CONTROL_WHEN_SESSION_ALLOCATED const(0);
dcl-c RETURN_CONTROL_IMMEDIATE const(1);

// Send Type
dcl-c SEND_BUFFER_DATA const(0);
dcl-c SEND_AND_FLUSH const(1);
dcl-c SEND_AND_CONFIRM const(2);
dcl-c SEND_AND_PREP_TO_RECEIVE const(3);
dcl-c SEND_AND_DEALLOCATE const(4);

// Status Received
dcl-c RECEIVED_NO_STATUS const(0);
dcl-c RECEIVED_SEND const(1);
dcl-c RECEIVED_CONFIRM const(2);
dcl-c RECEIVED_CONFIRM_SEND const(3);
dcl-c RECEIVED_CONFIRM_DEALLOC const(4);
dcl-c RECEIVED_TAKE_COMMIT const(5);
dcl-c RECEIVED_TAKE_COMMIT_SEND const(6);
dcl-c RECEIVED_TAKE_COMMIT_DEALLOCATE const(7);

// Sync Level
dcl-c SYNC_LEVEL_NONE const(0);
dcl-c SYNC_LEVEL_CONFIRM const(1);
dcl-c SYNC_LEVEL_COMMIT const(2);