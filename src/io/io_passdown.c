/*
Copyright (C) 2001-2007, The Perl Foundation.
$Id$

=head1 NAME

src/io/io_passdown.c - IO layer handling

=head1 DESCRIPTION

This is a set of helper functions which search for the first
implementation of a function in the layer-stack, call it with the
appropriate arguments and return the value returned.

=head2 Functions

*/

#include <parrot/parrot.h>
#include "io_private.h"

/* HEADER: src/io/io_private.h */

/*

FUNCDOC: PIO_open_down

Looks for the implementation of C<Open> and calls it if found, returning
its return value.

Returns C<NULL> if no implementation is found.

*/

ParrotIO *
PIO_open_down(Interp *interp, ParrotIOLayer *layer /*NULLOK*/, const char *name /*NN*/,
              INTVAL flags)
    /* WARN_UNUSED */
{
    while (layer) {
        if (layer->api->Open) {
            return layer->api->Open(interp, layer, name, flags);
        }
        layer = PIO_DOWNLAYER(layer);
    }
    /* No layer found */
    return NULL;
}

/*

FUNCDOC: PIO_open_async_down

Looks for the implementation of C<Open_ASync> and calls it if found,
returning its return value.

Returns C<NULL> if no implementation is found.

*/

ParrotIO *
PIO_open_async_down(Interp *interp, ParrotIOLayer *layer /*NULLOK*/, const char *name /*NN*/,
                    const char *mode /*NN*/, DummyCodeRef * dummy)
    /* WARN_UNUSED */
{
    while (layer) {
        if (layer->api->Open_ASync) {
            return layer->api->Open_ASync(interp, layer, name, mode,
                                          dummy);
        }
        layer = PIO_DOWNLAYER(layer);
    }
    /* No layer found */
    return NULL;
}

/*

PIO_fdopen_down

Looks for the implementation of C<FDOpen> and calls it if found,
returning its return value.

Returns C<NULL> if no implementation is found.

*/

ParrotIO *
PIO_fdopen_down(Interp *interp, ParrotIOLayer *layer /*NULLOK*/, PIOHANDLE fd, INTVAL flags)
    /* WARN_UNUSED */
{
    while (layer) {
        if (layer->api->FDOpen) {
            return layer->api->FDOpen(interp, layer, fd, flags);
        }
        layer = PIO_DOWNLAYER(layer);
    }
    /* No layer found */
    return NULL;
}

size_t
PIO_peek_down(Interp *interp, ParrotIOLayer *layer /*NULLOK*/, ParrotIO * io, STRING ** buf)
    /* WARN_UNUSED */
{
    while (layer) {
        if (layer->api->Peek) {
            return layer->api->Peek(interp, layer, io, buf);
        }
        layer = PIO_DOWNLAYER(layer);
    }

    /* No layer found */
    return 0;
}


/*

FUNCDOC: PIO_close_down

Looks for the implementation of C<Close> and calls it if found,
returning its return value.

Returns C<-1> if no implementation is found.

*/

INTVAL
PIO_close_down(Interp *interp, ParrotIOLayer *layer /*NULLOK*/, ParrotIO * io)
    /* WARN_UNUSED */
{
    while (layer) {
        if (layer->api->Close) {
            return layer->api->Close(interp, layer, io);
        }
        layer = PIO_DOWNLAYER(layer);
    }
    /* No layer found */
    return -1;
}

/*

PIO_write_down

Looks for the implementation of C<Write> and calls it if found,
returning its return value.

Returns C<0> if no implementation is found.

*/

size_t
PIO_write_down(Interp *interp, ParrotIOLayer *layer /*NULLOK*/, ParrotIO * io, STRING *s)
    /* WARN_UNUSED */
{
    while (layer) {
        if (layer->api->Write) {
            return layer->api->Write(interp, layer, io, s);
        }
        layer = PIO_DOWNLAYER(layer);
    }
    /* No layer found */
    return 0;
}

/*

FUNCDOC: PIO_write_async_down

Looks for the implementation of C<WriteASync> and calls it if found,
returning its return value.

Returns C<0> if no implementation is found.

*/

size_t
PIO_write_async_down(Interp *interp, ParrotIOLayer *layer /*NULLOK*/, ParrotIO * io,
                     STRING *s, DummyCodeRef *dummy)
    /* WARN_UNUSED */
{
    while (layer) {
        if (layer->api->Write_ASync) {
            return layer->api->Write_ASync(interp, layer, io, s, dummy);
        }
        layer = PIO_DOWNLAYER(layer);
    }
    /* No layer found */
    return 0;
}

/*

FUNCDOC: PIO_read_down

Looks for the implementation of C<Read> and calls it if found, returning
its return value.

Returns C<0> if no implementation is found.

*/

