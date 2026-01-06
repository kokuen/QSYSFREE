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
// Header File Name: H/EOGDOCH
// Descriptive Name: Document Handleing Exit Program.
// 
// Description: 
//  The Document Handling program allows other applications to be called in place of or in addition 
//  to the OfficeVision/400 word processor.
// 
// Header Files Included: None.
// 
// Macros List: None.
// 
// Structure List:
//  Qog_Doci_DOCI0100_t
//  Qog_Doci_DOCI0200_t
//  Qog_Doci_DOCI0300_t
//  Qog_Doci_DOCI0400_t
//  Qog_Doci_DOCI0500_t
//  Qog_Doci_DOCI0600_t
//  Qog_Doci_DOCI0700_t
//  Qog_Doci_DOCI0800_t
//  Qog_Doci_DOCI0900_t
//  Qog_Doci_Recipient_List_t
// 
// Function Prototype List: None.
// 
// Change Activity:
//  D2862000  1994-04-15  V3R1  New Include
//----------------------------------------------------------


//--------------------------------------
// Include guard
//--------------------------------------


/if defined(eogdoch)
  /eof 
/else
  /define eogdoch
/endif


//--------------------------------------
// Data structures
//--------------------------------------


// Print function request format.
dcl-ds Qog_Doci_DOCI0100_t qualified;
  copiesToPrint               char(2);
  outputDevice                char(1);
  printerDevice               char(10);
  outputQueue                 char(10);
  outputQueueLibrary          char(10);
  outputFile                  char(10);
  formType                    char(10);
  printerFile                 char(10);
  printerFileLibrary          char(10);
  deviceFile                  char(10);
  deviceLibrary               char(10);
  deviceMember                char(10);
  delayPrinting               ind;
  draftSpacing                ind;
  printLineNumbers            ind;
  resolveInstructions         ind;
  largePrint                  ind;
  graphicCharacterSet         int(10);
  codePage                    int(10);
  printSeparatorPage          ind;
  adjustLineEndings           ind;
  adjustPageEndings           ind;
  allowWindowLines            ind;
  additionalSpacesToLeft      char(2);
  printChangesSymbols         ind;
  changeSymbolsToPrint        char(5);
  printQuality                char(1);
  placeOnJobQueue             ind;
  sendCompletionMessage       ind;
  jobDescription              char(10);
  jobDescriptionLibrary       char(10);
  cancelOnError               ind;
  printErrorLog               ind;
  errorLogFormatType          char(10);
  clearErrorLogAfterPrinting  char(1);
  saveResolvedOutput          ind;
  resolvedOutput              char(12);
  resolvedOutputFolder        char(63);
  multipleLineReport          ind;
  printOnBothSides            ind;
  autoPageBinding             ind;
  autoShiftMargins            ind;
  renumberSystemPageNumbers   ind;
  printFromPage1              char(7);
  printToPage1                char(8);
  printFromPage2              char(7);
  printToPage2                char(8);
  printFromPage3              char(7);
  printToPage3                char(8);
  printFromPage4              char(7);
  printToPage4                char(8);
  printFromPage5              char(7);
  printToPage5                char(8);
  printFromPage6              char(7);
  printToPage6                char(8);
  printFromPage7              char(7);
  printToPage7                char(8);
  docIsLabel                  ind;
  labelsNumber                char(2);
  labelsWidth                 char(3);
  sheetFeedLabels             ind;
  rowsPerSheet                char(2);
  mergeType                   char(1);
  query                       char(10);
  queryLibrary                char(10);
  dataDoc                     char(12);
  dataFolder                  char(63);
  dataFile                    char(10);
  dataFileLibrary             char(10);
  dataFileMember              char(10);
end-ds Qog_Doci_DOCI0100_t;

