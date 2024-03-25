**free
// +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
/// @title MEDIA
/// @info All medias related API resources
///
/// @project QAPIFREE
/// @author kokuen
/// @version 7.1
// +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++




// +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// Exports & Imports
// +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++




/IF not defined(shared_resources)
  /INCLUDE SHARED,RESOURCES
/ENDIF

/IF not defined(qusec)
  /INCLUDE SHARED,QUSEC
/ENDIF

// -----------------

/IF defined(qtacjma)
  /EOF
/ELSEIF defined(qsrcrtmd)
  /EOF
/ELSEIF defined(qsrdltmd)
  /EOF
/ELSEIF defined(qtarjma)
  /EOF
/ELSEIF defined(qsrrtvmd)
  /EOF
/ELSE
  /DEFINE medias_apis
/ENDIF




// +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// Prototypes
// +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


/// @info The Change Job Media Library Attributes (QTACJMA) API changes the specified job's settings for the media
/// library attributes.
/// @link https://www.ibm.com/docs/en/i/7.1?topic=ssw_ibm_i_71/apis/qtacjma.html
/// @param The media library attributes.
///   @use "CJMA0100"
/// @param The length of the media library attributes description, in bytes.
/// @param The name of the format in which to return the backup schedule.
///   @usestrict "CJMA_0100"
/// @param The name of the job for which information is to be changed.
///   @use "JOB_CURRENT", "JOB_INTERNAL"
/// @param The internal identifier for the job.
/// @param The structure in which to return error information.
///   @usestrict "ERRC0100", "ERRC0200"
dcl-pr QTACJMA extpgm('QTACJMA');
  inputStructure char(INT10_MAX) options(*varsize) const;
  inputLength int(10) const;
  inputFormat char(8) const;
  qualifiedJobName char(26) const;
  internalJobIdentifier char(16) const;
  errorCode char(INT5_MAX) options(*varsize);
end-pr;


/// @info The Create Media Definition (OPM, QSRCRTMD; ILE, QsrCreateMediaDefinition) API creates a media definition
/// specified by the user.
/// @link https://www.ibm.com/docs/en/i/7.1?topic=ssw_ibm_i_71/apis/qsrcrtmd.html
/// @param The media definition to be created.
/// @param The variable that is to holding the information defining the use of multiple tape files.
///   @use "TAPE0100_CreationHeader", "TAPE0200_CreationHeader"
/// @param The length of the data in the "inputStructure" parameter.
/// @param The name of the format for input data.
///   @usestrict "TAPE_0100", "TAPE_0200"
/// @param The authority you give to users without specific private or group authority to the media definition.
/// @param A brief description of the media definition.
/// @param Whether you want to replace an existing media definition.
/// @param The structure in which to return error information.
///   @usestrict "ERRC0100", "ERRC0200"
dcl-pr QSRCRTMD extpgm('QSRCRTMD');
  qualifiedMediaName char(20) const options(*varsize);
  inputStructure char(INT10_MAX) const options(*varsize);
  inputLength int(10) const;
  inputFormat char(8) const;
  publicAuthority char(10) const;
  description char(50) const options(*varsize);
  replace ind const;
  errorCode char(INT5_MAX) options(*varsize);
end-pr;


/// @info The Delete Media Definition API deletes a media definition specified by the user.
/// @link https://www.ibm.com/docs/en/i/7.1?topic=ssw_ibm_i_71/apis/qsrdltmd.html
/// @param The media definition to be deleted. The first 10 characters contain the media definition name. The second 10
///   characters contain the name of the library in which the media definition is located.
/// @param The structure in which to return error information.
///   @usestrict "ERRC0100", "ERRC0200"
dcl-pr QSRDLTMD extpgm('QSRDLTMD');
  qualifiedMediaDefinitionName char(20) const;
  errorCode char(INT5_MAX) options(*varsize);
end-pr;


/// @info The Retrieve Job Media Library Attributes (QTARJMA) API retrieves the specified job's current settings for the
/// media library attributes. 
/// @link https://www.ibm.com/docs/en/i/7.1?topic=ssw_ibm_i_71/apis/qtarjma.html
/// @param The variable that is to receive the information requested.
/// @param The length of the receiver variable.
/// @param The format name RJMA0100 is the only valid format name used by this API.
///   @usestrict "RJMA_0100"
/// @param The qualified job name has three parts: Job name(10), User name(10), Job number(6).
///   @use "JOB_CURRENT", "JOB_INTERNAL"
/// @param The internal identifier for the job. With this parameter, the system can locate the job more quickly than
/// with a job name.
/// @param The structure in which to return error information.
///   @usestrict "ERRC0100", "ERRC0200"
dcl-pr QTARJMA extpgm('QTARJMA');
  outputStructure char(INT10_MAX) options(*varsize);
  outputLength int(10) const;
  outputFormat char(8) const;
  qualifiedJobName char(26) const;
  internalJobID char(16) const;
  errorCode char(INT5_MAX) options(*varsize);
