io__setup_vtable(PARROT_INTERP, IO_VTABLE *vtable)
{
    ASSERT_ARGS(io__setup_vtable)
    vtable->name = "User Handle Type";
    vtable->read_s = io__read_s;
    vtable->read_b = io__read_b;
    vtable->write_s = io__write_s;
    vtable->readline_s = io__readline_s;
    vtable->readall_s = io__readall_s;
    vtable->flush = io__flush;
    vtable->is_eof = io__is_eof;
    vtable->tell = io__tell;
    vtable->peek_b = io__peek_b;
    vtable->seek = io__seek;
    vtable->open = io__open;
    vtable->is_open = io__is_open;
    vtable->close = io__close;
}


static STRING *
io__read_s(PARROT_INTERP, ARGMOD(PMC *handle), size_t char_length)
{
    ASSERT_ARGS(io__read_s)
}

static INTVAL
io__read_b(PARROT_INTERP, ARGMOD(PMC *handle), ARGOUT(char *buffer), size_t byte_length)
{
    ASSERT_ARGS(io__read_b)
}

static INTVAL
io__write_s(PARROT_INTERP, ARGMOD(PMC *handle), ARGIN(STRING *s), size_t char_length)
{
    ASSERT_ARGS(io__write_s)
}

static INTVAL
io__write_b(PARROT_INTERP, ARGMOD(PMC *handle), ARGIN(char *buffer), size_t byte_length)
{
    ASSERT_ARGS(io__write_b)
}

static INTVAL
io__readline_s(PARROT_INTERP, ARGMOD(PMC *handle), INTVAL terminator)
{
    ASSERT_ARGS(io__readline_s)
}

static STRING *
io__readall_s(PARROT_INTERP, ARGMOD(PMC *handle))
{
    ASSERT_ARGS(io__readall_s)
}

static INTVAL
io__flush(PARROT_INTERP, ARGMOD(PMC *handle))
{
    ASSERT_ARGS(io__flush_s)
}

static INTVAL
io__is_eof(PARROT_INTERP, ARGMOD(PMC *handle))
{
    ASSERT_ARGS(io__readall_s)
}

static PIOOFF_T
io__tell(PARROT_INTERP, ARGMOD(PMC *handle))
{
    ASSERT_ARGS(io__tell)
}

static INTVAL
io__seek(PARROT_INTERP, ARGMOD(PMC *handle))
{
    ASSERT_ARGS(io__seek)
}

static INTVAL
io__peek(PARROT_INTERP, ARGMOD(PMC *handle))
{
    ASSERT_ARGS(io__peek_b)
}

static INTVAL
io__open(PARROT_INTERP, ARGMOD(PMC *handle), ARGIN(STRING *path), INTVAL flags, ARGIN(STRING *mode))
{
    ASSERT_ARGS(io__open)
}

static INTVAL
io__is_open(PARROT_INTERP, ARGMOD(PMC *handle))
{
    ASSERT_ARGS(io__is_open)
}

static INTVAL
io__close(PARROT_INTERP, ARGMOD(PMC *handle), INTVAL autoflush)
{
    ASSERT_ARGS(io__close)
}
