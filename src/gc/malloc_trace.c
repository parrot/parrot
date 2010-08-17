/* malloc-trace.c
 *
 * by Wolfram Gloger 1995.
 *
 * $Id$
 * Copyright (C) 2002-2007, Parrot Foundation.
 */

#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <fcntl.h>
#include <string.h>
#include <sys/time.h>
#ifdef __linux__
#  include <signal.h>
#  include <asm/signal.h>
#endif

#define ACTION_BUF_SIZE 1024
#define TIMESTAMP_FREQ  50
#define LOG_NAME "/tmp/mtrace"

static void malloc_trace_destructor(void);

static ACTION buffer[ACTION_BUF_SIZE+1];
static int buffer_i = 0;
static int fd = -1;
static int tracing = 1;
static int pid = 0;
static char *initial_brk = 0;

/*

=head1 NAME

src/malloc-trace.c

=head1 DESCRIPTION

TT #292

=head2 Functions

=over 4

=cut

*/

/*

=item C<static void open_log_file()>

Open a logfile for storing debugging information.

=cut

*/

static void
open_log_file()
{
    char name[128];
    const unsigned version = MTRACE_VERSION;
#ifdef __linux__
    char cmdline[128], *s;
    int count, fd2;
#endif

    tracing = 0;
    pid = getpid();
#ifdef __linux__
    sprintf(name, "/proc/%d/cmdline", pid);
    fd2 = open(name, O_RDONLY);
    if (fd2>=0 && (count = read(fd2, cmdline, 127)) > 0) {
        close(fd2);
        cmdline[count] = 0;
        for (s=cmdline; ++*s;); --s;
        while (--s>cmdline && *s!='/');
        if (*s == '/') ++s;
        sprintf(name, LOG_NAME ".%.12s.%d", s, pid);
    }
        else {
        sprintf(name, LOG_NAME ".%d", pid);
    }
#else
    sprintf(name, LOG_NAME ".%d", pid);
#endif
    fd = open(name, O_WRONLY|O_CREAT, 0600);
    if (fd >= 0) {
        write(fd, &version, sizeof (version));
        write(fd, &initial_brk, sizeof (initial_brk));
    }
    tracing = 1;
}

/*

=item C<static void malloc_trace_destructor(void)>

Print out a final timestamp and message to the log file.

=cut

*/

static void
malloc_trace_destructor(void)
{
    struct timeval t;

    /* produce final timestamp */
    gettimeofday(&t, NULL);
    buffer[buffer_i].code = CODE_TIMESTAMP;
    buffer[buffer_i].size = t.tv_sec;
    buffer[buffer_i].ptr = (void *)t.tv_usec;
    buffer[buffer_i].ptr2 = NULL;
    ++buffer_i;
    if (fd < 0) open_log_file();
    if (getpid() != pid) { /* Oops, must have forked... */
        if (fd >= 0) close(fd);
        return;
    }
    if (fd >= 0) write(fd, buffer, buffer_i*sizeof (ACTION));
    write(2, "<end malloc trace>\n", 19);
    if (fd >= 0) close(fd);
}

#ifdef __linux__

/*

=item C<static void malloc_segv_handler(int i, struct sigcontext_struct sc)>

Catch a segfault signal, print an error message, and end the logfile.

=cut

*/

static void
malloc_segv_handler(int i, struct sigcontext_struct sc)
{
    tracing = 0;
    fprintf(stderr, "malloc-trace: caught SEGV signal.\n");
    fprintf(stderr, "sc.cr2 = %8lx\n", (unsigned long)sc.cr2);
    malloc_trace_destructor();
}

#endif

/*

=item C<static void malloc_record(int code, size_t size, void *ptr, void *ptr2)>

Record information about the allocation into the logfile.

=cut

*/