end-pr;


/// @info The Retrieve Media Definition API retrieves a media definition specified by the user.  
/// @link https://www.ibm.com/docs/en/i/7.1?topic=ssw_ibm_i_71/apis/qsrrtvmd.html
/// @param The media definition to be retrieved. The first 10 characters contain the media definition name.
/// The second 10 characters contain the name of the library in which the media definition is located.
/// @param The variable that is to hold all the information defining the use of multiple tape files for a save or 
/// restore operation.
///   @use "MDFN0100", "TAPE0100_header_retrieve", "TAPE0200_header"
/// @param The length of the receiver variable provided.
/// @param The name of the format for the receiver variable.
///   @usestrict "MDFN_0100", "TAPE_0100", "TAPE_0200"
/// @param The structure in which to return error information.
///   @usestrict "ERRC0100", "ERRC0200"
dcl-pr QSRRTVMD extpgm('QSRRTVMD');
    qualifiedMediaDefinitionName char(20) const;
    outputStructure char(INT10_MAX) options(*varsize);
    outputLength int(10) const;
    outputFormat char(8) const;
    errorCode char(INT5_MAX) options(*varsize);
end-pr;




// +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// Data Structures
// +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++




// ---------------------------------------------------------
// Shared data structures 
// ---------------------------------------------------------


/// @info Second level of the input/output of the QSRCRTMD and QSRRTVMD APIs when using the TAPE0100 format.
///   @usewith An array based on "TAPE0100_MediaFileDefinition"
/// @fields "offset[*]" The offset from the beginning of the output/input. This value must be a multiple of 4.
/// @field "*n" Ignored by the system.
/// @field "mediaFilesNumber" The possible values are 1 through 32.
dcl-ds TAPE0100_DeviceDefinition qualified inz;
  offsetToNextDefinition int(10);
  deviceName char(10);
  *n char(2);
  offsetToFirstMediaFile int(10);
  mediaFilesNumber int(10);
end-ds;

/// @info Third level of the input/output of the QSRCRTMD and QSRRTVMD APIs when using the TAPE0100 format.
///   @usewith An array of volume IDs.
/// @fields "offset[*]" The offset from the beginning of the output/input. This value must be a multiple of 4.
/// @field "volumeIDsNumber" The possible values are 0 through 75.
/// @field "volumeIDsLength" The possible values are 0 through 6.
dcl-ds TAPE0100_MediaFileDefinition qualified inz;
  offsetToNextDefinition int(10);
  sequenceNumber int(10);
  offsetToVolumeIDsArray int(10);
  volumeIDsNumber int(10);
  volumeIDsLength int(10);
  volumeArrayStartingElement int(10);
end-ds;

/// @info Second level of the input/output of the QSRCRTMD and QSRRTVMD APIs when using the TAPE0200 format.
///   @usewith An array based on "TAPE0200_MediaFileDefinition"
dcl-ds TAPE0200_DeviceDefinition qualified inz;
  Device likeds(TAPE0100_DeviceDefinition);
  deviceLength int(10) inz(28);
end-ds;

/// @info Third level of the input/output of the QSRCRTMD and QSRRTVMD APIs when using the TAPE0200 format.
///   @usewith An array of volume IDs.
/// @field "mediaFileLength" The value must be 28 or 60.
dcl-ds TAPE0200_MediaFileDefinition qualified inz;
  MediaFile likeds(TAPE0100_mediaFile);
  mediaFileLength int(10);
  mediaFileStartingPosition char(32);
end-ds;


// ---------------------------------------------------------
// QTACJMA data structures 
// ---------------------------------------------------------


/// @info First level of the input structure used by the QTACJMA API.
///   @usewith An array based on "MediaLibraryDevice"
/// @field "option"
///   @usestrict "OPTION_CHANGE", "OPTION_REPLACE"
/// @field "*n" Reserved by the system
dcl-ds CJMA0100 qualified inz;
  option char(10);
  *n char(2);
  devicesNumber int(10);
