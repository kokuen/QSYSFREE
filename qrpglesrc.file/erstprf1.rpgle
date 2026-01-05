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
// Header File Name: ERSTPRF1
// Descriptive Name: Restore User Profile Exit Program
// 
// Description:
//  The Restore User Profile exit program provides the notification of profiles being restored.
// 
// Header Files Included: None.
// 
// Macros List: None.
// 
// Structure List:
//  Qsy_Restore_Profile_Fmt1_t
// 
// Function Prototype List: None.
// 
// Change Activity:
//  D94085, V3R7, 1996-04-17: New Include
//----------------------------------------------------------


//--------------------------------------
// Include guard
//--------------------------------------


/if defined(erstprf1)
  /eof 
/else
  /define erstprf1
/endif


//--------------------------------------
// Data structures
//--------------------------------------


// Type Definition for the Restore Exit Program information
dcl-ds Qsy_Restore_Profile_Fmt1_t qualified;
  exitProgramName   char(20);
  exitProgramFormat char(8);
  userProfile       char(10);
end-ds Qsy_Restore_Profile_Fmt1_t;