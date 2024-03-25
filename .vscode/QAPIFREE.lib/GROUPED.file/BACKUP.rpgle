**free
// +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// All backup related API resources
//
// QAPIFREE, by kokuen
// version 7.1
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

/IF defined(qezchbkl)
  /EOF
/ELSEIF defined(qezchbks)
  /EOF
/ELSEIF defined(qezolbkl)
  /EOF
/ELSEIF defined(qezrtbkd)
  /EOF
/ELSEIF defined(qezrtbkh)
  /EOF
/ELSEIF defined(qezrtbko)
  /EOF
/ELSEIF defined(qezrtbks)
  /EOF
/ELSEIF defined(qtacjma)
  /EOF
/ELSE
  /DEFINE backup_apis
/ENDIF




// +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// Constants
// +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++




// ---------------------------------------------------------
// Formats names
// ---------------------------------------------------------
// QEZCHBKS API formats
dcl-c CBKS_0100 const('CBKS0100');

// QEZOLBKL API formats
dcl-c OBKL_0100 const('OBKL0100');
dcl-c OBKL_0200 const('OBKL0200');
dcl-c OBKL_0600 const('OBKL0600');

// QEZRTBKD API formats
dcl-c RBKD_0100 const('RBKD0100');

// QEZRTBKH API formats
dcl-c RBKH_0100 const('RBKH0100');
dcl-c RBKH_0200 const('RBKH0200');

// QEZRTBKO API formats
dcl-c RBKO_HEADER const('RBOH0100');
dcl-c RBKO_0100 const('RBKO0100');
dcl-c RBKO_0200 const('RBKO0200');

// QEZRTBKS API formats
dcl-c RBKS_0100 const('RBKS0100');


// ---------------------------------------------------------
// APIs Shared special values
// ---------------------------------------------------------
// Object type special values
dcl-c OBJECT_FOLDER const('*FLR');
dcl-c OBJECT_LIBRARY const('*LIB');

// Backup frequency special values
dcl-c BACKUP_DAILY const('*DAILY');
dcl-c BACKUP_WEEKLY const('*WEEKLY');
dcl-c BACKUP_MONTHLY const('*MONTHLY');
dcl-c BACKUP_ALL const('*ALL');

// Week of month backup special values
dcl-c WEEKMONTH_SAME const(-1);
dcl-c WEEKMONTH_NONE const(*zeros);
dcl-c WEEKMONTH_LAST const(5);

// ---------------------------------------------------------
// QEZCHBKL special values
// ---------------------------------------------------------
// Backup schedule special values
dcl-c BACKUP_DAILY_SCHEDULE const(1);
dcl-c BACKUP_WEEKLY_SCHEDULE const(2);
dcl-c BACKUP_MONTHLY_SCHEDULE const(3);
dcl-c BACKUP_NONE_SCHEDULE const(4);


// ---------------------------------------------------------
// QEZCHBKS special values
// ---------------------------------------------------------
// Frequency special values
dcl-c FREQUENCE_DAILY const('1');
dcl-c FREQUENCE_WEEKLY const('2');
dcl-c FREQUENCE_MONTHLY const('3');
dcl-c FREQUENCE_WEEKMONTH const('4');
dcl-c FREQUENCE_SAME const('9');
dcl-c FREQUENCE_NONE const(*blank);

// Backup time special values
dcl-c TIME_NONE const(*blanks);
dcl-c TIME_SAME const('*SAME');

// Message hour special values
dcl-c HOURS_NONE const(0);
dcl-c HOURS_SAME const(-1);

// Schedule usage special values
dcl-c USE_NO const('0');
dcl-c USE_YES const('1');
dcl-c USE_SAME const(*blank);




// +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// Data Structures
// +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++




// ---------------------------------------------------------
// QEZCHBKL data structures 
// ---------------------------------------------------------
// Base structure used by the QEZCHBKL API
dcl-ds InputStructure qualified inz;
  recordsNumber int(10) inz(2);
  Records likeds(Record) dim(2);
end-ds;

// Record structure of the input structure used by the QEZCHBKL API
dcl-ds Record qualified template;
  recordLength int(10);
  Structures likeds(Structures);
  dataLength int(10);
  data char(INT10_MAX) options(*varsize);
