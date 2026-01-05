**free
//----------------------------------------------------------
// Product(s):
//  5761-SS1
//
// Copyright:
//  IBM Corp.  2007, 2008 - All rights reserved.
//  US Government Users Restricted Rights - Use, duplication or disclosure restricted by GSA ADP 
//  Schedule Contract with IBM Corp.
//  Licensed Materials-Property of IBM
//
// Header File Name: ERRNO
// Descriptive Name: API error numbers.
// 
// Description: None.
// 
// Header Files Included: None.
// 
// Macros List: None.
// 
// Structure List:
//  QQQ_QRYSV_QRYS0100_t
// 
// Function Prototype List: None.
// 
// Change Activity:
//  N/A, V6R1, 2007-08-30: New Include
//----------------------------------------------------------


//--------------------------------------
// Include guard
//--------------------------------------


/if defined(qibm_errno_included)
  /eof 
/else
  /define qibm_errno_included
/endif


//--------------------------------------
// Prototypes
//--------------------------------------


dcl-pr getErrnoPtr extproc('__errno') end-pr;

dcl-pr perror extproc('perror');
  string  pointer value options(*string);
end-pr;


//--------------------------------------
// Speacial values
//--------------------------------------


// Error Numbers
dcl-c MATH_FUNCTION_DOMAIN_ERROR          const(3001);
dcl-c MATH_FUNCTION_RANGE_ERROR           const(3002);
dcl-c TRUNCATION_ON_IO_OPERATION          const(3003);
dcl-c FILE_NOT_OPENED                     const(3004);
dcl-c FILE_NOT_OPENED_FOR_READ            const(3005);
dcl-c FILE_OPENED_FOR_RECORD_IO           const(3008);
dcl-c FILE_NOT_OPENED_FOR_WRITE           const(3009);
dcl-c STDIN_CANNOT_BE_OPENED              const(3010);
dcl-c STDOUT_CANNOT_BE_OPENED             const(3011);
dcl-c STDERR_CANNOT_BE_OPENED             const(3012);
dcl-c BAD_OFFSET_TO_SEEK_TO               const(3013);
dcl-c INVALID_FILE_NAME_SPECIFIED         const(3014);
dcl-c INVALID_FILE_MODE_SPECIFIED         const(3015);
dcl-c INVALID_POSITION_SPECIFIER          const(3017);
dcl-c NO_RECORD_AT_SPECIFIED_POSITION     const(3018);
dcl-c NO_FTELL_IF_MORE_THAN1_MEMBER       const(3019);
dcl-c NO_FTELL_IF_TOO_MANY_RECORDS        const(3020);
dcl-c INVALID_FUNCTION_POINTER            const(3022);
dcl-c RECORD_NOT_FOUND                    const(3026);
dcl-c MESSAGE_DATA_INVALID                const(3028);
dcl-c BAD_OPTION_ON_IO_FUNCTION           const(3040);
dcl-c FILE_NOT_OPENED_FOR_UPDATE          const(3041);
dcl-c FILE_NOT_OPENED_FOR_DELETE          const(3042);
dcl-c PADDING_OCCURRED_ON_WRITE_OPERATION const(3043);
dcl-c BAD_KEY_LENGTH_OPTION               const(3044);
dcl-c ILLEGAL_WRITE_AFTER_READ            const(3080);
dcl-c ILLEGAL_READ_AFTER_WRITE            const(3081);
dcl-c IO_EXCEPTION_NON_RECOVERABLE_ERROR  const(3101);
dcl-c IO_EXCEPTION_RECOVERABLE_ERROR      const(3102);

// The following values are defined by POSIX ISO/IEC 9945-1:1990.
dcl-c INVALID_ARGUMENT        const(3021);
dcl-c INPUT_OUTPUT_ERROR      const(3006);
dcl-c NO_SUCH_DEVICE          const(3007);
dcl-c RESOURCE_BUSY           const(3029);
dcl-c NO_SUCH_FILE_OR_LIBRARY const(3025);
dcl-c OPERATION_NOT_PERMITTED const(3027);

