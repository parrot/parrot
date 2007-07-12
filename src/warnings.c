/*
Copyright (C) 2001-2007, The Perl Foundation.
$Id$

=head1 NAME

src/warnings.c - Warning and error reporting

=head1 DESCRIPTION

Parrot C<STRING> and C string versions of a function to print warning/error
messages.

*/

#include "parrot/parrot.h"

#include <stdarg.h>
#include <assert.h>

/* HEADERIZER HFILE: include/parrot/warnings.h */

/* HEADERIZER BEGIN: static */

static INTVAL print_warning( PARROT_INTERP, NULLOK(STRING *msg) )
        __attribute__nonnull__(1);

/* HEADERIZER END: static */

/*

FUNCDOC: print_pbc_location

Prints the bytecode location of the warning or error to C<PIO_STDERR>.

*/

void
print_pbc_location(PARROT_INTERP)
{
    Interp * const tracer =
        interp->debugger ?
            interp->debugger : interp;
    PIO_eprintf(tracer, "%Ss\n",
            Parrot_Context_infostr(interp,
                CONTEXT(interp->ctx)));
}

/*

FUNCDOC: print_warning

Prints the warning message and the bytecode location.

*/

static INTVAL
print_warning(PARROT_INTERP, NULLOK(STRING *msg))
{
    if (!msg)
        PIO_puts(interp, PIO_STDERR(interp), "Unknown warning\n");
    else {
        PIO_putps(interp, PIO_STDERR(interp), msg);
        if (string_ord(interp, msg, -1) != '\n')
            PIO_eprintf(interp, "%c", '\n');
    }
    print_pbc_location(interp);
    return 1;
}

/*

=head2 Parrot Warnings Interface

FUNCDOC: Parrot_warn

The Parrot C string warning/error reporter.

Returns 2 on error, 1 on success.

C<message, ..> can be a C<Parrot_vsprintf_c()> format with arguments.

*/

PARROT_API
INTVAL
Parrot_warn(PARROT_INTERP, INTVAL warnclass,
            NOTNULL(const char *message), ...)
{
    STRING *targ;

    va_list args;

    assert(interp);
    if (!PARROT_WARNINGS_test(interp, warnclass))
        return 2;

    va_start(args, message);
    targ = Parrot_vsprintf_c(interp, message, args);
    va_end(args);
    return print_warning(interp, targ);
}

/*

FUNCDOC: Parrot_warn_s

The Parrot C<STRING> warning/error reporter.

Returns 2 on error, 1 on success.

C<message, ..> can be a C<Parrot_vsprintf_s()> format with arguments.

*/

PARROT_API
INTVAL
Parrot_warn_s(NULLOK_INTERP, INTVAL warnclass,
              NOTNULL(STRING *message), ...)
{
    STRING *targ;

    va_list args;

    if (!interp || !PARROT_WARNINGS_test(interp, warnclass))
        return 2;

    va_start(args, message);
    targ = Parrot_vsprintf_s(interp, message, args);
    va_end(args);

    return print_warning(interp, targ);
}

/*

=head1 SEE ALSO

F<include/parrot/warnings.h>.

*/


/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
