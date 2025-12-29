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
// Header File Name: H/EOKDRSH1
// Descriptive Name: Directory Search Exit Program
// 
// Description:
//  The Directory Search exit program allows the administrator to define a customized search of
//  directory data.
// 
// Header Files Included: None.
// 
// Macros List: None.
// 
// Structure List:
//  Qok_Search_ARRAY_t
// 
// Function Prototype List:
//  EOKDRSH1
// 
// Change Activity:
//  D2862000, V3R1, 1994-04-18: New Include
//----------------------------------------------------------


//--------------------------------------
// Include guard
//--------------------------------------


/if defined(eokdrsh1)
  /eof 
/else
  /define eokdrsh1
/endif


//--------------------------------------
// Data structures
//--------------------------------------


// Type Definition for the Search function Array
// NOTE: The following type definition only defines the fixed portion of the format. Any varying 
//  length field will have to be defined by the user.
dcl-ds Qok_Search_ARRAY_t qualified;
  usedSelectionOption         char(1);
  userID                      char(8);
  userAddress                 char(8);
  usersFullNameOrDescription  char(50);
end-ds Qok_Search_ARRAY_t;

// Varying length
// dcl-ds OKSA qualified;
//   EOKSOU00 char(1);
//   EOKUID00 char(8);
//   EOKUA00 char(8);
//   EOKUFNOD00 char(50);
// end-ds OKSA;