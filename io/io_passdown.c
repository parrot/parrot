/* io_passdown.c
 *  Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
 *  CVS Info
 *      $Id$
 *  Overview:
 *      This is a set of helper functions which search the next implementation
 *      of a function in the layer-stack and call it with the appropriate
 *      arguments
 *  Data Structure and Algorithms:
 *      Uses the IO PMC defined in io.h
 *      Uses ParrotIO structs in io_private.h
 *  History:
 *      Initially written by Juergen Boemmels
 *  References:
 *      Some ideas and goals from Perl5.7 and Nick Ing-Simmons' work
 */

#include <parrot/parrot.h>
#include "io_private.h"

/* 
 * These function iterate down the layerstack starting at layer 
 * and calling the first non-null function they find.
 */

ParrotIO *
PIO_open_down(theINTERP, ParrotIOLayer * layer, const char * name,
              INTVAL flags)
{
    while (layer) {
        if (layer->api->Open) {
            return layer->api->Open(interpreter, layer, name, flags);
        }
        layer = PIO_DOWNLAYER(layer);
    }
    /* No layer found */
    return NULL;
}


ParrotIO *
PIO_open_async_down(theINTERP, ParrotIOLayer * layer, const char * name,
                    const char * mode, DummyCodeRef * dummy)
{
    while (layer) {
        if (layer->api->Open_ASync) {
            return layer->api->Open_ASync(interpreter, layer, name, mode,
                                          dummy);
        }
        layer = PIO_DOWNLAYER(layer);
    }
    /* No layer found */
    return NULL;
}


ParrotIO *
PIO_fdopen_down(theINTERP, ParrotIOLayer * layer, PIOHANDLE fd, INTVAL flags)
{
    while (layer) {
        if (layer->api->FDOpen) {
            return layer->api->FDOpen(interpreter, layer, fd, flags);
        }
        layer = PIO_DOWNLAYER(layer);
    }
    /* No layer found */
    return NULL;
}


INTVAL
PIO_close_down(theINTERP, ParrotIOLayer * layer, ParrotIO * io)
{
    while (layer) {
        if (layer->api->Close) {
            return layer->api->Close(interpreter, layer, io);
        }
        layer = PIO_DOWNLAYER(layer);
    }
    /* No layer found */
    return -1;
}


size_t
PIO_write_down(theINTERP, ParrotIOLayer * layer, ParrotIO * io,
               const void * buf, size_t len)
{
    while (layer) {
        if (layer->api->Write) {
            return layer->api->Write(interpreter, layer, io, buf, len);
        }
        layer = PIO_DOWNLAYER(layer);
    }
    /* No layer found */
    return 0;
}


size_t
PIO_write_async_down(theINTERP, ParrotIOLayer * layer, ParrotIO * io,
                     void * buf, size_t len, DummyCodeRef *dummy)
{
    while (layer) {
        if (layer->api->Write_ASync) {
            return layer->api->Write_ASync(interpreter, layer, io, buf, len, 
                                       dummy);
        }
        layer = PIO_DOWNLAYER(layer);
    }
    /* No layer found */
    return 0;
}


size_t
PIO_read_down(theINTERP, ParrotIOLayer * layer, ParrotIO * io, void * buf,
              size_t len)
{
    while (layer) {
        if (layer->api->Read) {
            return layer->api->Read(interpreter, layer, io, buf, len);
        }
        layer = PIO_DOWNLAYER(layer);
    }
    /* No layer found */
    return 0;
}


size_t
PIO_read_async_down(theINTERP, ParrotIOLayer * layer, ParrotIO * io,
                    void * buf, size_t len, DummyCodeRef *dummy)
{
    while (layer) {
        if (layer->api->Read_ASync) {
            return layer->api->Read_ASync(interpreter, layer, io, buf, len,
                                          dummy);
        }
        layer = PIO_DOWNLAYER(layer);
    }
    /* No layer found */
    return 0;
}


