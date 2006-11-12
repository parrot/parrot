/*
Copyright (C) 2001-2003, The Perl Foundation.
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
#include <assert.h>

/*

=item C<void
print_pbc_location(Parrot_Interp interp)>

Prints the bytecode location of the warning or error to C<PIO_STDERR>.

=cut

*/

void
print_pbc_location(Parrot_Interp interp)
{
    Interp * const tracer =
        interp->debugger ?
            interp->debugger : interp;
    PIO_eprintf(tracer, "%Ss\n",
            Parrot_Context_infostr(interp,
                CONTEXT(interp->ctx)));
}

/*

=item C<static INTVAL
print_warning(Interp *interp, STRING *msg)>

Prints the warning message and the bytecode location.

=cut

*/

static INTVAL
print_warning(Interp *interp, STRING *msg)
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

=back

=head2 Parrot Warnings Interface

=over

=item C<INTVAL
Parrot_warn(Interp *interp, INTVAL warnclass,
            const char *message, ...)>

The Parrot C string warning/error reporter.

Returns 2 on error, 1 on success.

C<message, ..> can be a C<Parrot_vsprintf_c()> format with arguments.

=cut

*/

INTVAL
Parrot_warn(Interp *interp, INTVAL warnclass,
            const char *message, ...)
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

=item C<INTVAL
Parrot_warn_s(Interp *interp, INTVAL warnclass,
              STRING *message, ...)>

The Parrot C<STRING> warning/error reporter.

Returns 2 on error, 1 on success.

C<message, ..> can be a C<Parrot_vsprintf_s()> format with arguments.

=cut

*/

INTVAL
Parrot_warn_s(Interp *interp, INTVAL warnclass,
              STRING *message, ...)
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
