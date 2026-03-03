**free
//----------------------------------------------------------
// Product(s):
//  5769-SS1
//  5769-TC1
//
// Copyright:
//  IBM Corp. 1997,1999 - All rights reserved.
//  US Government Users Restricted Rights - Use, duplication or disclosure restricted by GSA ADP 
//  Schedule Contract with IBM Corp.
//  Licensed Materials-Property of IBM
//
// Header File Name: ETGDEVEX
// Descriptive Name: Telnet Server Device Exit Program
// 
// Description:
//  The TELNET server device exit program provides device initialization and termination for clients
// 
// Header Files Included: None.
// 
// Macros List:
//  QTG_DSPD0100
// 
// Structure List:
//  Qtg_User_Description_t
//  Qtg_DSPD0100_t
//  Qtg_Device_Description_t
//  Qtg_Connection_Description_t
// 
// Function Prototype List: None.
// 
// Change Activity:
//  D95486              1997-04-23  V4R2  New Include
//  P3698701, P9900631  1999-06-25  V4R5  Add local IP address, SSL flag, DCM flag and client cert.
//  P9914943            2000-01-03  V5R1  TERASPACE HEADER FILES
//----------------------------------------------------------


//--------------------------------------
// Include guard
//--------------------------------------


/if defined(etgdevex)
  /eof 
/else
  /define etgdevex
/endif


//--------------------------------------
// Data structures
//--------------------------------------


// Type Definition for the User Description Information
dcl-ds Qtg_User_Description_t qualified;
  lengthOfUserDescription int(10);
  userProfile             char(10);
  currentLibrary          char(10);
  programToCall           char(10);
  initialMenu             char(10);
end-ds Qtg_User_Description_t;

// Structures used by Device Description Information
dcl-ds Qtg_DSPD0100_t qualified;
  keyboardIdentifier  char(3);
  *n                  char(1)     inz(*allx'00');
  codePage            int(10);
  characterSet        int(10);
end-ds Qtg_DSPD0100_t

// Type Definition for the Device Description Information
dcl-ds Qtg_Device_Description_t qualified;
  deviceName                char(10);
  deviceFormat              char(8);
  *n                        char(2)   inz(*allx'00');
  offsetToDeviceAttributes  int(10);
  lengthOfDeviceAttributes  int(10);
  // deviceDescription      char(12);
  // keyboardIdentifier     char(3)   overlay(deviceDescription);
  // *n                     char(1)   overlay(deviceDescription: *next)   inz(*allx'00');
  // codePage               int(10)   overlay(deviceDescription: *next);
  // characterSet           int(10)   overlay(deviceDescription: *next);
end-ds Qtg_Device_Description_t;

// Type Definition for the Connection Description Information
dcl-ds Qtg_Connection_Description_t qualified;
  lengthOfConnectionDescription int(10);
  internetAddress               char(20);
  securePasswordValid           ind;
  workstationType               char(14);
  secureSocketsLayer            ind;
  localInternetAddress          char(20);
  clientAuthenticationLevel     char(1);
  *n                            char(3)   inz(*allx'00');
  clientCertificateValidate     int(10);
  offsetToClientCertificate     int(10);
  clientCertificateLength       uns(10);
  // certificate                char(*);  // Varying length
end-ds Qtg_Connection_Description_t;