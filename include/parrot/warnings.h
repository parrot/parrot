#if !defined(PARROT_WARNINGS_H_GUARD)
#define PARROT_WARNINGS_H_GUARD

/* These should be visible to embedders. */

/* Warning flags */
typedef enum {
    PARROT_WARNINGS_ALL_FLAG   = 0xFF,
    PARROT_WARNINGS_NONE_FLAG  = 0x00,
    PARROT_WARNINGS_UNDEF_FLAG = 0x01,
    PARROT_WARNINGS_IO_FLAG    = 0x02
} Warnings_classes;

#define PARROT_WARNINGS_on(interp, flag) \
        (/*@i1@*/ (interp)->warns->classes |= (flag))
#define PARROT_WARNINGS_off(interp, flag) \
        (/*@i1*/(interp)->warns->classes &= ~(flag))
#define PARROT_WARNINGS_test(interp, flag) \
        (/*@i1*/(interp)->warns->classes & (flag))


#if defined(PARROT_IN_CORE)

#include "parrot/parrot.h"

INTVAL Parrot_warn(struct Parrot_Interp *, INTVAL warnclass,
                   const char *message, ...);

INTVAL Parrot_warn_s(struct Parrot_Interp *, INTVAL warnclass,
                     STRING *message, ...);

#endif

#endif

/*
 * Local variables:
 * c-indentation-style: bsd
 * c-basic-offset: 4
 * indent-tabs-mode: nil
 * End:
 *
 * vim: expandtab shiftwidth=4:
 */
