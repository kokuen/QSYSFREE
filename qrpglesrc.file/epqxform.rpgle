**free
//----------------------------------------------------------
// Product(s):
//  5722-SS1
//
// Copyright:
//  IBM Corp. 2000,2000 - All rights reserved.
//  US Government Users Restricted Rights - Use, duplication or disclosure restricted by GSA ADP 
//  Schedule Contract with IBM Corp.
//  Licensed Materials-Property of IBM
//
// Header File Name: H/EPQXFORM
// Descriptive Name: IPDS to PDF Transform Exit Interface
// 
// Description:
//  The IPDS to PDF Transform Exit Interface - Describes the interface between PSF/400 and a user 
//  defined exit program (email mapping program).
// 
// Header Files Included:
//  H/EPQXFORM
// 
// Macros List: None.
// 
// Structure List:
//  Qpq_Xform_Exit_I_t
// 
// Function Prototype List: None.
// 
// Change Activity:
//  D98184, V5R1, 1999-12-02: New Include
//  P9953931, V5R2, 2001-09-26: Changes w/D98880
//----------------------------------------------------------


//--------------------------------------
// Include guard
//--------------------------------------


/if defined(epqxform)
  /eof 
/else
  /define epqxform
/endif


//--------------------------------------
// Data structures
//--------------------------------------


// Structure for Option Specific input information to IPDS to PDF Transform Exit.
dcl-ds Qpq_Xform_Exit_I_t qualified;
  deviceType              char(10);
  paperSizeDrawer1        char(10);
  paperSizeDrawer2        char(10);
  fileDirectory           char(256);
  writerPort              char(5);
  writerMsgqName          char(10);
  writerMsgqLibraryName   char(10);
  outputQueue             char(10);
  outputQueueLibrary      char(10);
  printerFontID           char(10);
  deviceName              char(10);
  inlineFontIndicator     ind;
  groupBoundaryOperation  ind;
end-ds Qpq_Xform_Exit_I_t;