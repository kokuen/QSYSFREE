**free
//----------------------------------------------------------
// Product(s):
//  5722-SS1
//
// Copyright:
//  Copyright IBM Corp. 2000 - All rights reserved.
//  US Government Users Restricted Rights - Use, duplication or disclosure restricted by GSA ADP 
//  Schedule Contract with IBM Corp.
//  Licensed Materials-Property of IBM
//
// Header File Name: EVLDPWD1
// Descriptive Name: Validate Password Exit Program
// 
// Description:
//  The Validate Password exit program provides notification of a password being changed by the
//  CHGPWD command or QSYCHGPW API.
// 
// Header Files Included: None.
// 
// Macros List: None.
// 
// Structure List:
//  Qsy_Vld_Password_Info_t
// 
// Function Prototype List: None.
// 
// Change Activity:
//  D98311	2000-09-29	V5R1	New Include
//----------------------------------------------------------


//--------------------------------------
// Include guard
//--------------------------------------


/if defined(evldpwd1)
  /eof 
/else
  /define evldpwd1
/endif


//--------------------------------------
// Data structures
//--------------------------------------


// Type Definition for the Validate Password exit point info
dcl-ds Qsy_Vld_Password_Info_t qualified;
  exitPointName       char(20);
  exitPointFormatName char(8);
  passwordLevel       int(10);
  userProfileName     char(10);
  *n                  char(2)   inz(*allx('00'));
  offsetToOldPassword int(10);
  lengthOfOldPassword int(10);
  CCSIDOfOldPassword  int(10);
  offsetToNewPassword int(10);
  lengthOfNewPassword int(10);
  CCSIDOfNewPassword  int(10);
end-ds Qsy_Vld_Password_Info_t;
