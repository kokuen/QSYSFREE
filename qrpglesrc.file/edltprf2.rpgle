**free
//----------------------------------------------------------
// Product(s):
//  5763-SS1
//
// Copyright:
//  IBM Corp. 1996,1996 - All rights reserved.
//  US Government Users Restricted Rights - Use, duplication or disclosure restricted by GSA ADP 
//  Schedule Contract with IBM Corp.
//  Licensed Materials-Property of IBM
//
// Header File Name: EDLTPRF2
// Descriptive Name: Delete User Profile Exit Program
// 
// Description:  
//  The Delete User Profile exit program provides the notification of profiles being deleted.
// 
// Header Files Included: None.
//
// Macros List: None.
//
// Structure List: 
//  Qsy_Delete_Profile_Fmt2_t (format 2)
// 
// Function Prototype List: None.
// 
// Change Activity:
//  D94085  1996-04-17  V3R7  New Include
//----------------------------------------------------------


//--------------------------------------
// Include guard
//--------------------------------------


/if defined(edltprf2)
  /eof
/else
  /define edltprf2
/endif


//--------------------------------------
// Data structures
//--------------------------------------


// Type Definition for the Pre-delete exit program information
dcl-ds Qsy_Delete_Profile_Fmt2_t qualified;
  exitProgram       char(20);
  exitProgramFormat char(8);
  userProfile       char(10);
end-ds Qsy_Delete_Profile_Fmt2_t;