end-ds;

//Structures linked to a record of the input structure used by the QEZCHBKL API
dcl-ds Structures qualified template;
  arraySize int(10);
  backupType char(1); // Use the "BACKUP_*_SCHEDULE" constants
  Names char(INT10_MAX) options(*varsize); // Library names are of type char(10) while folder names are of type char(12)
end-ds;


// ---------------------------------------------------------
// QEZCHBKS data structures 
// ---------------------------------------------------------
// Format CBKS0100 contains the information regarding changes to the Operational Assistant backup schedule
dcl-ds CBKS0100 qualified inz;
  hoursBeforeReminder int(10); // Use the "HOURS_*" constants
  backupWeekMonth int(10); // Use the "WEEKMONTH_*" constants
  useSchedule char(1); // Use the "USE_*" constants
  backupOnSunday char(1); // Use the "FREQUENCE_*" constants
  sundayBackupTime char(6); // Use the "TIME_*" constants
  backupOnMonday char(1); // Use the "FREQUENCE_*" constants
  mondayBackupTime char(6); // Use the "TIME_*" constants
  backupOnTuesday char(1); // Use the "FREQUENCE_*" constants
  tuesdayBackupTime char(6); // Use the "TIME_*" constants
  backupOnWednesday char(1); // Use the "FREQUENCE_*" constants
  wednesdayBackupTime char(6); // Use the "TIME_*" constants
  backupOnThursday char(1); // Use the "FREQUENCE_*" constants
  thursdayBackupTime char(6); // Use the "TIME_*" constants
  backupOnFriday char(1); // Use the "FREQUENCE_*" constants
  fridayBackupTime char(6); // Use the "TIME_*" constants
  backupOnSaturday char(1); // Use the "FREQUENCE_*" constants
  saturdayBackupTime char(6); // Use the "TIME_*" constants
end-ds;


// ---------------------------------------------------------
// QEZOLBKL data structures 
// ---------------------------------------------------------
//Informations about the list of objects that are to be backed up
dcl-ds ListInformation qualified inz;
  totalRecords int(10);
  recordsReturned int(10);
  requestHandle char(4);
  recordLength int(10);
  informationState char(1);
  creationDateTime char(13);
  listStatus char(1);
  *n char(1); // Reserved by the system
  outputLength int(10);
  firstBufferRecord int(10);
  userAuthority int(10);
  *n char(36); // Reserved by the system
end-ds;

// The OBKL0100 format includes the basic information for a library object entry
dcl-ds OBKL0100 qualified inz;
  backupOption char(10); // Use the "BACKUP_" constants
  libraryName char(10);
  *n char(2); // Reserved by the system
end-ds;

// The OBKL0200 format includes the basic information for a folder object entry
dcl-ds OBKL0200 qualified inz;
  backupOption char(10); // Use the "BACKUP_" constants
  folderName char(12);
end-ds;

// The OBKL0600 format that includes the complete information for a library object entry
dcl-ds OBKL0600_library qualified inz;
  Info likeds(OBKL0100);
  lastBackupDate char(7);
  lastBackupTIme char(6);
  objectDescription char(50);
  changedSinceLastBackup ind;
  *n char(21); // Reserved by the system
end-ds;

// The OBKL0600 format that includes the complete information for a folder object entry
dcl-ds OBKL0600_folder qualified inz;
  Info likeds(OBKL0200);
  lastBackupDate char(7);
  lastBackupTIme char(6);
  objectDescription char(50);
  changedSinceLastBackup ind;
  *n char(21); // Reserved by the system
end-ds;


// ---------------------------------------------------------
// QEZRTBKD data structures 
// ---------------------------------------------------------
// Structure of the output of the QEZRTBKD API.
dcl-ds RBKD0100 qualified inz;
  bytesAvailable int(10);
  bytesReturned int(10);
  lastSavedDate char(7); // CYYMMDD date format
  lastSavedTime char(6);
  objectDescription char(50);
  changedSinceLastBackup ind;
end-ds;


