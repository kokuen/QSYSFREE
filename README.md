# QSYSFREE
Conversion of the IBM QSYSINC library rpgle copy members to fully free format.

# What has been modified?
## Names
Variables, constants and data structures names have been modified, based on IBM's code comments and their respective role.
The main objective here was to give them more consistent and readable names.

## Qualified data structures
All data structures are now qualified to allow same field names within multiple data structures.

## Added constants
Some data structures fields have comments indicating values to use / expect for them but without declaring them.
I declared these values as constants into the same copy member so you can start to use them directly. 

## Compiler indications
Compiler instructions have been added to avoid inclusion redundancy.