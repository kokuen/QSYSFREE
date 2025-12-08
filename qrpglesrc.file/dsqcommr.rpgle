**free
//----------------------------------------------------------
// All original rights and credits goes to IBM.
//
// Header File Name: DSQCOMMR
// Descriptive Name: CPI-C Header.
//
// Description: This is the CLE header for the CPI-C API.
// 
// Header Files Included: none. 
// Macros List: none.
// Structure List:
// Function Prototype List:
//----------------------------------------------------------


/if defined(dsqcommr)
  /eof
/else
  /define dsqcommr
/endif


//--------------------------------------
// Data structures
//--------------------------------------


dcl-ds QueryInterface qualified;
  queryExecutionStatus int(10);
  saaQueryIdentifier int(10);
  *n char(44) inz(x'00'); // Reserved by the system
  completionMessageId char(8);
  queryMessageId char(8);
  failAtStartParameterError char(8);
  commandIsCanceled char(1);
  *n char(17) inz(x'00'); // Reserved by the system
  queryDerivedFromQRYDFN char(1);
  formDerivedFromQRYDFN char(1);
  environmentDeletion char(4);
  *n char(256) inz(x'00'); // Reserved by the system
  *n char(256) inz(x'00'); // Reserved by the system
  *n char(256) inz(x'00'); // Reserved by the system
  *n char(156) inz(x'00'); // Reserved by the system
end-ds;


//--------------------------------------
// Special values
//--------------------------------------


dcl-enum query_execution_status qualified;
  SUCCESS 0;
  WARNING 4;
  FAILURE 8;
  SEVERE 16;
end-enum;

//--------------------------------------

dcl-c INTERFACE_PROGRAM 'QQXMAIN';
dcl-c CHAR 'CHAR';
dcl-c FINT 'FINT';