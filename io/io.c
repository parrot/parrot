/* io.c
 *  Copyright: (When this is determined...it will go here)
 *  CVS Info
 *  Overview:
 *      This is the Parrot IO subsystem API.  Generic IO stuff
 *      goes here, each specific layer goes in its own file...
 *      (io_os, io_stdio, io_utf8, etc.)
 *  Data Structure and Algorithms:
 *      Uses the IO PMC defined in io.h
 *      Uses ParrotIO structs in io.h 
 *  History:
 *      Initially written by Melvin Smith
 *  Notes:     
 *      In future rework to use copy-on-write IO stacks rather than
 *              creating a new stack for each IO stream.
 *      Add support for loadable layers in Parrot bytecode
 *  References:
 *      Some ideas and goals from Perl5.7 and Nick Ing-Simmons' work
 */

#include "parrot/parrot.h"


/* This is list of valid layers */
ParrotIOLayer   * pio_registered_layers;

/* This is the default stack used for IO */
ParrotIOLayer   * pio_default_stack;

/* The standard streams */
ParrotIO * pio_stdin;
ParrotIO * pio_stdout;
ParrotIO * pio_stderr;

PIOOFF_T        piooffsetzero;

PMC * new_io_pmc(theINTERP, ParrotIO * io) {
        PMC * new_pmc;
        new_pmc = new_pmc_header(interpreter);
        new_pmc->data = io;
        new_pmc->vtable = YOU_LOSE_VTABLE;
        return new_pmc;
}

void free_io_header(ParrotIO *io) {
        /* Free buffer if it was malloced */
        if( io->b.startb && (io->flags&PIO_F_MALLOC) )
                free(io->b.startb);
        free(io);
}


/*
 * Create a new IO stream, optionally reusing old structure.
 */
ParrotIO * PIO_new(theINTERP, ParrotIO * old, INTVAL iotype,
                        UINTVAL flags, UINTVAL mode) {
        ParrotIO * new_io;

        UNUSED (interpreter); UNUSED (iotype);

        if( old ) {
                /* FIXME: Reuse old IO */
        }
        new_io = (ParrotIO *)malloc(sizeof(ParrotIO));
        new_io->fpos = new_io->lpos = piooffsetzero;
        new_io->flags = flags;
        new_io->mode = mode;
        new_io->stack = pio_default_stack;
        new_io->b.startb = NULL;
        new_io->b.endw = NULL;
        new_io->b.endr = NULL;
        new_io->b.endb = NULL;
        new_io->b.next = NULL;
        return new_io;
}

/*
 * Initialize some stuff.
 */
INTVAL pio_initialized;

void PIO_init(theINTERP) {
        int err;

        if( pio_initialized != 0 )
                return;

        /* Init IO stacks.
         * Side effect of the Init method of the OS stack will
         * create STDIN, STDOUT, STDERR.
         */
        if((err = PIO_init_stacks(interpreter)) != 0) {
                abort();
        }

        if(!pio_stdin || !pio_stderr || !pio_stdout) {
                abort();
        }

        if((interpreter->flags & PARROT_DEBUG_FLAG) != 0) {
                PIO_puts(interpreter, pio_stderr,
                        "PIO: IO system initialized.\n");
        }
        pio_initialized = 1;
}


/*
 * IO system destructor, flush streams, free structures, etc.
 */
void PIO_atexit(theINTERP) {
        UNUSED (interpreter);
#if 0
        PIO_flush(interpreter, pio_stdout);
#endif
}


/*
 * Initialize the default IO stack(s)
 */
INTVAL PIO_init_stacks(theINTERP) {
        ParrotIOLayer * p;

        /* First push the platform specific OS layer */
#ifndef WIN32
        PIO_push_layer(&pio_unix_layer, NULL);
#else
        PIO_push_layer(&pio_win32_layer, NULL);
#endif
#if 0
        PIO_push_layer(&pio_stdio_layer, NULL);
#endif

        /* Note: All layer pushes should be done before init calls */
        for(p=pio_default_stack; p; p=p->down) {
                if( p->api->Init ) {
                        if((*p->api->Init)(interpreter, p) != 0) {
                                if((interpreter->flags & PARROT_DEBUG_FLAG) != 0) {
#if 0
                                        fprintf(stderr,
                                        "Parrot IO: Failed init layer(%s).\n", p->name);
#endif
                                        /* abort(); */
                                }
                        }
                }
        }

        return 0;
}


/*
 * Init routine called once for each layer at interpreter creation
 * time. This is similar to a Perl module INIT {} block.
 */
INTVAL PIO_base_init(theINTERP, ParrotIOLayer * l) {
        UNUSED (interpreter); UNUSED (l);
        return 0;
}