INTVAL
PIO_flush_down(theINTERP, ParrotIOLayer * layer, ParrotIO * io)
{
    while (layer) {
        if (layer->api->Flush) {
            return layer->api->Flush(interpreter, layer, io);
        }
        layer = PIO_DOWNLAYER(layer);
    }
    /* No layer found */
    return 0;
}

PIOOFF_T
PIO_seek_down(theINTERP, ParrotIOLayer * layer, ParrotIO * io, PIOOFF_T offset,
              INTVAL whence)
{
    while (layer) {
        if (layer->api->Seek) {
            return layer->api->Seek(interpreter, layer, io, offset, whence);
        }
        layer = PIO_DOWNLAYER(layer);
    }
    /* No layer found */
    return -1;
}


PIOOFF_T
PIO_tell_down(theINTERP, ParrotIOLayer * layer, ParrotIO * io)
{
    while (layer) {
        if (layer->api->Tell) {
            return layer->api->Tell(interpreter, layer, io);
        }
        layer = PIO_DOWNLAYER(layer);
    }
    /* No layer found */
    return 0;
}


INTVAL
PIO_setbuf_down(theINTERP, ParrotIOLayer * layer, ParrotIO * io,
                size_t bufsize)
{
    while (layer) {
        if (layer->api->SetBuf) {
            return layer->api->SetBuf(interpreter, layer, io, bufsize);
        }
        layer = PIO_DOWNLAYER(layer);
    }
    /* No layer found */
    return -1;
}


INTVAL
PIO_setlinebuf_down(theINTERP, ParrotIOLayer * layer, ParrotIO * io)
{
    while (layer) {
        if (layer->api->SetLineBuf) {
            return layer->api->SetLineBuf(interpreter, layer, io);
        }
        layer = PIO_DOWNLAYER(layer);
    }
    /* No layer found */
    return -1;
}


INTVAL
PIO_eof_down(theINTERP, ParrotIOLayer * layer, ParrotIO * io)
{
    while (layer) {
        if (layer->api->Eof) {
            return layer->api->Eof(interpreter, layer, io);
        }
        layer = PIO_DOWNLAYER(layer);
    }
    /* No layer found */
    return -1;
}

INTVAL
PIO_poll_down(theINTERP, ParrotIOLayer *layer, ParrotIO *io,
    INTVAL which, INTVAL sec, INTVAL usec)
{
    while (layer) {
        if (layer->api->Poll) {
            return layer->api->Poll(interpreter, layer, io, which, sec, usec);
        }
        layer = PIO_DOWNLAYER(layer);
    }
    return -1;
}

ParrotIO *
PIO_socket_down(theINTERP, ParrotIOLayer *layer, INTVAL fam, INTVAL type, INTVAL proto)
{
    while (layer) {
        if (layer->api->Socket) {
            return layer->api->Socket(interpreter, layer, fam, type, proto);
        }
        layer = PIO_DOWNLAYER(layer);
    }
    return NULL;
}

INTVAL
PIO_recv_down(theINTERP, ParrotIOLayer *layer, ParrotIO *io, STRING **buf)
{
    while (layer) {
        if (layer->api->Recv) {
            return layer->api->Recv(interpreter, layer, io, buf);
        }
        layer = PIO_DOWNLAYER(layer);
    }
    return -1;
}

INTVAL
PIO_send_down(theINTERP, ParrotIOLayer *layer, ParrotIO *io, STRING *buf)
{
    while (layer) {
        if (layer->api->Send) {
            return layer->api->Send(interpreter, layer, io, buf);
        }
        layer = PIO_DOWNLAYER(layer);
    }
    return -1;
}

INTVAL
PIO_connect_down(theINTERP, ParrotIOLayer *layer, ParrotIO *io, STRING *address)
{
    while (layer) {
        if (layer->api->Connect) {
            return layer->api->Connect(interpreter, layer, io, address);
        }
        layer = PIO_DOWNLAYER(layer);
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
