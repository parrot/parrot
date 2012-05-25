io_pipe_setup_vtable(PARROT_INTERP, IO_VTABLE *vtable)
{
    ASSERT_ARGS(io_pipe_setup_vtable)
    vtable->name = "Pipe";
    vtable->read_s = io_pipe_read_s;
    vtable->read_b = io_pipe_read_b;
    vtable->write_s = io_pipe_write_s;
    vtable->readline_s = io_pipe_readline_s;
    vtable->readall_s = io_pipe_readall_s;
    vtable->flush = io_pipe_flush;
    vtable->is_eof = io_pipe_is_eof;
    vtable->tell = io_pipe_tell;
    vtable->peek_b = io_pipe_peek_b;
    vtable->seek = io_pipe_seek;
    vtable->open = io_pipe_open;
    vtable->is_open = io_pipe_is_open;
    vtable->close = io_pipe_close;
}


static STRING *
io_pipe_read_s(PARROT_INTERP, ARGMOD(PMC *handle), size_t char_length)
{
    ASSERT_ARGS(io_pipe_read_s)
}

static INTVAL
io_pipe_read_b(PARROT_INTERP, ARGMOD(PMC *handle), ARGOUT(char *buffer), size_t byte_length)
{
    ASSERT_ARGS(io_pipe_read_b)
}

static INTVAL
io_pipe_write_s(PARROT_INTERP, ARGMOD(PMC *handle), ARGIN(STRING *s), size_t char_length)
{
    ASSERT_ARGS(io_pipe_write_s)
}

static INTVAL
io_pipe_write_b(PARROT_INTERP, ARGMOD(PMC *handle), ARGIN(char *buffer), size_t byte_length)
{
    ASSERT_ARGS(io_pipe_write_b)
}

static INTVAL
io_pipe_readline_s(PARROT_INTERP, ARGMOD(PMC *handle), INTVAL terminator)
{
    ASSERT_ARGS(io_pipe_readline_s)
}

static STRING *
io_pipe_readall_s(PARROT_INTERP, ARGMOD(PMC *handle))
{
    ASSERT_ARGS(io_pipe_readall_s)
}

static INTVAL
io_pipe_flush(PARROT_INTERP, ARGMOD(PMC *handle))
{
    ASSERT_ARGS(io_pipe_flush_s)
}

static INTVAL
io_pipe_is_eof(PARROT_INTERP, ARGMOD(PMC *handle))
{
    ASSERT_ARGS(io_pipe_readall_s)
}

static PIOOFF_T
io_pipe_tell(PARROT_INTERP, ARGMOD(PMC *handle))
{
    ASSERT_ARGS(io_pipe_tell)
}

static INTVAL
io_pipe_seek(PARROT_INTERP, ARGMOD(PMC *handle))
{
    ASSERT_ARGS(io_pipe_seek)
}

static INTVAL
io_pipe_peek(PARROT_INTERP, ARGMOD(PMC *handle))
{
    ASSERT_ARGS(io_pipe_peek_b)
}

static INTVAL
io_pipe_open(PARROT_INTERP, ARGMOD(PMC *handle), ARGIN(STRING *path), INTVAL flags, ARGIN(STRING *mode))
{
    ASSERT_ARGS(io_pipe_open)

    const int f_read  = (flags & PIO_F_READ) != 0;
    const int f_write = (flags & PIO_F_WRITE) != 0;
    INTVAL    pid;
    PIOHANDLE os_handle;

    if (f_read == f_write)
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_PIO_ERROR,
            "Invalid pipe mode: %X", flags);

    os_handle = PIO_OPEN_PIPE(interp, path, flags, &pid);

    /* Save the pid of the child, we'll wait for it when closing */
    VTABLE_set_integer_keyed_int(interp, handle, 0, pid);

    if (flags & PIO_F_BINARY)
        SETATTR_FileHandle_encoding(interp, handle, CONST_STRING(interp, "binary"));

    SETATTR_FileHandle_os_handle(interp, filehandle, os_handle);
    SETATTR_FileHandle_flags(interp, filehandle, flags);
    SETATTR_FileHandle_filename(interp, filehandle, path);
    SETATTR_FileHandle_mode(interp, filehandle, mode);

    return 1;
}

static INTVAL
io_pipe_is_open(PARROT_INTERP, ARGMOD(PMC *handle))
{
    ASSERT_ARGS(io_pipe_is_open)
}

static INTVAL
io_pipe_close(PARROT_INTERP, ARGMOD(PMC *handle))
{
    ASSERT_ARGS(io_pipe_close)

    // TODO: Separate out Pipe logic from FileHandle logic here
    const INTVAL result = Parrot_io_close_filehandle(interp, pmc);
    SETATTR_FileHandle_flags(interp, pmc, 0);
    return result;
}
