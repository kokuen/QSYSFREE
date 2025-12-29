**free
//----------------------------------------------------------
// Product(s):
//  5722-SS1
//  5769-SS1
// 
// Copyright:
//  IBM Corp.  1999 - All rights reserved.
//  US Government Users Restricted Rights - Use, duplication or disclosure restricted by GSA ADP 
//  Schedule Contract with IBM Corp.
//  Licensed Materials-Property of IBM
// 
// Header File Name: H/ECACHCMD
// Descriptive Name: Command Analyzer Change Exit Program.
// 
// Description: 
//  The Command Analyzer Change Exit Program allows an application to change the command that will 
//  be run by the command analyzer.
// 
// Header Files Included: None.
// 
// Macros List: None.
// 
// Structure List:
//  Qca_Chg_CHGC0100_t
// 
// Function Prototype List: None.
// 
// Change Activity:
//  D95252, V4R5, 1999-03-03: New Include
//  D98212.1, V5R1, 1999-11-07: Teraspace stage 2
//  D99697, V5R4, 2004-10-31: Proxy Command Support
//----------------------------------------------------------


//--------------------------------------
// Include guard
//--------------------------------------


/if defined(ecachcmd)
  /eof
/else
  /define ecachcmd
/endif


//--------------------------------------
// Data structures
//--------------------------------------


// Type definition for format CHGC0100
dcl-ds Qca_Chg_CHGC0100_t qualified;
  exitPointName char(20);
  exitPointFormat char(8);
  commandName char(10);
  libraryName char(10);
  changeAllowed char(1);
  promptRequested char(1);
  *n char(2) inz(x'00'); // Reserved by the system
  offsetToCommandString int(10);
  commandStringLength int(10);
  offsetToProxyChain int(10);
  proxyChainEntries int(10);
  // commandString char(*)
  // proxyCommandChain char(*)
end-ds;