#if !defined(PARROT_WARNINGS_H_GUARD)
#define PARROT_WARNINGS_H_GUARD

/* These should be visible to embedders. */

/* Warning flags */
/* &gen_from_enum(warnings.pasm)  */
typedef enum {
    PARROT_WARNINGS_ALL_FLAG      = 0xFF,
    PARROT_WARNINGS_NONE_FLAG     = 0x00,
    PARROT_WARNINGS_UNDEF_FLAG    = 0x01,
    PARROT_WARNINGS_IO_FLAG       = 0x02,
    PARROT_WARNINGS_PLATFORM_FLAG = 0x04
} Warnings_classes;

/* &end_gen */

#define PARROT_WARNINGS_on(interp, flag) do { \
    (interp)->ctx.warns = buffer_unmake_COW(interp, (interp)->ctx.warns); \
    ( (*(UINTVAL *) (interp)->ctx.warns->bufstart) |= (flag)); \
    } while (0)
#define PARROT_WARNINGS_off(interp, flag) do { \
    (interp)->ctx.warns = buffer_unmake_COW(interp, (interp)->ctx.warns); \
    ( (*(UINTVAL *) (interp)->ctx.warns->bufstart) &= ~(flag)); \
    } while (0)
#define PARROT_WARNINGS_test(interp, flag) \
        ( (*(UINTVAL *) (interp)->ctx.warns->bufstart) & (flag))


#if defined(PARROT_IN_CORE)

#include "parrot/parrot.h"

void print_pbc_location(Parrot_Interp);

INTVAL Parrot_warn(Parrot_Interp, INTVAL warnclass, const char *message, ...);

INTVAL Parrot_warn_s(Parrot_Interp, INTVAL warnclass, STRING *message, ...);

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
