/*
Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
$Id$

=head1 NAME

io/io_stdio.c - STDIO layer

=head1 DESCRIPTION

This is the Parrot IO STDIO layer. This may provide a subset of full
functionality, but must compile on any system with the ANSI C standard
library.  Also note that unlike the other low-level IO layers (UNIX,
Win32), this is I<buffered> IO, out of necessity.

=head2 Functions

=over 4

=cut

*/

#include <stdio.h>
#include "parrot/parrot.h"
#include "io_private.h"

extern INTVAL           PIO_stdio_getblksize(PIOHANDLE fd);

/* Defined at bottom */
extern const ParrotIOLayerAPI pio_stdio_layer_api;

ParrotIOLayer pio_stdio_layer = {
    NULL,
    "stdio",
    PIO_L_TERMINAL,
    &pio_stdio_layer_api,
    0, 0
};


/*
 * Currently keeping layer prototypes local to each layer
 * file.
 */
static const char * flags_to_stdio(INTVAL flags);

static INTVAL    PIO_stdio_init(theINTERP, ParrotIOLayer *layer);
static ParrotIO *PIO_stdio_open(theINTERP, ParrotIOLayer *layer,
                                const char *spath, INTVAL flags);
static ParrotIO *PIO_stdio_fdopen(theINTERP, ParrotIOLayer *layer,
                                  PIOHANDLE fd, INTVAL flags);
static INTVAL PIO_stdio_close(theINTERP, ParrotIOLayer *layer, ParrotIO *io);
static INTVAL PIO_stdio_flush(theINTERP, ParrotIOLayer *layer, ParrotIO *io);
static size_t    PIO_stdio_read(theINTERP, ParrotIOLayer *layer,
                                ParrotIO *io, STRING **);
static size_t    PIO_stdio_write(theINTERP, ParrotIOLayer *layer,
                                 ParrotIO *io, STRING *s);
static size_t    PIO_stdio_peek(theINTERP, ParrotIOLayer *layer,
                                ParrotIO *io, STRING **);
static PIOOFF_T  PIO_stdio_seek(theINTERP, ParrotIOLayer *layer, ParrotIO *io,
                                PIOOFF_T offset, INTVAL whence);
static PIOOFF_T  PIO_stdio_tell(theINTERP, ParrotIOLayer *layer, ParrotIO *io);
static INTVAL    PIO_stdio_isatty(PIOHANDLE fd);


/*

=item C<static const char *
flags_to_stdio(INTVAL flags)>

Returns a C string representation of C<flags> suitable for passing to
C<fopen()> in C<PIO_stdio_open()>.

=cut

*/

static const char *
flags_to_stdio(INTVAL flags)
{
    if ((flags & (PIO_F_WRITE | PIO_F_READ | PIO_F_APPEND)) ==
        (PIO_F_WRITE | PIO_F_READ | PIO_F_APPEND)) {
        return "a+b";
    }
    else if ((flags & (PIO_F_WRITE | PIO_F_READ | PIO_F_TRUNC)) ==
             (PIO_F_WRITE | PIO_F_READ | PIO_F_TRUNC)) {
        return "w+b";
    }
    else if ((flags & (PIO_F_WRITE | PIO_F_READ)) ==
             (PIO_F_WRITE | PIO_F_READ)) {
        return "r+b";
    }
    else if (flags & PIO_F_APPEND) {
        return "ab";
    }
    else if (flags & PIO_F_WRITE) {
        return "wb";
    }
    else {
        /* PIO_F_READ, hopefully */
        return "rb";
    }
}

/*

=item C<static INTVAL
PIO_stdio_init(theINTERP, ParrotIOLayer *layer)>

Setup standard streams, etc.

=cut

*/

static INTVAL
PIO_stdio_init(theINTERP, ParrotIOLayer *layer)
{
#ifdef PIO_OS_STDIO
    /* Only set standard handles if stdio is the OS IO */
    PIO_STDIN(interpreter)
        = new_io_pmc(interpreter,
                     PIO_stdio_fdopen(interpreter, layer, stdin, PIO_F_READ));

    PIO_STDOUT(interpreter)
        = new_io_pmc(interpreter,
                     PIO_stdio_fdopen(interpreter, layer, stdout, PIO_F_WRITE));

    PIO_STDERR(interpreter)
        = new_io_pmc(interpreter,
                     PIO_stdio_fdopen(interpreter, layer, stderr, PIO_F_WRITE));
#else  /* PIO_OS_STDIO */
    UNUSED(interpreter);
    UNUSED(layer);
#endif /* PIO_OS_STDIO */
    return 0;
}