end-ds;

/// @info Second level of the input structure used by the QTACJMA API.
/// @field "device"
///   @use "DEVICE_ALL", "DEVICE_DEFAULT"
/// @field "resourceAllocationPriority" Valid values range from 1 (highest) through 99 (lowest).
///   @use "PRIORITY_SAME", "PRIORITY_DEV", "PRIORITY_JOB"
/// @fields "[*]WaitTime" Valid values range from 1 through 600.
///   @use "WAIT_TIME_SAME", "WAIT_TIME_DEV", "WAIT_TIME_NOMAX", "WAIT_TIME_JOB", "WAIT_TIME_IMMED"
/// @fields "*n" Ignored by the system
dcl-ds MediaLibraryDevice qualified inz;
  device char(10);
  *n char(6);
  resourceAllocationPriority int(10);
  initialAmountWaitTime int(10);
  volumeMountEndWaitTime int(10);
  *n char(4);
end-ds;


// ---------------------------------------------------------
// QSRCRTMD data structures 
// ---------------------------------------------------------


/// @info Header of the input structure used by the QSRCRTMD API for the TAPE0100 format.
///   @usewith "TAPE0100_device"
/// @fields "*n" Ignored by the system.
/// @fields "[*]ParallelDevices" The possible values are 0 through 32.
/// @field "devicesNumber" The possible values are 1 through 32.
dcl-ds TAPE0100_CreationHeader qualified inz;
  *n int(10);
  *n int(10);
  maximumParallelDevices int(10);
  minimumParallelDevices int(10);
  offsetToFirstDevice int(10);
  devicesNumber int(10);  
end-ds;

/// @info Header of the input/output of the QSRRTVMD and QSRRTVMD APIs when using the TAPE0100 format.
///   @usewith An array based on "TAPE0200_deviceDefinition"
/// @field "deviceAllocation" When to allocate the tape devices.
///   @usestrict "ALLOCATE_ALL", "ALLOCATE_ONE", "ALLOCATE_MINIMUM"
/// @field "saveFormat" This field is ignored for restore operations.
///   @usestrict "FORMAT_AUTO", "FORMAT_SERIAL", "FORMAT_PARALLEL"
dcl-ds TAPE0200_CreationHeader qualified inz;
  Header likeds(TAPE0100_CreationHeader);
  headerLength int(10) inz(36);
  deviceAllocation int(10);
  saveFormat int(10);
end-ds;


// ---------------------------------------------------------
// QTARJMA data structures 
// ---------------------------------------------------------


/// @info First part of the output structure used by the QTARJMA API.
///   @usewith "DeviceEntry"
/// @field "*n" Ignored by the system.
dcl-ds RJMA0100 qualified inz;
  bytesReturned int(10);
  bytesAvailable int(10);
  deviceEntriesListOffset int(10);
  deviceEntriesNumber int(10);
  deviceEntryLength int(10);
  *n char(12);
end-ds;

/// @info Second part of the output structure used by the QTARJMA API.
/// @fields "*n" Ignored by the system.
dcl-ds DeviceEntry qualified inz;
  mediaLibraryDevice char(10);
  *n char(6);
  resourceAllocationPriority int(10);
  initialMountWaitTime int(10);
  mountEndWaitTime int(10);
  *n char(4);
end-ds;


// ---------------------------------------------------------
// QSRRTVMD data structures 
// ---------------------------------------------------------


/// @info Structure of the output of the QSRRTVMD API when using MDFN0100 format.
dcl-ds MDFN0100 qualified inz;
  bytesReturned int(10);
  bytesAvailable int(10);
  formatName char(8);
end-ds;

/// @info Header of the QSRRTVMD API output when using TAPE0100 format.
///   @usewith An array based on "TAPE0100_DeviceDefinition"
dcl-ds TAPE0100_RetrievingHeader qualified inz;
  bytesReturned int(10);
  bytesAvailable int(10);
  maximumParallelDevices int(10);
  minimumParallelDevices int(10);
  offsetToFirstDevice int(10);
  devicesNumber int(10);
end-ds;

