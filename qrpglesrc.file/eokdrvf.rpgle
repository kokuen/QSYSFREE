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
// Header File Name: H/EOKDRVF
// Descriptive Name: Directory Verification Exit Program.
// 
// Description:
//  The verifcation program allows the administrator to define additional security or syntax 
//  checking on the data.
// 
// Header Files Included:
//  h/eok
// 
// Macros List: None.
// 
// Structure List:
//  Qok_Chkp_CHKP0100_t
//  Qok_Chkp_CHKP0200_t
//  Qok_Chkp_CHKP0300_t
// 
// Function Prototype List: None.
// 
// Change Activity:
//  D2862000, V3R1, 1994-04-15: New Include
//  D95344.2, V4R2, 1997-03-31: Add new SDD field for Allow Synchronization in the reserved 1-char  
//    area before the User Def. Field information in the EOKP0100 structure.
//    This is XPF OK support for NTSI D95046.
//  D94424.1, V4R3, 1997-08-04: Add new SDD field for DLO Owner in the SUPP0100 format after the 
//    Number UserDef Fields field.
//----------------------------------------------------------


//--------------------------------------
// Include guard
//--------------------------------------


/if defined(eokdrvf)
  /eof 
/else
  /define eokdrvf
/endif


//--------------------------------------
// Data structures
//--------------------------------------


// Stucture for Directory Entry Format 0100
dcl-ds Qok_Chkp_CHKP0100_t qualified;
  userIDAddress             char(16);
  systemNameGroup           char(16);
  userProfile               char(10);
  networkUserID             char(47);
  newUserIDAddress          char(16);
  oldUserToForward          char(16);
  indirectUser              ind;
  printPersonMail           ind;
  *n                        char(3)     inz(x'00'); // Reserved by the system
  description               char(50);
  characterSet01            int(10);
  codePage01                int(10);
  lastName                  char(40);
  characterSet02            int(10);
  codePage02                int(10);
  firstName                 char(20);
  characterSet03            int(10);
  codePage03                int(10);
  middleMame                char(20);
  characterSet04            int(10);
  codePage04                int(10);
  preferredName             char(20);
  characterSet05            int(10);
  codePage05                int(10);
  *n                        char(2)     inz(x'00'); // Reserved by the system
  fullName                  char(50);
  characterSet06            int(10);
  codePage06                int(10);
  *n                        char(2)     inz(x'00'); // Reserved by the system
  department                char(10);
  characterSet07            int(10);
  codePage07                int(10);
  *n                        char(2)     inz(x'00'); // Reserved by the system
  jobTitle                  char(50);
  characterSet08            int(10);
  codePage08                int(10);
  *n                        char(2)     inz(x'00'); // Reserved by the system
  company                   char(50);
  characterSet09            int(10);
  codePage09                int(10);
  *n                        char(2)     inz(x'00'); // Reserved by the system
  telephoneNumber01         char(26);
  characterSet10            int(10);
  codePage10                int(10);
  *n                        char(2)     inz(x'00'); // Reserved by the system
  telephoneNumber02         char(26);
  characterSet11            int(10);
  codePage11                int(10);
  location                  char(40);
  characterSet12            int(10);
  codePage12                int(10);
  building                  char(20);
  characterSet13            int(10);
  codePage13                int(10);
  office                    char(16);
  characterSet14            int(10);
  codePage14                int(10);
  mailingAddress01          char(40);
  characterSet15            int(10);
  codePage15                int(10);
  mailingAddress02          char(40);
  characterSet16            int(10);
  codePage16                int(10);
  mailingAddress03          char(40);
  characterSet17            int(10);
  codePage17                int(10);
  mailingAddress04          char(40);
  characterSet18            int(10);
  codePage18                int(10);
  *n                        char(2)     inz(x'00'); // Reserved by the system
  text                      char(50);
  characterSet19            int(10);
  codePage19                int(10);
  printCoverPage            ind;
  mailNotification          ind;
  X400Country               char(3);
  X400AdminDomain           char(16);
  X400PrivateDomain         char(16);
  X400Organisation          char(64);
  X400Surname               char(40);
  X400GivenName             char(16);
  X400Initials              char(5);
  X400GenerationQualifier   char(3);
  X400OrgUnit1              char(32);
  X400OrgUnit2              char(32);
  X400OrgUnit3              char(32);
  X400OrgUnit4              char(32);
  X400DomainAttributeType1  char(8);
  X400DomainAttributeValue1 char(128);
  X400DomainAttributeType2  char(8);
  X400DomainAttributeValue2 char(128);
  X400DomainAttributeType3  char(8);
  X400DomainAttributeValue3 char(128);
  X400DomainAttributeType4  char(8);
  X400DomainAttributeValue4 char(128);
  *n                        char(3)     inz(x'00'); // Reserved by the system
  faxTelephoneNumber        char(32);
  characterSet20            int(10);
  codePage20                int(10);
  mailServiceLevel          char(17);
  preferredAddress          char(29);
  CCAddress                 char(255);
  CCComment                 char(126);
  allowSynchronization      ind;
  offsetUserDefFields       int(10);
  numberUserDefFields       int(10);
  DLOOwner                  char(10);
end-ds Qok_Chkp_CHKP0100_t;

// Stucture for Directory Entry Format 0200
dcl-ds Qok_Chkp_CHKP0200_t qualified;
  *n                    char(2)   inz(x'00'); // Reserved by the system
  department            char(10)
  characterSet01        int(10);
  codePage01            int(10);
  *n                    char(2)   inz(x'00'); // Reserved by the system
  Title                 char(50);
  characterSet02        int(10);
  codePage02            int(10);
  *n                    char(2)   inz(x'00'); // Reserved by the system
  reportsToDepartment   char(10);
  characterSet03        int(10);
  codePage03            int(10);
  managerUserIDAddress  char(16);
  *n                    char(2)   inz(x'00'); // Reserved by the system
  oldDepartment         char(10);
  characterSet04        int(10);
  codePage04            int(10);
end-ds Qok_Chkp_CHKP0200_t;

// Stucture for Directory Entry Format 0300
dcl-ds Qok_Chkp_CHKP0300_t qualified;
  location        char(40)
  characterSet01  int(10);
  codePage01      int(10);
  *n              char(2)   inz(x'00'); // Reserved by the system
  locationLine1   char(30);
  characterSet02  int(10);
  codePage02      int(10);
  *n              char(2)   inz(x'00'); // Reserved by the system
  locationLine2   char(30);
  characterSet03  int(10);
  codePage03      int(10);
  *n              char(2)   inz(x'00'); // Reserved by the system
  locationLine3   char(30);
  characterSet04  int(10);
  codePage04      int(10);
  *n              char(2)   inz(x'00'); // Reserved by the system
  locationLine4   char(30);
  characterSet05  int(10);
  codePage05      int(10);
  *n              char(2)   inz(x'00'); // Reserved by the system
  locationLine5   char(30);
  characterSet06  int(10);
  codePage06      int(10);
  *n              char(2)   inz(x'00'); // Reserved by the system
  locationLine6   char(30);
  characterSet07  int(10);
  codePage07      int(10);
  newLocation     char(40);
  characterSet08  int(10);
  codePage08      int(10);
  oldLocation     char(40);
  characterSet09  int(10);
  codePage09      int(10);
end-ds Qok_Chkp_CHKP0300_t;