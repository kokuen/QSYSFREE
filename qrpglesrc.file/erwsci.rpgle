**free
//----------------------------------------------------------
// Product(s):
//  5763-SS1
//
// Copyright:
//  IBM Corp. 1994,1994 - All rights reserved.
//  US Government Users Restricted Rights - Use, duplication or disclosure restricted by GSA ADP 
//  Schedule Contract with IBM Corp.
//  Licensed Materials-Property of IBM
//
// Header File Name: H/ERWSCI
// Descriptive Name: SQL Client Integration Exit Program  
// 
// Description:
//  This include contains the input and output format definitions for SQL Client Integration.
// 
// Header Files Included: None.
// 
// Macros List: None.
// 
// Structure List:
//  Qrw_Arcn0100_t  Connect
//  Qrw_Ardi0100_t  Disconnect
//  Qrw_Arbb0100_t  Begin Bind
//  Qrw_Arbs0100_t  Bind Statement
//  Qrw_Areb0100_t  End Bind
//  Qrw_Arps0100_t  Prepare Statement (use for ARPD0010 also)
//  Qrw_Arxb0100_t  Execute Bound Statement (for ARXD0100 also)
//  Qrw_Arxp0100_t  Execute Prepared Statement
//  Qrw_Arxi0100_t  Execute Immediate
//  Qrw_Aroc0100_t  Open Cursor
//  Qrw_Arfc0100_t  Fetch Cursor
//  Qrw_Arcc0100_t  Close Cursor
//  Qrw_Ards0100_t  Describe Statement
//  Qrw_Ardt0100_t  Describe Table (Object)
// 
//  Qrw_Connect_Ofmt_t  Connect output format
//  Qrw_Execute_Ofmt_t  Execute output format
//  Qrw_Open_Ofmt_t     Open Cursor output format
//  Qrw_Fetch_Ofmt_t    Fetch Cursor output format
// 
// Function Prototype List: None.
// 
// Change Activity:
//  P3961391  1994-07-25  V3R1  New Include
//  P3981961  1995-02-14  V3R6  Fix prolog list
//----------------------------------------------------------


//--------------------------------------
// Include guard
//--------------------------------------


/if defined(erwsci)
  /eof 
/else
  /define erwsci
/endif


//--------------------------------------
// Input formats
//--------------------------------------


// Input format for CONNECT
dcl-ds Qrw_Arcn0100_t qualified;
  outputFormatBufferSize  int(10);
  activationGroupNumber   int(10);
  RDBName                 char(18);
  deviceName              char(10);
  modeName                char(8);
  remoteLocationName      char(8);
  localLocationName       char(8);
  remoteNetworkID         char(8);
  TPNName                 char(8);
  userID                  char(10);
  password                char(10);
  productID               char(8);
end-ds Qrw_Arcn0100_t;

// Input format for DISCONNECT
dcl-ds Qrw_Ardi0100_t qualified;
  outputFormatBufferSize  int(10);
  activationGroupNumber   int(10);
  RDBName                 char(18);
  *n                      char(2)   inz(x'00');
  disconnectType          int(10);
end-ds Qrw_Ardi0100_t;

// Input format for Begin Package Bind
dcl-ds Qrw_Arbb0100_t qualified;
  outputFormatBufferSize  int(10);
  activationGroupNumber   int(10);
  RDBName                 char(18);
  packageCollection       char(18);
  packageName             char(8);
  packageConsistencyToken char(2);
  *n                      char(2)   inz(x'00');
  textCCSID               int(10);
  existenceRequired       ind;
  errorsAllowed           ind;
  replaceAllowed          ind;
  stringDelimiter         char(1);
  decimalDelimiter        char(1);
  blockingType            char(1);
  dateFormat              char(10);
  timeFormat              char(10);
  isolationLevel          char(10);
  defaultCollection       char(18);
  text                    char(50);
end-ds Qrw_Arbb0100_t;

// Input format for End Package Bind
dcl-ds Qrw_Areb0100_t qualified;
  outputFormatBufferSize  int(10);
  activationGroupNumber   int(10);
  RDBName                 char(18);
  packageCollection       char(18);
  packageName             char(8);
  packageConsistencyToken char(2);
  *n                      char(2)   inz(x'00');
  maxSectionNumber        int(10);
