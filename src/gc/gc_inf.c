/*
Copyright (C) 2001-2010, Parrot Foundation.

=head1 NAME

src/gc/gc_inf.c - A demonstration of an infinite memory garbage collector

=head1 DESCRIPTION

This code implements an example of a bare-bones "infinite memory" garbage
collector. This is a learning tool only to demonstrate how to implement the
GC API in a new core. DO NOT USE THIS CORE ANYWHERE FOR ANY REASON.

Because this core never frees memory, some functionality is missing and some
tests will fail: Tests for timely destruction, tests involving IO that is
not manually flushed (the GC never calls the destroy VTABLE, so things never
get flushed/closed automatically), etc. This is by design and should not be
considered a "bug" or an "error". It is just a fact of life for such a
minimalist core.

To enable this core, change the settings in include/parrot/settings.h. Set

 PARROT_GC_SUBSYSEM == 3

to activate this core.

=cut

*/

#include "parrot/parrot.h"
#include "gc_private.h"

#define PANIC_OUT_OF_MEM(size) failed_allocation(__LINE__, (size))

/* HEADERIZER HFILE: src/gc/gc_private.h */

/* HEADERIZER BEGIN: static */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

PARROT_DOES_NOT_RETURN
static void failed_allocation(unsigned int line, unsigned long size);

static void gc_inf_allocate_buffer_storage(PARROT_INTERP,
    ARGMOD(Buffer *buffer),
    size_t size)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*buffer);

PARROT_MALLOC
PARROT_CAN_RETURN_NULL
static Buffer* gc_inf_allocate_bufferlike_header(PARROT_INTERP, size_t size);

PARROT_CAN_RETURN_NULL
static void* gc_inf_allocate_fixed_size_storage(PARROT_INTERP, size_t size);

PARROT_MALLOC
PARROT_CAN_RETURN_NULL
static void * gc_inf_allocate_memory_chunk(PARROT_INTERP, size_t size);

PARROT_MALLOC
PARROT_CAN_RETURN_NULL
static void * gc_inf_allocate_memory_chunk_zeroed(PARROT_INTERP,
    size_t size);

PARROT_MALLOC
PARROT_CAN_RETURN_NULL
static void* gc_inf_allocate_pmc_attributes(PARROT_INTERP, ARGMOD(PMC *pmc))
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*pmc);

PARROT_MALLOC
PARROT_CAN_RETURN_NULL
static PMC* gc_inf_allocate_pmc_header(PARROT_INTERP, UINTVAL flags);

PARROT_MALLOC
PARROT_CAN_RETURN_NULL
static STRING* gc_inf_allocate_string_header(PARROT_INTERP, UINTVAL flags);

static void gc_inf_allocate_string_storage(PARROT_INTERP,
    ARGMOD(STRING *str),
    size_t size)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*str);

static void gc_inf_compact_memory_pool(PARROT_INTERP);
static void gc_inf_free_bufferlike_header(PARROT_INTERP,
    ARGFREE(Buffer *b),
    size_t size);

static void gc_inf_free_fixed_size_storage(PARROT_INTERP,
    size_t size,
    ARGFREE(void *data));

static void gc_inf_free_memory_chunk(PARROT_INTERP, ARGFREE(void *data));
static void gc_inf_free_pmc_attributes(PARROT_INTERP, ARGMOD(PMC *pmc))
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*pmc);

static void gc_inf_free_pmc_header(PARROT_INTERP, ARGFREE(PMC *pmc));
static void gc_inf_free_string_header(PARROT_INTERP, ARGFREE(STRING *s));
PARROT_WARN_UNUSED_RESULT
static size_t gc_inf_get_gc_info(PARROT_INTERP, Interpinfo_enum what);

static void gc_inf_mark_and_sweep(PARROT_INTERP, UINTVAL flags);
static void gc_inf_reallocate_buffer_storage(PARROT_INTERP,
    ARGMOD(Buffer *buffer),
    size_t size)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*buffer);

PARROT_MALLOC
PARROT_CAN_RETURN_NULL
static void * gc_inf_reallocate_memory_chunk(PARROT_INTERP,
    ARGFREE(void *from),
    size_t size);

PARROT_MALLOC
PARROT_CANNOT_RETURN_NULL
static void * gc_inf_reallocate_memory_chunk_zeroed(PARROT_INTERP,
    ARGFREE(void *data),
    size_t newsize,
    size_t oldsize);

