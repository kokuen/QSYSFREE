**free
//----------------------------------------------------------
// Product(s):
//  5722-SS1
//
// Copyright:
//  IBM Corp.  2007, 2007 - All rights reserved.
//  US Government Users Restricted Rights - Use, duplication or disclosure restricted by GSA ADP 
//  Schedule Contract with IBM Corp.
//  Licensed Materials-Property of IBM
//
// Header File Name: EMOOPTEP
// Descriptive Name: Optical Exit Point.
// 
// Description: 
//  Exit point QIBM_QMO_OPT is used by exit programs that want to monitor and control the use of
//  optical volumes for selected operations by the operating system.
// 
// Header Files Included: None.
// 
// Macros List: None.
// 
// Structure List:
//  Qmo_Operational_Info_Struct_t
//  Qmo_Control_Value_Info_Struct_t
// 
// Function Prototype List: None.
// 
// Change Activity:
//  D93327.6, V5R5, 2006-10-26: New Include
//----------------------------------------------------------


//--------------------------------------
// Include guard
//--------------------------------------


/if defined(emooptep)
  /eof 
/else
  /define emooptep
/endif


//--------------------------------------
// Data structures
//--------------------------------------


// Type Definition for the Operational Information
dcl-ds Qmo_Operational_Info_Struct_t qualified;
  operationalInfoLength int(10);
  controlValueInfoLength int(10);
  opticalOperation char(10);
  volumeID char(32);
end-ds;

// Type Definition for the Control Value Information
dcl-ds Qmo_Control_Value_Info_Struct_t qualified;
  volumeAcceptance char(1);
end-ds;