static void
malloc_record(int code, size_t size, void *ptr, void *ptr2)
{
    static long count = 0;
    struct timeval t;

    if (!tracing) return;
#ifdef __linux__
    if (count == 0) signal(SIGSEGV, (void (*)(int))malloc_segv_handler);
#endif
    if ((count++ % TIMESTAMP_FREQ) == 0) {
        gettimeofday(&t, NULL);
        buffer[buffer_i].code = CODE_TIMESTAMP;
        buffer[buffer_i].size = t.tv_sec;
        buffer[buffer_i].ptr = (void *)t.tv_usec;
        buffer[buffer_i].ptr2 = NULL;
        ++buffer_i;
    }
    buffer[buffer_i].code = code;
    buffer[buffer_i].size = size;
    buffer[buffer_i].ptr = ptr;
    buffer[buffer_i].ptr2 = ptr2;
    if (++buffer_i >= ACTION_BUF_SIZE) {
        if (fd < 0) open_log_file();
        if (getpid() != pid) { /* Oops, must have forked... */
            tracing = 0;
            return;
        }
        if (fd >= 0) write(fd, buffer, buffer_i*sizeof (ACTION));
        buffer_i = 0;
    }
}

void* _real_malloc(size_t bytes);

/*

=item C<void* malloc(size_t bytes)>

Allocate memory with the specified size in bytes. Record information about it
in the logfile.

=cut

*/

void* malloc(size_t bytes)
{
    void *ptr;

    if (initial_brk == 0) { /* Must be the first time. */
        initial_brk = sbrk(0);
        atexit(malloc_trace_destructor);
    }
    ptr = _real_malloc(bytes);
    malloc_record(CODE_MALLOC, bytes, ptr, 0);
    return ptr;
}
#define malloc _real_malloc

void _real_free(void* mem);

/*

=item C<void free(void* mem)>

Record information about the free in the logfile, and free the memory.

=cut

*/

void free(void* mem)
{
    malloc_record(CODE_FREE, 0, mem, 0);
    _real_free(mem);
}
#define free _real_free

void* _real_realloc(void* mem, size_t bytes);

/*

=item C<void* realloc(void* mem, size_t bytes)>

Resize the allocated memory buffer to the new size.

=cut

*/

void* realloc(void* mem, size_t bytes)
{
    void *ptr;

    ptr = _real_realloc(mem, bytes);
    malloc_record(CODE_REALLOC, bytes, mem, ptr);
    return ptr;
}
#define realloc _real_realloc

void* _real_memalign(size_t alignment, size_t bytes);

/*

=item C<void* memalign(size_t alignment, size_t bytes)>

Return an allocated memory buffer that's of at least the given size in bytes
and is aligned along the given boundary.

=cut

*/

void* memalign(size_t alignment, size_t bytes)
{
    void *ptr;

    if (initial_brk == 0) { /* Must be the first time. */
        initial_brk = sbrk(0);
        atexit(malloc_trace_destructor);
    }
    ptr = _real_memalign(alignment, bytes);
    malloc_record(CODE_MEMALIGN, bytes, ptr, (void*)alignment);
    return ptr;
}
#define memalign _real_memalign

void* _real_calloc(size_t n, size_t elem_size);

/*

=item C<void* calloc(size_t n, size_t elem_size)>

Allocate memory of the given size, initializing the memory to the given value.

=cut

*/

void* calloc(size_t n, size_t elem_size)
{
    void *ptr;

    if (initial_brk == 0) { /* Must be the first time. */
        initial_brk = sbrk(0);
        atexit(malloc_trace_destructor);
    }
    ptr = _real_calloc(n, elem_size);
    malloc_record(CODE_CALLOC, n*elem_size, ptr, 0);
    return ptr;
}
#define calloc _real_calloc

void _real_cfree(void *mem);

/*

=item C<void cfree(void *mem)>

free the given buffer, recording information about it in the log.

=cut

*/

void cfree(void *mem)
{
    malloc_record(CODE_CFREE, 0, mem, 0);
    _real_cfree(mem);
}
#define cfree _real_cfree

#include "malloc.c"

/*

=back

=cut

*/

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
