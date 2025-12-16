**free
//----------------------------------------------------------
// All original rights and credits goes to IBM.
//
// Header File Name: eim.h
// Descriptive Name: Enterprise Identity Mapping (EIM) APIs
// 
// Description: Defines prototypes, macros, variables, and structures to be used with the EIM APIs.
// 
// Header Files Included: None.
// Macros List: None.
// Structure List: None.
// Function Prototype List: None.
//----------------------------------------------------------


/if defined(eim)
  /eof
/else
  /define eim 
/endif


//--------------------------------------
// Data structures
//--------------------------------------


dcl-ds EIMHandle qualified;
  handle char(16);
end-ds;

//----------------------------

dcl-ds EIMBinaryData qualified;
  length int(10);
  data pointer;
end-ds;

//----------------------------

dcl-ds EIMSimpleConnectInfo qualified;
  protect int(10);
  bindDN pointer;
  bindPassword pointer;
end-ds;

dcl-ds EIMSSLInfo qualified;
  keyring pointer;
  keyringPassword pointer;
  certificateLabel pointer;
end-ds;  

dcl-ds EIMConnectInfo qualified;
  type int(10);
  credentials char(64);
  credentialsPointer pointer;
  protect int(10);
  bindDN pointer;
  bindPassword pointer;
  SSL pointer;
end-ds;

//----------------------------

dcl-ds EIMIdentifierInfo qualified;
  ID char(16);
  uniqueName pointer; 
  entryUUID pointer;
  name pointer;
  IDtype int(10);
end-ds;

//----------------------------

dcl-ds EIMCertificatePolicyFilter qualified;
  sourceRegistry pointer;
  filterValue pointer;
end-ds;

dcl-ds EIMPolicyFilterInfo qualified;
  type int(10);
  filter char(32);
  sourceRegistry pointer; 
  filterValue pointer;
end-ds;

dcl-ds EIMCertificatePolicyFilterSubsetInfo qualified;
  subjectFilter pointer;
  issuerFilter pointer;
end-ds;

dcl-ds EIMPolicyFilterSubsetInfo qualified;
  subset char(32);
  subjectFilter pointer;
  issuerFilter pointer;
end-ds;

dcl-ds EIMCertificateFilterPolicyAssociation qualified;
  sourceRegistry pointer;
  filterValue pointer;
  targetRegistry pointer;
  targetRegistryUserName pointer;
end-ds;

dcl-ds EIMDefaultRegistryPolicyAssociation qualified;
  sourceRegistry pointer;
  targetRegistry pointer;
  targetRegistryUserName pointer;
end-ds;

dcl-ds EIMDefaultDomainPolicyAssociation qualified;
  targetRegistry pointer;
  targetRegistryUserName pointer;
end-ds;

dcl-ds EIMPolicyAssociationInfo qualified;
  type int(10);
  policyAssociation char(64);
  certificationFilterSourceRegistry pointer;
  filterValue pointer.
  certificationFilterTargetRegistry pointer;
  certificationFilterTargetRegistryUserName pointer;
  defaultSourceRegistry pointer;
  defaultTargetRegistry pointer;
  defaultTargetRegistryUserName pointer;
  defaultDomainTargetRegistry pointer;
  defaultDomainTargetRegistryUserName pointer;
end-ds;

//----------------------------

dcl-ds EIMCertificateInfo qualified;
  issuerDN pointer;
  subjectDN pointer;
  publicKey pointer;
  publicKeyLength uns(10);
end-ds;

dcl-ds EIMCertificate qualified;
  certificateData pointer;
  certificateLength uns(10);
end-ds;

dcl-ds EIMUserIdentityInfo qualified;
  type int(10);
  infos char(52);
  issuerDN pointer;
  subjectDN pointer;
  publicKey pointer;
  publicKeyLength uns(10);
  certificateData pointer;
  certificateLength uns(10);
end-ds;

//----------------------------

dcl-ds EIMConfigInfo_Format0 qualified;
  ldapURL pointer;
  localRegistry pointer;
  kerberosRegistry pointer;
  x509Registry pointer;
end-ds;

dcl-ds EIMConfigInfo qualified;
  dcl-s format int(10);
  dcl-s enable int(10);
  dcl-s ccsid int(10);
  dcl-s config char(64);
  dcl-s ldapURL pointer;
  dcl-s localRegistry pointer;
  dcl-s kerberosRegistry pointer;
  dcl-s x509Registry pointer;
end-ds;

//----------------------------

dcl-ds EIMHostInfo qualified;
  hostType int(10);
  hostInfo char(16);
  EIM pointer;
  LDAPURL pointer;
end-ds;


//--------------------------------------
// Access data structures
//--------------------------------------


dcl-ds EIMReturnStructure qualified;
  inputSize uns(10);
  outputSize uns(10);
  errorNumber int(10);
  messageCatalogSetNumber int(10);
  messageCatalogMessageID int(10);
  LDAPError int(10);
  SLLError int(10);
  fieldForFutureUse char(16);
  substitutionTextLength uns(10);
  errorInfo char(1);
