**free
//----------------------------------------------------------
// All original rights and credits goes to IBM.
//
// Header File Name: EDBOPNDB
// Descriptive Name: Open Database Exit Program
// 
// Description: The Open Database File exit program provides the Exit Program with a list of files
//  referenced in the open and their open options.
// 
// Header Files Included: None.
// Macros List: None.
// Structure List: QDBE_Opn_DB_File_Array_Entry_t, QDBE_Open_DBOP0100_t
// Function Prototype List: None.
//----------------------------------------------------------


/if defined(edbopndb)
  /eof
/else
  /define edbopndb
/endif


//--------------------------------------
// Data structures
//--------------------------------------


dcl-ds OpenDatabaseFileArrayEntry qualified;
   fileName char(10);
   libraryName char(10);
   memberName char(10);
   *n char(2) inz(x'00'); // Reserved by the system
   fileType int(10);
   underlyingPhysical int(10);
   openInputOption char(1);
   openOutputOption char(1);
   openUpdateOption char(1);
   openDeleteOption char(1);
   // varyingLength char(*);
end-ds;

dcl-ds DBOP0100 qualified;
   headerSize int(10);
   format char(8);
   offsetToFileArray int(10);
   fileCount int(10);
   lengthFileArrayEntry int(10);
   jobName char(10);
   userName char(10);
   jobNumber char(6);
   currentUserProfile char(10);
   queryOpen char(1);
end-ds;

  // EDBFILI00 char(45) dim(1);
  // EDBDBEFN04 char(10) overlay(EDBFILI00: 1);
  // EDBDBELN02 char(10) overlay(EDBFILI00: 11);
  // EDBDBEMN02 char(10) overlay(EDBFILI00: 21);
  // EDBQDBER02 char(2) overlay(EDBFILI00: 31);
  // EDBEDBFT02 bindec(9) overlay(EDBFILI00: 33);
  // EDBDBEUP02 bindec(9) overlay(EDBFILI00: 37);
  // EDBBEOIO02 char(1) overlay(EDBFILI00: 41);
  // EDBBEOOO02 char(1) overlay(EDBFILI00: 42);
  // EDBBEOUO02 char(1) overlay(EDBFILI00: 43);
  // EDBBEODO02 char(1) overlay(EDBFILI00: 44);
  // EDBERVED02 char(1) overlay(EDBFILI00: 45);