/*
Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
$Id$

=head1 NAME

io/io_utf8.c - IO Layer for UTF8

=head1 DESCRIPTION

Convert output to utf8. Convert input to Parrot's internal string
representation.

*/

/*

=head2 utf8 layer functions

=over 4

=cut

*/

#include "parrot/parrot.h"
#include "io_private.h"

/* Defined at bottom */
static const ParrotIOLayerAPI pio_utf8_layer_api;

ParrotIOLayer pio_utf8_layer = {
    NULL,
    "utf8",
    0,
    &pio_utf8_layer_api,
    0, 0
};

ParrotIOLayer *
PIO_utf8_register_layer(void)
{
    return &pio_utf8_layer;
}

void *Parrot_utf8_encode(void *ptr, UINTVAL c);
static size_t
PIO_utf8_write(theINTERP, ParrotIOLayer *l, ParrotIO *io, STRING *s)
{
    STRING *dest;

    if (s->encoding == Parrot_utf8_encoding_ptr)
        return PIO_write_down(interpreter, l->down, io, s);

    dest = Parrot_utf8_encoding_ptr->copy_to_encoding(interpreter, s);
    return PIO_write_down(interpreter, l->down, io, dest);
}

static const ParrotIOLayerAPI pio_utf8_layer_api = {
    PIO_null_init,
    PIO_base_new_layer,
    PIO_base_delete_layer,
    PIO_null_push_layer,
    PIO_null_pop_layer,
    PIO_null_open,
    PIO_null_open2,
    PIO_null_open3,
    PIO_null_open_async,
    PIO_null_fdopen,
    PIO_null_close,
    PIO_utf8_write,
    PIO_null_write_async,
    PIO_null_read,
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
