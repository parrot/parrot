/*
Copyright (C) 2005-2007, The Perl Foundation.
$Id$

=head1 NAME

src/io/io_mmap.c - IO Layer for mmaped files

=head1 DESCRIPTION

Open mmaps the file.

=head2 mmap layer functions

=over 4

=cut

*/

#include "parrot/parrot.h"
#include "io_private.h"

/* HEADERIZER HFILE: none */

/* HEADERIZER BEGIN: static */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

static INTVAL PIO_mmap_close(PARROT_INTERP,
    ARGIN(ParrotIOLayer *layer),
    ARGMOD(ParrotIO *io))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        FUNC_MODIFIES(*io);

PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
static ParrotIO * PIO_mmap_open(PARROT_INTERP,
    ARGIN(ParrotIOLayer *layer),
    ARGIN(const char *path),
    INTVAL flags)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

static size_t PIO_mmap_read(PARROT_INTERP,
    ARGIN(ParrotIOLayer *layer),
    ARGMOD(ParrotIO *io),
    ARGOUT(STRING **buf))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        __attribute__nonnull__(4)
        FUNC_MODIFIES(*io)
        FUNC_MODIFIES(*buf);

/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: static */


static const ParrotIOLayerAPI pio_mmap_layer_api = {
    PIO_null_init,
    PIO_base_new_layer,
    PIO_base_delete_layer,
    PIO_null_push_layer,
    PIO_null_pop_layer,
    PIO_mmap_open,
    PIO_null_open2,
    PIO_null_open3,
    PIO_null_open_async,
    PIO_null_fdopen,
    PIO_mmap_close,
    PIO_null_write,
    PIO_null_write_async,
    PIO_mmap_read,
    PIO_null_read_async,
    PIO_null_flush,
    PIO_null_peek,
    PIO_null_seek,
    PIO_null_tell,
    PIO_null_setbuf,
    PIO_null_setlinebuf,
    PIO_null_getcount,
    PIO_null_fill,
    PIO_null_eof,
    NULL, /* no poll */
    NULL, /* no socket */
    NULL, /* no connect */
    NULL, /* no send */
    NULL, /* no recv */
    NULL, /* no bind */
    NULL, /* no listen */
    NULL  /* no accept */
};

ParrotIOLayer pio_mmap_layer = {
    NULL,
    "mmap",
    0,
    &pio_mmap_layer_api,
    NULL, NULL
};

/*

=item C<ParrotIOLayer * PIO_mmap_register_layer>

RT#48260: Not yet documented!!!

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
ParrotIOLayer *
PIO_mmap_register_layer(void)
{
    return &pio_mmap_layer;
}

/*

=item C<static ParrotIO * PIO_mmap_open>

The buffer layer's C<Open> function.

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
static ParrotIO *
PIO_mmap_open(PARROT_INTERP, ARGIN(ParrotIOLayer *layer),
               ARGIN(const char *path), INTVAL flags)
{
    ParrotIO *io;
    ParrotIOLayer *l = PIO_DOWNLAYER(layer);

    if (!l) {
        l = interp->piodata->default_stack;
        if (STREQ(l->name, "buf"))
            l = PIO_DOWNLAYER(l);
    }
    io = PIO_open_down(interp, l, path, flags);
    if (!io) {
        /* error creating IO stream */
        return NULL;
    }
#ifdef PARROT_HAS_HEADER_SYSMMAN
    {
        /* RT#46407 assume fstat exists too
        */
        struct stat statbuf;
        int status;
        PIOOFF_T file_size;

        status = fstat(io->fd, &statbuf); /* We're ignoring this return value. */
        UNUSED(status);
        file_size = statbuf.st_size;
        /* RT#46409 verify flags */
        io->b.startb = (unsigned char *)mmap(0, file_size, PROT_READ, MAP_SHARED, io->fd, 0);
        io->b.size = (size_t)file_size;  /* XXX */
        io->b.endb = io->b.startb + io->b.size;
        io->b.flags |= PIO_BF_MMAP;
    }
#endif
    return io;
}

/*

=item C<static size_t PIO_mmap_read>

Calls C<read()> to return up to C<len> bytes in the memory starting at
C<buffer>.

=cut

*/

static size_t
PIO_mmap_read(PARROT_INTERP, ARGIN(ParrotIOLayer *layer),
        ARGMOD(ParrotIO *io), ARGOUT(STRING **buf))
{
    STRING *s;
    UINTVAL len;

    if (!(io->b.flags & PIO_BF_MMAP))
        return PIO_read_down(interp, PIO_DOWNLAYER(layer), io, buf);

    if (*buf == NULL) {
        *buf = new_string_header(interp, 0);
    }
    s = *buf;
    /* RT#46411 create string_free API for reusing string headers */
    if (s->strstart && PObj_sysmem_TEST(s))
        mem_sys_free(PObj_bufstart(s));
    PObj_get_FLAGS(s) |= PObj_external_FLAG;
    PObj_bufstart(s) = io->b.startb + io->fpos;
    s->strstart =  (char *) io->b.startb + io->fpos;
    len = s->bufused ? s->bufused : io->b.size;
    io->fpos += len;
    PObj_buflen(s) = s->strlen = len;
    return len;
}

/*

=item C<static INTVAL PIO_mmap_close>

Closes C<*io>'s file descriptor.

=cut

*/

static INTVAL
PIO_mmap_close(PARROT_INTERP, ARGIN(ParrotIOLayer *layer), ARGMOD(ParrotIO *io))
{
    INTVAL ret;

    if (io->fd >= 0)
        ret = PIO_close_down(interp, PIO_DOWNLAYER(layer), io);
    else
        ret = -1;

    return ret;
}

/*

=back

=head1 SEE ALSO

F<src/io/io_passdown.c>,
F<src/io/io.c>,
F<src/io/io_layers.c>,
F<src/io/io_private.h>.

=head1 HISTORY

Initially written by Leo.

=cut

*/


/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
