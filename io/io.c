/* io.c
 *  Copyright: (When this is determined...it will go here)
 *  CVS Info
 *      $Id$
 *  Overview:
 *      This is the Parrot IO subsystem API.  Generic IO stuff
 *      goes here, each specific layer goes in its own file...
 *      (io_unix, io_win32, io_stdio, io_utf8, etc.)
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

/* This is the default stack used for IO. Copy this to each new interp */
/*
ParrotIOLayer   * pio_default_stack;
*/

/*
        The standard streams are:

                interpreter->piodata->table[PIO_STD*_FILENO].
*/


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
        if( io->b.startb && (io->b.flags&PIO_BF_MALLOC) )
                free(io->b.startb);
        free(io);
}

ParrotIOTable alloc_pio_array(int numhandles) {
        ParrotIOTable newhandles;
        unsigned int size = numhandles * sizeof(ParrotIO *);
        newhandles = (ParrotIOTable)mem_sys_allocate(size);
        return newhandles;
}

int realloc_pio_array(ParrotIOTable * table, int numhandles) {
        UNUSED(table); UNUSED(numhandles);
        return -1;
}

/*
 * Create a new IO stream, optionally reusing old structure.
 */
ParrotIO * PIO_new(theINTERP, ParrotIO * old, INTVAL iotype,
                        UINTVAL flags, UINTVAL mode) {
        ParrotIO * new_io;

        UNUSED (iotype);

        if( old ) {
                /* FIXME: Reuse old IO */
        }
        new_io = (ParrotIO *)malloc(sizeof(ParrotIO));
        new_io->fpos = new_io->lpos = piooffsetzero;
        new_io->flags = flags;
        new_io->mode = mode;
        new_io->stack = GET_INTERP_IO(interpreter);
        new_io->b.startb = NULL;
        new_io->b.endb = NULL;
        new_io->b.next = NULL;
        return new_io;
}

/*
 * Initialize some stuff.
 */