end-ds;

dcl-ds EIMAccessUser qualified;
  user char(16);
  DN pointer;
  kerberosPrincipal pointer;
  localUser pointer;
  userType int(10);
end-ds;

dcl-ds EIMListData qualified;
  dataLength uns(10);
  offsetToData uns(10);
end-ds;

dcl-ds EIMSubList qualified;
  entriesNumber uns(10);
  offsetToSublist uns(10);
end-ds;

dcl-ds EIMConfig qualified;
  bytesReturned uns(10);
  bytesAvailable uns(10);
  isEnabled int(10);
  // LDAPURL char(8);
  LDAPURLLength uns(10);
  offsetToLDAPURL uns(10);
  // localSystemRegistry char(8);
  localSystemRegistryLength uns(10);
  offsetToLocalSystemRegistry uns(10);
  // kerberosRegistry char(8);
  kerberosLength uns(10);
  offsetToKerberosRegistry uns(10);
  // x509Registry char(8);
  x509Length uns(10);
  offsetTox509Registry uns(10);
end-ds;

dcl-ds EIMAttribute qualified;
  bytesReturned uns(10);
  bytesAvailable uns(10);
  // handleAttribute char(8);
  dataLength uns(10);
  offsetToHandleAttribute uns(10);
end-ds;

dcl-ds EIMList qualified;
  bytesReturned uns(10);
  bytesAvailable uns(10);
  entriesReturned uns(10);
  entriesAvailable uns(10);
  offsetToFirstEntry uns(10);
end-ds;

dcl-ds EIMDomain qualified;
  offsetToNextEntry uns(10);
  // domainName char(8);
  domainNameLength uns(10);
  offsetToDomainName uns(10);
  // distinguishedDomainName char(8);
  distinguishedDomainNameLength uns(10);
  offsetToDistinguishedDomainName uns(10);
  // description char(8);
  descriptionLength uns(10);
  offsetToDescription uns(10);
  policyAssociation int(10);
end-ds;

dcl-ds EIMRegistry qualified;
  offsetToNextEntry uns(10);
  registryKind int(10);
  // registryName char(8);
  registryNameLength uns(10);
  offsetToRegistryName uns(10);
  // registryType char(8);
  registryTypeLength uns(10);
  offsetToRegistryType uns(10);
  // description char(8);
  descriptionLength uns(10);
  offsetToDescription uns(10);
  // entryUUID char(8); 
  entryUUIDLength uns(10);
  offsetToEntryUUID uns(10);
  // URI char(8);
  URILength uns(10);
  offsetToURI uns(10);
  // systemRegistryName char(8);
  systemRegistryNameLength uns(10);
  offsetToSystemRegistryName uns(10);
  // EIMRegistryAliasSublist char(8);
  EIMRegistryAliasSublistLength uns(10);
  offsetToEIMRegistryAliasSublist uns(10);
  mappingLookup int(10);
  policyAssociations int(10);
  // EIMRegistryNameSublist1 char(8);
  EIMRegistryNameSublistLength1 uns(10);
  offsetToEIMRegistryNameSublist1 uns(10);
  // EIMRegistryNameSublist2 char(8);
  EIMRegistryNameSublistLength2 uns(10);
  offsetToEIMRegistryNameSublist2 uns(10);
end-ds;

dcl-ds EIMIdentifier qualified;
  offsetToNextEntry uns(10);
  // uniqueName char(8);
  uniqueNameLength uns(10);
  offsetToUniqueName uns(10);
  // description char(8);
  descriptionLength uns(10);
  offsetToDescription uns(10);
  // UUID char(8);
  UUIDLength uns(10);
  offsetToUUID uns(10);
  // EIMIdentifierNameSublist char(8);
  EIMIdentifierNameSublistLength uns(10);
  offsetToEIMIdentifierNameSublist uns(10);
  // EimAddlInfoSublist char(8);
  EIMAddlInfoSublistLength uns(10);
  offsetToEIMAddlInfoSublist uns(10);
  AssociationType int(10);
  // usedGroupRegistry char(8);
  usedGroupRegistryLength uns(10);
  offsetToUsedGroupRegistry uns(10);
end-ds;

dcl-ds EIMAssociation qualified;
  offsetToNextEntry uns(10);
  AssociationType int(10);
  // registryType char(8);
  registryTypeLength uns(10);
  offsetToRegistryType uns(10);
  // registryName char(8);
  registryNameLength uns(10);
  offsetToRegistryName uns(10);
  // registryUserName char(8);
  registryUserNameLength uns(10);
  offsetToRegistryUserName uns(10);
end-ds;

dcl-ds EIMRegistryAlias qualified;
  offsetToNextEntry uns(10);
  // aliasType char(8);
  aliasTypeLength uns(10);
  offsetToAliasType uns(10);
  // aliasValue char(8);
  aliasValueLength uns(10);
  offsetToAliasValue uns(10);
end-ds;