/*
 * ParrotIOLayer constructor with optional copy
 */
ParrotIOLayer * PIO_base_new_layer(ParrotIOLayer * proto) {
        ParrotIOLayer * new_layer;

        new_layer = mem_sys_allocate(sizeof(ParrotIOLayer));
        if( proto ) {
                /* FIXME: Flag here to indicate whether to free strings */
                new_layer->name = proto->name;
                new_layer->flags = proto->flags;
                new_layer->api = proto->api;
        } else {
                new_layer->name = NULL;
                new_layer->flags = 0;
                new_layer->api = NULL;
        }
        new_layer->this = 0;
        new_layer->up = NULL;
        new_layer->down = NULL;
        return new_layer; 
}


/*
 * ParrotIOLayer object destructor
 */
void PIO_base_delete_layer(ParrotIOLayer * layer) {
        if( layer != NULL )
                free(layer);
}


/*
 * Push a layer onto an IO object or the default stack
 */
INTVAL PIO_push_layer(ParrotIOLayer * layer, ParrotIO * io) {
        ParrotIOLayer * t;
        if( !layer )
                return -1;
        if( io ) {
                if( !io->stack
                        && (layer->flags & PIO_L_TERMINAL) == 0 ) {
                        /* Error( 1st layer must be terminal) */
                        return -1;
                }
                /* Check and see if this layer already is on stack
                 * This is a internals sanity check not a user level
                 * check, at least until I fix copy-on-write stacks.
                 * -Melvin
                 */
                for(t=io->stack; t; t=t->down) {
                        if( t == layer )
                                return -1;
                }

                layer->down = io->stack;
                if( io->stack )
                        io->stack->up = layer; 
                io->stack = layer;
                if( layer->api->Pushed )
                        (*layer->api->Pushed)(layer, io);
        } else {
                if( !pio_default_stack
                        && (layer->flags & PIO_L_TERMINAL) == 0 ) {
                        /* Error( 1st layer must be terminal) */
                        return -1;
                }
                /* Sanity check */
                for(t=pio_default_stack; t; t=t->down) {
                        if( t == layer )
                                return -1;
                }

                layer->down = pio_default_stack;
                if( pio_default_stack )
                        pio_default_stack->up = layer;
                pio_default_stack = layer;
                return 0;
        }
        return -1;
}


/*
 * Pop a layer from an IO object or the default stack
 */
ParrotIOLayer * PIO_pop_layer(ParrotIO * io) {
        ParrotIOLayer * layer;
        if( io ) {
                layer = io->stack;
                if( layer ) {
                        io->stack = layer->down; 
                        io->stack->up = 0;
                        layer->up = 0;
                        layer->down = 0;
                        if( layer->api->Popped )
                                (*layer->api->Popped)(layer, io);
                        return layer;
                }
                return layer;
        }
        /* Null io object - use default stack */
        else {
                layer = pio_default_stack;
                if( layer ) {
                        pio_default_stack = layer->down; 
                        pio_default_stack->up = NULL;
                        layer->up = 0;
                        layer->down = 0;
                        return layer;
                }
        }

        return 0;
}


/*
 * Primarily used to copy the default IO stack for a new
 * IO object. Later we will do some funky copy-on-write stuff.
 */
ParrotIOLayer * PIO_copy_stack( ParrotIOLayer * stack ) {
        ParrotIOLayer * ptr_new;
        ParrotIOLayer ** ptr_ptr_new;
        ParrotIOLayer * ptr_proto;
        ParrotIOLayer * ptr_last = NULL;
        ptr_ptr_new = &ptr_new;
        ptr_proto = stack;
        while( ptr_proto ) { 
                *ptr_ptr_new = PIO_base_new_layer( ptr_proto );
                (*ptr_ptr_new)->up = ptr_last;
                ptr_proto = ptr_proto->down;
                ptr_last = *ptr_ptr_new;
                ptr_ptr_new = &((*ptr_ptr_new)->down);
        }

        return ptr_new;
}


/*
 * Generic top level ParrotIO interface.
 */

/*
 * Parse string for file open mode and return generic
 * bits. The low level OS layers may then interpret the
 * generic bits differently depending on platform.
 */
UINTVAL PIO_parse_open_flags(const char * flagstr) {
        UINTVAL flags;
        const char * s;

        if( !flagstr || !(*flagstr) )
                return 0;
        flags = 0;
        s = flagstr;
        /* Set mode flags - <, >, >>, +<, +> */
        /* add ? and ! for block/non-block */
        switch(*s) {
                case '+':
                        flags |= (PIO_F_WRITE|PIO_F_READ);
                        break;
                case '<':
                        flags |= PIO_F_READ;
                        break;
                case '>':
                        flags |= PIO_F_WRITE;
                        if( *(++s) == '>') {
                                flags |= PIO_F_APPEND;
                        }
                        else if(*s != 0)
                                return 0;
                        break;
                default:
                        return 0;
        }

        return flags;
}
 

