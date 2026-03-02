**free
//----------------------------------------------------------
// Product(s):
//  5722-SS1
//
// Copyright:
//  IBM Corp.  2002, 2004 - All rights reserved.
//  US Government Users Restricted Rights - Use, duplication or disclosure restricted by GSA ADP 
//  Schedule Contract with IBM Corp.
//  Licensed Materials-Property of IBM
//
// Header File Name: eim.h
// Descriptive Name: Enterprise Identity Mapping (EIM) APIs
// 
// Description:
//  Defines prototypes, macros, variables, and structures to be used with the EIM APIs.
// 
// Header Files Included: None.
//
// Macros List: None.
//
// Structure List: None.
// 
// Function Prototype List: None.
// 
// Change Activity:
//  D9860600  2002-02-02  V5R2  New Include
//  P9A04903  2002-03-30  V5R2  Fix AIX registry type
//  D9121900  2002-12-15  V5R3  Add policy support + Add message catalog Id numbers
//  D9121908  2002-12-15  V5R3  Add new config. + Add assoc type to EimIdentifier struct
//  D9121910  2003-02-16  V5R3  Reorganize structures
//  P9A26515  2003-03-30  V5R3  Add linux registry type
//  P9A28411  2003-05-18  V5R3  Add Tivoli Access Manager type + duplicate of Policy Director
//  P9A28415  2003-07-20  V5R3  Add Domino reg types
//  P9A35259  2003-08-03  V5R3  Add new Windows reg type defines
//  P9A36692  2003-08-31  V5R3  Add eimGetVersion
//  P9A78104  2004-10-01  V5R3  Add credential and registry group support
//----------------------------------------------------------


//--------------------------------------
// Include guard
//--------------------------------------


/if defined(eim)
  /eof
/else
  /define eim 
/endif


//--------------------------------------
// Data structures
//--------------------------------------


dcl-ds EIMHandle qualified;
  handle  char(16);
end-ds EIMHandle;

dcl-ds EIMBinaryData qualified;
  length  int(10);
  data    pointer;
end-ds EIMBinaryData;

//-----------------
// Eim Connect Information
//-----------------

dcl-ds EIMSimpleConnectInfo qualified;
  protect       int(10);
  bindDN        pointer;
  bindPassword  pointer;
end-ds EIMSimpleConnectInfo;

dcl-ds EIMSSLInfo qualified;
  keyring           pointer;
  keyringPassword   pointer;
  certificateLabel  pointer;
end-ds EIMSSLInfo;

// NOTE: for compatability, do not add any information to the union in this structure that will 
//  increase the size of the union.
dcl-ds EIMConnectInfo qualified;
  type                int(10);
  credentials         char(64);
  credentialsPointer  pointer;
  protect             int(10);
  bindDN              pointer;
  bindPassword        pointer;
  SSL                 pointer;
end-ds EIMConnectInfo;

// NOTE: for compatability, do not add any information to the union in this structure that will 
//  increase the size of the union.
dcl-ds EIMIdentifierInfo qualified;
  ID          char(16);
  uniqueName  pointer; 
  entryUUID   pointer;
  name        pointer;
  IDtype      int(10);
end-ds EIMIdentifierInfo;

//-----------------
// Eim Policy Information
//-----------------

dcl-ds EIMCertificatePolicyFilter qualified;
  sourceRegistry  pointer;
  filterValue     pointer;
end-ds EIMCertificatePolicyFilter;

dcl-ds EIMPolicyFilterInfo qualified;
  type            int(10);
  filter          char(32);
  sourceRegistry  pointer; 
  filterValue     pointer;
end-ds EIMPolicyFilterInfo;

dcl-ds EIMCertificatePolicyFilterSubsetInfo qualified;
  subjectFilter pointer;
  issuerFilter  pointer;
end-ds EIMCertificatePolicyFilterSubsetInfo;

dcl-ds EIMPolicyFilterSubsetInfo qualified;
  subset        char(32);
  subjectFilter pointer;
  issuerFilter  pointer;
end-ds EIMPolicyFilterSubsetInfo;

dcl-ds EIMCertificateFilterPolicyAssociation qualified;
  sourceRegistry          pointer;
  filterValue             pointer;
  targetRegistry          pointer;
  targetRegistryUserName  pointer;
end-ds EIMCertificateFilterPolicyAssociation;

