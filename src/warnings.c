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

=head2 Internal Functions

=over 4

=item C<static int
find_line(struct Parrot_Interp *interpreter, struct PackFile_Debug * debug)>

Find the line number.

Returns -2 if the interpreter has no current profile counter.

I<What does returning -1 mean?>

=cut

*/

static int
find_line(struct Parrot_Interp *interpreter, struct PackFile_Debug * debug)
{
    size_t offs, i, n;
    op_info_t *op_info;
    opcode_t *pc;

    if (!interpreter->cur_pc)
        return -2;
    pc = interpreter->code->cur_cs->base.data;
    offs = interpreter->cur_pc - pc;
    for (i = n = 0; n < interpreter->code->cur_cs->base.size; i++) {
        op_info = &interpreter->op_info_table[*pc];
        if (n >= offs)
            return (int) debug->base.data[i];
        n += op_info->arg_count;
        pc += op_info->arg_count;
    }
    return -1;
}

/*

=item C<void
print_pbc_location(Parrot_Interp interpreter)>

Prints the bytecode location of the warning or error to C<PIO_STDERR>.

=cut

*/

void
print_pbc_location(Parrot_Interp interpreter)
{
    const char *file;
    int line;
    struct PackFile_Debug * debugs = interpreter->code->cur_cs->debugs;
    if (debugs) {
        file = debugs->filename;
        line = find_line(interpreter, debugs);
    }
    else {
        file = "(unknown file)";
        line = -1;
    }
    PIO_eprintf(interpreter, "\tin file '%s' near line %d\n", file, line);
}

/*

=item C<void
print_pbc_location_stdio(Parrot_Interp interpreter)>

Prints the bytecode location of the warning or error to C<stderr>.

Uses C<fprintf()> only. This may be called from exceptions.

=cut

*/

void
print_pbc_location_stdio(Parrot_Interp interpreter)
{
    const char *file;
    int line;
    struct PackFile_Debug * debugs = interpreter->code->cur_cs->debugs;
    if (debugs) {
        file = debugs->filename;
        line = find_line(interpreter, debugs);
    }
    else {
        file = "(unknown file)";
        line = -1;
    }
    fprintf(stderr, "\tin file '%s' near line %d\n", file, line);
}

/*

=item C<static INTVAL
print_warning(struct Parrot_Interp *interpreter, STRING *msg)>

Prints the warning message and the bytecode location.

=cut

*/

static INTVAL
print_warning(struct Parrot_Interp *interpreter, STRING *msg)
{

    if (!msg)
        PIO_puts(interpreter, PIO_STDERR(interpreter), "Unknown warning\n");
    else {
        PIO_putps(interpreter, PIO_STDERR(interpreter), msg);
        if (string_ord(msg, -1) != '\n')
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
Parrot_warn(struct Parrot_Interp *interpreter, INTVAL warnclass,
            const char *message, ...)>

The Parrot C string warning/error reporter.

Returns 2 on error, 1 on success.

C<message, ..> can be a C<Parrot_vsprintf_c()> format with arguments.

=cut

*/

INTVAL
Parrot_warn(struct Parrot_Interp *interpreter, INTVAL warnclass,
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
Parrot_warn_s(struct Parrot_Interp *interpreter, INTVAL warnclass,
              STRING *message, ...)>

The Parrot C<STRING> warning/error reporter.

Returns 2 on error, 1 on success.

C<message, ..> can be a C<Parrot_vsprintf_s()> format with arguments.

=cut

*/

INTVAL
Parrot_warn_s(struct Parrot_Interp *interpreter, INTVAL warnclass,
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