// ---------------------------------------------------------
// QEZRTBKH data structures 
// ---------------------------------------------------------
// Structure of the output of the QEZRTBKH API when using the RBKH0100 format.
dcl-ds RBKH0100 qualified inz;
  bytesReturned int(10);
  bytesAvailable int(10);
  allUserLibrariesLastBackupDate char(7); // CYYMMDD date format
  allUserLibrariesLastBackupTime char(6);
  allUserLibrariesTape char(4);
  allUserLibrariesChangesLastBackupDate char(7); // CYYMMDD date format
  allUserLibrariesChangesLastBackupTime char(6);
  allUserLibrariesChangesTape char(4);
  librariesOnListLastBackupDate char(7); // CYYMMDD date format
  librariesOnListLastBackupTime char(6);
  librariesOnListTape char(4);
  librariesOnListChangesLastBackupDate char(7); // CYYMMDD date format
  librariesOnListChangesLastBackupTime char(6);
  librariesOnListChangesTape char(4);
  allFoldersLastBackupDate char(7); // CYYMMDD date format
  allFoldersLastBackupTime char(6);
  allFoldersTape char(4);
  allFoldersChangesLastBackupDate char(7); // CYYMMDD date format
  allFoldersChangesLastBackupTime char(6);
  allFoldersChangesTape char(4);
  foldersOnListLastBackupDate char(7); // CYYMMDD date format
  foldersOnListLastBackupTime char(6);
  foldersOnListTape char(4);
  securityDataLastBackupDate char(7); // CYYMMDD date format
  securityDataLastBackupTime char(6);
  securityDataTape char(4);
  configurationDataLastBackupDate char(7); // CYYMMDD date format
  configurationDataLastBackupTime char(6);
  configurationDataTape char(4);
  calendarsLastBackupDate char(7); // CYYMMDD date format
  calendarsLastBackupTime char(6);
  calendarsTape char(4);
  mailBackupDate char(7); // CYYMMDD date format
  mailLastBackupTime char(6);
  mailTape char(4);
  allUserDirectoriesLastBackupDate char(7); // CYYMMDD date format
  allUserDirectoriesLastBackupTime char(6);
  allUserDirectoriesTape char(4);
  allUserDirectoriesChangesLastBackupDate char(7); // CYYMMDD date format
  allUserDirectoriesChangesLastBackupTime char(6);
  allUserDirectoriesChangesTape char(4);
  *n char(21); // Reserved by the system
end-ds;

// Structure of the output of the QEZRTBKH API when using the RBKH0200 format.
dcl-ds RBKH0200 qualified inz;
  BasicInfos likeds(RBKH_0100);
  BackupInfos likeds(BackupInfo) dim(UNS3_MAX);
end-ds;

// General information about the backup history.
dcl-ds BackupInfo qualified template;
  backupDate char(7); // CYYMMDD date format
  backupTime(6);
  backupOptions char(10);
  tapeSet char(4);
  changesOnly ind;
  userLibrariesSaved char(1);
  foldersSaved char(1);
  userDirectoriesSaved char(1);
  securityDataSaved ind;
  configurationSaved ind;
  calendarsSaved ind;
  mailSaved ind;
end-ds;


// ---------------------------------------------------------
// QEZRTBKO data structures 
// ---------------------------------------------------------
// Structure of the header of the output of the QEZRTBKO API.
dcl-ds RBOH0100 qualified template;
  bytesReturned int(10);
  bytesAvailable int(10);
  offsetToDailyOption int(10); 
  offsetToWeeklyOption int(10); 
  offsetToMonthlyOption int(10); 
end-ds;


// Structure of the output of the QEZRTBKO API when using the RBKO0100 format.
dcl-ds RBKO0100 qualified inz;
  offsetToBackupDevices int(10);
  backupDevicesNumber int(10);
  offsetToTapesToRotate int(10);
  TapesToRotateNumber int(10);
  lastUsedTape char(4);
  nextTape char(4);
  EraseTapeBeforeBackup ind;
  backupUserLibraries char(1);
  backupFolders char(1);
  backupUserDirectories char(1);
  backupSecurityData ind;
  backupConfigurationData ind;
  backupMail char(1);
  backupCalendars char(1);
  submitAsBatchJob ind;
  saveChangedObjectsOnly ind;
  printDetailedReport ind;
  userExitProgramName char(10);
  userExitProgramLibrary char(10);
  *n char(1); // Reserved by the system
  offsetToAdditionalInfo int(10);
  backupDevices&tapeSetsToRotate char(INT5_MAX) options(*varsize);
