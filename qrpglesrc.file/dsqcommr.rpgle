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
  SAAQueryIdentifier int(10);
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


// Return code meanings
dcl-c QUERY_STATUS_SUCCESS const(0);
dcl-c QUERY_STATUS_WARNING const(4);
dcl-c QUERY_STATUS_FAILURE const(8);
dcl-c QUERY_STATUS_SEVERE const(16);

// Cancel indicator meanings
dcl-c CANCEL_YES const('1');
dcl-c CANCEL_NO const('0');

// QRYDFN derivation indicator meanings
dcl-c DERIVED_YES const('1');
dcl-c DERIVED_NO const('0');

// Constants for the values returned for the DSQCATTN and DSQAROWC global variables
dcl-c DSQ_YES const('1');
dcl-c DSQ_NO const('0');

// Interface program call name definition
dcl-c INTERFACE_PROGRAM 'QQXMAIN';

// Miscellaneous
dcl-c CHAR 'CHAR';
dcl-c FINT 'FINT';