// sys/errno.h defines
dcl-c PERMISSION_DENIED                                         const(3401);
dcl-c NOT_A_DIRECTORY                                           const(3403);
dcl-c NO_SPACE_AVAILABLE                                        const(3404);
dcl-c IMPROPER_LINK                                             const(3405);
dcl-c OPERATION_WOULD_HAVE_BLOCKED_PROCESS                      const(3406);
dcl-c OPERATION_WOULD_HAVE_BLOCKED_PROCESS_AGAIN                const(3406);
dcl-c INTERRUPTED_FUNCTION_CALL                                 const(3407);
dcl-c THE_ADDRESS_USED_FOR_AN_ARGUMENT_WAS_NOT_FOUND            const(3408);
dcl-c OPERATION_TIMED_OUT                                       const(3409);
dcl-c NO_SUCH_DEVICE_OR_ADDRESS                                 const(3415);
dcl-c SOCKET_CLOSED                                             const(3417);
dcl-c ADDRESS_ALREADY_IN_USE                                    const(3420);
dcl-c ADDRESS_NOT_AVAILABLE                                     const(3421);
dcl-c TYPE_OF_SOCKET_NOT_SUPPORTED                              const(3422);
dcl-c OPERATION_ALREADY_IN_PROGRESS                             const(3423);
dcl-c CONNECTION_ENDED_ABNORMALLY                               const(3424);
dcl-c REMOTE_HOST_REFUSED_ATTEMPTED_CONNECTION                  const(3425);
dcl-c CONNECTION_WITH_REMOTE_SOCKET_WAS_RESET                   const(3426);
dcl-c OPERATION_REQUIRES_DESTINATION_ADDRESS                    const(3427);
dcl-c REMOTE_HOST_NOT_AVAILABLE                                 const(3428);
dcl-c ROUTE_TO_REMOTE_HOST_NOT_AVAILABLE                        const(3429);
dcl-c OPERATION_IN_PROGRESS                                     const(3430);
dcl-c CONNECTION_HAS_ALREADY_BEEN_ESTABLISHED                   const(3431);
dcl-c NETWORK_NOT_CURRENTLY_AVAILABLE                           const(3433);
dcl-c MESSAGE_SIZE_OUT_OF_RANGE                                 const(3432);
dcl-c SOCKET_CONNECTED_TO_HOST_IN_NETWORK_RESET                 const(3434);
dcl-c CANNOT_REACH_THE_DESTINATION_NETWORK                      const(3435);
dcl-c NOT_ENOUGH_BUFFER_SPACE                                   const(3436);
dcl-c PROTOCOL_DOES_NOT_SUPPORT_SPECIAL_OPTION                  const(3437);
dcl-c REQUESTED_OPERATION_REQUIRES_A_CONNECTION                 const(3438);
dcl-c DESCRIPTOR_DOES_NOT_REFER_TO_VALID_SOCKET                 const(3439);
dcl-c NOT_SUPPORTED                                             const(3440);
dcl-c OPERATION_NOT_SUPPORTED                                   const(3440);
dcl-c SOCKET_PROTOCOL_FAMILY_NOT_SUPPORTED                      const(3441);
dcl-c NO_PROTOCOL_OF_SPECIFIED_TYPE_SUPPORTED                   const(3442);
dcl-c SOCKET_TYPE_OR_PROTOCOLS_NOT_COMPATIBLE                   const(3443);
dcl-c ERROR_INDICATION_SENT_BY_PEER                             const(3444);
dcl-c CANNOT_SEND_DATA_AFTER_SHUTDOWN                           const(3445);
dcl-c SPECIFIED_SOCKET_TYPE_NOT_SUPPORTED                       const(3446);
dcl-c REMOTE_HOST_TIMEOUT                                       const(3447);
dcl-c REQUIRED_PROTOCOL_CURRENTLY_UNAVAILABLE                   const(3448);
dcl-c INVALID_DESCRIPTOR                                        const(3450);
dcl-c TOO_MANY_OPEN_FILES_FOR_PROCESS                           const(3452);
dcl-c TOO_MANY_OPEN_FILES_IN_SYSTEM                             const(3453);
dcl-c BROKEN_PIPE                                               const(3455);
dcl-c FILE_EXISTS                                               const(3457);
dcl-c RESOURCE_DEADLOCK_AVOIDED                                 const(3459);
dcl-c STORAGE_ALLOCATION_REQUEST_FAILED                         const(3460);
dcl-c SYNCHRONIZATION_OBJECT_OWNER_NOT_RUNNING                  const(3462);
dcl-c SYNCHRONIZATION_OBJECT_DESTROYED                          const(3463);
dcl-c OPERATION_TERMINATED                                      const(3464);
dcl-c MAXIMUM_LINK_COUNT_FOR_FILE_EXCEEDED                      const(3468);
dcl-c SEEK_REQUEST_NOT_SUPPORTED_FOR_OBJECT                     const(3469);
dcl-c FUNCTION_NOT_IMPLEMENTED                                  const(3470);
dcl-c SPECIFIED_TARGET_IS_DIRECTORY                             const(3471);
dcl-c READ_ONLY_FILE_SYSTEM                                     const(3472);
dcl-c UNKNOWN_SYSTEM_STATE                                      const(3474);
dcl-c INVALID_ITERATOR                                          const(3475);
dcl-c ENCOUNTERED_DAMAGED_OBJECT                                const(3484);
dcl-c LOOP_IN_SYMBOLIC_LINKS                                    const(3485);
dcl-c PATH_NAME_TOO_LONG                                        const(3486);
dcl-c NO_LOCKS_AVAILABLE                                        const(3487);
dcl-c DIRECTORY_NOT_EMPTY                                       const(3488);
dcl-c SYSTEM_RESOURCES_UNAVAILABLE                              const(3489);
dcl-c CONVERSION_ERROR                                          const(3490);
dcl-c ARGUMENT_LIST_TOO_LONG                                    const(3491);
dcl-c CONVERSION_STOPPED_DUE_TO_INPUT_CHARACTER                 const(3492);
dcl-c OBJECT_HAS_SOFT_DAMAGE                                    const(3497);
dcl-c USER_NOT_ENROLLED_IN_SYSTEM_DISTRIBUTION                  const(3498);
dcl-c OBJECT_SUSPENDED                                          const(3499);
dcl-c OBJECT_IS_READ_ONLY                                       const(3500);
dcl-c USED_AREA_LOCKED                                          const(3506);
dcl-c OBJECT_TOO_LARGE                                          const(3507);
dcl-c SEMAPHORE_SHARED_MEMORY_OR_MESSAGE_QUEUE_ALREADY_DELETED  const(3509);
dcl-c QUEUE_DOES_NOT_CONTAIN_VALID_MESSAGE                      const(3510);
dcl-c FILE_ID_CONVERSION_OF_DIRECTORY_FAILED                    const(3511);
dcl-c FILE_ID_COULD_NOT_BE_ASSIGNED                             const(3512);
dcl-c FILE_OR_OBJECT_HANDLE_REJECTED_BY_SERVER                  const(3513);
dcl-c NO_SUCH_PROCESS                                           const(3515);
dcl-c PROCESS_NOT_ENABLED_FOR_SIGNALS                           const(3516);
dcl-c NO_CHILD_PROCESS                                          const(3517);
dcl-c OPERATION_WOULD_EXCEED_MAXIMUM_REFERENCES_COUNT           const(3523);
dcl-c FUNCTION_NOT_ALLOWED                                      const(3524);
dcl-c OBJECT_TOO_LARGE_TO_PROCESS                               const(3525);
dcl-c JOURNAL_DAMAGED                                           const(3526);
dcl-c JOURNAL_INACTIVE                                          const(3527);
dcl-c JOURNAL_SPACE_OR_SYSTEM_STORAGE_ERROR                     const(3528);
dcl-c JOURNAL_IS_REMOTE                                         const(3529);
dcl-c NEW_JOURNAL_RECEIVER_NEEDED                               const(3530);
dcl-c NEW_JOURNAL_NEEDED                                        const(3531);
dcl-c OBJECT_ALREADY_JOURNALED                                  const(3532);
dcl-c ENTRY_TOO_LARGE_TO_SEND                                   const(3533);
dcl-c OBJECT_IS_DATALINK_OBJECT                                 const(3534);
dcl-c INDEPENDENT_ASP_NOT_AVAILABLE                             const(3535);
dcl-c INAPPROPRIATE_IO_CONTROL_OPERATION                        const(3536);
dcl-c WRITE_OR_TRUNCATE_PAST_FILE_SIZE                          const(3540);
dcl-c TEXT_FILE_BUSY                                            const(3543);
dcl-c ASP_GROUP_NOT_SET_FOR_THREAD                              const(3544);
dcl-c SYSTEM_CALL_CAN_BE_RESTARTED                              const(3545);
dcl-c OBJECT_MARKED_AS_SCAN_FAILURE                             const(3546);