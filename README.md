# QSYSFREE
Conversion of the IBM QSYSINC library rpgle copy members to fully free format.

# What has been converted?
All of the data structures and constants that are in the rpgle and rpg copy members of the QSYSINC library.
Comments have been included in the conversion to the best extent to stay relevent.

# What has been modified?
## Names
Variables, constants and data structures names have been modified, based on IBM's code comments or their respective role.
Reserved data structures fields, used for alignement, are renammed into anonymous fields.
The main objective here was to give them more consistent and readable names.

## Indicators
Some data structure fields are originally declared as "char(1)" or "int(3)" type but their name and/or IBM code comment clearly shows that they are used as boolean values.
These fields have been transformed into indicators to go accordingly with it. When the usage couldn't be clearly determined, the oiginal definition was kept.

# What has been added?
## Data structures qualification
All data structures are now qualified to allow same field names within multiple data structures.

## Constants for special values
Originally, some data structures fields have comments indicating values associated to them, but without declaring them.
These values have been added as constants into the same copy member so you can start to use them directly. 

## Include guard
Compiler instructions have been added as "include guards" at the beginning of every source member to avoid any inclusion redundancy.