end-ds Qrw_Areb0100_t;

// Input format for Bind Statement
dcl-ds Qrw_Arbs0100_t qualified;
  outputFormatBufferSize  int(10);
  activationGroupNumber   int(10);
  RDBName                 char(18);
  packageCollection       char(18);
  packageName             char(8);
  packageConsistencyToken char(2);
  *n                      char(2)   inz(x'00');
  sectionNumber           int(10);
  statementCCSID          int(10);
  OffsetToSQLDA           int(10);
  SQLDALength             int(10);
  OffsetToStatement       int(10);
  statementLength         int(10);
end-ds Qrw_Arbs0100_t;

// Input format for Prepare Statement
dcl-ds Qrw_Arps0100_t qualified;
  outputFormatBufferSize  int(10);
  activationGroupNumber   int(10);
  RDBName                 char(18);
  packageCollection       char(18);
  packageName             char(8);
  packageConsistencyToken char(2);
  *n                      char(2)   inz(x'00');
  sectionNumber           int(10);
  statementCCSID          int(10);
  stringDelimiter         char(1);
  decimalDelimiter        char(1);
  dateFormat              char(10);
  timeFormat              char(10);
  isolationLevel          char(10);
  OffsetToStatement       int(10);
  statementLength         int(10);
  statementName           char(18);
end-ds;

// Input format for Execute Bound Statement
dcl-ds Qrw_Arxb0100_t qualified;
  outputFormatBufferSize    int(10);
  activationGroupNumber     int(10);
  RDBName                   char(18);
  packageCollection         char(18);
  packageName               char(8);
  packageConsistencyToken   char(2);
  *n                        char(2)   inz(x'00');
  sectionNumber             int(10);
  statementCCSID            int(10);
  stringDelimiter           char(1);
  decimalDelimiter          char(1);
  dateFormat                char(10);
  timeFormat                char(10);
  isolationLevel            char(10);
  defaultCollection         char(18);
  *n                        char(2)   inz(x'00');
  OffsetToSQLDA             int(10);
  SQLDALength               int(10);
  OffsetToStatement         int(10);
  statementLength           int(10);
  offsetToProcedureDeclare  int(10);
  procedureDeclareLength    int(10);
  offsetToProcedureName     int(10);
  procedureNameLength       int(10);
end-ds Qrw_Arxb0100_t;

// Input format for Execute Prepared Statement
dcl-ds Qrw_Arxp0100_t qualified;
  outputFormatBufferSize  int(10);
  activationGroupNumber   int(10);
  RDBName                 char(18);
  packageCollection       char(18);
  packageName             char(8);
  packageConsistencyToken char(2);
  *n                      char(2)   inz(x'00');
  sectionNumber           int(10);
  statementNameCCSID      int(10);
  stringDelimiter         char(1);
  decimalDelimiter        char(1);
  dateFormat              char(10);
  timeFormat              char(10);
  isolationLevel          char(10);
  defaultCollection       char(18);
  *n                      char(2)   inz(x'00');
  OffsetToSQLDA           int(10);
  SQLDALength             int(10);
  offsetToProcedureName   int(10);
  procedureNameLength     int(10);
  statementName           char(18);
end-ds Qrw_Arxp0100_t;

// Input format for Execute Immediate Statement
dcl-ds Qrw_Arxi0100_t qualified;
  outputFormatBufferSize  int(10);
  activationGroupNumber   int(10);
  RDBName                 char(18);
  packageCollection       char(18);
  packageName             char(8);
  packageConsistencyToken char(2);
  *n                      char(2)   inz(x'00');
  sectionNumber           int(10);
  statementCCSID          int(10);
  stringDelimiter         char(1);
  decimalDelimiter        char(1);
  dateFormat              char(10);
  timeFormat              char(10);
  isolationLevel          char(10);
  OffsetToStatement       int(10);
  statementLength         int(10);
end-ds Qrw_Arxi0100_t;

