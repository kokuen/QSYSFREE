**free
//----------------------------------------------------------
// Product(s):
//  5770-SS1
//
// Copyright:
//  Copyright IBM Corp. 2024, 2024 - All rights reserved.
//  US Government Users Restricted Rights - Use, duplication or disclosure restricted by GSA ADP 
//  Schedule Contract with IBM Corp.
//  Licensed Materials-Property of IBM
//
// Header File Name: H/EZBSHCEP
// Descriptive Name: Host Connection Server Exit Program Structure
// 
// Description:
//  This include defines the parameter structures for the exit point defined for the host
//  connection server.
// 
// Header Files Included:
//  ESOEXTPT
// 
// Macros List: None.
// 
// Structure List:
//  Qzso_Signon_Format_t
// 
// Function Prototype List: None.
// 
// Change Activity:
//  PPD00R51B	2023-08-24	V7R6	New Include
//----------------------------------------------------------


//--------------------------------------
// Include guard
//--------------------------------------


/if defined(ezbshcep)
  /eof 
/else
  /define ezbshcep
/endif


//--------------------------------------
// Imports
//--------------------------------------


/COPY QSYSINC/QRPGLESRC,ESOEXTPT





//--------------------------------------
// Data structures
//--------------------------------------


// Typedef for host connection server exit program structure
dcl-ds Qzbs_HostCnn_Format_t qualified;
   userProfile char(10);
   applicationName char(10);
   formatName char(8);
   requestedFunction int(10); 
   newConnectionServerType int(10); 
   clientAddressLength int(10);
   ClientAddress likeds(sockaddr_afinetx);
end-ds;


//--------------------------------------
// Special values
//--------------------------------------


// Application name constants
dcl-c HOST_CONNECTION_SERVER_ID const('*HOSTCNN  ');

// Format name constants
dcl-c HOST_CONNECTION_SERVER_FORMAT const('ZBSH0100');

// Function ID constants
dcl-c START_SERVER        const(x'4001');
dcl-c RETRIEVE_USER_INFO  const(x'4002');
dcl-c START_NEW_SERVER    const(x'4003');

// Server type constants
dcl-c CENTRAL_SERVER        const(x'E000');
dcl-c SQL_SERVER            const(x'E004');
dcl-c NATIVE_REQUEST_SERVER const(x'E005');
dcl-c RETRIEVE_OBJECT_INFO  const(x'E006');
dcl-c XA_TRANSACTION_SERVER const(x'E00A');
dcl-c DATA_QUEUE_SERVER     const(x'E007');
dcl-c FILE_SERVER           const(x'E002');
dcl-c NETWORK_PRINT_SERVER  const(x'E003');
dcl-c REMOTE_COMMAND_SERVER const(x'E008');
dcl-c SIGNON_SERVER         const(x'E009');