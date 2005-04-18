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

/* error flags */
/* &gen_from_enum(errors.pasm)  */
typedef enum {
    PARROT_ERRORS_ALL_FLAG      = 0xFF,
    PARROT_ERRORS_NONE_FLAG     = 0x00,
    PARROT_ERRORS_GLOBALS_FLAG  = 0x01,
    PARROT_ERRORS_OVERFLOW_FLAG = 0x02
} Errors_classes;

/* &end_gen */

#define PARROT_we_on(we, interp, flag) do { \
    (interp)->ctx.we |= (flag); } while (0)
#define PARROT_we_off(we, interp, flag) do { \
    (interp)->ctx.we &= ~(flag); } while (0)
#define PARROT_we_test(we, interp, flag)  \
    (interp)->ctx.we & (flag)

#define PARROT_WARNINGS_on(interp, flag) PARROT_we_on(warns, interp, flag)
#define PARROT_WARNINGS_off(interp, flag) PARROT_we_off(warns, interp, flag)
#define PARROT_WARNINGS_test(interp, flag) PARROT_we_test(warns, interp, flag)

#define PARROT_ERRORS_on(interp, flag) PARROT_we_on(errors, interp, flag)
#define PARROT_ERRORS_off(interp, flag) PARROT_we_off(errors, interp, flag)
#define PARROT_ERRORS_test(interp, flag) PARROT_we_test(errors, interp, flag)

#if defined(PARROT_IN_CORE)

#include "parrot/parrot.h"

void print_pbc_location(Parrot_Interp);

INTVAL Parrot_warn(Parrot_Interp, INTVAL warnclass, const char *message, ...);

INTVAL Parrot_warn_s(Parrot_Interp, INTVAL warnclass, STRING *message, ...);

#endif /* PARROT_IN_CORE */
#endif /* PARROT_WARNINGS_H_GUARD */

/*
 * Local variables:
 * c-indentation-style: bsd
 * c-basic-offset: 4
 * indent-tabs-mode: nil
 * End:
 *
 * vim: expandtab shiftwidth=4:
 */
