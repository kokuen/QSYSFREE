# QSYSFREE
Conversion of the IBM QSYSINC library rpgle source members to fully free format for an easier use.

# What has been modified?
## Names
Variables, constants and data structures names have been modified, based on IBM's code commentaries and their respective role.
The main objective here was them to have more consistent names.

## Qualified data structures
All data structures are now qualified to allow same field names within multiple data structures.

## Enumerations
Constants representing special values have been regrouped into enumerations for better readability of the code.

## Compiler indications
Compiler instructions have been added to avoid inclusion redudancy.