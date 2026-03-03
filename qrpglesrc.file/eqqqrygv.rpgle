**free
//----------------------------------------------------------
// Product(s):
//  5722-SS1
//
// Copyright:
//  IBM Corp.  2006, 2006 - All rights reserved.
//  US Government Users Restricted Rights - Use, duplication or disclosure restricted by GSA ADP 
//  Schedule Contract with IBM Corp.
//  Licensed Materials-Property of IBM
//
// Header File Name: EQQQRYGV
// Descriptive Name: Query Governor Exit Program
// 
// Description:
//  The Query Governor Exit Program provides the estimated runtime, the user specified runtime 
//  limit, the estimated temporary storage usage, and the user specified temporary storage limit
//  for a query.  If applicable, it also provides the SQL statement text.
// 
// Header Files Included: None.
// 
// Macros List: None.
// 
// Structure List:
//  QQQ_QRYGV_QRYG0100_t
// 
// Function Prototype List: None.
// 
// Change Activity:
//  P9B21467  2006-02-20  V5R4  New Include
//----------------------------------------------------------


//--------------------------------------
// Include guard
//--------------------------------------


/if defined(eqqqrygv)
  /eof 
/else
  /define eqqqrygv
/endif


// Type Definitions for the Query Governor Exit Point information.
dcl-ds QQQ_QRYGV_QRYG0100_t qualified;
  headerSize                          int(10);
  queryGovernor                       char(8);
  queryJobName                        char(10);
  queryJobIssuingUserProfile          char(10);
  queryJobNumber                      char(6);
  queryInitiatingUserProfile          char(10);
  estimatedRuntime                    int(10);  // In seconds
  userSpecifiedRuntimeLimit           int(10);  // In seconds
  estimatedTemporaryStorageUsage      int(10);  // In megabytes
  userSpecifiedTemporaryStorageLimit  int(10);  // In megabytes
  offsetToSQLStatement                int(10);  // 0, if not SQL query
  SQLStatementLength                  int(10);  // 0, if not SQL query
  // SQLStatement                     char(*);  // Varying length
end-ds QQQ_QRYGV_QRYG0100_t;