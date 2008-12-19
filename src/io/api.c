/*
Copyright (C) 2001-2008, The Perl Foundation.
$Id$

=head1 NAME

src/io/api.c - Parrot I/O API

=head1 DESCRIPTION

The Parrot I/O subsystem provides the core I/O functionality for all parts of
Parrot. This file implements the public interface to the I/O subsystem. Common
utility functions that aren't part of the public interface are defined in
F<src/io/common.c> and utility functions for a specific platform are in
F<src/io/unix.c>, F<src/io/win32.c>, or F<src/io/portable.c>. The platform is
selected in F<include/parrot/io.h>, based on #defines from the configuration
process.

The C<FileHandle> PMC provides the class-based interface for filehandles that
is used in Parrot ops.

=cut

*/

#include "parrot/parrot.h"
#include "io_private.h"
#include "api.str"

#include <stdarg.h>

/* HEADERIZER HFILE: include/parrot/io.h */

/*

=head2 Generic I/O interface

=over 4

=item C<PMC * Parrot_io_new_pmc>

Creates a new I/O filehandle object. The value of C<flags> is set
in the returned PMC.

=cut

*/

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
PMC *
Parrot_io_new_pmc(PARROT_INTERP, INTVAL flags)
{
    PMC * const new_io = pmc_new(interp, enum_class_FileHandle);

    Parrot_io_set_flags(interp, new_io, flags);

    return new_io;
}




/*

=item C<PMC * Parrot_io_open>

Creates and returns a C<FileHandle> PMC for a given string path and flags.

=cut

*/

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
PMC *
Parrot_io_open(PARROT_INTERP, ARGIN_NULLOK(PMC *pmc),
        ARGIN(STRING *path), ARGIN_NULLOK(STRING *mode_str))
{
    PMC *new_filehandle;
    const INTVAL flags = Parrot_io_parse_open_flags(interp, mode_str);


    new_filehandle = PIO_OPEN(interp, pmc, path, flags);

    if (PMC_IS_NULL(new_filehandle))
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_PIO_ERROR,
            "Unable to open filehandle");

    Parrot_io_setbuf(interp, new_filehandle, PIO_UNBOUND);
    return new_filehandle;
}

/*

=item C<PMC * Parrot_io_fdopen>

Creates and returns a C<FileHandle> PMC for a given set of flags on an
existing, open file descriptor.

This is used particularly to initialize the C<STD*> IO handles onto the
OS IO handles (0, 1, 2).

=cut

*/

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
PMC *
Parrot_io_fdopen(PARROT_INTERP, ARGIN_NULLOK(PMC *pmc), PIOHANDLE fd,
        ARGIN(STRING *sflags))
{
    PMC *new_filehandle;
    INTVAL flags;

    flags = Parrot_io_parse_open_flags(interp, sflags);
    if (!flags)
        return PMCNULL;

    new_filehandle = PIO_FDOPEN(interp, pmc, fd, flags);

    if (PMC_IS_NULL(new_filehandle))
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_PIO_ERROR,
            "Unable to open filehandle");

    if (Parrot_io_get_flags(interp, new_filehandle) & PIO_F_CONSOLE)
        Parrot_io_setlinebuf(interp, new_filehandle);
    else
        Parrot_io_setbuf(interp, new_filehandle, PIO_UNBOUND);

    return new_filehandle;
}

/*

=item C<INTVAL Parrot_io_close>

Flushes, closes, and destroys the C<ParrotIO> PMC C<*pmc>.

=cut

*/

PARROT_EXPORT
INTVAL
Parrot_io_close(PARROT_INTERP, ARGMOD(PMC *pmc))
{
    INTVAL res;

    if (Parrot_io_is_closed(interp, pmc))
        return -1;

    Parrot_io_flush(interp, pmc);
    res =  PIO_CLOSE(interp, pmc);
    Parrot_io_clear_buffer(interp, pmc);
    return res;
}

/*

=item C<INTVAL Parrot_io_is_closed>

Test whether a filehandle is closed.

=cut

*/

PARROT_EXPORT
INTVAL
Parrot_io_is_closed(PARROT_INTERP, ARGMOD(PMC *pmc))
{
    return PIO_IS_CLOSED(interp, pmc);
}

