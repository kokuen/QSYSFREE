# QSYSFREE
Conversion of the IBM QSYSINC library rpgle copy members to fully free format.

# What has been converted?
All of the data structures and constants that are in the rpgle copy members of the QSYSINC library.
Comments have been included in the convertion to the best extent to stay relevent. 

# What has been modified?
## Names
Variables, constants and data structures names have been modified, based on IBM's code comments and their respective role.
The main objective here was to give them more consistent and readable names.

## Qualified data structures
All data structures are now qualified to allow same field names within multiple data structures.

## Added constants
Originally, some data structures fields have comments indicating values to use or expect for them, but without declaring them.
These values have been added as constants into the same copy member so you can start to use them directly. 

## Compiler indications
Compiler instructions have been added to avoid inclusion redundancy.