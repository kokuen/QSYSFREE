**free
//----------------------------------------------------------
// Product(s):
//  5770-SS1
//
// Copyright:
//  IBM Corp.  2018, 2018 - All rights reserved.
//  US Government Users Restricted Rights - Use, duplication or disclosure restricted by GSA ADP 
//  Schedule Contract with IBM Corp.
//  Licensed Materials-Property of IBM
//
// Header File Name: EQQQRYSV
// Descriptive Name: Query Supervisor Exit Program
// 
// Description:
//  The Query Supervisor Exit Program provides information about the job that reached the threshold,
//  about the query that was running, and about the threshold that was reached.
// 
// Header Files Included: None.
// 
// Macros List: None.
// 
// Structure List:
//  QQQ_QRYSV_QRYS0100_t
// 
// Function Prototype List: None.
// 
// Change Activity:
//  FW709443, V7R3, 2021-01-28: New Include
//----------------------------------------------------------


//--------------------------------------
// Include guard
//--------------------------------------


/if defined(eqqqrysv)
  /eof 
/else
  /define eqqqrysv
/endif


// Type Definitions for the Query Supervisor Exit Point information.
dcl-ds QQQ_QRYSV_QRYS0100_t qualified;
  headerSize                        int(10);
  querySupervisor                   char(8);
  queryJobName                      char(10);
  jobInitializingUserProfile        char(10);
  queryJobNumber                    char(6);
  jobSubsystem                      char(10);
  reachedThresholdThreadUserName    char(10);
  QROHash                           char(8);
  accessPlanID                      uns(20);
  userDefinedReachedThresholdName   char(60);
  reachedThresholdType              char(30);
  valueReachedByQuery               int(20);
  queryOperationType                int(5);
  offsetToSQLStatement              int(10);  // 0, if not available
  SQLStatementLength                int(10);  // 0, if not available
  offsetToHostVariableList          int(10);  // 0, if no variables
  hostVariablesListLength           int(10);  // 0, if no variables
  offsetToACCTNGSpecialRegister     int(10);  // 0, if not defined
  ACCTNGSpecialRegisterLength       int(10);  // 0, if not defined
  offsetToAPPLNAMESpecialRegister   int(10);  // 0, if not defined
  APPLNAMESpecialRegisterLength     int(10);  // 0, if not defined
  offsetToPROGRAMIDSpecialRegister  int(10);  // 0, if not defined
  PROGRAMIDSpecialRegisterLength    int(10);  // 0, if not defined
  offsetToUSERIDSpecialRegister     int(10);  // 0, if not defined
  USERIDSpecialRegisterLength       int(10);  // 0, if not defined
  offsetToWRKSTNNAMESpecialRegister int(10);  // 0, if not defined
  WRKSTNNAMESpecialRegisterLength   int(10);  // 0, if not defined
  // SQLStatement                   char(1);  // Varying length, CCSID 1200
  // hostVariablesList              char(1);  // Varying length, CCSID 1200
  // ACCTNGSpecialRegister          char(1);  // Varying length
  // APPLNAMESpecialRegister        char(1);  // Varying length
  // PROGRAMIDSpecialRegister       char(1);  // Varying length
  // USERIDSpecialRegister          char(1);  // Varying length
  // WRKSTNNAMESpecialRegister      char(1);  // Varying length
end-ds QQQ_QRYSV_QRYS0100_t;