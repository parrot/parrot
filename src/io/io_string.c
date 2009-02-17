/*
Copyright (C) 2006-2007, Parrot Foundation.
$Id$

=head1 NAME

src/io/io_string.c - IO Layer for strings

=head1 DESCRIPTION

Capture output to a string PMC.

=head2 String Layer Functions

=over 4

=cut

*/

#include "parrot/parrot.h"
#include "io_private.h"

/* HEADERIZER HFILE: none */

/* HEADERIZER BEGIN: static */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

static size_t PIO_string_read(SHIM_INTERP,
    ARGMOD(ParrotIOLayer *l),
    SHIM(ParrotIO *io),
    ARGOUT(STRING **buf))
        __attribute__nonnull__(2)
        __attribute__nonnull__(4)
        FUNC_MODIFIES(*l)
        FUNC_MODIFIES(*buf);

static size_t PIO_string_write(PARROT_INTERP,
    ARGMOD(ParrotIOLayer *l),
    SHIM(ParrotIO *io),
    ARGMOD(STRING *s))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(4)
        FUNC_MODIFIES(*l)
        FUNC_MODIFIES(*s);

/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: static */

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
    NULL, /* no poll */
    NULL, /* no socket */
    NULL, /* no connect */
    NULL, /* no send */
    NULL, /* no recv */
    NULL, /* no bind */
    NULL, /* no listen */
    NULL  /* no accept */
};

ParrotIOLayer pio_string_layer = {
    NULL,
    "string",
    0,
    &pio_string_layer_api,
    NULL, NULL
};

/*

=item C<ParrotIOLayer * PIO_string_register_layer>

RT#48260: Not yet documented!!!

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
ParrotIOLayer *
PIO_string_register_layer(void)
{
    return &pio_string_layer;
}

/*

=item C<static size_t PIO_string_read>

RT#48260: Not yet documented!!!

=cut

*/

static size_t
PIO_string_read(SHIM_INTERP, ARGMOD(ParrotIOLayer *l), SHIM(ParrotIO *io), ARGOUT(STRING **buf))
{
    if (!l->self)
        return 0;

    *buf    = (STRING *)l->self;
    l->self = NULL;

    return (*buf)->strlen;
}

/*

=item C<static size_t PIO_string_write>

RT#48260: Not yet documented!!!

=cut

*/

static size_t
PIO_string_write(PARROT_INTERP, ARGMOD(ParrotIOLayer *l), SHIM(ParrotIO *io), ARGMOD(STRING *s))
{
    STRING * const old_string = (STRING *)l->self;

    if (!old_string) {
        l->self = s;
        return s->strlen;
    }

    l->self = Parrot_str_append(interp, old_string, s);
    return Parrot_str_byte_length(interp, (STRING *)l->self);
}

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
