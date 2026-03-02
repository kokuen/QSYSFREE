**free
//----------------------------------------------------------
// Product(s):
//  5763-SS1
//
// Copyright:
//  IBM Corp. 1994,1994 - All rights reserved.
//  US Government Users Restricted Rights - Use, duplication or disclosure restricted by GSA ADP 
//  Schedule Contract with IBM Corp.
//  Licensed Materials-Property of IBM
//
// Header File Name: ETASTGEX
// Descriptive Name: Storage Extension Exit Program.
// 
// Description:
//  The Storage Extension exit program provides the capability of restoring objects using storage
//  extension, that is, restoring objects that were saved using *FREE.
// 
// Header Files Included: None.
// 
// Macros List: None.
// 
// Structure List:
//  Qta_Object_Description_Info_t
//  Qta_Control_Value_Struct_t
// 
// Function Prototype List: None.
// 
// Change Activity:
//  D2862000  1994-04-18  V3R1  New Include
//----------------------------------------------------------


//--------------------------------------
// Include guard
//--------------------------------------


/if defined(etastgex)
  /eof 
/else
  /define etastgex
/endif


//--------------------------------------
// Data structures
//--------------------------------------


// Type Definition for the Object Description Information Format
dcl-ds Qta_Object_Description_Info_t qualified;
  structure1Length  char(4);
  structure2Length  char(4);
  objectName        char(10);
  objectLibraryName char(10);
  objectType        char(10);
  memberName        char(10);
  jobName           char(10);
  userID            char(10);
  jobNumber         char(6);
end-ds Qta_Object_Description_Info_t;

// Type Definition for the Control Value Information Format
dcl-ds Qta_Control_Value_Struct_t qualified;
  objectRestoreInfo char(1);
end-ds Qta_Control_Value_Struct_t;