dcl-ds EIMRegistryUser qualified dim;
  offsetToNextEntry uns(10);
  // name char(8);
  nameLength uns(10);
  offsetToName uns(10);
  // description char(8);
  descriptionLength uns(10);
  offsetToDescription uns(10);
  // EIMAddlInfoSublist char(8);
  EIMAddlInfoSublistLength uns(10);
  offsetToEIMAddlInfoSublist uns(10);
  // EIMCredentialInfoSublist char(8);
  EIMCredentialInfoSublistLength uns(10);
  offsetToEIMCredentialInfoSublist uns(10);
end-ds;

dcl-ds EIMTargetIdentity qualified;
  offsetToNextEntry uns(10);
  // userName char(8);
  userNameLength uns(10);
  offsetToUserName uns(10);
  associationType int(10);
  // sourceGroupRegistryName char(8);
  sourceGroupRegistryNameLength uns(10);
  offsetToSourceGroupRegistryName uns(10);
  // targetGroupRegistryName char(8);
  targetGroupRegistryNameLength uns(10);
  offsetToTargetGroupRegistryName uns(10);
  // EIMCredentialInfoSublist char(8);
  EIMCredentialInfoSublistLength uns(10);
  offsetToEIMCredentialInfoSublist uns(10);
end-ds;

dcl-ds EIMIdentifierName qualified;
  offsetToNextEntry uns(10);
  // name char(8);
  nameLength uns(10);
  offsetToName uns(10);
end-ds;

dcl-ds EIMRegistryName qualified;
  offsetToNextEntry uns(10);
  // name char(8);
  nameLength uns(10);
  offsetToName uns(10);
end-ds;

dcl-ds EIMAddlInfo qualified;
  offsetToNextEntry uns(10);
  // additionalInfo char(8);
  additionalInfoLength uns(10);
  offsetToAdditionalInfo uns(10);
end-ds;

dcl-ds EIMCredentialInfo qualified;
  offsetToNextEntry uns(10);
  credentialType int(10);
  credentialStatus int(10);
  // credentialData char(8);
  credentialDataLength uns(10);
  offsetToCredentialData uns(10);
end-ds;

dcl-ds EIMPolicyFilter qualified;
  offsetToNextEntry uns(10);
  policyFilterType int(10);
  // targetSourceRegistry char(8);
  targetSourceRegistryNameLength uns(10);
  offsetToTargetSourceRegistryName uns(10);
  // filterValue char(8);
  filterValueLength uns(10);
  offsetToFilterValue uns(10);
end-ds;

dcl-ds EIMRegistryAssociation qualified;
  offsetToNextEntry uns(10);
  associationType int(10);
  // targetRegistry char(8);
  targetRegistryNameLength uns(10);
  offsetToTargetRegistryName uns(10);
  // targetRegistryUser char(8);
  targetRegistryUserNameLength uns(10);
  offsetToTargetRegistryUserName uns(10);
  // EIMUniqueName char(8);
  EIMUniqueNameLength uns(10);
  offsetToEIMUniqueName uns(10);
  // targetSourceRegistry char(8);
  targetSourceRegistryNameLength uns(10);
  offsetToTargetSourceRegistryName uns(10);
  // filterValue char(8);
  filterValueLength uns(10);
  offsetToFilterValue uns(10);
  domainPolicyAssociationStatus int(10);
  sourceMappingLookupStatus int(10);
  targetMappingLookupStatus int(10);
  targetPolicyAssocStatus int(10);
end-ds;

dcl-ds EIMPolicyFilterValue qualified;
  offsetToNextEntry uns(10);
  // generatedPolicyFilterValue char(8);
  generatedPolicyFilterValueLength uns(10);
  offsetToGeneratedPolicyFilterValue uns(10);
end-ds;

dcl-ds EIMUserIdentity qualified;
  bytesReturned uns(10);
  bytesAvailable int(10);
  // userID char(8);
  userIDLength uns(10);
  offsetToUserID uns(10);
end-ds;

dcl-ds EIMAccess qualified;
  offsetToNextEntry uns(10);
  // userWithAccess char(8);
  userWithAccessLength uns(10);
  offsetToUserWithAccess uns(10);
end-ds;

dcl-ds EIMUserAccess qualified;
  offsetToNextEntry uns(10);
  EIMAdmin int(10);
  EIMRegAdmin int(10);
  EIMIdenAdmin int(10);
  EIMMappingLookup int(10);
  // EIMRegistryNameSublist char(8);
  EIMRegistryNameSublistLength uns(10);
  offsetToEIMRegistryNameSublist uns(10);
  EIMCredentialData int(10);
end-ds;


//--------------------------------------
// Special values
//--------------------------------------


// EIMCredentialInfo - values for "credentialStatus"
// EIMRegistryAssociation - values for "domainPolicyAssociationStatus", "sourceMappingLookupStatus",
//   "targetMappingLookupStatus", "targetPolicyAssocStatus"
dcl-c DISABLED const(1);
dcl-c ENABLED const(1);