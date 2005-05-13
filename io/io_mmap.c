/*
Copyright: 2005 The Perl Foundation.  All Rights Reserved.
$Id$

=head1 NAME

io/io_mmap.c - IO Layer for mmaped files

=head1 DESCRIPTION

Open mmaps the file.

*/

/*

=head2 mmap layer functions

=over 4

=cut

*/

#include "parrot/parrot.h"
#include "io_private.h"

/* Defined at bottom */
static const ParrotIOLayerAPI pio_mmap_layer_api;

ParrotIOLayer pio_mmap_layer = {
    NULL,
    "mmap",
    0,
    &pio_mmap_layer_api,
    0, 0
};

ParrotIOLayer *
PIO_mmap_register_layer(void)
{
    return &pio_mmap_layer;
}

/*

=item C<static ParrotIO *
PIO_mmap_open(theINTERP, ParrotIOLayer *layer,
               const char *path, INTVAL flags)>

The buffer layer's C<Open> function.

=cut

*/

static ParrotIO *
PIO_mmap_open(theINTERP, ParrotIOLayer *layer,
               const char *path, INTVAL flags)
{
    ParrotIO *io;
    ParrotIOLayer *l = PIO_DOWNLAYER(layer);

    if (!l) {
        l = interpreter->piodata->default_stack;
        if (!strcmp(l->name, "buf"))
            l = PIO_DOWNLAYER(l);
    }
    io = PIO_open_down(interpreter, l, path, flags);
    if (!io) {
        /* error creating IO stream */
        return NULL;
    }
#ifdef PARROT_HAS_HEADER_SYSMMAN
    {
        /* XXX assume fstat exists too
        */
        struct stat statbuf;
        int status;
        PIOOFF_T file_size;

        status = fstat(io->fd, &statbuf);
        file_size = statbuf.st_size;
        /* TODO verify flags */
        io->b.startb = mmap(0, file_size, PROT_READ, MAP_SHARED, io->fd, 0);
        io->b.size = (size_t)file_size;  /* XXX */
        io->b.endb = io->b.startb + io->b.size;
        io->b.flags |= PIO_BF_MMAP;
    }
#endif
    return io;
}

/*

=item C<static size_t
PIO_mmap_read(theINTERP, ParrotIOLayer *layer, ParrotIO *io,
              STRING ** buf)>

Calls C<read()> to return up to C<len> bytes in the memory starting at
C<buffer>.

=cut

*/

static size_t
PIO_mmap_read(theINTERP, ParrotIOLayer *layer, ParrotIO *io,
              STRING **buf)
{
    STRING *s;
    UINTVAL len;

    if (!(io->b.flags & PIO_BF_MMAP))
        return PIO_read_down(interpreter, PIO_DOWNLAYER(layer), io, buf);

    if (*buf == NULL) {
	*buf = new_string_header(interpreter, 0);
    }
    s = *buf;
    if (s->strstart && PObj_sysmem_TEST(s))
        mem_sys_free(s->strstart);
    PObj_get_FLAGS(s) |= PObj_external_FLAG|PObj_bufstart_external_FLAG;
    PObj_bufstart(s) = s->strstart = io->b.startb + io->fpos;
    len = s->bufused ? s->bufused : io->b.size;
    io->fpos += len;
    PObj_buflen(s) = s->strlen = len;
    return len;
}

/*

=item C<static INTVAL
PIO_mmap_close(theINTERP, ParrotIOLayer *layer, ParrotIO *io)>

Closes C<*io>'s file descriptor.

=cut

*/

static INTVAL
PIO_mmap_close(theINTERP, ParrotIOLayer *layer, ParrotIO *io)
{
    INTVAL ret = -1;

    if (io->fd >= 0) {
        ret = PIO_close_down(interpreter, PIO_DOWNLAYER(layer), io);
    }
    return ret;
}

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

F<io/io_passdown.c>,
F<io/io.c>,
F<io/io_layers.c>,
F<io/io_private.h>.

=head1 HISTORY

Initially written by Leo.

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