/*

=item C<void Parrot_io_flush>

Flushes the C<ParrotIO> PMC C<*pmc>.

=cut

*/

PARROT_EXPORT
void
Parrot_io_flush(PARROT_INTERP, ARGMOD(PMC *pmc))
{
    INTVAL ignored;

    if (Parrot_io_is_closed(interp, pmc))
        return;

    Parrot_io_flush_buffer(interp, pmc);
    ignored = PIO_FLUSH(interp, pmc);
    UNUSED(ignored);
}

/*

=item C<STRING * Parrot_io_reads>

Return a new C<STRING*> holding up to C<len> bytes.

=cut

*/


PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
STRING *
Parrot_io_reads(PARROT_INTERP, ARGMOD(PMC *pmc), size_t len)
{
    STRING               *res;
    INTVAL                ignored;

    if (Parrot_io_is_closed(interp, pmc))
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_PIO_ERROR,
            "Cannot read from a closed filehandle");

    if (Parrot_io_get_buffer_flags(interp, pmc) & PIO_BF_MMAP) {
        res           = new_string_header(interp, 0);
        res->charset  = Parrot_iso_8859_1_charset_ptr;   /* XXX binary */
        res->encoding = Parrot_fixed_8_encoding_ptr;
    }
    else {
        res = NULL;
        res = Parrot_io_make_string(interp, &res, len);
    }

    res->bufused = len;

    if (Parrot_io_is_encoding(interp, pmc, CONST_STRING(interp, "utf8")))
        ignored = Parrot_io_read_utf8(interp, pmc, &res);
    else
        ignored = Parrot_io_read_buffer(interp, pmc, &res);
    UNUSED(ignored);

    return res;
}

/*

=item C<INTVAL Parrot_io_read>

Reads up to C<len> bytes from C<*pmc> and copies them into C<*buffer>.

=cut

*/

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
INTVAL
Parrot_io_read(PARROT_INTERP, ARGMOD(PMC *pmc), ARGIN(char *buffer), size_t len)
{
    STRING *res = new_string_header(interp, 0);

    if (Parrot_io_is_closed(interp, pmc))
        return -1;

    res->strstart = buffer;
    res->bufused = len;

    if (Parrot_io_is_encoding(interp, pmc, CONST_STRING(interp, "utf8")))
        return Parrot_io_read_utf8(interp, pmc, &res);

    return Parrot_io_read_buffer(interp, pmc, &res);
}

/*

=item C<INTVAL Parrot_io_write>

Writes C<len> bytes from C<*buffer> to C<*pmc>.

=cut

*/

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
INTVAL
Parrot_io_write(PARROT_INTERP, ARGMOD(PMC *pmc), ARGIN(const void *buffer), size_t len)
{
    DECL_CONST_CAST;

    if (Parrot_io_is_closed(interp, pmc))
        return -1;

    if (Parrot_io_get_flags(interp, pmc) & PIO_F_WRITE) {
        STRING fake;
        /* TODO skip utf8 translation layers if any */
        fake.strstart = (char *) PARROT_const_cast(void *, buffer);
        fake.strlen = fake.bufused = len;
        fake.charset = Parrot_default_charset_ptr;
        fake.encoding = Parrot_default_encoding_ptr;

        if (Parrot_io_is_encoding(interp, pmc, CONST_STRING(interp, "utf8")))
            return Parrot_io_write_utf8(interp, pmc, &fake);

        return Parrot_io_write_buffer(interp, pmc, &fake);
    }
    else
        return 0;
}

/*

=item C<PIOOFF_T Parrot_io_seek>

Moves the read/write position of C<*pmc> to offset C<bytes> from the
position indicated by C<w>. Typically C<w> will be C<0> for the start of
the file, C<1> for the current position, and C<2> for the end.

=cut

*/

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PIOOFF_T
Parrot_io_seek(PARROT_INTERP, ARGMOD(PMC *pmc), PIOOFF_T offset, INTVAL w)
{
    if (Parrot_io_is_closed(interp, pmc))
        return -1;

    return Parrot_io_seek_buffer(interp, pmc, offset, w);
}

