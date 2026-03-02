**free
//----------------------------------------------------------
// Product(s):
//  5761-SS1
//
// Copyright:
//  Copyright IBM Corp. 2007, 2008 - All rights reserved.
//  US Government Users Restricted Rights - Use, duplication or disclosure restricted by GSA ADP 
//  Schedule Contract with IBM Corp.
//  Licensed Materials-Property of IBM
//
// Header File Name: FCNTL
// Descriptive Name: File System File Control Definitions
// 
// Description:
//  File system file control definitions.
// 
// Header Files Included: None.
// 
// Macros List: None.
// 
// Structure List:
//  flock_t
//  flock64_t
// 
// Function Prototype List:
//  creat
//  open
//  QlgCreat
//  QlgOpen
//  Qp0lOpen
// 
// Change Activity:
//  N/A 2007-08-30  V6R1  New Include
//----------------------------------------------------------


//--------------------------------------
// Include guard
//--------------------------------------


/if defined(qibm_fcntl_included)
  /eof
/else
  /define qibm_fcntl_included
/endif

/copy QSYSINC/QRPGLESRC,SYSTYPES
/copy QSYSINC/QRPGLESRC,SYSSTAT


//--------------------------------------
// Prototypes
//--------------------------------------


dcl-pr Creat  int(10) extproc(*cwiden: CREAT_FUNCTION);
  path  *             value options(*string);
  mode  like(mode_t)  value;
end-pr creat;

dcl-pr Open int(10) extproc(*cwiden: OPEN_FUNCTION);
  path                          *             value options(*string);
  openFlag                      int(10)       value;
  mode                          like(mode_t)  value options(*nopass);
  conversionID                  uns(10)       value options(*nopass);
  textFileCreationConversionID  uns(10)       value options(*nopass);
end-pr Open;

dcl-pr Creat_Large int(10) extproc(*cwiden: CREAT_LARGE_FUNCTION);
  Path  likeds(Qlg_Path_Name_T) const;
  mode  like(mode_t)            value;
end-pr Creat_Large;

dcl-pr Open_Large int(10) extproc(*cwiden: OPEN_LARGE_FUNCTION);
  Path                          likeds(Qlg_Path_Name_T) const;
  oflag                         int(10)                 value;
  mode                          like(mode_t)            value options(*nopass);
  conversionID                  uns(10)                 value options(*nopass);
  textFileCreationConversionID  uns(10)                 value options(*nopass);
end-pr Open_Large;

dcl-pr Open_0l extproc(*cwiden: OPEN_0L_FUNCTION);
  path                      likeds(Qlg_Path_Name_T) const;
  oflag                     int(10)                 value;
  mode                      like(mode_t)            value options(*nopass);
  conversion_id             uns(10)                 value options(*nopass);
  text_file_creation_CCSID  uns(10)                 value options(*nopass);
end-pr Qp0lOpen;


//--------------------------------------
// Data structures
//--------------------------------------


// flock structure
/if defined(*v6r1m0)
  dcl-ds flock_t  qualified align template;
/else
  dcl-ds flock_t  qualified align based(QIBM_TEMPLATE);
/endif
    l_type    int(5);
    l_whence  int(5);
    l_start   like(off_t);
    l_len     like(off_t);
    l_pid     like(pid_t);
    /if defined(LARGE_FILES)
      *n      char(4) inz(*allx('00'));
    /endif
    *n        * inz(*null);
    *n        * inz(*null);
  end-ds flock_t;

// flock64 structure
/if defined(LARGE_FILES)
  /if defined(*v6r1m0)
    dcl-ds flock64_t qualified align template;
  /else
    dcl-ds flock64_t qualified align based(QIBM_TEMPLATE);
  /endif
      l_type    int(5);
      l_whence  int(5);
      *n        char(4)       inz(*allx('00'));
      l_start   like(off64_t);
      l_len     like(off64_t);
      l_pid     like(pid_t);
      *n        char(4);
      *n        *             inz(*null);
      *n        *             inz(*null);
    end-ds flock64_t;
/endif


//--------------------------------------
// Special values
//--------------------------------------


