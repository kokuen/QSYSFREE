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
// Header File Name: ESYUPDCU
// Descriptive Name: Update Certificate Usage Exit Program.
// 
// Description:
//  The Update Certificate Usage exit program provides the notification of certificate updates for 
//  registered applications that use certificates.
// 
// Header Files Included: None.
// 
// Macros List: None.
// 
// Structure List:
//  Qsy_Update_Cert_Usage_Info_t
// 
// Function Prototype List: None.
// 
// Change Activity:
//  P3677328   1998-09-02  V4R4  New Include
//----------------------------------------------------------


//--------------------------------------
// Include guard
//--------------------------------------


/if defined(esyupdcu)
  /eof 
/else
  /define esyupdcu
/endif


//--------------------------------------
// Data structures
//--------------------------------------


// Type Definition for the Update Certificate Usage exit program information.
dcl-ds Qsy_Update_Cert_Usage_Info_t qualified;
  exitPointName             char(20);
  exitPointFormat           char(8);
  applicationID             char(100);
  Action                    char(1);
  CACertificateIDType       char(1);
  *n                        char(2)     inz(*allx'00');
  offsetToCertificateStore  int(10);
  certificateStoreLength    int(10);
  offsetToCertificateID     int(10);
  CertificateIDLength       int(10);
  // CertificateStore       char(*);    // Varying length
  // CertificateID          char(*);    // Varying length
end-ds Qsy_Update_Cert_Usage_Info_t;