end-ds;

// Structure of the output of the QEZRTBKO API when using the RBKO0200 format.
dcl-ds RBKO0200 qualified inz;
  SaveInformation likeds(RBKO_0100);
  lastBackupDate char(7); // CYYMMDD date format
  lastBackupTime char(6);
  nextBackupDate char(7); // CYYMMDD date format
  nextBackupTime char(6);
end-ds;


// ---------------------------------------------------------
// QEZRTBKS data structures 
// ---------------------------------------------------------
// Structure of the output of the QEZRTBKS API when using the RBKS0100 format.
dcl-ds RBKS0100 qualified;
  bytesReturned int(10);
  bytesAvailable int(10);
  hoursBeforeReminder int(10); // Use the "HOURS_*" constants
  backupWeekMonth int(10);
  useSchedule char(1); // Use the "USE_*" constants 
  backupOnSunday char(1);
  sundayBackupTime char(6);
  backupOnMonday char(1);
  mondayBackupTime char(6);
  backupOnTuesday char(1);
  tuesdayBackupTime char(6);
  backupOnWednesday char(1);
  wednesdayBackupTime char(6);
  backupOnThursday char(1);
  thursdayBackupTime char(6);
  backupOnFriday char(1);
  fridayBackupTime char(6);
  backupOnSaturday char(1);
  saturdayBackupTime char(6);
end-ds;




// +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// Prototypes
// +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++




/// @info The Change Object Backup List (QEZCHBKL) API changes the backup type for a list of objects that are specified
/// by the user.
/// @link https://www.ibm.com/docs/en/i/7.1?topic=ssw_ibm_i_71/apis/QEZCHBKL.html
/// @param This structure includes the keys and data that are needed to make the necessary changes to the backup
/// definitions.
///   @useonly "InputStructure"
/// @param The length of the input structure.
/// @param The structure in which to return error information.
dcl-pr QEZCHBKL extpgm('QEZCHBKL');
  inputStructure char(INT10_MAX) options(*varsize) const;
  inputLength int(10) const;
  errorCode char(INT5_MAX) options(*varsize);
end-pr;


/// @info The Change Backup Schedule (QEZCHBKS) API allows the user to change the Operational Assistant backup
/// schedules.
/// @link https://www.ibm.com/docs/en/i/7.1?topic=ssw_ibm_i_71/apis/QEZCHBKS.html
/// @param The variable that contains the backup schedule changes.
///   @useonly "CBKS0100"
/// @param Length of the change request structure.
/// @param The format of the input structure data
///   @useonly "FORMAT_CBKS_0100".
/// @param The structure in which to return error information.
dcl-pr QEZCHBKS extpgm('QEZCHBKS');
  input char(INT10_MAX) options(*varsize) const;
  inputLength int(10) const;
  inputFormat char(8) const;
  errorCode char(INT5_MAX) options(*varsize);
end-pr;


/// @info The Open List of Objects to be Backed Up (QEZOLBKL) API retrieves an open list of the objects that are to be
/// backed up.
/// @link https://www.ibm.com/docs/en/i/7.1?topic=ssw_ibm_i_71/apis/qezolbkl.html
/// @param The receiver variable that receives the information requested.
/// @param The length of the receiver variable provided.
/// @param Information about the list that is created by this program.
///   @useonly "ListInformation"
/// @param The number of records in the list to put into the receiver variable.
/// @param The name of the format to be used to return the requested information.
///   @useonly "OBKL_0100", "OBKL_0200", "OBKL_0600"
/// @param The type of the objects to be returned in the list.
///   @useonly "OBJECT_FOLDER", "OBJECT_LIBRARY"
/// @param The backup type of the objects that you request.
///   @useonly "BACKUP_DAILY", "BACKUP_WEEKLY", "BACKUP_MONTHLY", "BACKUP_ALL"
/// @param The structure in which to return error information.
dcl-pr QEZOLBKL extpgm('QEZOLBKL');
  output char(INT10_MAX) options(*varsize);
  expectedOutputLength int(10) const;
  listInformation likeds(ListInformation);
  recordsNumber int(10) const;
  outputFormat char(8) const;
  objectType char(10) const;
  backupType char(10) const;
  errorCode char(INT5_MAX) options(*varsize);
