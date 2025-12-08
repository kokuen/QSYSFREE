**free
//----------------------------------------------------------
// All original rights and credits goes to IBM.
//
// Header File Name: ECHKPWD1
// Descriptive Name: Validate Password Exit Program
// 
// Description: The Check Password exit program provides notification of a password being checked
//  by CHGUSRPRF (QSYUP).
// 
// Header Files Included: None.
// Macros List: None.
// Structure List: Qsy_Chk_Password_Info_t
// Function Prototype List: None.
//----------------------------------------------------------


/if defined(echkpwd1)
  /eof
/else
  /define echkpwd1
/endif


//--------------------------------------
// Data structures
//--------------------------------------


dcl-ds CheckPasswordInfo qualified;
  exitPoint char(20);
  exitPointFormat char(8);
  passwordLevel int(10);
  userProfile char(10);
  *n char(2) inz(x'00'); // Reserved by the system
  offsetToOldPassword int(10);
  oldPasswordLength int(10);
  oldPasswordCCSID int(10);
  offsetToNewPassword int(10);
  newPasswordLength int(10);
  newPasswordCCSID int(10);
  // old Password char(*)
  // new Password char(*)
end-ds;