/*

=item C<PIOOFF_T Parrot_io_tell>

Returns the current read/write position of C<*pmc>.

=cut

*/

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PIOOFF_T
Parrot_io_tell(PARROT_INTERP, ARGMOD(PMC *pmc))
{
    if (Parrot_io_is_closed(interp, pmc))
        return -1;

    return Parrot_io_get_file_position(interp, pmc);
    /* return PIO_TELL(interp, pmc); */
}

/*

=item C<INTVAL Parrot_io_peek>

Retrieve the next character in the stream without modifying the stream. Calls
the platform-specific implementation of 'peek'.

=cut

*/

PARROT_EXPORT
INTVAL
Parrot_io_peek(PARROT_INTERP, ARGMOD(PMC *pmc), ARGOUT(STRING **buffer))
{
    if (Parrot_io_is_closed(interp, pmc))
        return -1;

    return Parrot_io_peek_buffer(interp, pmc, buffer);
}

/*

=item C<INTVAL Parrot_io_eof>

Returns a boolean value indication whether C<*pmc>'s current read/write
position is C<EOF>.

=cut

*/

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
INTVAL
Parrot_io_eof(PARROT_INTERP, ARGMOD(PMC *pmc))
{
    /* io could be null here, but rather than return a negative error
     * we just fake EOF since eof test is usually in a boolean context.
     */
    if (PMC_IS_NULL(pmc) || Parrot_io_is_closed(interp, pmc))
            return 1;

    return (Parrot_io_get_flags(interp, pmc) & (PIO_F_EOF)) ? 1 : 0;

}

/*

=item C<INTVAL Parrot_io_puts>

Writes C<*s> tp C<*pmc>. C string version.

=cut

*/

PARROT_EXPORT
INTVAL
Parrot_io_puts(PARROT_INTERP, ARGMOD(PMC *pmc), ARGIN(const char *s))
{
    return Parrot_io_write(interp, pmc, s, strlen(s));
}

/*

=item C<INTVAL Parrot_io_putps>

Writes C<*s> to C<*pmc>. Parrot string version.

=cut

*/

PARROT_EXPORT
INTVAL
Parrot_io_putps(PARROT_INTERP, ARGMOD(PMC *pmc), ARGMOD_NULLOK(STRING *s))
{

    if (PMC_IS_NULL(pmc)
    || !VTABLE_isa(interp, pmc, CONST_STRING(interp, "FileHandle")))
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_PIO_ERROR,
            "Cannot write to non-IO PMC");

    if (Parrot_io_is_closed(interp, pmc))
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_PIO_ERROR,
            "Cannot write to a closed filehandle");

    if (!(Parrot_io_get_flags(interp, pmc) & PIO_F_WRITE))
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_PIO_ERROR,
            "Cannot write to a filehandle not opened for write");

    if (STRING_IS_NULL(s))
        return 0;

#if ! DISABLE_GC_DEBUG
    /* trigger GC for debug - but not during tests */
    if (0 && GC_DEBUG(interp))
        Parrot_do_dod_run(interp, GC_trace_stack_FLAG);
#endif

    if (Parrot_io_is_encoding(interp, pmc, CONST_STRING(interp, "utf8")))
        return Parrot_io_write_utf8(interp, pmc, s);

    return Parrot_io_write_buffer(interp, pmc, s);
}

/*

=item C<INTVAL Parrot_io_fprintf>

Writes a C string format with varargs to C<*pmc>.

=cut

*/

PARROT_EXPORT
INTVAL
Parrot_io_fprintf(PARROT_INTERP, ARGMOD(PMC *pmc), ARGIN(const char *s), ...)
{
    va_list args;
    INTVAL ret;

    va_start(args, s);

    ret = Parrot_io_putps(interp, pmc, Parrot_vsprintf_c(interp, s, args));

    va_end(args);

    return ret;
}

/*

=item C<INTVAL Parrot_io_printf>

Writes a C string format with varargs to C<stdout>.

=cut

*/

