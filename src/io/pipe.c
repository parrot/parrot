
#include "parrot/parrot.h"
#include "io_private.h"
#include "pmc/pmc_filehandle.h"

/* HEADERIZER HFILE: src/io/io_private.h */

/* HEADERIZER BEGIN: static */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

static INTVAL io_pipe_close(PARROT_INTERP, ARGMOD(PMC *handle))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*handle);

static INTVAL io_pipe_flush(PARROT_INTERP, ARGMOD(PMC *handle))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*handle);

static STR_VTABLE * io_pipe_get_encoding(PARROT_INTERP, ARGIN(PMC *handle))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

static INTVAL io_pipe_get_flags(PARROT_INTERP, ARGIN(PMC *handle))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

static INTVAL io_pipe_is_eof(PARROT_INTERP, ARGMOD(PMC *handle))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*handle);

static INTVAL io_pipe_is_open(PARROT_INTERP, ARGMOD(PMC *handle))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*handle);

static INTVAL io_pipe_open(PARROT_INTERP,
    ARGMOD(PMC *handle),
    ARGIN(STRING *path),
    INTVAL flags,
    ARGIN(STRING *mode))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        __attribute__nonnull__(5)
        FUNC_MODIFIES(*handle);

static INTVAL io_pipe_read_b(PARROT_INTERP,
    ARGMOD(PMC *handle),
    ARGOUT(char *buffer),
    size_t byte_length)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        FUNC_MODIFIES(*handle)
        FUNC_MODIFIES(*buffer);

static INTVAL io_pipe_seek(PARROT_INTERP, ARGMOD(PMC *handle))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*handle);

static void io_pipe_set_flags(PARROT_INTERP,
    ARGIN(PMC *handle),
    INTVAL flags)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

static PIOOFF_T io_pipe_tell(PARROT_INTERP, ARGMOD(PMC *handle))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*handle);

static INTVAL io_pipe_write_b(PARROT_INTERP,
    ARGMOD(PMC *handle),
    ARGIN(char *buffer),
    size_t byte_length)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        FUNC_MODIFIES(*handle);

#define ASSERT_ARGS_io_pipe_close __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(handle))
#define ASSERT_ARGS_io_pipe_flush __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(handle))
#define ASSERT_ARGS_io_pipe_get_encoding __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(handle))
#define ASSERT_ARGS_io_pipe_get_flags __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(handle))
#define ASSERT_ARGS_io_pipe_is_eof __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(handle))
#define ASSERT_ARGS_io_pipe_is_open __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(handle))
#define ASSERT_ARGS_io_pipe_open __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(handle) \
    , PARROT_ASSERT_ARG(path) \
    , PARROT_ASSERT_ARG(mode))
#define ASSERT_ARGS_io_pipe_read_b __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(handle) \
    , PARROT_ASSERT_ARG(buffer))
#define ASSERT_ARGS_io_pipe_seek __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(handle))
#define ASSERT_ARGS_io_pipe_set_flags __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(handle))
#define ASSERT_ARGS_io_pipe_tell __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(handle))
#define ASSERT_ARGS_io_pipe_write_b __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(handle) \
    , PARROT_ASSERT_ARG(buffer))
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: static */

void
io_pipe_setup_vtable(PARROT_INTERP, IO_VTABLE *vtable)
{
    ASSERT_ARGS(io_pipe_setup_vtable)
    vtable->name = "Pipe";
    vtable->read_b = io_pipe_read_b;
    vtable->flush = io_pipe_flush;
    vtable->is_eof = io_pipe_is_eof;
    vtable->tell = io_pipe_tell;
    vtable->seek = io_pipe_seek;
    vtable->open = io_pipe_open;
    vtable->is_open = io_pipe_is_open;
    vtable->close = io_pipe_close;
    vtable->get_encoding = io_pipe_get_encoding;
    vtable->set_flags = io_pipe_set_flags;
    vtable->get_flags = io_pipe_get_flags;
}

static INTVAL
io_pipe_read_b(PARROT_INTERP, ARGMOD(PMC *handle), ARGOUT(char *buffer), size_t byte_length)
{
    ASSERT_ARGS(io_pipe_read_b)
    const PIOHANDLE os_handle = io_filehandle_get_os_handle(interp, handle);
    const size_t bytes_read = Parrot_io_internal_read(interp, os_handle, buffer, byte_length);
    if (bytes_read == 0) {
        INTVAL flags;
        GETATTR_FileHandle_flags(interp, handle, flags);
        flags |= PIO_F_EOF;
        SETATTR_FileHandle_flags(interp, handle, flags);
    }
}

static INTVAL
io_pipe_write_b(PARROT_INTERP, ARGMOD(PMC *handle), ARGIN(char *buffer), size_t byte_length)
{
    ASSERT_ARGS(io_pipe_write_b)
    const PIOHANDLE os_handle = io_filehandle_get_os_handle(interp, handle);
    return Parrot_io_internal_write(interp, handle, buffer, byte_length);
}

static INTVAL
io_pipe_flush(PARROT_INTERP, ARGMOD(PMC *handle))
{
    ASSERT_ARGS(io_pipe_flush_s)
    // TODO: In read mode, don't do what this does.
    PIOHANDLE os_handle = io_filehandle_get_os_handle(interp, handle);
    Parrot_io_internal_flush(interp, os_handle);
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
    IO_VTABLE * const vtable = IO_GET_VTABLE(interp, handle);
    IO_VTABLE_UNIMPLEMENTED(interp, vtable, "tell");
}

static INTVAL
io_pipe_seek(PARROT_INTERP, ARGMOD(PMC *handle))
{
    ASSERT_ARGS(io_pipe_seek)
    IO_VTABLE * const vtable = IO_GET_VTABLE(interp, handle);
    IO_VTABLE_UNIMPLEMENTED(interp, vtable, "seek");
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
