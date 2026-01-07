**free
//----------------------------------------------------------
// Product(s):
//  5770-SS1
//
// Copyright:
//  IBM Corp.  2016, 2009 - All rights reserved.
//  US Government Users Restricted Rights - Use, duplication or disclosure restricted by GSA ADP 
//  Schedule Contract with IBM Corp.
//  Licensed Materials-Property of IBM
//
// Header File Name: H/ESOEXTPT
// Descriptive Name: Sockets APIs exit program structures  
// 
// Description:
//  This include defines the parameter structures for the exit points:
//  QIBM_QSO_ACCEPT format ACPT0100
//  QIBM_QSO_CONNECT format CONN0100
//  QIBM_QSO_LISTEN format LSTN0100
// 
// Header Files Included: None.
// 
// Macros List: None.
// 
// Structure List:
//  Qso_ACPT0100_Format_t
//  Qso_CONN0100_Format_t
//  Qso_LSTN0100_Format_t
// 
// Function Prototype List: None.
// 
// Change Activity:
//  D92194  2008-08-07  V7R1  New Include
//  SE64598 2016-04-06  V7R2  Update structures
//----------------------------------------------------------


//--------------------------------------
// Include guard
//--------------------------------------


/if defined(qibm_esoextpt_included)
  /eof 
/else
  /define qibm_esoextpt_included
/endif


//--------------------------------------
// Data structures
//--------------------------------------


// Internet address
/if defined(*V6R1M0)
  dcl-ds in_addr qualified align template;
/else
  dcl-ds in_addr qualified align based(qibm_template);
/endif
    IPAddress  uns(10);
  end-ds in_addr;


/if defined(*V6R1M0)
  dcl-ds u6_addr qualified align template;
/else
  dcl-ds u6_addr qualified align based(qibm_template);
/endif
    IPv6_32 uns(10)   dim(4)  overlay(u6_addr);
    IPv6_16 uns(5)    dim(8)  overlay(u6_addr);
    IPv6_8  char(16)          overlay(u6_addr);
  end-ds u6_addr;


/if defined(*V6R1M0)
  dcl-ds in6_addr qualified align template;
/else
  dcl-ds in_addr qualified align based(qibm_template);
/endif
    IPv6Address likeds(u6_addr);
  end-ds in6_addr;


// Socket address (internet)
/if defined(*V6R1M0)
  dcl-ds sockaddr_in qualified align template;
/else
  dcl-ds sockaddr_in qualified align based(qibm_template);
/endif
    addressFamily uns(5);
    portNumber    uns(5);
    IPAddress     likeds(in_addr);
    *n            char(8) inz(*allx'00'); // Reserved by the system      
  end-ds sockaddr_in;


/if defined(*V6R1M0)
  dcl-ds sockaddr_in6 qualified align template;
/else
  dcl-ds sockaddr_in6 qualified align based(qibm_template);
/endif
    addressFamily         uns(5);
    portNumber            uns(5);
    flowInformation       uns(10);
    IPv6Address           likeds(in6_addr);
    scopeInterfacesSetID  uns(10);
end-ds sockaddr_in6;


/if defined(*V6R1M0)
  dcl-ds sockaddr_afinetx qualified align template;
/else
  dcl-ds sockaddr_afinetx qualified align based(qibm_template);
/endif
    socketAddress   likeds(sockaddr_in)   overlay(sockaddr_afinetx);
    socketAddressv6 likeds(sockaddr_in6)  overlay(sockaddr_afinetx);
  end-ds sockaddr_afinetx;


// Typedef for exit program input structures
/if defined(*V6R1M0)
  dcl-ds Qso_ACPT0100_Format_t qualified template;
/else
  dcl-ds Qso_ACPT0100_Format_t qualified based(qibm_template);
/endif
    localBoundAddressLength     int(10);
    localBoundAddress           likeds(sockaddr_afinetx); // Address of listening socket
    localIncomingAddressLength  int(10);
    localIncomingAddress        likeds(sockaddr_afinetx); // Address connection came in on
    remoteAddressLength         int(10);
    remoteAddress               likeds(sockaddr_afinetx); // Address the connection came from
  end-ds Qso_ACPT0100_Format_t;


/if defined(*V6R1M0)
  dcl-ds Qso_CONN0100_Format_t qualified template;
/else
  dcl-ds Qso_CONN0100_Format_t qualified based(qibm_template);
/endif
    localAddressLength        int(10);
    localAddress              likeds(sockaddr_afinetx); // Address of the socket connecting
    destinationAddressLength  int(10);
    destinationAddress        likeds(sockaddr_afinetx); // Destination Address of the connection
  end-ds Qso_CONN0100_Format_t;


/if defined(*V6R1M0)
  dcl-ds Qso_LSTN0100_Format_t qualified template;
/else
  dcl-ds Qso_LSTN0100_Format_t qualified based(qibm_template);
/endif
    backlog             int(10);                  // Listen backlog queue size
    localAddressLength  int(10);
    localAddress        likeds(sockaddr_afinetx); // Address of the listening socket
  end-ds Qso_LSTN0100_Format_t;