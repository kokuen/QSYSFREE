**free
//----------------------------------------------------------
// All original rights and credits goes to IBM.
//
// Header File Name: ECACHCMD
// Descriptive Name: Command Analyzer Change Exit Program
// 
// Description: The Command Analyzer Change Exit Program allows an application to change the 
//  command that will be run by the command analyzer.
// 
// Header Files Included: None.
// Macros List: None.
// Structure List: Qca_Chg_CHGC0100_t
// Function Prototype List: None.
//----------------------------------------------------------


/if defined(ecachcmd)
  /eof
/else
  /define ecachcmd
/endif


//--------------------------------------
// Data structures
//--------------------------------------


dcl-ds CHGC0100 qualified;
  exitPointName char(20);
  exitPointFormat char(8);
  CommandName char(10);
  LibraryName char(10);
  changeAllowed ind;
  promptRequested ind;
  *n char(2) inz(x'00'); // Reserved by the system
  offsetToCommandString int(10);
  commandStringLength int(10);
  OffsetToProxyChain int(10);
  proxyChainEntries int(10);
  // commandString char(*)
  // proxyCommandChain char(*)
end-ds;