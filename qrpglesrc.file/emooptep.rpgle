**free
//----------------------------------------------------------
// All original rights and credits goes to IBM.
//
// Header File Name: EMOOPTEP
// Descriptive Name: Optical Exit Point.
// 
// Description: 
//  Exit point QIBM_QMO_OPT is used by exit programs that want to monitor and control the use of
//  optical volumes for selected operations by the operating system.
// 
// Header Files Included: None.
// Macros List: None.
// Structure List:
//  Qmo_Operational_Info_Struct_t, Qmo_Control_Value_Info_Struct_t
// Function Prototype List: None.
//----------------------------------------------------------


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