dcl-ds EIMDefaultRegistryPolicyAssociation qualified;
  sourceRegistry          pointer;
  targetRegistry          pointer;
  targetRegistryUserName  pointer;
end-ds EIMDefaultRegistryPolicyAssociation;

dcl-ds EIMDefaultDomainPolicyAssociation qualified;
  targetRegistry          pointer;
  targetRegistryUserName  pointer;
end-ds EIMDefaultDomainPolicyAssociation;

dcl-ds EIMPolicyAssociationInfo qualified;
  type                                      int(10);
  policyAssociation                         char(64);
  certificationFilterSourceRegistry         pointer;
  filterValue                               pointer;
  certificationFilterTargetRegistry         pointer;
  certificationFilterTargetRegistryUserName pointer;
  defaultSourceRegistry                     pointer;
  defaultTargetRegistry                     pointer;
  defaultTargetRegistryUserName             pointer;
  defaultDomainTargetRegistry               pointer;
  defaultDomainTargetRegistryUserName       pointer;
end-ds EIMPolicyAssociationInfo;

//-----------------
// Eim User Identity Information
//-----------------

dcl-ds EIMCertificateInfo qualified;
  issuerDN        pointer;
  subjectDN       pointer;
  publicKey       pointer;
  publicKeyLength uns(10);
end-ds EIMCertificateInfo;

dcl-ds EIMCertificate qualified;
  certificateData   pointer;
  certificateLength uns(10);
end-ds EIMCertificate;

dcl-ds EIMUserIdentityInfo qualified;
  type              int(10);
  infos             char(52);
  issuerDN          pointer;
  subjectDN         pointer;
  publicKey         pointer;
  publicKeyLength   uns(10);
  certificateData   pointer;
  certificateLength uns(10);
end-ds EIMUserIdentityInfo;

//-----------------
// Eim Configuration Information
//-----------------

dcl-ds EIMConfigInfo_Format0 qualified;
  ldapURL           pointer;
  localRegistry     pointer;
  kerberosRegistry  pointer;
  x509Registry      pointer;
end-ds EIMConfigInfo_Format0;

dcl-ds EIMConfigInfo qualified;
  dcl-s format            int(10);
  dcl-s enable            int(10);
  dcl-s ccsid             int(10);
  dcl-s config            char(64);
  dcl-s ldapURL           pointer;
  dcl-s localRegistry     pointer;
  dcl-s kerberosRegistry  pointer;
  dcl-s x509Registry      pointer;
end-ds EIMConfigInfo;

//-----------------
// Eim Host information for version
//-----------------

dcl-ds EIMHostInfo qualified;
  hostType  int(10);
  hostInfo  char(16);
  EIM       pointer;
  LDAPURL   pointer;
end-ds EIMHostInfo;

//-----------------
// Return code structure
//-----------------

dcl-ds EIMReturnStructure qualified;
  inputSize               uns(10); // Entire RC structure size. Filled in by the caller
  outputSize              uns(10); // Filled in by API, tells how much data could've been returned
  errorNumber             int(10); // Same as the errno returned as the rc for the API
  messageCatalogSetNumber int(10);
  messageCatalogMessageID int(10);
  LDAPError               int(10);
  SLLError                int(10);
  fieldForFutureUse       char(16);
  substitutionTextLength  uns(10); // Excluding a null-terminator which may or may not be present
  errorInfo               char(1); // further info describing the error
end-ds EIMReturnStructure;

//-----------------
// Access structures
//-----------------

dcl-ds EIMAccessUser qualified;
  user              char(16);
  DN                pointer;
  kerberosPrincipal pointer;
  localUser         pointer;
  userType          int(10);
end-ds EIMAccessUser;

// This is used to access the data elements.
dcl-ds EIMListData qualified;
  dataLength    uns(10);
  offsetToData  uns(10); // Relative to the start of the parent structure
end-ds EIMListData;

// This is used to access sub lists within the list information returned.
dcl-ds EIMSubList qualified;
  entriesNumber   uns(10);
  offsetToSublist uns(10); // Relative to the start of the parent structure
end-ds EIMSubList;