size_t
PIO_read_down(Interp *interp, ParrotIOLayer *layer /*NULLOK*/, ParrotIO * io, STRING ** buf)
    /* WARN_UNUSED */
{
    while (layer) {
        if (layer->api->Read) {
            return layer->api->Read(interp, layer, io, buf);
        }
        layer = PIO_DOWNLAYER(layer);
    }
    /* No layer found */
    return 0;
}

/*

FUNCDOC: PIO_read_async_down

Looks for the implementation of C<Read_ASync> and calls it if found,
returning its return value.

Returns C<0> if no implementation is found.

*/

size_t
PIO_read_async_down(Interp *interp, ParrotIOLayer *layer /*NULLOK*/, ParrotIO * io,
                    STRING ** buf, DummyCodeRef *dummy)
    /* WARN_UNUSED */
{
    while (layer) {
        if (layer->api->Read_ASync) {
            return layer->api->Read_ASync(interp, layer, io, buf, dummy);
        }
        layer = PIO_DOWNLAYER(layer);
    }
    /* No layer found */
    return 0;
}

/*

FUNCDOC: PIO_flush_down

Looks for the implementation of C<Flush> and calls it if found,
returning its return value.

Returns C<0> if no implementation is found.

*/

INTVAL
PIO_flush_down(Interp *interp, ParrotIOLayer *layer /*NULLOK*/, ParrotIO * io)
    /* WARN_UNUSED */
{
    while (layer) {
        if (layer->api->Flush) {
            layer->api->Flush(interp, layer, io);
        }
        layer = PIO_DOWNLAYER(layer);
    }
    /* No layer found */
    return 0;
}

/*

FUNCDOC: PIO_seek_down

Looks for the implementation of C<Seek> and calls it if found, returning
its return value.

Returns C<-1> if no implementation is found.

*/

PIOOFF_T
PIO_seek_down(Interp *interp, ParrotIOLayer *layer /*NULLOK*/, ParrotIO * io, PIOOFF_T offset,
              INTVAL whence)
    /* WARN_UNUSED */
{
    while (layer) {
        if (layer->api->Seek) {
            return layer->api->Seek(interp, layer, io, offset, whence);
        }
        layer = PIO_DOWNLAYER(layer);
    }
    /* No layer found */
    return -1;
}

/*

FUNCDOC: PIO_tell_down

Looks for the implementation of C<Tell> and calls it if found, returning
its return value.

Returns C<0> if no implementation is found.

*/

PIOOFF_T
PIO_tell_down(Interp *interp, ParrotIOLayer *layer /*NULLOK*/, ParrotIO * io)
    /* WARN_UNUSED */
{
    while (layer) {
        if (layer->api->Tell) {
            return layer->api->Tell(interp, layer, io);
        }
        layer = PIO_DOWNLAYER(layer);
    }
    /* No layer found */
    return 0;
}

/*

FUNCDOC: PIO_setbuf_down

Looks for the implementation of C<SetBuf> and calls it if found,
returning its return value.

Returns C<-1> if no implementation is found.

*/

INTVAL
PIO_setbuf_down(Interp *interp, ParrotIOLayer *layer /*NULLOK*/, ParrotIO * io,
                size_t bufsize)
    /* WARN_UNUSED */
{
    while (layer) {
        if (layer->api->SetBuf) {
            return layer->api->SetBuf(interp, layer, io, bufsize);
        }
        layer = PIO_DOWNLAYER(layer);
    }
    /* No layer found */
    return -1;
}

/*

FUNCDOC: PIO_setlinebuf_down

Looks for the implementation of C<SetLineBuf> and calls it if found,
returning its return value.

Returns C<-1> if no implementation is found.

*/

INTVAL
PIO_setlinebuf_down(Interp *interp, ParrotIOLayer *layer /*NULLOK*/, ParrotIO * io)
    /* WARN_UNUSED */
{
    while (layer) {
        if (layer->api->SetLineBuf) {
            return layer->api->SetLineBuf(interp, layer, io);
        }
        layer = PIO_DOWNLAYER(layer);
    }
    /* No layer found */
    return -1;
}

/*

FUNCDOC: PIO_eof_down

Looks for the implementation of C<Eof> and calls it if found, returning
its return value.

Returns C<-1> if no implementation is found.

*/

INTVAL
PIO_eof_down(Interp *interp, ParrotIOLayer *layer /*NULLOK*/, ParrotIO * io)
    /* WARN_UNUSED */
{
    while (layer) {
        if (layer->api->Eof) {
            return layer->api->Eof(interp, layer, io);
        }
        layer = PIO_DOWNLAYER(layer);
    }
    /* No layer found */
    return -1;
}

/*

FUNCDOC: PIO_poll_down

Looks for the implementation of C<Poll> and calls it if found, returning
its return value.

Returns C<-1> if no implementation is found.

*/

