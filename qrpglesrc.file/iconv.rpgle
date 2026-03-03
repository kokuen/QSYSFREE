**free
//----------------------------------------------------------
// Product(s): None.
//
// Copyright: None.
//
// Header File Name: iconv.h
// Descriptive Name: Codeset Conversion APIs
// 
// Description:
//  Include header file for the iconv APIs.
// 
// Header Files Included:
//  stddef.h
// 
// Macros List: None.
// 
// Structure List:
//  iconv_t
// 
// Function Prototype List:
//  iconv_open()
//  iconv()
//  iconv_close()
// 
// Change Activity:
//  D2871400	1994-02-27	V3R1	New Include
//----------------------------------------------------------


//--------------------------------------
// Include guard
//--------------------------------------


/if defined(iconv)
  /eof 
/else
  /define iconv
/endif


//--------------------------------------
// Data structures
//--------------------------------------


// Exception message ID
dcl-ds *n;
  exceptionMessageID  char(1);
end-ds *n;

// Definition of iconv_t type
dcl-ds iconv_t qualified;
  returnValue int(10); // To indicate if error occured
  cd          int(10) dim(12);
end-ds iconv_t;