// Information returned from eimRetrieveConfiguration() API.
dcl-ds EIMConfig qualified;
  bytesReturned                 uns(10); // Bytes actually returned by the API
  bytesAvailable                uns(10); // Bytes of available data that could've been returned
  EIMDomainParticipationEnabled int(10);
  // LDAPURL                    char(8);
  LDAPURLLength                 uns(10);
  offsetToLDAPURL               uns(10);
  // localSystemRegistry        char(8);
  localSystemRegistryLength     uns(10);
  offsetToLocalSystemRegistry   uns(10);
  // kerberosRegistry           char(8);
  kerberosLength                uns(10);
  offsetToKerberosRegistry      uns(10);
  // x509Registry               char(8);
  x509Length                    uns(10);
  offsetTox509Registry          uns(10);
end-ds EIMConfig;

// Information returned from eimGetAttribute() API.
dcl-ds EIMAttribute qualified;
  bytesReturned           uns(10); // Bytes actually returned by the API
  bytesAvailable          uns(10); // Bytes of available data that could've been returned
  // handleAttribute      char(8);
  dataLength              uns(10);
  offsetToHandleAttribute uns(10);
end-ds EIMAttribute;

// This is used by all EIM APIs that return a list.
//  It gives information on the amount of information returned and then gives access to the first 
//  list entry.
dcl-ds EIMList qualified;
  bytesReturned       uns(10); // Bytes actually returned by the API
  bytesAvailable      uns(10); // Bytes of available data that could have been returned by the API
  entriesReturned     uns(10); // Entries actually returned by the API
  entriesAvailable    uns(10); // Entries available to be returned by the API
  offsetToFirstEntry  uns(10); // Relative to the start of the EIMList structure
end-ds EIMList;

// List information returned by the following APIs:
//  eimListDomains
dcl-ds EIMDomain qualified;
  offsetToNextEntry               uns(10); // Relative to the start of this structure
  // domainName                   char(8);
  domainNameLength                uns(10);
  offsetToDomainName              uns(10);
  // distinguishedDomainName      char(8);
  distinguishedDomainNameLength   uns(10);
  offsetToDistinguishedDomainName uns(10);
  // description                  char(8);
  descriptionLength               uns(10);
  offsetToDescription             uns(10);
  policyAssociation               int(10);
end-ds EIMDomain;

// List information returned by the following APIs:
//  eimListRegistries
dcl-ds EIMRegistry qualified;
  offsetToNextEntry               uns(10); // Relative to the start of this structure
  registryKind                    int(10);
  // registryName                 char(8);
  registryNameLength              uns(10);
  offsetToRegistryName            uns(10);
  // registryType                 char(8);
  registryTypeLength              uns(10);
  offsetToRegistryType            uns(10);
  // description                  char(8);
  descriptionLength               uns(10);
  offsetToDescription             uns(10);
  // entryUUID                    char(8);
  entryUUIDLength                 uns(10);
  offsetToEntryUUID               uns(10);
  // URI                          char(8);
  URILength                       uns(10);
  offsetToURI                     uns(10);
  // systemRegistryName           char(8);
  systemRegistryNameLength        uns(10);
  offsetToSystemRegistryName      uns(10);
  // EIMRegistryAliasSublist      char(8);
  EIMRegistryAliasSublistLength   uns(10);
  offsetToEIMRegistryAliasSublist uns(10);
  mappingLookup                   int(10);
  policyAssociations              int(10);
  // EIMRegistryNameSublist1      char(8);
  EIMRegistryNameSublistLength1   uns(10);
  offsetToEIMRegistryNameSublist1 uns(10);
  // EIMRegistryNameSublist2      char(8);
  EIMRegistryNameSublistLength2   uns(10);
  offsetToEIMRegistryNameSublist2 uns(10);
end-ds EIMRegistry;

// List information returned by the following APIs:
//  eimListIdentifiers
//  eimGetAssociatedIdentifiers
dcl-ds EIMIdentifier qualified;
  offsetToNextEntry                 uns(10); // Relative to the start of this structure
  // uniqueName                     char(8);
  uniqueNameLength                  uns(10);
  offsetToUniqueName                uns(10);
  // description                    char(8);
  descriptionLength                 uns(10);
  offsetToDescription               uns(10);
  // UUID                           char(8);
  UUIDLength                        uns(10);
  offsetToUUID                      uns(10);
  // EIMIdentifierNameSublist       char(8);
  EIMIdentifierNameSublistLength    uns(10);
  offsetToEIMIdentifierNameSublist  uns(10);
  // EimAddlInfoSublist             char(8);
  EIMAddlInfoSublistLength          uns(10);
  offsetToEIMAddlInfoSublist        uns(10);
  AssociationType                   int(10); // Only valid for eimGetAssociatedIdentifiers
  // usedGroupRegistry              char(8);
  usedGroupRegistryLength           uns(10); // Only valid for eimGetAssociatedIdentifiers
  offsetToUsedGroupRegistry         uns(10); // Only valid for eimGetAssociatedIdentifiers
