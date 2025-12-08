**free
//----------------------------------------------------------
// All original rights and credits goes to IBM.
//
// Header File Name: EDCVARY
// Descriptive Name: Vary configuration Exit Program
// 
// Description: The vary configuration exit program provides the notification of objects being
//  varied.
// 
// Header Files Included: None.
// Macros List: None.
// Structure List: Qdc_Vary_Config_Info_100t, Qdc_Vary_Config_Info_200t
// Function Prototype List: None.
//----------------------------------------------------------


/if defined(edcvary)
  /eof
/else
  /define edcvary
/endif


//--------------------------------------
// Data structures
//--------------------------------------


dcl-ds VaryConfigInfo_100 qualified;
  objectName char(10);
  objectType char(10);
  exitProgramFormat char(8);
  forcedVary int(10);
end-ds;

dcl-ds VaryConfigInfo_200 qualified;
  objectName char(10);
  objectType char(10);
  exitProgramFormat char(8);
  varyStatus int(10);
end-ds;