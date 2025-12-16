**free
//----------------------------------------------------------
// All original rights and credits goes to IBM.
//
// Header File Name: ECARTCMD
// Descriptive Name: Command Analyzer Retrieve Exit Program
// 
// Description:
//  This header file describes the structure that is passed to an exit program associated with the
//  QIBM_QCA_RTV_COMMAND exit point for a command being run by Command Analyzer.
// 
// Header Files Included: None.
// Macros List: None.
// Structure List:
//  Qca_Rtv_RTVC0100_t
// Function Prototype List: None.
//----------------------------------------------------------


/if defined(ecartcmd)
  /eof
/else
  /define ecartcmd
/endif


//--------------------------------------
// Data structures
//--------------------------------------


// Type definition for format RTVC0100
dcl-ds Qca_Rtv_RTVC0100_t qualified;
  exitPointName char(20);
  exitPointFormat char(8);
  commandName char(10);
  libraryName char(10);
  *n char(2) inz(x'00'); // Reserved by the system
  calledAfterCommand char(1);
  *n char(1) inz(x'00'); // Reserved by the system
  offsetToOriginalCommandString int(10);
  originalCommandStringLength int(10);
  offsetToReplacementCommandString int(10);
  replacementCommandStringLength int(10);
  offsetToProxyChain int(10);
  proxyChainEntries int(10);
  // originalCommandString char(*)
  // replacementCommandString char(*)
  // proxyChain char(*) 
end-ds;