end-ds EIMIdentifier;

// List information returned by the following APIs:
//  eimListAssociations
dcl-ds EIMAssociation qualified;
  offsetToNextEntry         uns(10); // Relative to the start of this structure
  AssociationType           int(10);
  // registryType           char(8);
  registryTypeLength        uns(10);
  offsetToRegistryType      uns(10);
  // registryName           char(8);
  registryNameLength        uns(10);
  offsetToRegistryName      uns(10);
  // registryUserName       char(8);
  registryUserNameLength    uns(10);
  offsetToRegistryUserName  uns(10);
end-ds EIMAssociation;

// List information returned by the following APIs:
//  eimGetRegistryAlias
// Supplemental list information for the following structs:
//  EimRegistry
dcl-ds EIMRegistryAlias qualified;
  offsetToNextEntry   uns(10); // Relative to the start of this structure
  // aliasType        char(8);
  aliasTypeLength     uns(10);
  offsetToAliasType   uns(10);
  // aliasValue       char(8);
  aliasValueLength    uns(10);
  offsetToAliasValue  uns(10);
end-ds EIMRegistryAlias;

// List information returned by the following APIs:
//  eimListRegistryUsers, eimListRegistryUsersCreds 
dcl-ds EIMRegistryUser qualified dim;
  offsetToNextEntry                 uns(10); // Relative to the start of this structure
  // name                           char(8);
  nameLength                        uns(10);
  offsetToName                      uns(10);
  // description                    char(8);
  descriptionLength                 uns(10);
  offsetToDescription               uns(10);
  // EIMAddlInfoSublist             char(8);
  EIMAddlInfoSublistLength          uns(10);
  offsetToEIMAddlInfoSublist        uns(10);
  // EIMCredentialInfoSublist       char(8);
  EIMCredentialInfoSublistLength    uns(10);
  offsetToEIMCredentialInfoSublist  uns(10);
end-ds EIMRegistryUser;

// List information returned by the following APIs:
//  eimGetTargetFromSource, eimGetTargetFromIdentifier, eimGetTargetC redsFromSource,
//  eimGetTgtCredsFromIdentifier
dcl-ds EIMTargetIdentity qualified;
  offsetToNextEntry                 uns(10); // Relative to the start of this structure
  // userName                       char(8);
  userNameLength                    uns(10);
  offsetToUserName                  uns(10);
  associationType                   int(10);
  // sourceGroupRegistryName        char(8);
  sourceGroupRegistryNameLength     uns(10);
  offsetToSourceGroupRegistryName   uns(10);
  // targetGroupRegistryName        char(8);
  targetGroupRegistryNameLength     uns(10);
  offsetToTargetGroupRegistryName   uns(10);
  // EIMCredentialInfoSublist       char(8);
  EIMCredentialInfoSublistLength    uns(10);
  offsetToEIMCredentialInfoSublist  uns(10);
end-ds EIMTargetIdentity;

// Supplemental list information for the following structs:
//  EimIdentifier
dcl-ds EIMIdentifierName qualified;
  offsetToNextEntry uns(10); // Relative to the start of this structure
  // name           char(8);
  nameLength        uns(10);
  offsetToName      uns(10);
end-ds EIMIdentifierName;

// List information returned by the following APIs:
//  eimGetRegistryNameFromAlias
dcl-ds EIMRegistryName qualified;
  offsetToNextEntry uns(10); // Relative to the start of this structure
  // name           char(8);
  nameLength        uns(10);
  offsetToName      uns(10);
end-ds EIMRegistryName;

// Supplemental list information for the following structs:
//  EimRegistryUser
//  EimIdentifier
dcl-ds EIMAddlInfo qualified;
  offsetToNextEntry       uns(10); // Relative to the start of this structure
  // additionalInfo       char(8);
  additionalInfoLength    uns(10);
  offsetToAdditionalInfo  uns(10);
end-ds EIMAddlInfo;