static void gc_inf_reallocate_string_storage(PARROT_INTERP,
    ARGMOD(STRING *str),
    size_t size)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*str);

#define ASSERT_ARGS_failed_allocation __attribute__unused__ int _ASSERT_ARGS_CHECK = (0)
#define ASSERT_ARGS_gc_inf_allocate_buffer_storage \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(buffer))
#define ASSERT_ARGS_gc_inf_allocate_bufferlike_header \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = (0)
#define ASSERT_ARGS_gc_inf_allocate_fixed_size_storage \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = (0)
#define ASSERT_ARGS_gc_inf_allocate_memory_chunk __attribute__unused__ int _ASSERT_ARGS_CHECK = (0)
#define ASSERT_ARGS_gc_inf_allocate_memory_chunk_zeroed \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = (0)
#define ASSERT_ARGS_gc_inf_allocate_pmc_attributes \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(pmc))
#define ASSERT_ARGS_gc_inf_allocate_pmc_header __attribute__unused__ int _ASSERT_ARGS_CHECK = (0)
#define ASSERT_ARGS_gc_inf_allocate_string_header __attribute__unused__ int _ASSERT_ARGS_CHECK = (0)
#define ASSERT_ARGS_gc_inf_allocate_string_storage \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(str))
#define ASSERT_ARGS_gc_inf_compact_memory_pool __attribute__unused__ int _ASSERT_ARGS_CHECK = (0)
#define ASSERT_ARGS_gc_inf_free_bufferlike_header __attribute__unused__ int _ASSERT_ARGS_CHECK = (0)
#define ASSERT_ARGS_gc_inf_free_fixed_size_storage \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = (0)
#define ASSERT_ARGS_gc_inf_free_memory_chunk __attribute__unused__ int _ASSERT_ARGS_CHECK = (0)
#define ASSERT_ARGS_gc_inf_free_pmc_attributes __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(pmc))
#define ASSERT_ARGS_gc_inf_free_pmc_header __attribute__unused__ int _ASSERT_ARGS_CHECK = (0)
#define ASSERT_ARGS_gc_inf_free_string_header __attribute__unused__ int _ASSERT_ARGS_CHECK = (0)
#define ASSERT_ARGS_gc_inf_get_gc_info __attribute__unused__ int _ASSERT_ARGS_CHECK = (0)
#define ASSERT_ARGS_gc_inf_mark_and_sweep __attribute__unused__ int _ASSERT_ARGS_CHECK = (0)
#define ASSERT_ARGS_gc_inf_reallocate_buffer_storage \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(buffer))
#define ASSERT_ARGS_gc_inf_reallocate_memory_chunk \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = (0)
#define ASSERT_ARGS_gc_inf_reallocate_memory_chunk_zeroed \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = (0)
#define ASSERT_ARGS_gc_inf_reallocate_string_storage \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(str))
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: static */

/*

=head1 Functions

=over 4

=item C<static void gc_inf_mark_and_sweep(PARROT_INTERP, UINTVAL flags)>

This function would perform a GC run, if we needed to. Luckily we have
infinite memory!

This function is called from the GC API function C<Parrot_gc_mark_and_sweep>.

Flags can be a combination of these values:

  GC_finish_FLAG
  GC_lazy_FLAG
  GC_trace_stack_FLAG

=cut

*/

static void
gc_inf_mark_and_sweep(SHIM_INTERP, UINTVAL flags)
{
    ASSERT_ARGS(gc_inf_mark_and_sweep)
    UNUSED(flags);
}

/*

=item C<static void gc_inf_compact_memory_pool(PARROT_INTERP)>

Stub for compacting memory pools.

=cut

*/
static void
gc_inf_compact_memory_pool(SHIM_INTERP)
{
    ASSERT_ARGS(gc_inf_compact_memory_pool)
}

