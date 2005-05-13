/*
Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
$Id$

=head1 NAME

io/io_layers.c - IO Layer Handling

=head1 DESCRIPTION

The Parrot IO subsystem uses a per-interpreter stack to provide a
layer-based approach to IO. Each layer implements a subset of the
C<ParrotIOLayerAPI> vtable. To find an IO function the layer
stack is searched downwards until a non-C<NULL> function pointer
is found for that particular slot.

*/

/*

=head2 Layer and Stack Functions

=over 4

=item C<ParrotIOLayer *
PIO_base_new_layer(ParrotIOLayer *proto)>

The default IO layer constructor. Creates and returns a new
C<ParrotIOLayer>. If a prototype C<*proto> is supplied then it's values
will be copied to the new instance.

=cut

*/

#include "parrot/parrot.h"
#include "io_private.h"

ParrotIOLayer *
PIO_base_new_layer(ParrotIOLayer *proto)
{
    ParrotIOLayer *new_layer;

    /*
     * XXX use managed memory here ?
     */
    new_layer = mem_sys_allocate(sizeof(ParrotIOLayer));
    if (proto) {
        /* FIXME: Flag here to indicate whether to free strings */
        new_layer->name = proto->name;
        new_layer->flags = proto->flags;
        new_layer->api = proto->api;
    }
    else {
        new_layer->name = NULL;
        new_layer->flags = 0;
        new_layer->api = NULL;
    }
    new_layer->self = 0;
    new_layer->up = NULL;
    new_layer->down = NULL;
    return new_layer;
}

/*

=item C<void
PIO_base_delete_layer(ParrotIOLayer *layer)>

The default IO layer destructor. Frees the memory associated with
C<*layer>.

=cut

*/

void
PIO_base_delete_layer(ParrotIOLayer *layer)
{
    if (layer != NULL)
        mem_sys_free(layer);
}

/*

=item C<INTVAL
PIO_push_layer(theINTERP,  PMC *pmc, ParrotIOLayer *layer)>

Push a layer onto an IO object (C<*pmc>) or the default stack.

=item C<void
PIO_push_layer_str(theINTERP, PMC *pmc, STRING *layer_name)>

Push a layer onto an IO object (C<*pmc>).

=cut

*/

INTVAL
PIO_push_layer(theINTERP,  PMC *pmc, ParrotIOLayer *layer)
{
    ParrotIOLayer *t;

    if (layer == NULL)
        return -1;
    if (!PMC_IS_NULL(pmc)) {
        ParrotIO *io = PMC_data(pmc);
        if (!io)
            return -1;
        if (io->stack == NULL && (layer->flags & PIO_L_TERMINAL) == 0) {
            /* Error( 1st layer must be terminal) */
            return -1;
        }
        /* Check and see if this layer already is on stack
         * This is a internals sanity check not a user level
         * check, at least until I fix copy-on-write stacks.
         * -Melvin
         */
        for (t = io->stack; t; t = t->down) {
            if (t == layer)
                return -1;
        }
        /*
         * if this is a global layer create a copy first
         */
        if (!(io->stack->flags & PIO_L_LAYER_COPIED)) {
            io->stack = PIO_copy_stack(io->stack);
        }

        layer->down = io->stack;
        if (io->stack)
            io->stack->up = layer;
        io->stack = layer;
        PMC_struct_val(pmc) = layer;
        if (layer->api->Pushed)
            (*layer->api->Pushed) (layer, io);
    }
    else {
        ParrotIOData *d = interpreter->piodata;
        if (d->default_stack == NULL && (layer->flags & PIO_L_TERMINAL) == 0) {
            /* Error( 1st layer must be terminal) */
            return -1;
        }
        /* Sanity check */
        for (t = d->default_stack; t; t = t->down) {
            if (t == layer)
                return -1;
        }

        layer->down = d->default_stack;
        if (d->default_stack)
            d->default_stack->up = layer;
        d->default_stack = layer;
        return 0;
    }
    return -1;
}
ParrotIOLayer *
PIO_get_layer(Interp *interpreter, const char *name)
{
    ParrotIOLayer **t;

    UNUSED(interpreter);
    for (t = pio_registered_layers; *t; ++t)
        if (!strcmp(name, (*t)->name))
            return *t;
    return NULL;
}

void
PIO_push_layer_str(Interp *interpreter, PMC *pmc, STRING *ls)
{
    ParrotIOLayer  *l;
    char *cls = string_to_cstring(interpreter, ls);

    l = PIO_get_layer(interpreter, cls);
    string_cstring_free(cls);
    if (!l)
        internal_exception(1, "Layer not found");

    /* make private copy */
    l = PIO_base_new_layer(l);
    l->flags |= PIO_L_LAYER_COPIED;
    PIO_push_layer(interpreter, pmc, l);
}

/*

=item C<ParrotIOLayer *
PIO_pop_layer(theINTERP, PMC *pmc)>

Pop a layer from an IO object (C<*pmc>) or the default stack.

=item C<STRING *
PIO_pop_layer_str(theINTERP, PMC *pmc)>

Pop a layer from an IO object (C<*pmc>) and return the name of the
popped layer. The layer gets freed.

=cut

*/

ParrotIOLayer *
PIO_pop_layer(theINTERP, PMC *pmc)
{
    ParrotIOLayer *layer;
    ParrotIO *io = PMC_data(pmc);

    if (!PMC_IS_NULL(pmc)) {
        if (!io)
            return 0;
        /*
         * if this is a global layer create a copy first
         */
        if (!(io->stack->flags & PIO_L_LAYER_COPIED)) {
            io->stack = PIO_copy_stack(io->stack);
        }
        layer = io->stack;
        if (layer) {
            io->stack = layer->down;
            PMC_struct_val(pmc) = io->stack;
            io->stack->up = 0;
            layer->up = 0;
            layer->down = 0;
            if (layer->api->Popped)
                (*layer->api->Popped) (layer, io);
            return layer;
        }
        return layer;
    }
    /* Null io object - use default stack */
    else {
        ParrotIOData *d;
        d = interpreter->piodata;
        layer = d->default_stack;
        if (layer) {
            d->default_stack = layer->down;
            d->default_stack->up = NULL;
            layer->up = 0;
            layer->down = 0;
            return layer;
        }
    }

    return 0;
}

STRING *
PIO_pop_layer_str(Interp *interpreter, PMC *pmc)
{
    ParrotIOLayer *layer;
    STRING *ls;

    layer = PIO_pop_layer(interpreter, pmc);
    ls = string_make(interpreter, layer->name, strlen(layer->name),
            "iso-8859-1", 0);
    mem_sys_free(layer);
    return ls;
}

/*

=item C<ParrotIOLayer *
PIO_copy_stack(ParrotIOLayer *stack)>

Primarily used to copy the default IO stack for a new IO object. Later
we will do some funky copy-on-write stuff.

=cut

*/

ParrotIOLayer *
PIO_copy_stack(ParrotIOLayer *stack)
{
    ParrotIOLayer *ptr_new = NULL;
    ParrotIOLayer **ptr_ptr_new;
    ParrotIOLayer *ptr_last = NULL;
    ptr_ptr_new = &ptr_new;
    while (stack) {
        *ptr_ptr_new = PIO_base_new_layer(stack);
        (*ptr_ptr_new)->flags |= PIO_L_LAYER_COPIED;
        (*ptr_ptr_new)->up = ptr_last;
        stack = stack->down;
        ptr_last = *ptr_ptr_new;
        ptr_ptr_new = &((*ptr_ptr_new)->down);
    }

    return ptr_new;
}

/*

=back

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
