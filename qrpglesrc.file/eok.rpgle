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
// Header File Name: H/EOK
// Descriptive Name: Office Exit Program Common Information.
// 
// Description:
//  This format used by both the Directory Supplier Exit Programs and Directory Verification Exit 
//  Programs.
// 
// Header Files Included: None.
// 
// Macros List: None.
// 
// Structure List:
//  Eok_Common_0100_t
//  Eok_Common_0200_t
//  Eok_Common_0300_t
//  Eok_User_Defined_t
// 
// Function Prototype List: None.
// 
// Change Activity:
//  D2862000, V3R1, 1994-04-22: New Common Include
//  D95344.2, V4R2, 1997-03-31: Add new SDD field for Allow Synchronization in the reserved 1-char 
//    area before the User Def. Field information in the EOKC0100 structure.
//  D94424.1, V4R3, 1997-08-04: Add new SDD field for the DLO Owner in the Common 0100 Format after
//    the EOKNUDF field.
//----------------------------------------------------------


//--------------------------------------
// Include guard
//--------------------------------------


/if defined(eok)
  /eof 
/else
  /define eok
/endif


//--------------------------------------
// Data structures
//--------------------------------------


// Format for the Common 0100 formats.
dcl-ds Eok_Common_0100_t qualified;
  userIDAddress char(16);
  systemNameGroup char(16);
  userProfile char(10);
  networkUserID char(47);
  newUserIDAddress char(16);
  oldUserToForward char(16);
  indirectUser char(1);
  printPersonMail char(1);
  *n char(3) inz(x'00');
  description char(50);
  characterSet01 int(10);
  codePage01 int(10);
  lastName char(40);
  characterSet02 int(10);
  codePage02 int(10);
  firstName char(20);
  characterSet03 int(10);
  codePage03 int(10);
  middleMame char(20);
  characterSet04 int(10);
  codePage04 int(10);
  preferredName char(20);
  characterSet05 int(10);
  codePage05 int(10);
  *n char(2) inz(x'00');
  fullName char(50);
  characterSet06 int(10);
  codePage06 int(10);
  *n char(2) inz(x'00');
  department char(10);
  characterSet07 int(10);
  codePage07 int(10);
  *n char(2) inz(x'00');
  jobTitle char(50);
  characterSet08 int(10);
  codePage08 int(10);
  *n char(2) inz(x'00');
  company char(50);
  characterSet09 int(10);
  codePage09 int(10);
  *n char(2) inz(x'00');
  telephoneNum01 char(26);
  characterSet10 int(10);
  codePage10 int(10);
  *n char(2) inz(x'00');
  telephoneNum02 char(26);
  characterSet11 int(10);
  codePage11 int(10);
  location char(40);
  characterSet12 int(10);
  codePage12 int(10);
  building char(20);
  characterSet13 int(10);
  codePage13 int(10);
  office char(16);
  characterSet14 int(10);
  codePage14 int(10);
  mailingAddr01 char(40);
  characterSet15 int(10);
  codePage15 int(10);
  mailingAddr02 char(40);
  characterSet16 int(10);
  codePage16 int(10);
  mailingAddr03 char(40);
  characterSet17 int(10);
  codePage17 int(10);
  mailingAddr04 char(40);
  characterSet18 int(10);
  codePage18 int(10);
  *n char(2) inz(x'00');
  text char(50);
  characterSet19 int(10);
  codePage19 int(10);
  printCoverPage char(1);
  mailNotification char(1);
  x400Country char(3);
  x400AdminDomain char(16);
  x400PrivateDomain char(16);
  x400Org char(64);
  x400Surname char(40);
  x400GivenName char(16);
  x400Initials char(5);
  x400GenerationQualifier char(3);
  x400OrgUnit1 char(32);
  x400OrgUnit2 char(32);
  x400OrgUnit3 char(32);
  x400OrgUnit4 char(32);
  x400DomainAttrType1 char(8);
  x400DomainAttrValue1 char(128);
  x400DomainAttrType2 char(8);
  x400DomainAttrValue2 char(128);
  x400DomainAttrType3 char(8);
  x400DomainAttrValue3 char(128);
  x400DomainAttrType4 char(8);
  x400DomainAttrValue4 char(128);
  *n char(3) inz(x'00');
  faxTelephoneNumber char(32);
  characterSet20 int(10);
  codePage20 int(10);
  mailServiceLvl char(17);
  preferredAddress char(29);
  CCAddress char(229);
  CCComment char(126);
  allowSynchronization char(1);
  offsetUserDefFields int(10);
  numberUserDefFields int(10);
  DLOOwner char(10);
end-ds;

// Format for the User Defined Fields.
dcl-ds Eok_User_Defined_t qualified;
  displayNextElement int(10);
  fieldName char(10);
  productID char(7);
  *n char(3) inz(x'00');
  characterSet int(10);
  codePage int(10);
  returnedFieldLength int(10);
  // returnedFieldValue char(1); // varying length
end-ds;

// Format for the Common 0200 formats.
dcl-ds Eok_Common_0200_t qualified;
  *n char(2) inz(x'00');
  department char(10);
  characterSet01 int(10);
  codePage01 int(10);
  *n char(2) inz(x'00');
  title char(50);
  characterSet02 int(10);
  codePage02 int(10);
  *n char(2) inz(x'00');
  reportsToDepartment
  characterSet03 int(10);
  codePage03 int(10);
  managerUserIDAddress char(16);
  *n char(2) inz(x'00');
  oldDepartment char(10);
  characterSet04 int(10);
  codePage04 int(10);
end-ds;

// Format for the Common 0300 formats.
dcl-ds Eok_Common_0300_t qualified;
  location char(40);
  characterSet01 int(10);
  codePage01 int(10);
  *n char(2) inz(x'00');
  locationLine1 char(30);
  characterSet02 int(10);
  codePage02 int(10);
  *n char(2) inz(x'00');
  locationLine2 char(30);
  characterSet03 int(10);
  codePage03 int(10);
  *n char(2) inz(x'00');
  locationLine3 char(30);
  characterSet04 int(10);
  codePage04 int(10);
  *n char(2) inz(x'00');
  locationLine4 char(30);
  characterSet05 int(10);
  codePage05 int(10);
  *n char(2) inz(x'00');
  locationLine5 char(30);
  characterSet06 int(10);
  codePage06 int(10);
  *n char(2) inz(x'00');
  locationLine6 char(30); 
  characterSet07 int(10);
  codePage07 int(10);
  locationChangedTo char(40);
  characterSet08 int(10);
  codePage08 int(10);
  oldLocation char(40);
  characterSet09 int(10);
  codePage09 int(10);
end-ds;