/*

=item C<static PMC* gc_inf_allocate_pmc_header(PARROT_INTERP, UINTVAL flags)>

=item C<static void gc_inf_free_pmc_header(PARROT_INTERP, PMC *pmc)>

=item C<static STRING* gc_inf_allocate_string_header(PARROT_INTERP, UINTVAL
flags)>

=item C<static void gc_inf_free_string_header(PARROT_INTERP, STRING *s)>

=item C<static Buffer* gc_inf_allocate_bufferlike_header(PARROT_INTERP, size_t
size)>

=item C<static void gc_inf_free_bufferlike_header(PARROT_INTERP, Buffer *b,
size_t size)>

=item C<static void* gc_inf_allocate_pmc_attributes(PARROT_INTERP, PMC *pmc)>

=item C<static void gc_inf_free_pmc_attributes(PARROT_INTERP, PMC *pmc)>

=item C<static void gc_inf_allocate_string_storage(PARROT_INTERP, STRING *str,
size_t size)>

=item C<static void gc_inf_reallocate_string_storage(PARROT_INTERP, STRING *str,
size_t size)>

=item C<static void gc_inf_allocate_buffer_storage(PARROT_INTERP, Buffer
*buffer, size_t size)>

=item C<static void gc_inf_reallocate_buffer_storage(PARROT_INTERP, Buffer
*buffer, size_t size)>

=item C<static void* gc_inf_allocate_fixed_size_storage(PARROT_INTERP, size_t
size)>

=item C<static void gc_inf_free_fixed_size_storage(PARROT_INTERP, size_t size,
void *data)>

Functions for allocating/deallocating various objects.

*/

PARROT_MALLOC
PARROT_CAN_RETURN_NULL
static PMC*
gc_inf_allocate_pmc_header(SHIM_INTERP, SHIM(UINTVAL flags))
{
    ASSERT_ARGS(gc_inf_allocate_pmc_header)
    return (PMC*)calloc(sizeof (PMC), 1);
}

static void
gc_inf_free_pmc_header(SHIM_INTERP, ARGFREE(PMC *pmc))
{
    ASSERT_ARGS(gc_inf_free_pmc_header)
    if (pmc)
        free(pmc);
}

PARROT_MALLOC
PARROT_CAN_RETURN_NULL
static STRING*
gc_inf_allocate_string_header(SHIM_INTERP, SHIM(UINTVAL flags))
{
    ASSERT_ARGS(gc_inf_allocate_string_header)
    return (STRING*)calloc(sizeof (STRING), 1);
}

static void
gc_inf_free_string_header(SHIM_INTERP, ARGFREE(STRING *s))
{
    ASSERT_ARGS(gc_inf_free_string_header)
    if (s)
        free(s);
}

PARROT_MALLOC
PARROT_CAN_RETURN_NULL
static Buffer*
gc_inf_allocate_bufferlike_header(SHIM_INTERP, SHIM(size_t size))
{
    ASSERT_ARGS(gc_inf_allocate_bufferlike_header)
    return (Buffer*)calloc(sizeof (Buffer), 1);
}

static void
gc_inf_free_bufferlike_header(SHIM_INTERP, ARGFREE(Buffer *b), SHIM(size_t size))
{
    ASSERT_ARGS(gc_inf_free_bufferlike_header)
    if (b)
        free(b);
}

PARROT_MALLOC
PARROT_CAN_RETURN_NULL
static void*
gc_inf_allocate_pmc_attributes(SHIM_INTERP, ARGMOD(PMC *pmc))
{
    ASSERT_ARGS(gc_inf_allocate_pmc_attributes)
    const size_t attr_size = pmc->vtable->attr_size;
    PMC_data(pmc) = calloc(attr_size, 1);
    return PMC_data(pmc);
}

static void
gc_inf_free_pmc_attributes(SHIM_INTERP, ARGMOD(PMC *pmc))
{
    ASSERT_ARGS(gc_inf_free_pmc_attributes)
    if (PMC_data(pmc))
        free(PMC_data(pmc));
}


static void
gc_inf_allocate_string_storage(SHIM_INTERP, ARGMOD(STRING *str), size_t size)
{
    ASSERT_ARGS(gc_inf_allocate_string_storage)

    Buffer_buflen(str)   = size;

    if (size > 0) {
        char * const mem = (char *)mem_internal_allocate(size);

        Buffer_bufstart(str) = str->strstart = mem;
    }
    else {
        Buffer_bufstart(str) = NULL;
    }
}

static void
gc_inf_reallocate_string_storage(SHIM_INTERP, ARGMOD(STRING *str), size_t size)
{
    ASSERT_ARGS(gc_inf_reallocate_string_storage)
    char * const mem     = (char *)mem_internal_realloc(Buffer_bufstart(str), size);

    Buffer_bufstart(str) = str->strstart = mem;
    Buffer_buflen(str)   = size;
}