/// @info Header of the QSRRTVMD API output when using TAPE0200 format.
///   @usewith An array based on "TAPE0200_deviceDefinition"
/// @field "deviceAllocation" When to allocate the tape devices.
///   @valuesstrict "ALLOCATE_ALL", "ALLOCATE_ONE", "ALLOCATE_MINIMUM"
/// @field "saveFormat" This field is ignored for restore operations.
///   @valuesstrict "FORMAT_AUTO", "FORMAT_SERIAL", "FORMAT_PARALLEL"
dcl-ds TAPE0200_RetrievingHeader qualified inz;
  Header likeds(TAPE0100_RetrievingHeader);
  headerLength int(10) inz(36);
  deviceAllocation int(10);
  saveFormat int(10);
end-ds;




// +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// Constants
// +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++




// ---------------------------------------------------------
// Formats names
// ---------------------------------------------------------
/// @const QTACJMA only format.
dcl-c CJMA_0100 const('CJMA0100');

/// @const QTARJMA only format.
dcl-c RJMA_0100 const('RJMA0100');

/// @const Tape devices and media.
dcl-c TAPE_0100 const('TAPE0100');
/// @const Tape devices and media (extended).
dcl-c TAPE_0200 const('TAPE0200');

/// @const Format name that was used to create the media definition.
dcl-c MDFN_0100 const('MDFN0100');


// ---------------------------------------------------------
// Shared special values
// ---------------------------------------------------------
/// @const The job that this program is running in. The rest of the qualified job name parameter must be blank.
dcl-c JOB_CURRENT const('*');
/// @const The internal job identifier locates the job. The user name and job number must be blank.
dcl-c JOB_INTERNAL const('*INT');


// ---------------------------------------------------------
// QTACJMA special values
// ---------------------------------------------------------
/// @const The attributes are changed/created using the device entries specified by input structure.
dcl-c OPTION_CHANGE const('*CHANGE');
/// @const The entire list of attributes are replaced by the ones specified by input structure.
dcl-c OPTION_REPLACE const('*REPLACE');

/// @const The attributes apply to all media libraries.
dcl-c DEVICE_ALL const('*ALL');
/// @const The attributes apply to all media libraries without specific attributes defined for the job.
dcl-c DEVICE_DEFAULT const('*DEFAULT');

/// @const The resource allocation priority will remain the same.
dcl-c PRIORITY_SAME const(-1);
/// @const The device priority will be used when the job requests a tape resource.
dcl-c PRIORITY_DEV const(-2);
/// @const The job's run-time priority will be used when the job requests a tape resource.
dcl-c PRIORITY_JOB const(-31);

/// @const The wait time will remain the same.
dcl-c WAIT_TIME_SAME const(-1);
/// @const The device wait time will be used.
dcl-c WAIT_TIME_DEV const(-2);
/// @const The job will wait until a resource becomes available.
dcl-c WAIT_TIME_NOMAX const(-8);
/// @const The job's default wait time will be used to calculate the wait time.
dcl-c WAIT_TIME_JOB const(-31);
/// @const The job will not wait for a resource to become available.
dcl-c WAIT_TIME_IMMED const(32);


// ---------------------------------------------------------
// QSRCRTMD special values
// ---------------------------------------------------------
/// @const The user can perform all authorized operations on the media definition.
dcl-c AUTHORITY_ALL const('*ALL');
/// @const The user has read, add, update, and delete authority for the media definition and can read the object
/// description.
dcl-c AUTHORITY_CHANGE const('*CHANGE');
/// @const The user cannot access the media definition in any way.
dcl-c AUTHORITY_EXCLUDE const('*EXCLUDE');
/// @const The public authority for the media definition is taken from the CRTAUT value for the target library when the 
/// object is created.
dcl-c AUTHORITY_LIBCRTAUT const('*LIBCRTAUT');
/// @const The user can read the object description and contents, but cannot change the media definition.
dcl-c AUTHORITY_USE const('*USE');

/// @const All tape devices are allocated at the beginning of the operation.
dcl-c ALLOCATE_ALL const(0);
/// @const One tape device is allocated at the beginning of a save operation.
dcl-c ALLOCATE_ONE const(1);
/// @const The number of devices specified for the Minimum parallel device resources field is allocated at the beginning
/// of a save operation.
dcl-c ALLOCATE_MINIMUM const(2);

/// @const If one library is saved, it is saved in parallel format. If more than one library is saved, all libraries are
/// saved in serial format.
dcl-c FORMAT_AUTO const(-2);
/// @const All data is saved in serial format.
dcl-c FORMAT_SERIAL const(-1);
/// @const All data is saved in parallel format.
dcl-c FORMAT_PARALLEL const(0);