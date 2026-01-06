**free
//----------------------------------------------------------
// Product(s):
//  5722-SS1
//  5761-SS1
//  5770-SS1
//
// Copyright:
//  IBM Corp.  2000, 2009 - All rights reserved.
//  US Government Users Restricted Rights - Use, duplication or disclosure restricted by GSA ADP 
//  Schedule Contract with IBM Corp.
//  Licensed Materials-Property of IBM
//
// Header File Name: H/EPQMAPXT
// Descriptive Name: Email Exit Program Interface
// 
// Description:
//  The Email Exit Program Interface describes the interface between PSF/400 and a user defined 
//  exit program (e-mail mapping program).
// 
// Header Files Included: None.
// 
// Macros List: None.
// 
// Structure List:
//  Qpq_Email_Exit_I_t
//  Qpq_Email_Exit_O_t
//  Qpq_Email_Exit_E_t
//  Qpq_All_Stream_Files_t
//  Qpq_PDF_Spooled_File_t
//  Qpq_Stream_File_t
//  Qpq_PDF_Encryption_t
// 
// Function Prototype List: None.
// 
// Change Activity:
//  D98184    1999-12-02  V5R1  New Include
//  P9953931  2001-09-26  V5R2  Changes w/D98880
//  D99198    2002-08-30  V5R3  Changes w/D99198
//  P9A95904  2005-06-03  V5R3  Add support for mail sender in extension area
//  P9B07263  2005-08-09  V5R4  Add field to specify offset to message text. SMTP only.
//  P9C19044  2008-01-21  V5R4  Add flag for email delimiter
//  PFW472286 2009-06-12  V5R4  Add flags for encryption of stream files and spooled files
//----------------------------------------------------------


//--------------------------------------
// Include guard
//--------------------------------------


/if defined(epqmapxt)
  /eof 
/else
  /define epqmapxt
/endif


//--------------------------------------
// Data structures
//--------------------------------------


// Structure for Option Specific input information to mapping program
dcl-ds Qpq_Email_Exit_I_t qualified;
  qualifiedJobName        char(26);
  spooledFileName         char(10);
  spooledFileNumber       int(10)
  mailTag                 char(250);
  filePathAndName         char(340);
  mailServerType          char(1);
  *n                      char(1)     inz(x'00');
  pathNameCCSID           int(10);
  mailSender              char(10);
  userData                char(10);
  jobSystemName           char(8);
  creationTimeStamp       char(8);
  outputQueue             char(10);
  outputQueueLibrary      char(10);
  PDFMappingObjectName    char(10);
  PDFMappingObjectLibrary char(10);
  formatType              char(10);
end-ds Qpq_Email_Exit_I_t;

// Structure for Option Specific Output Information From Mapping Program.
dcl-ds Qpq_Email_Exit_O_t qualified;
  PDFFileDisposition          char(1);
  callExitProgramAgain        ind;
  *n                          char(2)     inz(x'00');
  messageTextLength           int(10);
  mailAddressDataLength       int(10);
  messageTextData             char(255);
  PDFEmailCommaDelimiter      ind;
  offsetToExtensionArea       int(10);
  CCSIDMessageTextAndSubject  int(10);
  PDFStreamFileDisposition    char(1);
  PDFSpooledFileDisposition   char(1);
  PDFErrorDisposition         char(1);
  AFPSpooledFileDisposition   char(1);
  messageTextOffset           int(10);
  *n                          char(3)     inz(x'00');
  // EPQEA                    char(1);  // Varying length
end-ds Qpq_Email_Exit_O_t;

dcl-ds Qpq_All_Stream_Files_t qualified;
  totalLength       int(10);
  streamFilesNumber int(10);
  // Qpq_Stream_File_t
  // Stream_File_Information[]
end-ds Qpq_All_Stream_Files_t;

dcl-ds Qpq_Stream_File_t qualified;
  totalLength           int(10);
  formatStructureLength int(10);
  offsetToPathName      int(10);
  pathNameLength        int(10);
  useSpecifiedDirectory ind;
  *n                    char(3)   inz(x'00');
  // EPQPN              char(1);  // Varying length
end-ds Qpq_Stream_File_t;

dcl-ds Qpq_PDF_Spooled_File_t qualified;
  outputQueueName     char(10);
  outputQueueLibrary  char(10);
  spooledFileName     char(10);
  userData            char(10);
  userDefinedData     char(255);
  formatType          char(10);
end-ds Qpq_PDF_Spooled_File_t;

dcl-ds Qpq_AFP_Spooled_File_t qualified;
  outputQueueName     char(10);
  outputQueueLibrary  char(10);
  spooledFileName     char(10);
  userData            char(10);
  userDefinedData     char(255);
  formatType          char(10);