static void
gc_inf_allocate_buffer_storage(SHIM_INTERP, ARGMOD(Buffer *buffer), size_t size)
{
    ASSERT_ARGS(gc_inf_allocate_buffer_storage)
    char *mem;

    Buffer_buflen(buffer)   = 0;
    Buffer_bufstart(buffer) = NULL;

    if (size == 0)
        return;

    mem      = (char *)mem_internal_allocate(size);

    Buffer_bufstart(buffer) = mem;
    Buffer_buflen(buffer)   = size;
}

static void
gc_inf_reallocate_buffer_storage(SHIM_INTERP, ARGMOD(Buffer *buffer), size_t size)
{
    ASSERT_ARGS(gc_inf_reallocate_buffer_storage)
    char * const mem = (char *)mem_internal_realloc(Buffer_bufstart(buffer), size);

    Buffer_bufstart(buffer) = mem;
    Buffer_buflen(buffer)   = size;
}

PARROT_CAN_RETURN_NULL
static void*
gc_inf_allocate_fixed_size_storage(SHIM_INTERP, size_t size)
{
    ASSERT_ARGS(gc_inf_allocate_fixed_size_storage)
    return calloc(size, 1);
}

static void
gc_inf_free_fixed_size_storage(SHIM_INTERP, SHIM(size_t size), ARGFREE(void *data))
{
    ASSERT_ARGS(gc_inf_free_fixed_size_storage)

    mem_internal_free(data);
}

/*

=item C<static size_t gc_inf_get_gc_info(PARROT_INTERP, Interpinfo_enum what)>

Stub for GC introspection function.

=cut

*/

PARROT_WARN_UNUSED_RESULT
static size_t
gc_inf_get_gc_info(SHIM_INTERP, SHIM(Interpinfo_enum what))
{
    ASSERT_ARGS(gc_inf_get_gc_info)
    return 0;
}


/*

=item C<void Parrot_gc_inf_init(PARROT_INTERP, Parrot_GC_Init_Args *args)>

Initializes the infinite memory collector. Installs the necessary function
pointers into the Memory_Pools structure. The two most important are the
C<mark_and_sweep> and C<pool_init> functions. C<finalize_gc_system> function
will be called at Parrot exit and will shut down the GC system if things
need to be flushed/closed/deactivated/freed/etc. It can be set to NULL if no
finalization is necessary.

=cut

*/

void
Parrot_gc_inf_init(PARROT_INTERP, SHIM(Parrot_GC_Init_Args *args))
{
    ASSERT_ARGS(Parrot_gc_inf_init)

    interp->gc_sys->do_gc_mark         = gc_inf_mark_and_sweep;
    interp->gc_sys->finalize_gc_system = NULL;

    interp->gc_sys->do_gc_mark              = gc_inf_mark_and_sweep;
    interp->gc_sys->compact_string_pool     = gc_inf_compact_memory_pool;

    /*
    interp->gc_sys->mark_special                = gc_inf_mark_special;
    interp->gc_sys->pmc_needs_early_collection  = gc_inf_pmc_needs_early_collection;
    */

    interp->gc_sys->allocate_pmc_header     = gc_inf_allocate_pmc_header;
    interp->gc_sys->free_pmc_header         = gc_inf_free_pmc_header;

    interp->gc_sys->allocate_string_header  = gc_inf_allocate_string_header;
    interp->gc_sys->free_string_header      = gc_inf_free_string_header;

    interp->gc_sys->allocate_bufferlike_header  = gc_inf_allocate_bufferlike_header;
    interp->gc_sys->free_bufferlike_header      = gc_inf_free_bufferlike_header;

    interp->gc_sys->allocate_pmc_attributes = gc_inf_allocate_pmc_attributes;
    interp->gc_sys->free_pmc_attributes     = gc_inf_free_pmc_attributes;

    interp->gc_sys->allocate_string_storage = gc_inf_allocate_string_storage;
    interp->gc_sys->reallocate_string_storage = gc_inf_reallocate_string_storage;

    interp->gc_sys->allocate_buffer_storage = gc_inf_allocate_buffer_storage;
    interp->gc_sys->reallocate_buffer_storage = gc_inf_reallocate_buffer_storage;

    interp->gc_sys->allocate_fixed_size_storage = gc_inf_allocate_fixed_size_storage;
    interp->gc_sys->free_fixed_size_storage     = gc_inf_free_fixed_size_storage;

    /* We don't distinguish between chunk and chunk_with_pointers */
    interp->gc_sys->allocate_memory_chunk   = gc_inf_allocate_memory_chunk;
    interp->gc_sys->reallocate_memory_chunk = gc_inf_reallocate_memory_chunk;
    interp->gc_sys->allocate_memory_chunk_with_interior_pointers
                = gc_inf_allocate_memory_chunk_zeroed;
    interp->gc_sys->reallocate_memory_chunk_with_interior_pointers
                = gc_inf_reallocate_memory_chunk_zeroed;
    interp->gc_sys->free_memory_chunk       = gc_inf_free_memory_chunk;

    interp->gc_sys->get_gc_info      = gc_inf_get_gc_info;

}

