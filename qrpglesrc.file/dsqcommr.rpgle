**free
//----------------------------------------------------------
// Title: DSQCOMMR 
// Role: IBM Query Management/400 interface.
//
// All original rights and credits goes to IBM.
//----------------------------------------------------------


/if defined(dsqcommr)
  /eof
/else
  /define dsqcommr
/endif


//--------------------------------------


dcl-ds QueryInterface qualified;
  queryExecutionStatus int(10);
  saaQueryIdentifier int(10);
  *n char(44) inz(x'00'); // Reserved by the system
  completionMessageId char(8);
  queryMessageId char(8);
  failAtStartParameterError char(8);
  commandIsCanceled ind;
  *n char(17) inz(x'00'); // Reserved by the system
  queryDerivedFromQRYDFN ind;
  formDerivedFromQRYDFN ind;
  environmentDeletion char(4);
  *n char(256) inz(x'00'); // Reserved by the system
  *n char(256) inz(x'00'); // Reserved by the system
  *n char(256) inz(x'00'); // Reserved by the system
  *n char(156) inz(x'00'); // Reserved by the system
end-ds;


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