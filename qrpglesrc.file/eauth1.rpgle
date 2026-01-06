**free
//----------------------------------------------------------
// Product(s):
//  5770-SS1
//
// Copyright:
//  IBM Corp.  2024, 2024 - All rights reserved.
//  US Government Users Restricted Rights - Use, duplication or disclosure restricted by GSA ADP 
//  Schedule Contract with IBM Corp.
//  Licensed Materials-Property of IBM
// 
// Header File Name: EAUTH1
// Descriptive Name: Additional Authentication Exit Program
// 
// Description: 
//  The Additional Authentication exit program provides notification when a user is being 
//  authenticated.
// 
// Header Files Included: None.
// 
// Macros List: None.
// 
// Structure List:
//  Qsy_Authentication_Info_t
// 
// Function Prototype List: None.
// 
// Change Activity:
//  PPD0021TL 2023-08-06  V7R6  New Include
//----------------------------------------------------------


//--------------------------------------
// Include guard
//--------------------------------------


/if defined(eauth1)
  /eof
/else
  /define eauth1
/endif


//--------------------------------------
// Data structures
//--------------------------------------


// Type Definition for the authentication caller information.
dcl-ds QsyCallingInfo qualified;
  profileType       int(10);
  profileTokenType  char(1);
end-ds QsyCallingInfo;

dcl-ds QsyAuthenticationCallerIn qualified;
  remotePort            int(10);
  localPort             int(10);
  remoteIPAddressLength int(10);
  localIPAddressLength  int(10);
  remoteIPAddress       char(46);
  localIPAddress        char(46);
  verificationId        char(30);
  *n                    char(2)   inz(x'00'); // Reserved by the system
  authenticationType    int(10); 
  // callingInfo        char(5);
  callingInterface      int(10);
  profileTokenType      char(1);
end-ds QsyAuthenticationCallerIn;

// Type Definition for the Additional Authentication exit point information
dcl-ds Qsy_Authentication_Info_t qualified;
  exitPointName           char(20);
  exitPointFormat         char(8);
  userProfile             char(10);
  *n                      char(2)   inz(x'00'); // Reserved by the system
  offseToAdditionalFactor int(10);
  additionalFactorLength  int(10);
  additionalFactorCCSID   int(10);
  // authenticationCaller char(149) 
  remotePort              int(10);
  localPort               int(10);
  remoteIPAddressLength   int(10);
  localIPAddressLength    int(10);
  remoteIPAddress         char(46);
  localIPAddress          char(46);
  verificationId          char(30);
  *n                      char(2)   inz(x'00'); // Reserved by the system
  authenticationIndicator int(10);
  // callingInfo          char(5);
  callingInterface        int(10);
  profileTokenType        char(1);
  // additionalFactor     char(*)
end-ds Qsy_Authentication_Info_t;


//--------------------------------------
// Special values
//--------------------------------------


// QsyCallingInfo - "profileType" values
dcl-c PROFILE_UNDEFINED                     const(0);
dcl-c PROFILE_SIGNON_PASSWORD               const(1);
dcl-c PROFILE_GENERATE_TOKEN_PASSWORD       const(2);
dcl-c PROFILE_GENERATE_TOKEN_SPECIAL_VALUE  const(3);
dcl-c PROFILE_HANDLE_PASSWORD               const(4);
dcl-c PROFILE_HANDLE_SPECIAL_VALUE          const(5);
dcl-c PROFILE_NETSERVER                     const(6);

// QsyCallingInfo - "profileTokenType" values
dcl-c TOKLEN_NOT_GENERATE     const(*blank);
dcl-c TOKLEN_SINGLE_USE       const('1');
dcl-c TOKLEN_MULTI_USE        const('2');
dcl-c TOKLEN_MULTI_USE_REGEN  const('3');

// QsyAuthenticationCallerIn - "authenticationType" values
dcl-c AUTHENTICATION_UNDEFINED          const(0);
dcl-c AUTHENTICATION_KERBEROS           const(1);
dcl-c AUTHENTICATION_SSH_KEY            const(2);
dcl-c AUTHENTICATION_USER_MAPPED_TOKEN  const(3);
dcl-c AUTHENTICATION_APPLICATION_AUTH   const(4);
