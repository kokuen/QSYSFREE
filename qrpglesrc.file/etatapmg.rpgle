**free
//----------------------------------------------------------
// Product(s):
//  5763-SS1
//  5722-SS1
//
// Copyright:
//  IBM Corp.  1994, 2007 - All rights reserved.
//  US Government Users Restricted Rights - Use, duplication or disclosure restricted by GSA ADP 
//  Schedule Contract with IBM Corp.
//  Licensed Materials-Property of IBM
//
// Header File Name: ETATAPMG
// Descriptive Name: Tape Management Exit Program.
// 
// Description:
//  The Tape Mangement exit program allows a tape management system to monitor and control the use
//  of volumes and devices used by the operating system for most tape operations.
// 
// Header Files Included: None.
// 
// Macros List:
//  QTA_SOF_EXIT
//  QTA_ACTIVE_FILE_MSGS
//  QTA_CHAR_CODE_CNV
//  QTA_EOS_EXIT
//  QTA_EOF_EXIT
//  QTA_IGNORE_RESPONSE
//  QTA_MOUNT_NEXT_MSGS
//  QTA_NO_LOG_BLK_ID
//  QTA_PERM_EXP_DATA
//  QTA_SOV_EXIT
//  QTA_SOS_EXIT
//  QTA_SUPPRESS_IGNORE_RESPONSE
//  QTA_SUPPRESS_ACTIVE_FILE_MSGS
//  QTA_SUPPRESS_CHAR_CODE_CNV
//  QTA_SUPPRESS_MOUNT_NEXT_MSGS
//  QTA_ACCEPT_MOUNTED_VOL
//  QTA_NOT_ACCEPTED_TERMINATE
//  QTA_REJECT_IN_FAVOR_OF
//  QTA_MESSAGE_NOT_RECOVERABLE
//  QTA_MESSAGE_RECOVERABLE
//  QTA_NOT_OUTPUT_EXTEND
//  QTA_OUTPUT_EXTEND
//  QTA_SKIP_FILE
//  QTA_DUPLICATE_FILE
// 
// Structure List:
//  Qta_Exit_Description_Struct_t
//  Qta_Label_Info_Struct_t
//  Qta_Operational_Info_Struct_t
//  Qta_Control_Value_Info_Struct_t
// 
// Function Prototype List: None.
// 
// Change Activity:
//  P3954178  1994-05-18  V3R1  New Include
//  N/A       1996-11-26  V4R1  Update for V3R6, V3R7 and V4R1
//  P9934931  2000-11-05  V5R1  Teraspace stage 2
//  D98498.1  2001-02-04  V5R2  EXPDATE for DUPTAP
//  D99307.1  2002-07-07  V5R3  TMS Enhancements
//  D99880.1  2004-05-02  V5R4  Add WORM support
//  P9B48594  2007-04-03  V5R5  Encryption support
//----------------------------------------------------------


//--------------------------------------
// Include guard
//--------------------------------------


/if defined(etatapmg)
  /eof 
/else
  /define etatapmg
/endif


//--------------------------------------
// Data structures
//--------------------------------------


// Type Definition for the Exit Description Information
dcl-ds Qta_Exit_Description_Struct_t qualified;
  lengthOfExitDescription   int(10);
  tapePositionExitType      char(1);
  tapeLibraryDeviceExitType char(1);
end-ds Qta_Exit_Description_Struct_t;

// Type Definition for the Label Information
dcl-ds Qta_Label_Info_Struct_t qualified;
  lengthOfLabelInfo   int(10);
  currentVolumnLabel  char(80);
  lastHDR1OrTRL1Label char(80);
  lastHDR2OrTRL2Label char(80);
end-ds Qta_Label_Info_Struct_t;

// Type Definition for the Operational Information
dcl-ds Qta_Operational_Info_Struct_t qualified;
  lengthOperationalInfo         int(10);
  lengthControlValueInfo        int(10);
  tapeOperation                 char(1);
  dataFileLabel                 char(17);
  tapeDeviceFileName            char(10);
  tapeDeviceFileLibraryName     char(10);
  currentDeviceName             char(10);
  currentVolumeID               char(6);
  nextDeviceName                char(10);
  nextVolumeID                  char(6);
  currentDeviceType             char(4);
  currentTapeDensity            char(10);
  dataCheckOnWrite              ind;
  nextTapeDensity               char(10);
  tapeDriveReadyStatus          char(1);
  tapeVolumeInitStatus          char(1);
  initNewVolumeLabel            ind;
  logicalBlockID                char(32);
  cartridgeID                   char(6);
  categoryName                  char(10);
  categorySystemName            char(8);
  mismatchStatus                char(1);
  libraryDeviceName             char(10);
  libraryDeviceStatus           char(1);
  libraryDeviceMode             char(1);
  restrictedStateStatus         ind;
  writeProtectionStatus         ind;
  messageIdentifier             char(7);
  messageType                   char(10);
  messageQueueOrProgramName     char(10);
  messageQueueOrProgramLibrary  char(10);
  messageDestination            char(4);
  volumeListStatus              char(1);
  offsetToReplacementText       int(10);
  lengthOfReplacementText       int(10);
  generateCartridgeStatus       ind;
  sequenceNumberChangeAllowed   ind;
  endPosition                   ind;
  fileSequenceNumber            char(10);
  aggregateSequenceNumber       char(10);
  MLBTapeResourceName           char(10);
  MLBTapeResourceType           char(4);
  MLBTapeResourceModel          char(4);
  generatedCartridgeID          ind;
  sessionIdentifier             char(10);
  cartridgeDensities            char(150);
  qualifiedJobName              char(26);
  *n                            char(4)     inz(*allx'00');
  typeOfClose                   char(1);
  commandName                   char(10);
  messageRecoverable            ind;
  outputExtend                  ind;
  userSequenceNumber            char(10);
  userExpirationDate            char(6);
  virtualDevice                 ind;
  wormCartridge                 char(1);
  targetRelease                 char(6);
end-ds Qta_Operational_Info_Struct_t;

// Type Definition for the Control Value Information
dcl-ds Qta_Control_Value_Info_Struct_t qualified;
  volumeAcceptance        char(1);
  volumeToBeUsed          char(6);
  fileExpirationDate      char(6);
  characterCodeConversion char(1);
  allowIgnoreResponse     ind;
  issueActiveFileMessages ind;
  issueMountNextMessages  ind;
  logicalBlockID          char(32);
  allowCategoryChange     ind;
  allowRemoval            ind;
  mismatchAcceptance      ind;
  autoADDTAPCTG           ind;
  messageResponse         char(1);
  Allow Mount Cgy         ind;
  Allow Demount Cgy       ind;
  sequenceNumber          char(6);
  categoryName            char(10);
  categorySystem          char(8);
  largeSequenceNumber     char(10);
  allowLogBlockID         ind;
  allowCartridgeSearch    ind;
  changeEndPosition       ind;
  densityOrFormat         char(10);
  useOptimumBlock         ind;
  duplicateFile           ind;
  imageCatalogName        char(10);
  suppressAutogen         ind;
  keyStoreFile            char(20);
  keyRecordLabel          char(32);
end-ds Qta_Control_Value_Info_Struct_t;