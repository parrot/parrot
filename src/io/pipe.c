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
    vtable->get_encoding = io_pipe_get_encoding;
    vtable->set_flags = io_pipe_set_flags;
    vtable->get_flags = io_pipe_get_flags;
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
    INTVAL flags;
    GETATTR_FileHandle_flags(interp, pmc, flags);
    if (flags & PIO_F_EOF)
        return 1;
    return 0;
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
    const PIOHANDLE os_handle = io_filehandle_get_os_handle(interp, pmc);
    return os_handle != PIO_INVALID_HANDLE;
}

static INTVAL
io_pipe_close(PARROT_INTERP, ARGMOD(PMC *handle))
{
    ASSERT_ARGS(io_pipe_close)
    const PIOHANDLE os_handle = io_filehandle_get_os_handle(interp, handle);

    if (os_handle == PIO_INVALID_HANDLE)
        return -1;

    else {
        INTVAL result;
        INTVAL flags;
        IO_BUFFER * const write_buffer = PIO_GET_WRITE_BUFFER(interp, handle);
        IO_VTABLE * const vtable = PIO_GET_VTABLE(interp, handle);
        Parrot_io_buffer_flush(interp, buffer, handle, vtable);
        result = Parrot_io_internal_close(interp, os_handle);
        io_filehandle_set_os_handle(interp, handle, PIO_INVALID_HANDLE);
        Parrot_io_buffer_clear(interp, write_buffer);

        if (flags & PIO_F_PIPE) {
            INTVAL pid;
            INTVAL status;

            GETATTR_FileHandle_process_id(interp, pmc, pid);
            status = Parrot_proc_waitpid(interp, pid);
            SETATTR_FileHandle_exit_status(interp, pmc, status);
        }
        io_filehandle_set_flags(interp, handle, 0);
        return result;
    }
}

static STR_VTABLE *
io_pipe_get_encoding(PARROT_INTERP, ARGIN(PMC *handle))
{
    ASSERT_ARGS(io_pipe_get_encoding)
    STRING           *encoding_str;
    const STR_VTABLE *encoding;

    GETATTR_FileHandle_encoding(interp, pmc, encoding_str);
    if (!STRING_IS_NULL(encoding_str)) {
        return Parrot_find_encoding_by_string(interp, encoding_str);
    return NULL;
}

static void
io_pipe_set_flags(PARROT_INTERP, ARGIN(PMC *handle), INTVAL flags)
{
    ASSERT_ARGS(io_pipe_set_flags)
    PARROT_FILEHANDLE(handle)->flags = flags;
}

static INTVAL
io_pipe_get_flags(PARROT_INTERP, ARGIN(PMC *handle))
{
    ASSERT_ARGS(io_pipe_get_flags)
    return PARROT_FILEHANDLE(handle)->flags;
}

static void
io_pipe_ensure_buffer(PARROT_INTERP, ARGMOD(PMC *handle), INTVAL buffer_no, size_t length, INTVAL flags)
{
    ASSERT_ARGS(io_pipe_ensure_buffer)
    // TODO: This
    switch (buffer_no) {
        case IO_PTR_IDX_READ_BUFFER:
        case IO_PTR_IDX_WRITE_BUFFER:
        default:
    }
}
