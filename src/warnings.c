#include "parrot/parrot.h"

#include <stdarg.h>

#define Default(interp, field, default) (interp ? interp->field : default)

INTVAL
Parrot_warn(struct Parrot_Interp *interpreter, INTVAL warnclass,
            const char *message, ...)
{
    STRING *targ;

    va_list args;
    va_start(args, message);

    if (!(interpreter == NULL || PARROT_WARNINGS_test(interpreter, warnclass))) {
        return 2;
    }

    targ = Parrot_vsprintf_c(interpreter, message, &args);
    if (!targ) {
        return -1;
    }

    va_end(args);

    targ = Parrot_sprintf_c(
             interpreter,
             "%S at %S line %d.\n", targ,
             Default(interpreter, current_file, string_make(interpreter, "?", 1, NULL, 0, NULL)),
             Default(interpreter, current_line, 0)
    );
    
    if (!targ) {
        return -1;
    }

    if (PIO_write
        (interpreter, PIO_STDERR(interpreter), targ->bufstart,
         targ->bufused) < 0) {
        return -2;
    }
    else {
        return 1;
    }
}

INTVAL
Parrot_warn_s(struct Parrot_Interp *interpreter, INTVAL warnclass,
              STRING *message, ...)
{
    STRING *targ;

    va_list args;
    va_start(args, message);

    if (!(interpreter == NULL || PARROT_WARNINGS_test(interpreter, warnclass))) {
        return 2;
    }

    targ = Parrot_vsprintf_s(interpreter, message, &args);
    if (!targ) {
        return -1;
    }

    va_end(args);

    targ = Parrot_sprintf_c(
        interpreter, "%S at %S line %d.\n", targ,
        Default(interpreter, current_file, string_make(interpreter, "?", 1, NULL, 0, NULL)),
        Default(interpreter, current_line, 0)
    );
    if (!targ) {
        return -1;
    }

    if (PIO_write
        (interpreter, PIO_STDERR(interpreter), targ->bufstart,
         targ->bufused) < 0) {
        return -2;
    }
    else {
        return 1;
    }
}

/*
 * Local variables:
 * c-indentation-style: bsd
 * c-basic-offset: 4
 * indent-tabs-mode: nil
 * End:
 *
 * vim: expandtab shiftwidth=4:
 */