/*

=item C<static ParrotIO *
PIO_stdio_open(theINTERP, ParrotIOLayer *layer,
              const char *spath, INTVAL flags)>

Open modes (read, write, append, etc.) are done in pseudo-Perl style
using C<< < >>, C<< > >>, etc.

=cut

*/

static ParrotIO *
PIO_stdio_open(theINTERP, ParrotIOLayer *layer,
              const char *spath, INTVAL flags)
{
    ParrotIO *io;
    const char *oflags;
    INTVAL type;
    FILE *fptr;
    type = PIO_TYPE_FILE;

    UNUSED(layer);

    if ((flags & (PIO_F_WRITE | PIO_F_READ)) == 0)
        return NULL;

    oflags = flags_to_stdio(flags);

    /* Only files for now */
    flags |= PIO_F_FILE;

    /* Try opening the file- note that this can't really handle O_EXCL, etc. */
    fptr = fopen(spath, oflags);

    if (fptr == NULL && errno == ENOENT && (flags & PIO_F_WRITE)) {
        fptr = fopen(spath, "w+b");
    }

    /* File open */
    if (fptr != NULL) {
        if (PIO_stdio_isatty((PIOHANDLE)fptr))
            flags |= PIO_F_CONSOLE;
        io = PIO_new(interpreter, type, flags, 0);
        io->fd = (PIOHANDLE)fptr;
        return io;
    }
    return NULL;
}

/*

=item C<static ParrotIO *
PIO_stdio_fdopen(theINTERP, ParrotIOLayer *layer, PIOHANDLE fptr, INTVAL flags)>

Desc.

=cut

*/

static ParrotIO *
PIO_stdio_fdopen(theINTERP, ParrotIOLayer *layer, PIOHANDLE fptr, INTVAL flags)
{
    ParrotIO *io;
    INTVAL mode;
    mode = 0;

    UNUSED(layer);

    if (PIO_stdio_isatty(fptr))
        flags |= PIO_F_CONSOLE;

    /* fdopened files are always shared */
    flags |= PIO_F_SHARED;

    io = PIO_new(interpreter, PIO_F_FILE, flags, mode);
    io->fd = fptr;
    return io;
}

/*

=item C<static INTVAL
PIO_stdio_close(theINTERP, ParrotIOLayer *layer, ParrotIO *io)>

Desc.

=cut

*/

static INTVAL
PIO_stdio_close(theINTERP, ParrotIOLayer *layer, ParrotIO *io)
{
    FILE *fptr = (FILE*)io->fd;

    UNUSED(interpreter);
    UNUSED(layer);

    if (fptr != NULL)
        fclose(fptr);
    io->fd = (PIOHANDLE)NULL;
    return 0;
}

/*

=item C<static INTVAL
PIO_stdio_isatty(PIOHANDLE fptr)>

Desc.

=cut

*/

static INTVAL
PIO_stdio_isatty(PIOHANDLE fptr)
{
    UNUSED(fptr);

    /* no obvious way to check for this with STDIO */
    return 0;
}

static size_t
PIO_stdio_peek(theINTERP, ParrotIOLayer *layer, ParrotIO *io, STRING **buf)
{
    FILE *fptr = (FILE *)io->fd;
    size_t bytes;
    STRING *s;

    UNUSED(layer);
    s = PIO_make_io_string(interpreter, buf, 1);

    /* read the next byte into the buffer */
    bytes = fread(s->strstart, 1, 1, fptr);

    /* if we got anything from the stream, push it back on */
    if (bytes) {
        s->bufused = s->strlen = 1;
        ungetc(*(char*)s->strstart, fptr);
    }
    else
        s->bufused = s->strlen = 1;

    return bytes;
}


/*

=item C<INTVAL
PIO_stdio_getblksize(PIOHANDLE fptr)>

Desc.

=cut

*/

INTVAL
PIO_stdio_getblksize(PIOHANDLE fptr)
{
    UNUSED(fptr);

    /* Hard coded for now */
    return PIO_BLKSIZE;
}

