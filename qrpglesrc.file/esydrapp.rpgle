**free
//----------------------------------------------------------
// Product(s):
//  5769-SS1
//
// Copyright:
//  IBM Corp. 1999 - All rights reserved.
//  US Government Users Restricted Rights - Use, duplication or disclosure restricted by GSA ADP 
//  Schedule Contract with IBM Corp.
//  Licensed Materials-Property of IBM
//
// Header File Name: ESYDRAPP
// Descriptive Name: Deregister Application For Certificate Use Exit Program.
// 
// Description:
//  The Deregister Application For Certificate Use exit program provides the notification of an 
//  attempt to deregister an application that uses certificates.
// 
// Header Files Included: None.
// 
// Macros List: None.
// 
// Structure List:
//  Qsy_Dereg_Cert_App_Info_t
// 
// Function Prototype List: None.
// 
// Change Activity:
//  P3677328  1998-09-02  V4R4  New Include
//----------------------------------------------------------


//--------------------------------------
// Include guard
//--------------------------------------


/if defined(esydrapp)
  /eof 
/else
  /define esydrapp
/endif


//--------------------------------------
// Data structures
//--------------------------------------


// Type Definition for the Deregister Application For Certificate Use exit program information.
dcl-ds Qsy_Dereg_Cert_App_Info_t qualified;
  exitPointName   char(20);
  exitPointFormat char(8);
  applicationID   char(100);
end-ds Qsy_Dereg_Cert_App_Info_t;