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
// Header File Name: ECHGPRF1
// Descriptive Name: Change User Profile Exit Program
// 
// Description: 
//  The Change User Profile exit program provides the notification of profiles being changed.
// 
// Header Files Included: None.
// 
// Macros List: None.
// 
// Structure List:
//  Qsy_Change_Profile_Fmt1_t
// 
// Function Prototype List: None.
// 
// Change Activity:
//  D94085  1996-04-17  V3R7  New Include
//----------------------------------------------------------


//--------------------------------------
// Include guard
//--------------------------------------


/if defined(echgprf1)
  /eof
/else
  /define echgprf1
/endif


//--------------------------------------
// Data structures
//--------------------------------------



// Type Definition for the Change profile exit point information
dcl-ds Qsy_Change_Profile_Fmt1_t qualified;
  exitProgramName   char(20);
  exitProgramFormat char(8);
  userProfile       char(10);
end-ds Qsy_Change_Profile_Fmt1_t;