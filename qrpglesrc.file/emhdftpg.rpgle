**free
//----------------------------------------------------------
// Product(s):
//  5716-SS1
//
// Copyright:
//  IBM Corp. 1995,1995 - All rights reserved.
//  US Government Users Restricted Rights - Use, duplication or disclosure restricted by GSA ADP 
//  Schedule Contract with IBM Corp.
//  Licensed Materials-Property of IBM
//
// Header File Name: EMHDFTPG
// Descriptive Name: Default handling exit program's parameter structure for receiving program
//  information
// 
// Description:   
//  The ADDMSGD (add message description) command or CHGMSGD (change message description) command
//  can be used to identify that a user-written program should be called.
//  The program is called when the particular message is sent as an escape message and the program 
//  or procedure that the message was sent to was not monitoring for the message.
// 
// Header Files Included: None.
//
// Macros List: None.
//
// Structure List: 
//  Qmh_Receiving_Program_Info_t
// 
// Function Prototype List: None.
// 
// Change Activity:
//  P3980706, V3R6, 1995-02-15: New Include
//----------------------------------------------------------


//--------------------------------------
// Include guard
//--------------------------------------


/if defined(emhdftpg)
  /eof 
/else
  /define emhdftpg
/endif


//--------------------------------------
// Data structures
//--------------------------------------


// Type Definition for the Receiving Program Information parameter
// NOTE: The following type definition only defines the fixed portion of the format.  Any varying 
//  length field will have to be defined by the user.
dcl-ds Qmh_Receiving_Program_Info_t qualified;
  programName char(10);
  moduleName char(10);
  procedureName char(256);
  programType char(1);
  *n char(2) inz(x'00'); // Reserved by the system
  OffsetToProcedure int(10);
  ProcedureLength int(10);
  // *n char(*); Reserved by the system
  // procedures char(*);
end-ds;