**free
//----------------------------------------------------------
// Product(s):
//  5769-SS1
//  5722-SS1
//
// Copyright:
//  IBM Corp. 2001,2002 - All rights reserved.
//  US Government Users Restricted Rights - Use, duplication or disclosure restricted by GSA ADP 
//  Schedule Contract with IBM Corp.
//  Licensed Materials-Property of IBM
//
// Header File Name: EIMGEPH
// Descriptive Name: Convert Image API exit program defines
// 
// Description:
//  Structures passed between the Convert Image API and user-defined exit programs.
// 
// Header Files Included: None.
//
// Macros List: None.
//
// Structure List: None.
// 
// Function Prototype List: None.
// 
// Change Activity:
//  D97941, V5R1, 1999-08-26: Created
//  D98795, V5R2, 2004-01-16: Writer MsgQ Support
//  D97260, V5R2, 2004-01-16: Decoupled splf from job support
//----------------------------------------------------------


//--------------------------------------
// Include guard
//--------------------------------------


/if defined(eimgeph)
  /eof
/else
  /define eimgeph
/endif


//--------------------------------------
// Data structures
//--------------------------------------


dcl-ds Qimg_XFRM0100 qualified;
  structureVersion char(8);
  structureLength int(10);
  inputFileFormat int(10);
  outputFileFormat int(10);
  invertImage int(10);
  inputDecompressionValue int(10);
  outputCompressionValue int(10);
  outputXResolution int(10);
  outputYResolution int(10);
  convertColorToGray int(10);
  convertGrayToColor int(10);
  outputPageOrientation int(10);
  xJustificationLeftBorder int(10);
  yJustificationTopBorder int(10);
  outputBitsPerPixel int(10);
  outputPageSize int(10);
  paperWidth packed(8:5);
  paperLength packed(8:5);
  leftUnprintableArea int(10);
  rightUnprintableArea int(10);
  topUnprintableArea int(10);
  bottomUnprintableArea int(10);
  *n char(12) inz(x'00'); // Reserved by the system
  spoolJobName char(10);
  spoolUser char(10);
  spoolJobNumber char(6);
  spoolName char(10);
  spoolNumber int(10);
  systemName char(8);
  creationDate char(7);
  *n char(1) inz(x'00'); // Reserved by the system
  creationTime char(6);
  *n char(2) inz(x'00'); // Reserved by the system
  writerMessageQueue char(10);
  writerMessageQueueLibrary char(10);
  internalSpoolID char(16);
  internalJobID char(16);
  *n char(24) inz(x'00'); // Reserved by the system
end-ds;

dcl-ds Qimg_IPRM0100 qualified;
  structureVersion char(8);
  structureLength int(10);
  processingOption int(10);
  inputDataStreamLength uns(10);
  outputDataStreamLength uns(10);
  returnedDataLength uns(3);
  canTransform char(1);
  padding char(2);
  isDone char(1);
end-ds;


//--------------------------------------
// Special values
//--------------------------------------


// Shared special values for the following fields:
//  IPRM0100 - "processingOption"
dcl-c PROCESS_FILE const(20);
dcl-c TRANSFORM_DATA const(30);
dcl-c END_FILE const(40);
dcl-c TERMINATE const(50);

// Shared special values for the following fields:
//  IPRM0100 - "canTransform", "isDone"
dcl-c YES const(1);
dcl-c NO const(0);