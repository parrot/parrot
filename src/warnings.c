/*
Copyright (C) 2001-2010, Parrot Foundation.
$Id$

=head1 NAME

src/warnings.c - Warning and error reporting

=head1 DESCRIPTION

Parrot C<STRING> and C string versions of a function to print warning/error
messages.

=over 4

=cut

*/

#include "parrot/parrot.h"

#include <stdarg.h>

/* HEADERIZER HFILE: include/parrot/warnings.h */

/* HEADERIZER BEGIN: static */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

static INTVAL print_warning(PARROT_INTERP, ARGIN_NULLOK(STRING *msg))
        __attribute__nonnull__(1);

#define ASSERT_ARGS_print_warning __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: static */

/*

=item C<void print_pbc_location(PARROT_INTERP)>

Prints the bytecode location of the warning or error to C<Parrot_io_STDERR>.

=cut

*/

PARROT_EXPORT
void
print_pbc_location(PARROT_INTERP)
{
    ASSERT_ARGS(print_pbc_location)
    Interp * const tracer = (interp->pdb && interp->pdb->debugger) ?
        interp->pdb->debugger :
        interp;
    Parrot_io_eprintf(tracer, "%Ss\n",
            Parrot_Context_infostr(interp, CURRENT_CONTEXT(interp)));
}

/*

=item C<static INTVAL print_warning(PARROT_INTERP, STRING *msg)>

Prints the warning message and the bytecode location.

=cut

*/

static INTVAL
print_warning(PARROT_INTERP, ARGIN_NULLOK(STRING *msg))
{
    ASSERT_ARGS(print_warning)
    if (!msg)
        Parrot_io_puts(interp, Parrot_io_STDERR(interp), "Unknown warning\n");
    else {
        Parrot_io_putps(interp, Parrot_io_STDERR(interp), msg);
        if (string_ord(interp, msg, -1) != '\n')
            Parrot_io_eprintf(interp, "%c", '\n');
    }
    print_pbc_location(interp);
    return 1;
}

/*

=back

=head2 Parrot Warnings Interface

=over 4

=item C<INTVAL Parrot_warn(PARROT_INTERP, INTVAL warnclass, const char *message,
...)>

The Parrot C string warning/error reporter.

Returns 2 on error, 1 on success.

C<message, ..> can be a C<Parrot_vsprintf_c()> format with arguments.

=cut

*/

PARROT_EXPORT
PARROT_IGNORABLE_RESULT
INTVAL
Parrot_warn(PARROT_INTERP, INTVAL warnclass,
            ARGIN(const char *message), ...)
{
    ASSERT_ARGS(Parrot_warn)
    if (!PARROT_WARNINGS_test(interp, warnclass))
        return 2;
    else {
        STRING *targ;
        va_list args;

        va_start(args, message);
        targ = Parrot_vsprintf_c(interp, message, args);
        va_end(args);
        return print_warning(interp, targ);
    }
}

/*

=item C<void Parrot_warn_deprecated(PARROT_INTERP, const char *message)>

Warn about use of a deprecated feature

C<message> is a C string.

=cut

*/

PARROT_EXPORT
void
Parrot_warn_deprecated(PARROT_INTERP, ARGIN(const char *message))
{
    ASSERT_ARGS(Parrot_warn_deprecated)

    if (PARROT_WARNINGS_test(interp, PARROT_WARNINGS_DEPRECATED_FLAG)) {
        STRING *msg = Parrot_sprintf_c(interp, "WARNING: %s\n", message);
        print_warning(interp, msg);
    }
}

/*

=back

=head1 SEE ALSO

F<include/parrot/warnings.h>.

=cut

*/


/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
