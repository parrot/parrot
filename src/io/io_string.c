/*
Copyright (c) 2006, The Perl Foundation.
$Id$

=head1 NAME

src/io/io_string.c - IO Layer for strings

=head1 DESCRIPTION

Capture output to a string PMC.

*/

/*

=head2 String Layer Functions

=over 4

=cut

*/

#include "parrot/parrot.h"
#include "io_private.h"

/* Defined at bottom */
static const ParrotIOLayerAPI pio_string_layer_api;

ParrotIOLayer pio_string_layer = {
    NULL,
    "string",
    0,
    &pio_string_layer_api,
    0, 0
};

ParrotIOLayer *
PIO_string_register_layer(void)
{
    return &pio_string_layer;
}

static size_t
PIO_string_read(theINTERP, ParrotIOLayer *l, ParrotIO *io, STRING **buf)
{
    UNUSED(io);
    UNUSED(interpreter);

    if (l->self == 0)
        return 0;

    *buf    = l->self;
    l->self = 0;

    return (*buf)->strlen;
}

static size_t
PIO_string_write(theINTERP, ParrotIOLayer *l, ParrotIO *io, STRING *s)
{
    STRING * old_string;

    UNUSED(io);
    old_string = l->self;

    if (old_string == 0) {
        l->self = s;
        return s->strlen;
    }

    l->self = string_append(interpreter, old_string, s, 0);
    return string_length(interpreter, l->self);
}

static const ParrotIOLayerAPI pio_string_layer_api = {
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
    PIO_string_write,
    PIO_null_write_async,
    PIO_string_read,
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

F<src/io/io_passdown.c>,
F<src/io/io.c>,
F<src/io/io_layers.c>,
F<src/io/io_private.h>.

=head1 HISTORY

Initially written by chromatic.

=cut

*/


/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
