**free
//----------------------------------------------------------
// Product(s): None.
//
// Copyright:
//  IBM Corp. - All rights reserved.
//  US Government Users Restricted Rights - Use, duplication or disclosure restricted by GSA ADP 
//  Schedule Contract with IBM Corp.
//  Licensed Materials-Property of IBM
//
// Header File Name: EKICONR
// Descriptive Name: PrintManager RPG Constants
// 
// Description: 
//  This copy file contains constants to be used by RPG applications using PrintManager.
// 
// Header Files Included: None.
//
// Macros List: None.
//
// Structure List: None.
// 
// Function Prototype List: None.
// 
// Change Activity: None.
//----------------------------------------------------------


//--------------------------------------
// Include guard
//--------------------------------------


/if defined(ekiconr)
  /eof 
/else
  /define ekiconr
/endif


//--------------------------------------
// Constants
//--------------------------------------


// General Use Constants
dcl-c TRUE        const(1);
dcl-c FALSE       const(0);
dcl-c NULL_HANDLE const(0);

// Option Value Types
dcl-c VALUE_BINARY      const(100);
dcl-c VALUE_STREAMLINE  const(101);

// Option Rule Types
dcl-c RULE_NO_VALUE const(0);
dcl-c RULE_STRING   const(1);
dcl-c RULE_RANGE    const(2);
dcl-c RULE_LIST     const(3);

// Print Descriptor and Group Control values
dcl-c ACTION_CREATE         const(10);
dcl-c ACTION_UPDATE         const(11);
dcl-c ACTION_GROUP          const(12);
dcl-c STATUS_AUTHORIZED     const(20);
dcl-c STATUS_NOT_AUTHORIZED const(21);
dcl-c DATE_AUTHORIZATION    const(30);
dcl-c DATE_NOT_AUTHAURIZED  const(31);

// Build Print Descriptor Constants
dcl-c BUILD_DESCRIPTOR    const(40);
dcl-c BUILD_NO_DESCRIPTOR const(41);
dcl-c DESCRIPTOR_USED     const(42);

// Print Descriptor Search Control Constants
dcl-c SEARCH_ENABLED  const(50);
dcl-c SEARCH_DISABLED const(51);

// Print Descriptor File Format Identifiers
dcl-c FORMAT_NATIVE   const(20);
dcl-c FORMAT_CHANGED  const(21);

// Continue flag values
dcl-c CONTINUE_OFF  const(0);

// Miscellaneous Constants
dcl-c DESCRIPTOR_LENGTH const(63);
dcl-c TEMPLATE_LENGTH   const(32);
dcl-c NAME_LENGTH       const(72);
dcl-c MAX_NAME_LENGTH   const(31);
dcl-c MAX_ERROR_LENGTH  const(255);
dcl-c MIN_STEP_LEVEL    const(1);
dcl-c MAX_STEP_LEVEL    const(32767);
dcl-c MIN_PROCESS       const(0);
dcl-c MAX_PROCESS       const(10);
dcl-c MAX_NAMES         const(24);