// Merge function request format
dcl-ds Qog_Doci_DOCI0200_t qualified;
  toDocument            char(12);
  toFolder              char(63);
  replaceDocument       ind;
  placeOnJobQueue       ind;
  sendCompletionMessage ind;
  jobDescription        char(10);
  jobDescriptionLibrary char(10);
  mergeType             char(1);
  query                 char(10);
  queryLibrary          char(10);
  dataDocument          char(12);
  dataFolder            char(63);
  dataFile              char(10);
  dataFileLibrary       char(10);
  dataFileMember        char(10);
  adjustmentOption      char(1);
  multipleLineReport    ind;
  collectFootnotes      ind;
  *n                    char(258)   inz(x'00'); // Reserved by the system
end-ds Qog_Doci_DOCI0200_t;

// Spell function request format.
dcl-ds Qog_Doci_DOCI0300_t qualified;
  checkType     ind;
  beginningPage char(7);
  endingPage    char(7);
  *n            char(470) inz(x'00'); // Reserved by the system
end-ds Qog_Doci_DOCI0300_t;

// Mail function request format.
dcl-ds Qog_Doci_DOCI0400_t qualified;
  mailReferenceDoc    char(12);
  mailReferenceFolder char(63);
  attachMailReference ind;
  sameNote            ind;
  *n                  char(408) inz(x'00'); // Reserved by the system
end-ds Qog_Doci_DOCI0400_t;

// Edit function request format.
dcl-ds Qog_Doci_DOCI0500_t qualified;
  showExitDisplay ind;
  *n              char(484) inz(x'00'); // Reserved by the system
end-ds Qog_Doci_DOCI0500_t;

// Create function request format.
dcl-ds Qog_Doci_DOCI0600_t qualified;
  showExitDisplay       ind;
  showDocDetailsDisplay ind;
  editDocument          ind;
  *n                    char(482) inz(x'00'); // Reserved by the system
end-ds Qog_Doci_DOCI0600_t;

// Fill form function request format.
dcl-ds Qog_Doci_DOCI0700_t qualified;
  shellForm         char(12);
  shellFolder       char(63);
  saveForm          char(12);
  saveFolder        char(63);
  replaceForm       ind;
  displayStatus     ind;
  displayExit       ind;
  allowRefresh      ind;
  dumpDataFile      char(10);
  fileLibrary       char(10);
  fileMember        char(10);
  replaceOrAdd      ind;
  outputDataOnExit  ind;
  *n char(299) inz(x'00'); // Reserved by the system
end-ds Qog_Doci_DOCI0700_t;

// Fill form function request format.
dcl-ds Qog_Doci_DOCI0800_t qualified;
  userID          char(8);
  userAddress     char(8);
  distributionID  char(22);
  *n              char(447) inz(x'00'); // Reserved by the system
end-ds Qog_Doci_DOCI0800_t;

// Send and Addressing function request format.
dcl-ds Qog_Doci_Recipient_List_t qualified;
  userID      char(8);
  userAddress char(8);
end-ds Qog_Doci_Recipient_List_t;

dcl-ds Qog_Doci_DOCI0900_t qualified dim;
  formatSize                    int(10);
  offsetToRecipientList         int(10);
  addresseesNumber              int(10);
  copyListRecipientsNumber      int(10);
  blindCopyListRecipientsNumber int(10);
  confirmOnDelivery             ind;
  logOutgoingMailStatus         ind;
  sensitivity                   char(1);
  deliveryGrade                 char(1);
  discloseRecipients            ind;
  importance                    char(1);
  allowAlternateRecipient       ind;
  allowX400Conversion           ind;
  replyRequested                ind;
  replyRequestedDate            char(7);
  replyRequestedTime            char(6);
  function                      char(1);
  subject                       char(60);
  subjectCHRID                  int(10);
  reference                     int(60);
  referenceCHRID                int(10);
  memoClipCHRID                 int(10);
  actionTextNumber              char(5);
  memoSlip                      char(18);
  actionItemText                char(5);
  usersMemoSlipText             char(202);
  *n                            char(13)    inz(x'00'); // Reserved by the system
end-ds Qog_Doci_DOCI0900_t;

// Varying length
// dcl-s Qog_Array        char(16)  dim(1);
// dcl-s Qog_userID       char(8)   overlay(Qog_Array: 1);
// dcl-s Qog_userAddress  char(8)   overlay(Qog_Array: 9);