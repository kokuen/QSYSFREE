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
// Header File Name: ECRTPRF1
// Descriptive Name: Create User Profile Exit Program
// 
// Description:  
//  The Create User Profile exit program provides the notification of profiles being created.
// 
// Header Files Included: None.
// 
// Macros List: None.
// 
// Structure List: 
//  Qsy_Create_Profile_Fmt1_t
// 
// Function Prototype List: None.
// 
// Change Activity:
//  D94085, V3R7, 1996-04-17: New Include
//----------------------------------------------------------


//--------------------------------------
// Include guard
//--------------------------------------


/if defined(ecrtprf1)
  /eof
/else
  /define ecrtprf1
/endif


// Type Definition for the Create profile exit point information
dcl-ds Qsy_Create_Profile_Fmt1_t qualified;
  exitProgram char(20);
  exitProgramFormat char(8);
  userProfile char(10);
end-ds;