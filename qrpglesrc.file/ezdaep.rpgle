**free
//----------------------------------------------------------
// Product(s):
//  5722-SS1
//
// Copyright:
//  Copyright IBM Corp. 1994, 2007 - All rights reserved.
//  US Government Users Restricted Rights - Use, duplication or disclosure restricted by GSA ADP 
//  Schedule Contract with IBM Corp.
//  Licensed Materials-Property of IBM
//
// Header File Name: H/EZDAEP
// Descriptive Name: Database Server Exit Program Structures
// 
// Description:
//  This include defines the parameter structures for the four exit points defined for the
//  database server.
//  1) QIBM_QZDA_INIT format ZDAI0100 - Used when the database server is started
//  2) QIBM_QZDA_NDB1 format ZDAD0100 - Used for all native database requests, except the Add 
//     Library List request. 
//     QIBM_QZDA_NDB1 format ZDAD0200 - Used for the native database Add Library List request
//  3) QIBM_QZDA_ROI1 format ZDAR0100 - Used for all retrieve object information requests, except 
//     the Foreign and Primary Key requests. QIBM_QZDA_ROI1 format ZDAR0200 - Used for the retrieve
//     object information Foreign and Primary Key requests
//  4) QIBM_QZDA_SQL1 format ZDAQ0100 - Used for SQL requests of 512 bytes or less.
//     QIBM_QZDA_SQL1 format ZDAQ0200 - Used for SQL requests of more than 512 bytes.
// 
// Header Files Included: None.
// 
// Macros List: None.
// 
// Structure List:
//  Qzda_Init_Format_t
//  Qzda_NDB_Format1_t
//  Qzda_NDB_Format2_t
//  Qzda_ROI_Format1_t
//  Qzda_ROI_Format2_t
//  Qzda_SQL_Format_t
//  Qzda_SQL_Format2_t
// 
// Function Prototype List: None.
// 
// Change Activity:
//  P3978167	1995-02-10	V3R6	New Include
//  P3613759	1996-03-14	V3R7	Add new SQL format
//  P9912109	2000-01-05	V4R5	Varying length statement text and varying number of libraries
//  P9912659	2000-01-05	V4R5	reserved area: 127->129
//  P9934931	2000-11-14	V5R1	Teraspace Stage 2
//  D9388600	2007-03-22	V5R5	Add new interface fields for QIBM_QZDA_INIT
//  D9358617	2007-05-22	V5R5	Add fields to SQL1 and SQL2 exit points
//----------------------------------------------------------


//--------------------------------------
// Include guard
//--------------------------------------


/if defined(ezdaep)
  /eof 
/else
  /define ezdaep
/endif


//--------------------------------------
// Data structures
//--------------------------------------


// Typedef for the database init exit point format
dcl-ds Qzda_Init_Format_t qualified;
  userProfileName     char(10);
  serverIdentifier    char(10);
  userExitFormatName  char(8);
  requestedFunctionId int(10);
  interfaceType       char(63);
  interfaceName       char(127);
  interfaceLevel      char(63);
end-ds Qzda_Init_Format_t;

// Typedef for the native database exit point format #1
dcl-ds Qzda_NDB_Format1_t qualified;
  userProfileName     char(10);
  serverIdentifier    char(10);
  userExitFormatName  char(8);
  requestedFunctionId int(10);
  fileName            char(128);
  libraryName         char(10);
  memberName          char(10);
  authority           char(10);
  baseFileName        char(128);
  baseLibraryName     char(10);
  overrideFileName    char(10);
  overrideLibraryName char(10);
  overrideMemberName  char(10);
end-ds Qzda_NDB_Format1_t;

// Typedef for the native database exit point format #2
dcl-ds Qzda_NDB_Format2_t qualified;
  userProfileName         char(10);
  serverIdentifier        char(10);
  userExitFormatName      char(8);
  requestedFunctionId     int(10);
  numberOfLibrariesInList int(10);
  // Varying number of library names
end-ds Qzda_NDB_Format2_t;

// Typedef for retrieve object information exit point format #1
dcl-ds Qzda_ROI_Format1_t qualified;
  userProfileName         char(10);
  serverIdentifier        char(10);
  userExitFormatName      char(8);
  requestedFunctionId     int(10);
  libraryName             char(20);
  relationalDatabaseName  char(36);
  packageName             char(20);
  fileName                char(256);
  memberName              char(20);
  formatName              char(20);
end-ds Qzda_ROI_Format1_t;

// Typedef for retrieve object information exit point format #2
dcl-ds Qzda_ROI_Format2_t qualified;
  userProfileName       char(10);
  serverIdentifier      char(10);
  userExitFormatName    char(8);
  requestedFunctionId   int(10);
  primaryKeyLibraryName char(10);
  primaryKeyTableName   char(128);
  foreignKeyLibraryName char(10);
  foreignKeyTableName   char(128);
end-ds Qzda_ROI_Format2_t;

// Typedef for the SQL exit point format
dcl-ds Qzda_SQL_Format_t qualified;
  userProfileName       char(10);
  serverIdentifier      char(10);
  userExitFormatName    char(8);
  requestedFunctionId   int(10);
  statementName         char(18);
  cursorName            char(18);
  prepareOption         char(2);
  openAttributes        char(2);
  packageName           char(10);
  packageLibraryName    char(10);
  DRDAConnectIndicator  int(3);
  commitIndicator       char(1);
  SQLStatementText      char(512);
  extendedCursorName    char(258);
end-ds Qzda_SQL_Format_t;

// Typedef for the SQL exit point format #2
dcl-ds Qzda_SQL_Format2_t qualified;
  userProfileName             char(10);
  serverIdentifier            char(10);
  userExitFormatName          char(8);
  requestedFunctionId         int(10);
  statementName               char(18);
  cursorName                  char(18);
  prepareOption               char(2);
  openAttributes              char(2);
  packageName                 char(10);
  packageLibraryName          char(10);
  DRDAConnectIndicator        int(3);
  commitIndicator             char(1);
  defaultSQLCollection        char(10);
  *n                          char(3)   inz(*allx('00'));  // Reserved by the system
  offsetToExtendedCursorName  int(10);
  lengthOfExtendedCursorName  int(10);
  *n                          char(118) inz(*allx('00'));  // Reserved by the system
  lengthOfSQLStatementText    int(10);
  // SQLStatementText         char(*);
  // extendedCursorName       char(*);
end-ds Qzda_SQL_Format2_t;
