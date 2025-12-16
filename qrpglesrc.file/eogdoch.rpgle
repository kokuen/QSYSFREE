**free
//----------------------------------------------------------
// All original rights and credits goes to IBM.
//
// Header File Name: H/EOGDOCH
// Descriptive Name: Document Handleing Exit Program.
// 
// Description: 
//  The Document Handling program allows other applications to be called in place of or in addition 
//  to the OfficeVision/400 word processor.
// 
// Header Files Included: None.
// Macros List: None.
// Structure List:
//  Qog_Doci_DOCI0100_t, Qog_Doci_DOCI0200_t, Qog_Doci_DOCI0300_t, Qog_Doci_DOCI0400_t, 
//  Qog_Doci_DOCI0500_t, Qog_Doci_DOCI0600_t, Qog_Doci_DOCI0700_t, Qog_Doci_DOCI0800_t,
//  Qog_Doci_DOCI0900_t, Qog_Doci_Recipient_List_t
// Function Prototype List: None.
//----------------------------------------------------------


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
  copiesToPrint char(2);
  outputDevice char(1);
  printerDevice char(10);
  outputQueue char(10);
  outputQueueLibrary char(10);
  outputFile char(10);
  formType char(10);
  printerFile char(10);
  printerFileLibrary char(10);
  deviceFile char(10);
  deviceLibrary char(10);
  deviceMember char(10);
  delayPrinting char(1);
  draftSpacing char(1);
  printLineNumbers char(1);
  resolveInstructions char(1);
  largePrint char(1);
  graphicCharacterSet int(10);
  codePage int(10);
  printSeparatorPage char(1);
  adjustLineEndings char(1);
  adjustPageEndings char(1);
  allowWindowLines char(1);
  additionalSpacesToLeft char(2);
  printChangesSymbols char(1);
  changeSymbolsToPrint char(5);
  printQuality char(1);
  placeOnJobQueue char(1);
  sendCompletionMessage char(1);
  jobDescription char(10);
  jobDescriptionLibrary char(10);
  cancelOnError char(1);
  printErrorLog char(1);
  errorLogFormatType char(10);
  clearErrorLogAfterPrinting char(1);
  saveResolvedOutput char(1);
  resolvedOutput char(12);
  resolvedOutputFolder char(63);
  multipleLineReport char(1);
  printOnBothSides char(1);
  autoPageBinding char(1);
  autoShiftMargins char(1);
  renumberSystemPageNumbers char(1);
  printFromPage1 char(7);
  printToPage1 char(8);
  printFromPage2 char(7);
  printToPage2 char(8);
  printFromPage3 char(7);
  printToPage3 char(8);
  printFromPage4 char(7);
  printToPage4 char(8);
  printFromPage5 char(7);
  printToPage5 char(8);
  printFromPage6 char(7);
  printToPage6 char(8);
  printFromPage7 char(7);
  printToPage7 char(8);
  docIsLabel char(1);
  labelsNumber char(2);
  labelsWidth char(3);
  sheetFeedLabels char(1);
  rowsPerSheet char(2);
  mergeType char(1);
  query char(10);
  queryLibrary char(10);
  dataDoc char(12);
  dataFolder char(63);
  dataFile char(10);
  dataFileLibrary char(10);
  dataFileMember char(10);
end-ds;

// Merge function request format
dcl-ds Qog_Doci_DOCI0200_t qualified;
  toDocument char(12);
  toFolder char(63);
  replaceDocument char(1);
  placeOnJobQueue char(1);
  sendCompletionMessage char(1);
  jobDescription char(10);
  jobDescriptionLibrary char(10);
  mergeType char(1);
  query char(10);
  queryLibrary char(10);
  dataDocument char(12);
  dataFolder char(63);
  dataFile char(10);
  dataFileLibrary char(10);
  dataFileMember char(10);
  adjustmentOption char(1);
  multipleLineReport char(1);
  collectFootnotes char(1);
  *n char(258) inz(x'00'); // Reserved by the system
end-ds;

// Spell function request format.
dcl-ds Qog_Doci_DOCI0300_t qualified;
  checkType char(1);
  beginningPage char(7);
  endingPage char(7);
  *n char(470) inz(x'00'); // Reserved by the system
end-ds;

// Mail function request format.
dcl-ds Qog_Doci_DOCI0400_t qualified;
  mailReferenceDoc char(12);
  mailReferenceFolder char(63);
  attachMailReference char(1);
  sameNote char(1);
  *n char(408) inz(x'00'); // Reserved by the system
end-ds;

// Edit function request format.
dcl-ds Qog_Doci_DOCI0500_t qualified;
  showExitDisplay char(1);
  *n char(484) inz(x'00'); // Reserved by the system
end-ds;

// Create function request format.
dcl-ds Qog_Doci_DOCI0600_t qualified;
  showExitDisplay char(1);
  showDocDetailsDisplay char(1);
  editDocument char(1);
  *n char(482) inz(x'00'); // Reserved by the system
end-ds;

// Fill form function request format.
dcl-ds Qog_Doci_DOCI0700_t qualified;
  shellForm char(12);
  shellFolder char(63);
  saveForm char(12);
  saveFolder char(63);
  replaceForm char(1);
  displayStatus char(1);
  displayExit char(1);
  allowRefresh char(1);
  dumpDataFile char(10);
  fileLibrary char(10);
  fileMember char(10);
  replaceOrAdd char(1);
  outputDataOnExit char(1);
  *n char(299) inz(x'00'); // Reserved by the system
end-ds;

// Fill form function request format.
dcl-ds Qog_Doci_DOCI0800_t qualified;
  userID char(8);
  userAddress char(8);
  distributionID char(22);
  *n char(447) inz(x'00'); // Reserved by the system
end-ds;

// Send and Addressing function request format.
dcl-ds Qog_Doci_Recipient_List_t qualified;
  userID char(8);
  userAddress char(8);
end-ds;

dcl-ds Qog_Doci_DOCI0900_t qualified dim;
  formatSize int(10);
  offsetToRecipientList int(10);
  addresseesNumber int(10);
  copyListRecipientsNumber int(10);
  blindCopyListRecipientsNumber int(10);
  confirmOnDelivery char(1);
  logOutgoingMailStatus  char(1);
  sensitivity  char(1);
  deliveryGrade  char(1);
  discloseRecipients  char(1);
  importance  char(1);
  allowAlternateRecipient  char(1);
  allowX400Conversion  char(1);
  replyRequested char(1);
  replyRequestedDate char(7);
  replyRequestedTime char(6);
  function char(1);
  subject char(60);
  subjectChrid int(10);
  reference int(60);
  referenceChrid int(10);
  memoClipChrid int(10);
  actionTextNumber char(5);
  memoSlip char(18);
  actionItemText char(5);
  usersMemoSlipText char(202);
  *n char(13) inz(x'00'); // Reserved by the system
end-ds;

// Varying length
// dcl-s Qog_Array char(16) dim(1);
// dcl-s Qog_userID char(8) overlay(Qog_Array: 1);
// dcl-s Qog_userAddress char(8) overlay(Qog_Array: 9);