// Supplemental list information for the following structs:
//  EimRegistryUser
//  EimTargetIdentity
dcl-ds EIMCredentialInfo qualified;
  offsetToNextEntry       uns(10); // Relative to the start of this structure
  credentialType          int(10);
  credentialStatus        int(10);
  // credentialData       char(8);
  credentialDataLength    uns(10);
  offsetToCredentialData  uns(10);
end-ds EIMCredentialInfo;

// List information returned by the following APIs:
//  eimListPolicyFilters
dcl-ds EIMPolicyFilter qualified;
  offsetToNextEntry                 uns(10); // Relative to the start of this structure
  policyFilterType                  int(10);
  // targetSourceRegistry           char(8);
  targetSourceRegistryNameLength    uns(10);
  offsetToTargetSourceRegistryName  uns(10);
  // filterValue                    char(8);
  filterValueLength                 uns(10);
  offsetToFilterValue               uns(10);
end-ds EIMPolicyFilter;

// List information returned by the following APIs:
//  eimListRegistryAssociations
dcl-ds EIMRegistryAssociation qualified;
  offsetToNextEntry                 uns(10); // Relative to the start of this structure
  associationType                   int(10);
  // targetRegistry                 char(8);
  targetRegistryNameLength          uns(10);
  offsetToTargetRegistryName        uns(10);
  // targetRegistryUser             char(8);
  targetRegistryUserNameLength      uns(10);
  offsetToTargetRegistryUserName    uns(10);
  // EIMUniqueName                  char(8);
  EIMUniqueNameLength               uns(10);
  offsetToEIMUniqueName             uns(10);
  // targetSourceRegistry           char(8);
  targetSourceRegistryNameLength    uns(10);
  offsetToTargetSourceRegistryName  uns(10);
  // filterValue                    char(8);
  filterValueLength                 uns(10);
  offsetToFilterValue               uns(10);
  domainPolicyAssociationStatus     int(10);
  sourceMappingLookupStatus         int(10);
  targetMappingLookupStatus         int(10);
  targetPolicyAssocStatus           int(10);
end-ds EIMRegistryAssociation;

// List information returned by the following APIs:
//  eimFormatPolicyFilter
dcl-ds EIMPolicyFilterValue qualified;
  offsetToNextEntry                   uns(10); // Relative to the start of this structure
  // generatedPolicyFilterValue       char(8);
  generatedPolicyFilterValueLength    uns(10);
  offsetToGeneratedPolicyFilterValue  uns(10);
end-ds EIMPolicyFilterValue;

// Information returned by the following APIs:
//  eimFormatUserIdentity
dcl-ds EIMUserIdentity qualified;
  bytesReturned   uns(10); // Bytes actually returned by the API.
  bytesAvailable  int(10); // Bytes of available data that could be returned by the API.
  // userID       char(8);
  userIDLength    uns(10);
  offsetToUserID  uns(10);
end-ds EIMUserIdentity;

// List information returned by the following APIs:
//  eimListAccess
dcl-ds EIMAccess qualified;
  offsetToNextEntry       uns(10); // Relative to the start of this structure
  // userWithAccess       char(8); // in the format of the dn for access id
  userWithAccessLength    uns(10);
  offsetToUserWithAccess  uns(10);
end-ds EIMAccess;

// List information returned by the following APIs:
//  eimListUserAccess
dcl-ds EIMUserAccess qualified;
  offsetToNextEntry               uns(10); // Relative to the start of this structure
  EIMAdmin                        int(10);
  EIMRegAdmin                     int(10);
  EIMIdenAdmin                    int(10);
  EIMMappingLookup                int(10);
  // EIMRegistryNameSublist       char(8);
  EIMRegistryNameSublistLength    uns(10);
  offsetToEIMRegistryNameSublist  uns(10);
  EIMCredentialData               int(10);
end-ds EIMUserAccess;


//--------------------------------------
// Special values
//--------------------------------------


// Shared special values for the following fields:
// EIMConfig - "EIMDomainParticipationEnabled"
// EIMCredentialInfo - "credentialStatus"
// EIMRegistryAssociation - 
//  "domainPolicyAssociationStatus",
//  "sourceMappingLookupStatus",
//   "targetMappingLookupStatus",
//  "targetPolicyAssocStatus"
dcl-c DISABLED  const(0);
dcl-c ENABLED   const(1);