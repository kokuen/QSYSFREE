**free
//----------------------------------------------------------
// All original rights and credits goes to IBM.
//
// Header File Name: EAUTH1
// Descriptive Name: Additional Authentication Exit Program
// 
// Description: The Additional Authentication exit program provides notification when a user is
//  being authenticated.           
// 
// Header Files Included: None.
// Macros List: None.
// Structure List: Qsy_Authentication_Info_t
// Function Prototype List: None.
//----------------------------------------------------------


/if defined(eauth1)
  /eof
/else
  /define eauth1
/endif


//--------------------------------------
// Data structures
//--------------------------------------


dcl-ds QsyCallingInfo qualified;
  profileType int(10);
  profileTokenType char(1);
end-ds;

dcl-ds QsyAuthenticationCallerIn qualified;
  remotePort int(10);
  localPort int(10);
  remoteIPAddressLength int(10);
  localIPAddressLength int(10);
  remoteIPAddress char(46);
  localIPAddress char(46);
  verificationId char(30);
  *n char(2) inz(x'00'); // Reserved by the system
  authenticationType int(10); 
  // callingInfo char(5);
  callingInterface int(10);
  profileTokenType char(1);
end-ds;

dcl-ds QsyAuthenticationInfo qualified;
  exitPointName char(20);
  exitPointFormat char(8);
  userProfile char(10);
  *n char(2) inz(x'00'); // Reserved by the system
  offseToAdditionalFactor int(10);
  AdditionalFactorLength int(10);
  AdditionalFactorCCSID int(10);
  // char(149) Authentication Caller
  remotePort int(10);
  localPort int(10);
  remoteIPAddressLength int(10);
  localIPAddressLength int(10);
  remoteIPAddress char(46);
  localIPAddress char(46);
  verificationId char(30);
  *n char(2) inz(x'00'); // Reserved by the system
  authenticationIndicator int(10);
  // callingInfo char(5);
  callingInterface int(10);
  profileTokenType char(1);
  // additionalFactor char(*)
end-ds;


//--------------------------------------
// Special values
//--------------------------------------


dcl-enum profile_type qualified;
  UNDEFINED 0;
  SIGNON_PASSWORD 1;
  GENERATE_TOKEN_PASSWORD 2;
  GENERATE_TOKEN_SPECIAL_VALUE 3;
  PROFILE_HANDLE_PASSWORD 4;
  PROFILE_HANDLE_SPECIAL_VALUE 5;
  NETSERVER 6;
end-enum;

dcl-enum token_type qualified;
  NOT_GENERATE *blank;
  SINGLE_USE '1';
  MULTI_USE '2';
  MULTI_USE_REGEN '3';
end-enum;

dcl-enum authentication_type qualified;
  UNDEFINED 0;
  KERBEROS 1;
  SSH_KEY 2;
  USER_MAPPED_TOKEN 3;
  APPLICATION_AUTH 4;
end-enum;