// Input format for Open Cursor
dcl-ds Qrw_Aroc0100_t qualified;
  outputFormatBufferSize  int(10);
  activationGroupNumber   int(10);
  RDBName                 char(18);
  packageCollection       char(18);
  packageName             char(8);
  packageConsistencyToken char(2);
  *n                      char(2)   inz(x'00');
  sectionNumber           int(10);
  cursorCCSID             int(10);
  stringDelimiter         char(1);
  decimalDelimiter        char(1);
  dateFormat              char(10);
  timeFormat              char(10);
  isolationLevel          char(10);
  defaultCollection       char(18);
  Blocking Allowed        ind;
  *n                      char(1)   inz(x'00');
  OffsetToSQLDA           int(10);
  SQLDALength             int(10);
  OffsetToCursorDeclare   int(10);
  CursorDeclareLength     int(10);
end-ds Qrw_Aroc0100_t;

// Input format for Fetch
dcl-ds Qrw_Arfc0100_t qualified;
  outputFormatBufferSize  int(10);
  activationGroupNumber   int(10);
  RDBName                 char(18);
  packageCollection       char(18);
  packageName             char(8);
  packageConsistencyToken char(2);
  *n                      char(2)   inz(x'00');
  sectionNumber           int(10);
  cursorCCSID             int(10);
  stringDelimiter         char(1);
  decimalDelimiter        char(1);
  dateFormat              char(10);
  timeFormat              char(10);
  isolationLevel          char(10);
  cursorName              char(18);
end-ds Qrw_Arfc0100_t;

// Input format for Close Cursor
dcl-ds Qrw_Arcc0100_t qualified;
  outputFormatBufferSize  int(10);
  activationGroupNumber   int(10);
  RDBName                 char(18);
  packageCollection       char(18);
  packageName             char(8);
  packageConsistencyToken char(2);
  *n                      char(2)   inz(x'00');
  sectionNumber           int(10);
  cursorCCSID             int(10);
  cursorName              char(18);
end-ds Qrw_Arcc0100_t;

// Input format for Describe Statement
dcl-ds Qrw_Ards0100_t qualified;
  outputFormatBufferSize  int(10);
  activationGroupNumber   int(10);
  RDBName                 char(18);
  packageCollection       char(18);
  packageName             char(8);
  packageConsistencyToken char(2);
  *n                      char(2)   inz(x'00');
  sectionNumber           int(10);
  statementCCSID          int(10);
  statementName           char(18);
end-ds Qrw_Ards0100_t;

// Input format for Describe Table (Object)
dcl-ds Qrw_Ardt0100_t qualified;
  outputFormatBufferSize  int(10);
  activationGroupNumber   int(10);
  RDBName                 char(18);
  *n                      char(2)   inz(x'00');
  nameCCSID               int(10);
  OffsetToObjectName      int(10);
  ObjectNameLength        int(10);
end-ds Qrw_Ardt0100_t;


//--------------------------------------
// Output formats
//--------------------------------------


// Output format for CONNECT
dcl-ds Qrw_Connect_Ofmt_t qualified;
  serverProduct           char(3);
  serverVersion           char(2);
  serverRelease           char(2);
  serverLevel             char(1);
  userID                  char(10);
  includeBoundStatements  ind;
  protectedConversation   ind;
end-ds Qrw_Connect_Ofmt_t;

// Output format for EXECUTE
dcl-ds Qrw_Execute_Ofmt_t qualified;
  updatePerformed   ind;
  *n                char(3)   inz(x'00');
  OffsetToSQLDA     int(10);
  OffsetToResultSet int(10);
end-ds Qrw_Execute_Ofmt_t;

// Output format for OPEN
dcl-ds Qrw_Open_Ofmt_t qualified;
  blockData     ind;
  cursorHold    ind;
  *n            char(2)   inz(x'00'); 
  OffsetToSQLDA int(10);
end-ds Qrw_Open_Ofmt_t;

// Output format for FETCH
dcl-ds Qrw_Fetch_Ofmt_t qualified;
  OffsetToResultSet int(10);
  cursorClosed      ind;
end-ds Qrw_Fetch_Ofmt_t;