INTVAL
PIO_poll_down(Interp *interp, ParrotIOLayer *layer, ParrotIO *io,
        INTVAL which, INTVAL sec, INTVAL usec)
    /* WARN_UNUSED */
{
    while (layer) {
        if (layer->api->Poll) {
            return layer->api->Poll(interp, layer, io, which, sec, usec);
        }
        layer = PIO_DOWNLAYER(layer);
    }
    return -1;
}

/*

FUNCDOC: PIO_socket_down

Looks for the implementation of C<Socket> and calls it if found,
returning its return value.

Returns C<NULL> if no implementation is found.

*/

ParrotIO *
PIO_socket_down(Interp *interp, ParrotIOLayer *layer, INTVAL fam, INTVAL type,
                INTVAL proto)
    /* WARN_UNUSED */
{
    while (layer) {
        if (layer->api->Socket) {
            return layer->api->Socket(interp, layer, fam, type, proto);
        }
        layer = PIO_DOWNLAYER(layer);
    }
    return NULL;
}

/*

FUNCDOC: PIO_recv_down

Looks for the implementation of C<Recv> and calls it if found, returning
its return value.

Returns C<-1> if no implementation is found.

*/

INTVAL
PIO_recv_down(Interp *interp, ParrotIOLayer *layer, ParrotIO *io, STRING **buf)
    /* WARN_UNUSED */
{
    while (layer) {
        if (layer->api->Recv) {
            return layer->api->Recv(interp, layer, io, buf);
        }
        layer = PIO_DOWNLAYER(layer);
    }
    return -1;
}

/*

FUNCDOC: PIO_send_down

Looks for the implementation of C<Send> and calls it if found, returning
its return value.

Returns C<-1> if no implementation is found.

*/

INTVAL
PIO_send_down(Interp *interp, ParrotIOLayer *layer, ParrotIO *io, STRING *buf)
    /* WARN_UNUSED */
{
    while (layer) {
        if (layer->api->Send) {
            return layer->api->Send(interp, layer, io, buf);
        }
        layer = PIO_DOWNLAYER(layer);
    }
    return -1;
}

/*

FUNCDOC: PIO_connect_down

Looks for the implementation of C<Connect> and calls it if found,
returning its return value.

Returns C<-1> if no implementation is found.

*/

INTVAL
PIO_connect_down(Interp *interp, ParrotIOLayer *layer, ParrotIO *io, STRING *address)
    /* WARN_UNUSED */
{
    while (layer) {
        if (layer->api->Connect) {
            return layer->api->Connect(interp, layer, io, address);
        }
        layer = PIO_DOWNLAYER(layer);
    }
    return -1;
}

/*

FUNCDOC: PIO_bind_down

Looks for the implementation of C<Bind> and calls it if found,
returning its return value.

Returns C<-1> if no implementation is found.

*/

INTVAL
PIO_bind_down(Interp *interp, ParrotIOLayer *layer, ParrotIO *io, STRING *address)
    /* WARN_UNUSED */
{
    while (layer) {
        if (layer->api->Bind) {
            return layer->api->Bind(interp, layer, io, address);
        }
        layer = PIO_DOWNLAYER(layer);
    }
    return -1;
}

/*

FUNCDOC: PIO_listen_down

Looks for the implementation of C<listen> and calls it if found,
returning its return value.

Returns C<-1> if no implementation is found.

*/

INTVAL
PIO_listen_down(Interp *interp, ParrotIOLayer *layer, ParrotIO *io, INTVAL backlog)
    /* WARN_UNUSED */
{
    while (layer) {
        if (layer->api->Listen) {
            return layer->api->Listen(interp, layer, io, backlog);
        }
        layer = PIO_DOWNLAYER(layer);
    }
    return -1;
}

/*

FUNCDOC: PIO_accept_down

Looks for the implementation of C<Accept> and calls it if found,
returning its return value.

Returns C<-1> if no implementation is found.

*/

ParrotIO *
PIO_accept_down(Interp *interp, ParrotIOLayer *layer, ParrotIO *io)
    /* WARN_UNUSED */
{
    while (layer) {
        if (layer->api->Accept) {
            return layer->api->Accept(interp, layer, io);
        }
        layer = PIO_DOWNLAYER(layer);
    }
    return NULL;
}

/*

=head1 SEE ALSO

F<src/io/io_buf.c>,
F<src/io/io_passdown.c>,
F<src/io/io_stdio.c>,
F<src/io/io_unix.c>,
F<src/io/io_win32.c>,
F<src/io/io.c>,
F<src/io/io_private.h>.

=head1 HISTORY

Initially written by Juergen Boemmels

Some ideas and goals from Perl5.7 and Nick Ing-Simmons' work.

*/


/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