end-ds Qpq_AFP_Spooled_File_t;

dcl-ds Qpq_PDF_Encryption_t qualified;
  PDFOwnerPassword        char(32);
  PDFUserPassword         char(32);
  PDFPrinting             ind;
  PDFChangingDocument     ind;
  PDFCopy                 ind;
  PDFEncryptionLevel      char(1);
  PDFContentAccessEnable  ind;
  PDFCommentChanging      ind;
  PDFDocumentAssembly     ind;
end-ds Qpq_PDF_Encryption_t;

// Structure for Extension Area
dcl-ds Qpq_Email_Exit_E_t qualified;
  extensionAreaLength           int(10);
  offsetToSubject               int(10);
  subjectLength                 int(10);
  offsetToReplyTo               int(10);
  replyToLength                 int(10);
  offsetToCC                    int(10);
  CCLength                      int(10);
  offsetToBCC                   int(10);
  BCCLength                     int(10);
  offsetToPathBody              int(10);
  offsetToAttachmentsDirectory  int(10);
  attachmentsDirectoryLength    int(10);
  offsetToAttachments           int(10);
  offsetToPDFFilePath           int(10);
  PDFFilePathLength             int(10);
  offsetToPDFFileName           int(10);
  PDFFileNameLength             int(10);
  offsetToPDFFileAuthority      int(10);
  PDFFileAuthorityLength        int(10);
  offsetToPDFSpooledfile        int(10);
  PDFSpooledfileLength          int(10);
  offsetToAFPSpooledfile        int(10);
  AFPSpooledfileLength          int(10);
  offsetToPDFEncryption         int(10);
  PDFEncryptionLength           int(10);
  mailSender                    char(10);
  encryptStreamFile             ind;
  encryptSpooledFile            ind;
  // Order of the following variables is discretionary
  // EPQSS                      char(1);    // Varying length
  // EPQRT                      char(1);    // Varying length
  // EPQCCEA                    char(1);    // Varying length
  // EPQBCCEA                   char(1);    // Varying length
  // EPQAD                      char(1);    // Varying length
  // EPQMENTS                   char(8)     dim(1);               // Varying length
  // EPQTL01                    bindec(9:0) overlay(EPQMENTS: 1);
  // EPQNBRSF00                 bindec(9:0) overlay(EPQMENTS: 5);
  // EPQPB                      char(8)     dim(1);               // Varying length
  // EPQTL02                    bindec(9:0) overlay(EPQPB: 1);
  // EPQNBRSF01                 bindec(9:0) overlay(EPQPB: 5);
  // EPQPDFFN01                 char(1);    // Varying length
  // EPQPDFFA01                 char(1);    // Varying length
  // EPQPDFSF00                 char(305)   dim(1);                   // Varying length
  // EPQOQN01                   char(10)    overlay(EPQPDFSF00: 1);
  // EPQOQLIB03                 char(10)    overlay(EPQPDFSF00: 11);
  // EPQSFILN03                 char(10)    overlay(EPQPDFSF00: 21);
  // EPQUD02                    char(10)    overlay(EPQPDFSF00: 31);
  // EPQUDD01                   char(255)   overlay(EPQPDFSF00: 41);
  // EPQMTYPE02                 char(10)    overlay(EPQPDFSF00: 296);
  // EPQAFPSF00                 char(305)   dim(1);                   // Varying length
  // EPQOQN02                   char(10)    overlay(EPQAFPSF00: 1);
  // EPQOQLIB04                 char(10)    overlay(EPQAFPSF00: 11);
  // EPQSFILN04                 char(10)    overlay(EPQAFPSF00: 21);
  // EPQUD03                    char(10)    overlay(EPQAFPSF00: 31);
  // EPQUDD02                   char(255)   overlay(EPQAFPSF00: 41);
  // EPQMTYPE03                 char(10)    overlay(EPQAFPSF00: 296); 
  // EPQPDFE                    char(71)    dim(1);               // Varying length
  // EPQPDFOP00                 char(32)    overlay(EPQPDFE: 1);
  // EPQPDFUP00                 char(32)    overlay(EPQPDFE: 33);
  // EPQPDFP00                  char(1)     overlay(EPQPDFE: 65);
  // EPQPDFCD00                 char(1)     overlay(EPQPDFE: 66);
  // EPQPDFC00                  char(1)     overlay(EPQPDFE: 67);
  // EPQPDFEL00                 char(1)     overlay(EPQPDFE: 68);
  // EPQDFCAE00                 char(1)     overlay(EPQPDFE: 69);
  // EPQPDFCC00                 char(1)     overlay(EPQPDFE: 70);
  // EPQPDFDA00                 char(1)     overlay(EPQPDFE: 71);
end-ds Qpq_Email_Exit_E_t;