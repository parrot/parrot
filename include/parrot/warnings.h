#if !defined(PARROT_WARNINGS_H_GUARD)
#define PARROT_WARNINGS_H_GUARD

#define PARROT_WARNINGS_ALL_FLAG         0xFF
#define PARROT_WARNINGS_NONE_FLAG        0x00
#define PARROT_WARNINGS_UNDEF_FLAG       0x01
#define PARROT_WARNINGS_IO_FLAG          0x02

#if defined(PARROT_IN_CORE)

#include "parrot/parrot.h"

#define PARROT_WARNINGS_on(interp, flag)   interp->warns->classes |=  flag
#define PARROT_WARNINGS_off(interp, flag)  interp->warns->classes &= ~flag
#define PARROT_WARNINGS_test(interp, flag) interp->warns->classes &   flag

INTVAL
Parrot_warn(struct Parrot_Interp *, INTVAL warnclass, const char* message, ...);

INTVAL
Parrot_warn_s(struct Parrot_Interp *, INTVAL warnclass, STRING* message, ...);

#endif

#endif