end-pr;


/// @info The Retrieve Backup Detail (QEZRTBKD) API retrieves more detailed information about the library or folder that
/// is to be backed up.
/// @link https://www.ibm.com/docs/en/i/7.1?topic=ssw_ibm_i_71/apis/qezrtbkd.html
/// @param The receiver variable that receives the information requested.
///   @useonly "RBKD0100"
/// @param The length of the receiver variable provided.
/// @param The name of the object to retrieve backup detail information about.
/// @param The length of the name of the object about which to retrieve backup detail information.
/// @param The name of the format to be used to return information to caller
///   @useonly "RBKD_0100"
/// @param The type of object for which you are requesting information.
///   @useonly "OBJECT_FOLDER", "OBJECT_LIBRARY"
/// @param The structure in which to return error information.
dcl-pr QEZRTBKD extpgm('QEZRTBKD');
  output char(INT10_MAX) options(*varsize);
  outputLength int(10) const;
  objectName char(12) const options(*varsize);
  objectNameLength int(10) const;
  formatName char(8) const;
  objectType char(10) const;
  errorCode char(INT5_MAX) options(*varsize);
end-pr;


/// @info The Retrieve Backup History (QEZRTBKH) API retrieves information about the backup status and history into a
/// single variable in the calling program.
/// @link https://www.ibm.com/docs/en/i/7.1?topic=ssw_ibm_i_71/apis/qezrtbkh.html
/// @param The receiver variable that receives the information requested.
///   @useonly "RBKH0100", "RBKH0200"
/// @param The length of the receiver variable provided.
/// @param The format of the command information to be returned.
///   @useonly "RBKH_0100", "RBKH_0200"
/// @param The structure in which to return error information. 
dcl-pr QEZRTBKH extpgm('QEZRTBKH');
  output char(INT10_MAX) options(*varsize);
  outputLength int(10) const;
  formatName char(8) const;
  errorCode char(INT5_MAX) options(*varsize);
end-pr;


/// @info The Retrieve Backup Options (QEZRTBKO) API returns in a receiver variable the backup options for the requested
/// backup type.
/// @link https://www.ibm.com/docs/en/i/7.1?topic=ssw_ibm_i_71/apis/qezrtbko.html
/// @param The receiver variable that receives the information requested.
///   @useonly "RBKO_HEADER", "RBKO_0100", "RBKO_0200"
/// @param The length of the receiver variable provided.
/// @param The format of the backup option descriptions to be returned.
///   @use "RBKO0100", "RBKO0200", "RBOH0100"
/// @param The backup options to retrieve.
///   @use "BACKUP_DAILY", "BACKUP_WEEKLY", "BACKUP_MONTHLY", "BACKUP_ALL"
/// @param The structure in which to return error information.
dcl-pr QEZRTBKO extpgm('QEZRTBKO');
  output char(INT10_MAX) options(*varsize);
  outputLength int(10) const;
  formatName char(8) const;
  backupOption char(10) const;
  errorCode char(INT5_MAX) options(*varsize);
end-pr;


/// @info The Retrieve Backup Schedule (QEZRTBKS) API returns in a receiver variable information about when the 
///   Operational Assistant backups are scheduled to be run.
/// @link https://www.ibm.com/docs/en/i/7.1?topic=ssw_ibm_i_71/apis/qezrtbks.html
/// @param The receiver variable that receives the information requested.
/// @param The length of the receiver variable provided.
/// @param The name of the format in which to return the backup schedule. See FORMAT_RBKS0100.
/// @param The structure in which to return error information.
dcl-pr QEZRTBKS extpgm('QEZRTBKS');
  output char(INT10_MAX) options(*varsize);
  outputLength int(10) const;
  outputFormat char(8) const;
  errorCode char(INT5_MAX) options(*varsize);
end-pr;