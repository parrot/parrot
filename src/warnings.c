/*
Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
$Id$

=head1 NAME

src/warnings.c - Warning and error reporting

=head1 DESCRIPTION

Parrot C<STRING> and C string versions of a function to print warning/error
messages.

=cut

*/

#include "parrot/parrot.h"

#include <stdarg.h>
#include <assert.h>

/*

=item C<void
print_pbc_location(Parrot_Interp interpreter)>

Prints the bytecode location of the warning or error to C<PIO_STDERR>.

=cut

*/

void
print_pbc_location(Parrot_Interp inter)
{
    PIO_eprintf(inter, "%Ss", Parrot_Context_infostr(inter, &inter->ctx));
}

/*

=item C<static INTVAL
print_warning(Interp *interpreter, STRING *msg)>

Prints the warning message and the bytecode location.

=cut

*/

static INTVAL
print_warning(Interp *interpreter, STRING *msg)
{

    if (!msg)
        PIO_puts(interpreter, PIO_STDERR(interpreter), "Unknown warning\n");
    else {
        PIO_putps(interpreter, PIO_STDERR(interpreter), msg);
        if (string_ord(interpreter, msg, -1) != '\n')
            PIO_eprintf(interpreter, "%c", '\n');
    }
    print_pbc_location(interpreter);
    return 1;
}

/*

=back

=head2 Parrot Warnings Interface

=over

=item C<INTVAL
Parrot_warn(Interp *interpreter, INTVAL warnclass,
            const char *message, ...)>

The Parrot C string warning/error reporter.

Returns 2 on error, 1 on success.

C<message, ..> can be a C<Parrot_vsprintf_c()> format with arguments.

=cut

*/

INTVAL
Parrot_warn(Interp *interpreter, INTVAL warnclass,
            const char *message, ...)
{
    STRING *targ;

    va_list args;

    assert(interpreter);
    if (!PARROT_WARNINGS_test(interpreter, warnclass))
        return 2;

    va_start(args, message);
    targ = Parrot_vsprintf_c(interpreter, message, args);
    va_end(args);
    return print_warning(interpreter, targ);

}

/*

=item C<INTVAL
Parrot_warn_s(Interp *interpreter, INTVAL warnclass,
              STRING *message, ...)>

The Parrot C<STRING> warning/error reporter.

Returns 2 on error, 1 on success.

C<message, ..> can be a C<Parrot_vsprintf_s()> format with arguments.

=cut

*/

INTVAL
Parrot_warn_s(Interp *interpreter, INTVAL warnclass,
              STRING *message, ...)
{
    STRING *targ;

    va_list args;

    if (!interpreter || !PARROT_WARNINGS_test(interpreter, warnclass))
        return 2;

    va_start(args, message);
    targ = Parrot_vsprintf_s(interpreter, message, args);
    va_end(args);

    return print_warning(interpreter, targ);
}

/*

=back

=head1 SEE ALSO

F<include/parrot/warnings.h>.

=cut

*/

/*
 * Local variables:
 * c-indentation-style: bsd
 * c-basic-offset: 4
 * indent-tabs-mode: nil
 * End:
 *
 * vim: expandtab shiftwidth=4:
 */