/*

=item C<static void * gc_inf_allocate_memory_chunk(PARROT_INTERP, size_t size)>

=item C<static void * gc_inf_reallocate_memory_chunk(PARROT_INTERP, void *from,
size_t size)>

=item C<static void * gc_inf_allocate_memory_chunk_zeroed(PARROT_INTERP, size_t
size)>

=item C<static void * gc_inf_reallocate_memory_chunk_zeroed(PARROT_INTERP, void
*data, size_t newsize, size_t oldsize)>

=item C<static void gc_inf_free_memory_chunk(PARROT_INTERP, void *data)>

=item C<static void failed_allocation(unsigned int line, unsigned long size)>

TODO Write docu.

*/

PARROT_MALLOC
PARROT_CAN_RETURN_NULL
static void *
gc_inf_allocate_memory_chunk(SHIM_INTERP, size_t size)
{
    ASSERT_ARGS(gc_inf_allocate_memory_chunk)
    void * const ptr = malloc(size);
#ifdef DETAIL_MEMORY_DEBUG
    fprintf(stderr, "Allocated %i at %p\n", size, ptr);
#endif
    if (!ptr && size)
        PANIC_OUT_OF_MEM(size);
    return ptr;
}

PARROT_MALLOC
PARROT_CAN_RETURN_NULL
static void *
gc_inf_reallocate_memory_chunk(SHIM_INTERP, ARGFREE(void *from), size_t size)
{
    ASSERT_ARGS(gc_inf_reallocate_memory_chunk)
    void *ptr;
#ifdef DETAIL_MEMORY_DEBUG
    fprintf(stderr, "Freed %p (realloc -- %i bytes)\n", from, size);
#endif
    if (from)
        ptr = realloc(from, size);
    else
        ptr = calloc(1, size);
#ifdef DETAIL_MEMORY_DEBUG
    fprintf(stderr, "Allocated %i at %p\n", size, ptr);
#endif
    if (!ptr && size)
        PANIC_OUT_OF_MEM(size);
    return ptr;
}

PARROT_MALLOC
PARROT_CAN_RETURN_NULL
static void *
gc_inf_allocate_memory_chunk_zeroed(SHIM_INTERP, size_t size)
{
    ASSERT_ARGS(gc_inf_allocate_memory_chunk_zeroed)
    void * const ptr = calloc(1, (size_t)size);
#ifdef DETAIL_MEMORY_DEBUG
    fprintf(stderr, "Allocated %i at %p\n", size, ptr);
#endif
    if (!ptr && size)
        PANIC_OUT_OF_MEM(size);
    return ptr;
}

PARROT_MALLOC
PARROT_CANNOT_RETURN_NULL
static void *
gc_inf_reallocate_memory_chunk_zeroed(SHIM_INTERP, ARGFREE(void *data),
        size_t newsize, size_t oldsize)
{
    ASSERT_ARGS(gc_inf_reallocate_memory_chunk_zeroed)
    void * const ptr = realloc(data, newsize);
    if (newsize > oldsize)
        memset((char*)ptr + oldsize, 0, newsize - oldsize);
    return ptr;
}

static void
gc_inf_free_memory_chunk(SHIM_INTERP, ARGFREE(void *data))
{
    ASSERT_ARGS(gc_inf_free_memory_chunk)
#ifdef DETAIL_MEMORY_DEBUG
    fprintf(stderr, "Freed %p\n", data);
#endif
    if (data)
        free(data);
}

PARROT_DOES_NOT_RETURN
static void
failed_allocation(unsigned int line, unsigned long size)
{
    ASSERT_ARGS(failed_allocation)
    fprintf(stderr, "Failed allocation of %lu bytes\n", size);
    do_panic(NULL, "Out of mem", __FILE__, line);
}



/*

=back

=cut

*/

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4 cinoptions='\:2=2' :
 */
