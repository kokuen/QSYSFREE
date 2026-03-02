**free
//----------------------------------------------------------
// Product(s):
//  5722-SS1
//
// Copyright:
//  IBM Corp. 2001 - All rights reserved.
//  US Government Users Restricted Rights - Use, duplication or disclosure restricted by GSA ADP 
//  Schedule Contract with IBM Corp.
//  Licensed Materials-Property of IBM
//
// Header File Name: ESYRGAPP
// Descriptive Name: Register Application For Certificate Use Exit Program.
// 
// Description:
//  The Register Application For Certificate Use exit program provides the notification of a update
//  to the registration information for an application.
// 
// Header Files Included: None.
// 
// Macros List: None.
// 
// Structure List:
//  Qsy_Reg_Cert_App_Info_t
// 
// Function Prototype List: None.
// 
// Change Activity:
//  D9788002  1999-06-09  V5R1  New Include
//  P9934931  2000-11-07  V5R1  Teraspace stage 2
//  RFW585292 2012-07-01  V7R2  Add new values
//----------------------------------------------------------


//--------------------------------------
// Include guard
//--------------------------------------


/if defined(esyrgapp)
  /eof 
/else
  /define esyrgapp
/endif


//--------------------------------------
// Data structures
//--------------------------------------


// Type Definition for the Register Application For Certificate Use exit program information
dcl-ds Qsy_Reg_Cert_App_Info_t qualified;
  exitPointName                             char(20);
  exitPointFormat                           char(8);
  applicationID                             char(100);
  currentClientAuthenticationRequired       ind;
  newClientAuthenticationRequired           ind;
  currentClientAuthenticationSupported      ind;
  newClientAuthenticationSupported          ind;
  currentLimitTrustedCA                     char(1);
  newLimitTrustedCA                         char(1);
  currentPerformCertificateRevocation       char(1);
  newPerformCertificateRevocation           char(1);
  currentSSLProtocols                       char(10);
  newSSLProtocols                           char(10);
  currentSSLCipherSpecificationsList        char(128);
  newSSLCipherSpecificationsList            char(128);
  currentSSLSignatureAlgorithms             char(32);
  newSSLSignatureAlgorithms                 char(32);
  currentPerformOCSPChecking                char(1);
  newPerformOCSPChecking                    char(1);
  currentOCSPURL                            char(128);
  newOCSPURL                                char(128);
  currentExtendedRenegotiationCriticalMode  char(1);
  newExtendedRenegotiationCriticalMode      char(1);
  currentServerName                         char(128);
  newServerName                             char(128);
end-ds Qsy_Reg_Cert_App_Info_t;