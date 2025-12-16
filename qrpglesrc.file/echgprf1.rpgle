**free
//----------------------------------------------------------
// All original rights and credits goes to IBM.
//
// Header File Name: ECHGPRF1
// Descriptive Name: Change User Profile Exit Program
// 
// Description: 
//  The Change User Profile exit program provides the notification of profiles being changed.
// 
// Header Files Included: None.
// Macros List: None.
// Structure List:
//  Qsy_Change_Profile_Fmt1_t
// Function Prototype List: None.
//----------------------------------------------------------


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
  exitProgramName char(20);
  exitProgramFormat char(8);
  userProfile char(10);
end-ds;