void PIO_init(theINTERP) {
        int err;
        /* Has interp been initialized already? */
        if(interpreter->piodata)
                return;

        interpreter->piodata = mem_sys_allocate(sizeof(ParrotIOData));
        if(interpreter->piodata == NULL)
                internal_exception(PIO_ERROR, "PIO alloc piodata failure.");
        GET_INTERP_IOD(interpreter)->default_stack = NULL;
        GET_INTERP_IOD(interpreter)->table = alloc_pio_array(PIO_NR_OPEN);
        if(GET_INTERP_IOD(interpreter)->table == NULL)
                internal_exception(PIO_ERROR, "PIO alloc table failure.");

        /* Init IO stacks and handles for interp instance.  */
        if((err = PIO_init_stacks(interpreter)) != 0) {
                internal_exception(PIO_ERROR, "PIO init stacks failed.");
        }

        if(!PIO_STDIN(interpreter) || !PIO_STDOUT(interpreter)
                         || !PIO_STDERR(interpreter)) {
                internal_exception(PIO_ERROR, "PIO init std handles failed.");
        }

        if((interpreter->flags & PARROT_DEBUG_FLAG) != 0) {
                PIO_puts(interpreter, PIO_STDERR(interpreter),
                        "PIO: IO system initialized.\n");
        }
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
        /* Optimize this to keep a default stack and just
         * call copy stack.
         */
#ifndef WIN32
        PIO_push_layer(interpreter, PIO_base_new_layer(&pio_unix_layer),
                                NULL);
#else
        PIO_push_layer(interpreter, PIO_base_new_layer(&pio_win32_layer),
                                NULL);
#endif
#if 0
        PIO_push_layer(interpreter, PIO_base_new_layer(&pio_stdio_layer),
                                NULL);
#endif

        /* Note: All layer pushes should be done before init calls */
        for(p=GET_INTERP_IO(interpreter); p; p=p->down) {
                if(p->api->Init) {
                        if((*p->api->Init)(interpreter, p) != 0) {
                                char buf[1024];
                                sprintf(buf,
                                "Parrot IO: Failed init layer(%s).\n", p->name);
                                internal_exception(PIO_ERROR, buf);
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
INTVAL PIO_push_layer(theINTERP, ParrotIOLayer * layer, ParrotIO * io) {
        ParrotIOLayer * t;
        if(layer == NULL)
                return -1;
        if(io != NULL) {
                if(io->stack == NULL
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
                ParrotIOData * d = (ParrotIOData *)interpreter->piodata;
                if( d->default_stack == NULL
                        && (layer->flags & PIO_L_TERMINAL) == 0 ) {
                        /* Error( 1st layer must be terminal) */
                        return -1;
                }
                /* Sanity check */
                for(t=d->default_stack; t; t=t->down) {
                        if( t == layer )
                                return -1;
                }

                layer->down = d->default_stack;
                if( d->default_stack )
                        d->default_stack->up = layer;
                d->default_stack = layer;
                return 0;
        }
        return -1;
}


/*
 * Pop a layer from an IO object or the default stack
 */
ParrotIOLayer * PIO_pop_layer(theINTERP, ParrotIO * io) {
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
                ParrotIOData * d;
                d = (ParrotIOData *)interpreter->piodata;
                layer = d->default_stack;
                if(layer) {
                        d->default_stack = layer->down; 
                        d->default_stack->up = NULL;
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
                        else {
                                flags |= PIO_F_TRUNC;
                        }
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
        ParrotIOLayer * l = GET_INTERP_IO(interpreter);
        UINTVAL flags = PIO_parse_open_flags(sflags);
        while(l) {
                if(l->api->Open) {
                        io = (*l->api->Open)(interpreter, l, spath, flags);
                        if(io) {
                                io->stack = GET_INTERP_IO(interpreter);
                                return io;
                        } else {
                                return NULL;
                        }
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
        ParrotIOLayer * l = GET_INTERP_IO(interpreter);
        flags = PIO_parse_open_flags(sflags);
        while(l) {
                if(l->api->FDOpen) {
                        io = (*l->api->FDOpen)(interpreter, l, fd, flags);
                        io->stack = GET_INTERP_IO(interpreter);
                        return io;
                }
                l = PIO_DOWNLAYER(l);
        }
        return NULL;
}


INTVAL PIO_close(theINTERP, ParrotIO * io) {
        if(io) {
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
        if(io) {
                ParrotIOLayer * l = io->stack;
                while(l) {
                        if(l->api->Flush) {
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
        if(io) {
                ParrotIOLayer * l = io->stack;
                while(l) {
                        if(l->api->Read) {
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
        if(io) {
                ParrotIOLayer * l = io->stack;
                while(l) {
                        if(l->api->Write) {
                                return (*l->api->Write)(interpreter,
                                                l, io, buffer, len);
                        }
                        l = PIO_DOWNLAYER(l);
                }
        }

        return 0;
}


/*
 * 64 bit support wrapper. Some platforms/filesystems don't
 * support large files. Pass hi as 0 for 32bit seek. There is
 * a 1 and 2 arg version of seek opcode.
 */
INTVAL PIO_seek(theINTERP, ParrotIO * io, INTVAL hi, INTVAL lo,
                                INTVAL w) {
        if(io) {
                ParrotIOLayer * l = io->stack;
                while(l) {
                        if( l->api->Seek ) {
                                return (*l->api->Seek)(interpreter, l,
                                                        io, hi, lo, w);
                        }
                        l = PIO_DOWNLAYER(l);
                }
        }
        return -1;
}


/*
 * Iterate down the stack to the first layer implementing "Read" API
 */
INTVAL PIO_eof(theINTERP, ParrotIO * io) {
        if(io) {
                return (io->flags & (PIO_F_EOF)) != 0;
        }
        return 1;
}


INTVAL PIO_puts(theINTERP, ParrotIO * io, const char * s) {
        if(io) {
                ParrotIOLayer * l = io->stack;
                while(l) {
                        if(l->api->PutS) {
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