/*

=item C<static INTVAL
PIO_stdio_flush(theINTERP, ParrotIOLayer *layer, ParrotIO *io)>

Desc.

=cut

*/

static INTVAL
PIO_stdio_flush(theINTERP, ParrotIOLayer *layer, ParrotIO *io)
{
    UNUSED(interpreter);
    UNUSED(layer);

    return fflush((FILE*)io->fd);
}

/*

=item C<static size_t
PIO_stdio_read(theINTERP, ParrotIOLayer *layer, ParrotIO *io,
              STRING **)>

Desc.

=cut

*/

static size_t
PIO_stdio_read(theINTERP, ParrotIOLayer *layer, ParrotIO *io,
              STRING ** buf)
{
    size_t bytes;
    FILE *fptr = (FILE *)io->fd;
    void *buffer;
    size_t len;
    STRING *s;

    UNUSED(layer);

    s = PIO_make_io_string(interpreter, buf, 2048);
    len = s->bufused;
    buffer = s->strstart;

    bytes = fread(buffer, 1, len, fptr);
    s->bufused = s->strlen = bytes;

    if (bytes != len) {
        if (feof(fptr)) {
            io->flags |= PIO_F_EOF;
        }
    }

    return bytes;
}

/*

=item C<static size_t
PIO_stdio_write(theINTERP, ParrotIOLayer *layer, ParrotIO *io,
               STRING *s)>

Desc.

=cut

*/

static size_t
PIO_stdio_write(theINTERP, ParrotIOLayer *layer, ParrotIO *io, STRING *s)
{
    void *buffer = s->strstart;
    size_t len = s->bufused;
    UNUSED(interpreter);
    UNUSED(layer);

    return(fwrite(buffer, 1, len, (FILE*)io->fd));
}

/*

=item C<static PIOOFF_T
PIO_stdio_seek(theINTERP, ParrotIOLayer *layer, ParrotIO *io,
              PIOOFF_T offset, INTVAL whence)>

Hard seek.

=cut

*/

static PIOOFF_T
PIO_stdio_seek(theINTERP, ParrotIOLayer *layer, ParrotIO *io,
              PIOOFF_T offset, INTVAL whence)
{
    PIOOFF_T pos;

    UNUSED(interpreter);
    UNUSED(layer);

    errno = 0;

    if ((pos = fseek((FILE*)io->fd, offset, whence)) >= 0) {
        io->lpos = io->fpos;
        io->fpos = pos;
    }

    /* Seek clears EOF */
    io->flags &= ~PIO_F_EOF;
    return pos;
}

/*

=item C<static PIOOFF_T
PIO_stdio_tell(theINTERP, ParrotIOLayer *layer, ParrotIO *io)>

Desc.

=cut

*/

static PIOOFF_T
PIO_stdio_tell(theINTERP, ParrotIOLayer *layer, ParrotIO *io)
{
    UNUSED(interpreter);
    UNUSED(layer);

    return(ftell((FILE*)io->fd));
}

const ParrotIOLayerAPI pio_stdio_layer_api = {
    PIO_stdio_init,
    PIO_base_new_layer,
    PIO_base_delete_layer,
    PIO_null_push_layer,
    PIO_null_pop_layer,
    PIO_stdio_open,
    PIO_null_open2,
    PIO_null_open3,
    PIO_null_open_async,
    PIO_stdio_fdopen,
    PIO_stdio_close,
    PIO_stdio_write,
    PIO_null_write_async,
    PIO_stdio_read,
    PIO_null_read_async,
    PIO_stdio_flush,
    PIO_stdio_peek,
    PIO_stdio_seek,
    PIO_stdio_tell,
    PIO_null_setbuf,
    PIO_null_setlinebuf,
    PIO_null_getcount,
    PIO_null_fill,
    PIO_null_eof,
    0, /* no poll */
    0, /* no socket */
    0, /* no connect */
    0, /* no send */
    0, /* no recv */
    0, /* no bind */
    0, /* no listen */
    0  /* no accept */
};

/*

=back

=head1 SEE ALSO

F<io/io_buf.c>,
F<io/io_passdown.c>,
F<io/io_unix.c>,
F<io/io_win32.c>,
F<io/io.c>,
F<io/io_private.h>.

=head1 HISTORY

Adapted from io_unix.c by Josh Wilmes (josh@hitchhiker.org).

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