// External C functions to associate with local prototypes
/if defined(LARGE_FILES)
  dcl-c CREAT_FUNCTION        const('creat64');
  dcl-c OPEN_FUNCTION         const('open64');
  dcl-c CREAT_LARGE_FUNCTION  const('QlgCreat64');
  dcl-c OPEN_LARGE_FUNCTION   const('QlgOpen64');
  dcl-c OPEN_0L_FUNCTION      const('Qp0lOpen64');
/else
  dcl-c CREAT_FUNCTION        const('creat');
  dcl-c OPEN_FUNCTION         const('open');
  dcl-c CREAT_LARGE_FUNCTION  const('QlgCreat');
  dcl-c OPEN_LARGE_FUNCTION   const('QlgOpen');
  dcl-c OPEN_0L_FUNCTION      const('Qp0lOpen');
/endif

//----------------------------

// File descriptor
dcl-c FILE_DESCRIPTOR_DUPLICATE         const(0);
dcl-c FILE_DESCRIPTOR_GET_FLAGS         const(1);
dcl-c FILE_DESCRIPTOR_SET_FLAGS         const(2);
dcl-c FILE_DESCRIPTOR_CLOSE_ON_EXECUTE  const(1);

//----------------------------

// Locking information
/if not defined(LARGE_FILES)
  dcl-c LOCKING_INFORMATION_GET       const(3);
  dcl-c LOCKING_INFORMATION_SET       const(4);
  dcl-c LOCKING_INFORMATION_SET_WAIT  const(5);
/else
  dcl-c LOCKING_INFORMATION_GET       const(12);
  dcl-c LOCKING_INFORMATION_SET       const(13);
  dcl-c LOCKING_INFORMATION_SET_WAIT  const(14);
/endif

dcl-c LOCKING_INFORMATION_GET64       const(12);
dcl-c LOCKING_INFORMATION_SET64       const(13);
dcl-c LOCKING_INFORMATION_SET_WAIT64  const(14);

//----------------------------

// File status flags
dcl-c FILE_STATUS_FLAGS_GET const(6);
dcl-c FILE_STATUS_FLAGS_SET const(7);

//----------------------------

// Process/group owner
dcl-c OWNER_GET const(8);
dcl-c OWNER_SET const(9);

//----------------------------

// File access modes for open()
dcl-c OPEN_READ_ONLY  const(1);
dcl-c OPEN_WRITE_ONLY const(2);
dcl-c OPEN_READ_WRITE const(4);

//----------------------------

// Mask for use with File Access Modes
dcl-c ACCESS_MODE_MASK  const(%BITOR(OPEN_READ_ONLY: %BITOR(OPEN_WRITE_ONLY: OPEN_READ_WRITE)));

//----------------------------

// oflag Values for open()
dcl-c OPEN_CREATE     const(8);
dcl-c OPEN_EXCLUSIVE  const(16);
dcl-c OPEN_TRUNCATE   const(64);
dcl-c OPEN_NO_CONTROL const(32768);

//----------------------------

// File status flags for open() and fcntl()
dcl-c OPEN_NON_BLOCKING       const(128);
dcl-c OPEN_APPEND             const(256);
dcl-c OPEN_LARGE_FILE         const(536870912);
dcl-c OPEN_SYNCHRONOUS_WRITE  const(1024);
dcl-c OPEN_DATA_SYNCHRONOUS   const(2048);
dcl-c OPEN_READ_SYNCHRONOUS   const(4096);
dcl-c OPEN_NO_DELAY           const(128);
dcl-c FILE_NO_DELAY           const(128);
dcl-c FILE_ASYNC_IO           const(512);
dcl-c OPEN_CODE_PAGE          const(8388608);
dcl-c OPEN_TEXT_DATA          const(16777216);
dcl-c OPEN_INHERIT_MODE       const(134217728);
dcl-c OPEN_CCSID              const(32);
dcl-c OPEN_TEXT_CREATE        const(33554432);

//----------------------------

// oflag Share Mode Values for open()
dcl-c OPEN_SHARE_READ_ONLY  const(65536);
dcl-c OPEN_SHARE_WRITE_ONLY const(131072);
dcl-c OPEN_SHARE_READ_WRITE const(262144);
dcl-c OPEN_SHARE_NONE       const(524288);

//----------------------------

// Constants for l_type in flock structure
dcl-c LOCK_READ   const(1);
dcl-c LOCK_WRITE  const(2);
dcl-c LOCK_UNLOCK const(3);