PARROT_EXPORT
INTVAL
Parrot_io_printf(PARROT_INTERP, ARGIN(const char *s), ...)
{
    va_list args;
    INTVAL ret;

    va_start(args, s);

    if (interp) {
        STRING * const str = Parrot_vsprintf_c(interp, s, args);
        ret = Parrot_io_putps(interp, _PIO_STDOUT(interp), str);
    }
    else {
        /* Be nice about this...
         **   XXX BD Should this use the default PIO_STDOUT or something?
         */
        ret = vfprintf(stdout, s, args);
    }

    va_end(args);

    return ret;
}

/*

=item C<INTVAL Parrot_io_eprintf>

Writes a C string format with varargs to C<stderr>.

=cut

*/

PARROT_EXPORT
PARROT_IGNORABLE_RESULT
INTVAL
Parrot_io_eprintf(NULLOK(PARROT_INTERP), ARGIN(const char *s), ...)
{
    va_list args;
    INTVAL ret;

    va_start(args, s);

    if (interp) {
        STRING * const str = Parrot_vsprintf_c(interp, s, args);

        ret = Parrot_io_putps(interp, _PIO_STDERR(interp), str);
    }
    else {
        /* Be nice about this...
        **   XXX BD Should this use the default PIO_STDERR or something?
        */
        ret = vfprintf(stderr, s, args);
    }

    va_end(args);

    return ret;
}

/*

=item C<PIOHANDLE Parrot_io_getfd>

Returns C<*pmc>'s file descriptor, or C<0> if it is not defined.

=cut

*/

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PIOHANDLE
Parrot_io_getfd(PARROT_INTERP, ARGMOD(PMC *pmc))
{
    return Parrot_io_get_os_handle(interp, pmc);
}

/*

=item C<INTVAL Parrot_io_is_tty>

Returns a boolean value indicating whether C<*pmc> is a console/tty.

=cut

*/

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
INTVAL
Parrot_io_is_tty(PARROT_INTERP, ARGMOD(PMC *pmc))
{
    if (Parrot_io_is_closed(interp, pmc))
        return 0;

    return (Parrot_io_get_flags(interp, pmc) & PIO_F_CONSOLE) ? 1 : 0;
}

/*

=back

=head2 C<Parrot_io_STD*> Functions

=over 4

=item C<PMC * Parrot_io_STDIN>

Returns the C<FileHandle> PMC for C<stdin>.

=cut

*/

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
PMC *
Parrot_io_STDIN(PARROT_INTERP)
{
    return _PIO_STDIN(interp);
}

/*

=item C<PMC * Parrot_io_STDOUT>

Returns the C<FileHandle> PMC for C<stdout>.

=cut

*/

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
PMC *
Parrot_io_STDOUT(PARROT_INTERP)
{
    return _PIO_STDOUT(interp);
}

/*

=item C<PMC * Parrot_io_STDERR>

Returns the C<FileHandle> PMC for C<stderr>.

=cut

*/

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
PMC *
Parrot_io_STDERR(PARROT_INTERP)
{
    return _PIO_STDERR(interp);
}

/*

=back

=head2 Offset Functions

These are used to create offsets for the C<seek> op.

=over 4

=item C<PIOOFF_T Parrot_io_make_offset>

Returns C<offset>.

=cut

*/

PARROT_EXPORT
PIOOFF_T
Parrot_io_make_offset(INTVAL offset)
{
    return offset;
}

/*

=item C<PIOOFF_T Parrot_io_make_offset32>

C<hi> is shifted 32 bytes to the left and C<or>ed together with C<lo>.
This allows 64-bit seeks with only 32-bit C<INTVALS>.

=cut

*/

PIOOFF_T
Parrot_io_make_offset32(INTVAL hi, INTVAL lo)
{
    return ((PIOOFF_T)hi << 31) | lo;
}

/*

=item C<PIOOFF_T Parrot_io_make_offset_pmc>

Returns the return value of the C<get_integer> vtable method on C<*pmc>.

=cut

*/

PIOOFF_T
Parrot_io_make_offset_pmc(PARROT_INTERP, ARGMOD(PMC *pmc))
{
    return VTABLE_get_integer(interp, pmc);
}


/*

=back

=head1 SEE ALSO

F<io/unix.c>,
F<io/win32.c>,
F<io/portable.c>,
F<io/io_private.h>.

=cut

*/



/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
