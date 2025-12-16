**free
//----------------------------------------------------------
// All original rights and credits goes to IBM.
//
// Header File Name: EDLTPRF1
// Descriptive Name: Delete User Profile Exit Program
// 
// Description: 
//  The Delete User Profile exit program provides the notification of profiles being deleted.
// 
// Header Files Included: None.
// Macros List: None.
// Structure List: 
//  Qsy_Delete_Profile_Fmt1_t (format 1)
// Function Prototype List: None.
//----------------------------------------------------------


/if defined(edltprf1)
  /eof
/else
  /define edltprf1
/endif


//--------------------------------------
// Data structures
//--------------------------------------


// Type Definition for the Post-delete exit program information
dcl-ds Qsy_Delete_Profile_Fmt1_t qualified;
  exitProgram char(20);
  exitProgramFormat char(8);
  userProfile char(10);
end-ds;