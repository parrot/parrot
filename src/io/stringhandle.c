/*
Copyright (C) 2001-2010, Parrot Foundation.

=head1 NAME

src/io/stringhandle.c - StringHandle vtables and helper routines

=head1 DESCRIPTION


=cut

*/

#include "parrot/parrot.h"
#include "io_private.h"
#include "pmc/pmc_stringhandle.h"

/* HEADERIZER HFILE: src/io/io_private.h */

io_stringhandle_setup_vtable(PARROT_INTERP, IO_VTABLE *vtable)
{
    ASSERT_ARGS(io_stringhandle_setup_vtable)
    vtable->name = "StringHandle";
    vtable->read_s = io_stringhandle_read_s;
    vtable->read_b = io_stringhandle_read_b;
    vtable->write_s = io_stringhandle_write_s;
    vtable->readline_s = io_stringhandle_readline_s;
    vtable->readall_s = io_stringhandle_readall_s;
    vtable->flush = io_stringhandle_flush;
    vtable->is_eof = io_stringhandle_is_eof;
    vtable->tell = io_stringhandle_tell;
    vtable->peek_b = io_stringhandle_peek_b;
    vtable->seek = io_stringhandle_seek;
    vtable->open = io_stringhandle_open;
    vtable->is_open = io_stringhandle_is_open;
    vtable->close = io_stringhandle_close;
    vtable->get_encoding = io_stringhandle_get_encoding;
    vtable->set_flags = io_stringhandle_set_flags;
    vtable->get_flags = io_stringhandle_get_flags;
}

static INTVAL
io_stringhandle_read_b(PARROT_INTERP, ARGMOD(PMC *handle), ARGOUT(char *buffer), size_t byte_length)
{
    ASSERT_ARGS(io_stringhandle_read_b)
}

static INTVAL
io_stringhandle_write_b(PARROT_INTERP, ARGMOD(PMC *handle), ARGIN(char *buffer), size_t byte_length)
{
    ASSERT_ARGS(io_stringhandle_write_b)
}

static INTVAL
io_stringhandle_flush(PARROT_INTERP, ARGMOD(PMC *handle))
{
    ASSERT_ARGS(io_stringhandle_flush_s)
}

static INTVAL
io_stringhandle_is_eof(PARROT_INTERP, ARGMOD(PMC *handle))
{
    ASSERT_ARGS(io_stringhandle_readall_s)
}

static PIOOFF_T
io_stringhandle_tell(PARROT_INTERP, ARGMOD(PMC *handle))
{
    ASSERT_ARGS(io_stringhandle_tell)
}

static INTVAL
io_stringhandle_seek(PARROT_INTERP, ARGMOD(PMC *handle))
{
    ASSERT_ARGS(io_stringhandle_seek)
}

static INTVAL
io_stringhandle_peek(PARROT_INTERP, ARGMOD(PMC *handle))
{
    ASSERT_ARGS(io_stringhandle_peek_b)
}

static INTVAL
io_stringhandle_open(PARROT_INTERP, ARGMOD(PMC *handle), ARGIN(STRING *path), INTVAL flags, ARGIN(STRING *mode))
{
    ASSERT_ARGS(io_stringhandle_open)
}

static INTVAL
io_stringhandle_is_open(PARROT_INTERP, ARGMOD(PMC *handle))
{
    ASSERT_ARGS(io_stringhandle_is_open)
}

static INTVAL
io_stringhandle_close(PARROT_INTERP, ARGMOD(PMC *handle), INTVAL autoflush)
{
    ASSERT_ARGS(io_stringhandle_close)

    SETATTR_StringHandle_read_offset(interp, handle, 0);
    return
}
