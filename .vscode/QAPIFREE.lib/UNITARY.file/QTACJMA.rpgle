**free
// +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
/// @title QTACJMA
/// @info Change Job Media Library Attributes
///
/// @project QAPIFREE
/// @author kokuen
/// @version 7.1
// +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++




// +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// Exports & Imports
// +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
/IF defined(backup_recovery_apis)
  /EOF
/ELSE
  /DEFINE qtacjma
/ENDIF

/IF not defined(shared_resources)
  /INCLUDE SHARED,RESOURCES
/ENDIF

/IF not defined(qusec)
  /INCLUDE SHARED,QUSEC
/ENDIF




// +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// Constants
// +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++




// ---------------------------------------------------------
//  Formats names
// ---------------------------------------------------------
/// @const QTACJMA only format.
dcl-c FORMAT_CJMA0100 'CJMA0100';


// ---------------------------------------------------------
// Special values
// ---------------------------------------------------------
/// @const The media library attributes are changed by using the device entries specified in the media library
/// attributes description.
dcl-c OPTION_CHANGE '*CHANGE';
/// @const The entire list of media library attributes are replaced by the device entries specified in the media
/// library attributes description.
dcl-c OPTION_REPLACE '*REPLACE';

/// @const The attributes apply to all media libraries.
dcl-c DEVICE_ALL '*ALL';
/// @const The attributes apply to all media libraries that do not have specific attributes defined for the specified
/// job.
dcl-c DEVICE_DEFAULT '*DEFAULT';

/// @const The resource allocation priority will remain the same.
dcl-c PRIORITY_SAME -1;
/// @const The priority specified in the device description will be used when the job requests a tape resource.
dcl-c PRIORITY_DEV -2;
/// @const The specified job's run-time priority will be used for the resource allocation priority when the job requests
/// a tape resource.
dcl-c PRIORITY_JOB -31;

/// @const The wait time will remain the same.
dcl-c WAIT_TIME_SAME -1;
/// @const The wait time specified in the device description will be used.
dcl-c WAIT_TIME_DEV -2;
/// @const The specified job will wait until a resource becomes available.
dcl-c WAIT_TIME_NOMAX -8;
/// @const The specified job's default wait time will be used to calculate the wait time.
dcl-c WAIT_TIME_JOB -31;
/// @const The specified job will not wait for a resource to become available.
dcl-c WAIT_TIME_IMMED 32;




// +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// Data Structures
// +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++




dcl-ds CJMA_0100 qualified inz;
  option char(10);
  *n char(2); // Reserved by the system
  deviceEntriesNumber int(10);
  MediaLibraryAttributes likeds(MediaLibraryAttribute) dim(UNS3_MAX)
end-ds;

/// @field "resourceAllocationPriority" Valid values range from 1 (highest) through 99 (lowest).
/// @fields "[*]WaitTime" Valid values range from 1 through 600.
dcl-ds MediaLibraryAttribute qualified inz;
  device char(10);
  *n char(6); // Reserved by the system
  resourceAllocationPriority int(10);
  initialAmountWaitTime int(10);
  volumeMountEndWaitTime int(10);
  *n char(4); // Reserved by the system
end-ds;






// +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// Prototypes
// +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


/// @info The Change Job Media Library Attributes (QTACJMA) API changes the specified job's settings for the media
/// library attributes.
/// @link https://www.ibm.com/docs/en/i/7.1?topic=ssw_ibm_i_71/apis/qtacjma.html
/// @param The media library attributes.
/// @param The length of the media library attributes description, in bytes.
/// @param The name of the format in which to return the backup schedule. See FORMAT_CJMA0100.
/// @param The name of the job for which information is to be changed.
/// @param The internal identifier for the job.
/// @param The structure in which to return error information.
dcl-pr QTACJMA extpgm('QTACJMA');
  inputStructure char(INT10_MAX) options(*varsize) const;
  inputLength int(10) const;
  inputFormat char(8) const;
  qualifiedJobName char(26) const;
  internalJobIdentifier char(16) const;
  errorCode char(INT5_MAX) options(*varsize);
end-pr;