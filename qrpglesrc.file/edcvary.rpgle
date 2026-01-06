**free
//----------------------------------------------------------
// Product(s):
//  5722-SS1
//
// Copyright:
//  IBM Corp. 2003 - All rights reserved.
//  US Government Users Restricted Rights - Use, duplication or disclosure restricted by GSA ADP 
//  Schedule Contract with IBM Corp.
//  Licensed Materials-Property of IBM
//
// Header File Name: EDCVARY
// Descriptive Name: Vary configuration Exit Program
// 
// Description: 
//  The vary configuration exit program provides the notification of objects being varied.
// 
// Header Files Included: None.
// 
// Macros List: None.
// 
// Structure List:
//  Qdc_Vary_Config_Info_100t
//  Qdc_Vary_Config_Info_200t
// 
// Function Prototype List: None.
// 
// Change Activity:
//  D99409  2002-10-01  V5R3  New Include
//----------------------------------------------------------


//--------------------------------------
// Include guard
//--------------------------------------


/if defined(edcvary)
  /eof
/else
  /define edcvary
/endif


//--------------------------------------
// Data structures
//--------------------------------------


// Type Definition for the Vary config exit point information for exit point formats PRON0100 (Pre
//   vary on) and PROF0100 (Pre vary off).
dcl-ds Qdc_Vary_Config_Info_100t qualified;
  objectName        char(10);
  objectType        char(10);
  exitProgramFormat char(8);
  forcedVary        int(10);
end-ds Qdc_Vary_Config_Info_100t;

// Type Definition for the Vary config exit point information for exit point formats PSON0200 (Post
//  vary on) and PSOF0200 (Post vary off).
dcl-ds Qdc_Vary_Config_Info_200t qualified;
  objectName        char(10);
  objectType        char(10);
  exitProgramFormat char(8);
  varyStatus        int(10);
end-ds Qdc_Vary_Config_Info_200t;