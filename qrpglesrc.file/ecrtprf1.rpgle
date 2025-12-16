**free
//----------------------------------------------------------
// All original rights and credits goes to IBM.
//
// Header File Name: ECRTPRF1
// Descriptive Name: Create User Profile Exit Program
// 
// Description:  
//  The Create User Profile exit program provides the notification of profiles being created.
// 
// Header Files Included: None.
// Macros List: None.
// Structure List: 
//  Qsy_Create_Profile_Fmt1_t
// Function Prototype List: None.
//----------------------------------------------------------


/if defined(ecrtprf1)
  /eof
/else
  /define ecrtprf1
/endif


//--------------------------------------
// Data structures
//--------------------------------------


// Type Definition for the Create profile exit point information
dcl-ds Qsy_Create_Profile_Fmt1_t qualified;
  exitProgram char(20);
  exitProgramFormat char(8);
  userProfile char(10);
end-ds;