/*
 * API for controlling buffering specifics on an IO stream
 */
INTVAL PIO_setbuf(theINTERP, ParrotIO * io, size_t bufsize) {
        ParrotIOLayer * l = io->stack;
        PIO_flush(interpreter, io);
        while(l) {
                if(l->api->SetBuf) {
                        return (*l->api->SetBuf)(interpreter, l,
                                                io, bufsize);
                }
                l = PIO_DOWNLAYER(l);
        }
 
        return 0;
}


INTVAL PIO_setlinebuf(theINTERP, ParrotIO * io) {
        ParrotIOLayer * l = io->stack;
        PIO_flush(interpreter, io);
        while(l) {
                if(l->api->SetLineBuf) {
                        return (*l->api->SetLineBuf)(interpreter, l, io);
                }
                l = PIO_DOWNLAYER(l);
        }

        return 0;
}


ParrotIO * PIO_open(theINTERP, const char * spath, const char * sflags) {
        ParrotIO * io;
        ParrotIOLayer * l = pio_default_stack;
        UINTVAL flags = PIO_parse_open_flags(sflags);
        while(l) {
                if(l->api->Open) {
                        io = (*l->api->Open)(interpreter, l, spath, flags);
                        io->stack = pio_default_stack;
                        return io;
                }
                l = PIO_DOWNLAYER(l);
        }
        return NULL;
}


/*
 * Create an IO object on an existing, open file descriptor.
 * This is particularly used to init Parrot Standard IO onto
 * the OS IO handles (0,1,2).
 */
ParrotIO * PIO_fdopen(theINTERP, PIOHANDLE fd, const char * sflags) {
        ParrotIO * io;
        UINTVAL flags;
        ParrotIOLayer * l = pio_default_stack;
        flags = PIO_parse_open_flags(sflags);
        while(l) {
                if(l->api->FDOpen) {
                        io = (*l->api->FDOpen)(interpreter, l, fd, flags);
                        io->stack = pio_default_stack;
                        return io;
                }
                l = PIO_DOWNLAYER(l);
        }
        return NULL;
}


INTVAL PIO_close(theINTERP, ParrotIO * io) {
        if( io ) {
                ParrotIOLayer * l = io->stack;
                while(l) {
                        if(l->api->Close) {
                                PIO_flush(interpreter, io);
                                return (*l->api->Close)(interpreter,l,io);
                        }
                        l = PIO_DOWNLAYER(l);
                }
        }
	return 0;
}


void PIO_flush(theINTERP, ParrotIO * io) {
        if( io ) {
                ParrotIOLayer * l = io->stack;
                while(l) {
                        if( l->api->Flush ) {
                                (*l->api->Flush)(interpreter, l, io);
                                return;
                        }
                        l = PIO_DOWNLAYER(l);
                }
        }
}


/*
 * Iterate down the stack to the first layer implementing "Read" API
 */
INTVAL PIO_read(theINTERP, ParrotIO * io, void * buffer, size_t len) {
        if( io ) {
                ParrotIOLayer * l = io->stack;
                while(l) {
                        if( l->api->Read ) {
                                return (*l->api->Read)(interpreter,
                                                l, io, buffer, len);
                        }
                        l = PIO_DOWNLAYER(l);
                }
        }

	return 0;
}


/*
 * Iterate down the stack to the first layer implementing "Write" API
 */
INTVAL PIO_write(theINTERP, ParrotIO * io, void * buffer, size_t len) {
        if( io ) {
                ParrotIOLayer * l = io->stack;
                while(l) {
                        if( l->api->Write ) {
                                return (*l->api->Write)(interpreter,
                                                l, io, buffer, len);
                        }
                        l = PIO_DOWNLAYER(l);
                }
        }

        return 0;
}


INTVAL PIO_puts(theINTERP, ParrotIO * io, const char * s) {
        if( io ) {
                ParrotIOLayer * l = io->stack;
                while(l) {
                        if( l->api->PutS ) {
                                return (*l->api->PutS)(interpreter,
                                                l, io, s);
                        }
                        l = PIO_DOWNLAYER(l);
                }
        }

        return -1;
}


/*
 * Local variables:
 * c-indentation-style: bsd
 * c-basic-offset: 4
 * indent-tabs-mode: nil
 * End:
 *
 * vim: expandtab shiftwidth=4:
*/
