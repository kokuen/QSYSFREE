# QSYSFREE
Conversion of the IBM QSYSINC library rpgle source members to fully free format for an easier use.

# What has been modified?
## Names
Variables, constants and data structures names have been modified, based on IBM's code commentaries and their respective role.
The main objective here was them to have more consistent names.

## Types
In some cases, a field / variable type has been modified to a more appropriate type.
Tipycally, fields of type char(1) that are already used as indicators have been transformed into... indicators.

## Qualified data structures
All data structures are now qualified to allow same field names within multiple data structures.

## Enumerations
Constants representing special values have been regrouped into enumerations for better readability of the code

## Compiler indications
Compiler instructions have been added to avoid "include loops" while including one or more of the source members in your code.  