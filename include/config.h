#ifndef GUARD_CONFIG_H
#define GUARD_CONFIG_H

#ifndef REVISION
#define REVISION 0
#endif

#if REVISION == 2
#define BUGFIX_BERRY
#endif

// European editions of Ruby/Sapphire and all editions of Emerald have this fix.
// #define BUGFIX_TRAINERAPPROACH

#endif // GUARD_CONFIG_H