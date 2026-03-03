**free
//----------------------------------------------------------
// Product(s):
//  5722-SS1
//
// Copyright:
//  IBM Corp. 2000 - All rights reserved.
//  US Government Users Restricted Rights - Use, duplication or disclosure restricted by GSA ADP 
//  Schedule Contract with IBM Corp.
//  Licensed Materials-Property of IBM
//
// Header File Name: ESYUPDCA
// Descriptive Name: Update Certificate Authority (CA) Trust Exit Program.
// 
// Description:
//  The Update Certificate Authority (CA) Trust exit program provides the notification of when a
//  Certificate Authority (CA) certificate is added to or removed from the list of trusted CA
//  certificates for registered applications that use certificates.
// 
// Header Files Included: None.
// 
// Macros List: None.
// 
// Structure List:
//  Qsy_Update_CA_Trust_Info_t
// 
// Function Prototype List: None.
// 
// Change Activity:
//  D9788016  2000-07-09  V5R1  ZNew Include
//----------------------------------------------------------


//--------------------------------------
// Include guard
//--------------------------------------


/if defined(esyupdca)
  /eof 
/else
  /define esyupdca
/endif


//--------------------------------------
// Data structures
//--------------------------------------


// Type Definition for the Update Certificate Authority (CA) Trust exit program information.
dcl-ds Qsy_Update_CA_Trust_Info_t qualified;
  exitPointName           char(20);
  exitPointFormat         char(8);
  applicationID           char(100);
  Action                  char(1);
  CACertificateIDType     char(1);
  *n                      char(2)     inz(*allx'00');
  offsetToCACertificateID int(10);
  CACertificateIDLength   int(10);
  // CACertificate        char(*);    // Varying length
end-ds Qsy_Update_CA_Trust_Info_t;