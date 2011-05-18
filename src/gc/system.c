/*
Copyright (C) 2001-2010, Parrot Foundation.

=head1 NAME

src/gc/system.c - CPU-dependent mark/sweep functions

=head1 DESCRIPTION

These functions setup a trace of the current processor context and the
system stack. The trace is set up here in C<trace_system_areas>. This
function gets the current processor context and either traces it
directly or stores it on the system stack. C<trace_system_stack>
sets up a trace of the system stack using two marker addresses as
boundaries. The code to actually perform the trace of a memory block
between two boundaries is located in C<src/gc/api.c:trace_mem_block>.

TT #273: This file needs to be cleaned up significantly.

=head2 Functions

=over 4

=cut

*/

#include "parrot/parrot.h"
#include "gc_private.h"

/* HEADERIZER HFILE: src/gc/gc_private.h */

/* HEADERIZER BEGIN: static */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

PARROT_CONST_FUNCTION
static size_t find_common_mask(PARROT_INTERP, size_t val1, size_t val2)
        __attribute__nonnull__(1);

PARROT_WARN_UNUSED_RESULT
static size_t get_max_buffer_address(PARROT_INTERP,
    ARGIN_NULLOK(const Memory_Pools *mem_pools))
        __attribute__nonnull__(1);

PARROT_WARN_UNUSED_RESULT
static size_t get_max_pmc_address(PARROT_INTERP,
    ARGIN_NULLOK(const Memory_Pools *mem_pools))
        __attribute__nonnull__(1);

PARROT_WARN_UNUSED_RESULT
static size_t get_min_buffer_address(PARROT_INTERP,
    ARGIN_NULLOK(const Memory_Pools *mem_pools))
        __attribute__nonnull__(1);

PARROT_WARN_UNUSED_RESULT
static size_t get_min_pmc_address(PARROT_INTERP,
    ARGIN_NULLOK(const Memory_Pools *mem_pools))
        __attribute__nonnull__(1);

PARROT_WARN_UNUSED_RESULT
static int is_buffer_ptr(
    ARGIN_NULLOK(const Memory_Pools *mem_pools),
    ARGIN(const void *ptr))
        __attribute__nonnull__(2);

PARROT_WARN_UNUSED_RESULT
static int is_pmc_ptr(
    ARGIN(const Memory_Pools *mem_pools),
    ARGIN(const void *ptr))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

static void trace_mem_block(PARROT_INTERP,
    ARGIN_NULLOK(const Memory_Pools *mem_pools),
    size_t lo_var_ptr,
    size_t hi_var_ptr)
        __attribute__nonnull__(1);

PARROT_NOINLINE
static void trace_system_stack(PARROT_INTERP,
    ARGIN_NULLOK(const Memory_Pools *mem_pools))
        __attribute__nonnull__(1);

#define ASSERT_ARGS_find_common_mask __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_get_max_buffer_address __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_get_max_pmc_address __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_get_min_buffer_address __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_get_min_pmc_address __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_is_buffer_ptr __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(ptr))
#define ASSERT_ARGS_is_pmc_ptr __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(mem_pools) \
    , PARROT_ASSERT_ARG(ptr))
#define ASSERT_ARGS_trace_mem_block __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_trace_system_stack __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: static */

/*

=item C<void trace_system_areas(PARROT_INTERP, const Memory_Pools *mem_pools)>

Initiates a trace of the system stack, looking for pointers which are being
used by functions in the call chain, but which might not be marked as alive
in any other way. Setting the trace up, which involves storing the processor
context onto the stack, is highly system dependent. However, once stored,
tracing the stack is very straightforward.

=cut

*/

void
trace_system_areas(PARROT_INTERP, ARGIN_NULLOK(const Memory_Pools *mem_pools))
{
    ASSERT_ARGS(trace_system_areas)
    {
#if defined(__sparc)
        /* Flush the register windows. For sparc systems, we use hand-coded
           assembly language to create a small function that flushes the
           register windows. Store the code in a union with a double to
           ensure proper memory alignment. */
        /* TT #271: This needs to be fixed in a variety of ways */
/* Using inline assember if available instead of the hand-coded version. */
#  if defined(__GNUC__) && (defined(__sparcv9) || defined(__sparcv9__) || defined(__arch64__))
        asm("flushw");
#  else
        static union {
            unsigned int insns[4];
            double align_hack[2];
        } u = { {
#    if defined(__sparcv9) || defined(__sparcv9__) || defined(__arch64__)

                            0x81580000, /* flushw */
#    else
                            0x91d02003, /* ta ST_FLUSH_WINDOWS */
#    endif
                            0x81c3e008, /* retl */
                            0x01000000  /* nop */
        } };

        /* Turn the array of machine code values above into a function pointer.
           Call the new function pointer to flush the register windows. */
        static void (*fn_ptr)(void) = (void (*)(void))&u.align_hack[0];
        fn_ptr();
#  endif

#elif defined(__ia64__)


#  if defined(__hpux)
        ucontext_t ucp;
        void *current_regstore_top;

        getcontext(&ucp);
        _Asm_flushrs();

#    if defined(_LP64)
        current_regstore_top = (void*)(uint64_t)_Asm_mov_from_ar(_AREG_BSP);
#    else
        current_regstore_top = (void*)(uint32_t)_Asm_mov_from_ar(_AREG_BSP);
#    endif

        size_t base = 0;
        struct pst_vm_status buf;
        int i = 0;

        while (pstat_getprocvm(&buf, sizeof (buf), 0, i++) == 1) {
            if (buf.pst_type == PS_RSESTACK) {
                base = (size_t)buf.pst_vaddr;
                break;
            }
        }

#  else /* !__hpux */
        /* On IA64 Linux systems, we use the function getcontext() to get the
           current processor context. This function is located in <ucontext.h>,
           included above. */
        struct ucontext ucp;
        void *current_regstore_top;

        /* Trace the memory block for the register backing stack, which
           is separate from the normal system stack. The register backing
           stack starts at memory address 0x80000FFF80000000 and ends at
           current_regstore_top. */
        size_t base = 0x80000fff80000000;

        getcontext(&ucp);

        /* flush_reg_store() is defined in config/gen/platforms/ia64/asm.s.
           it calls the flushrs opcode to perform the register flush, and
           returns the address of the register backing stack. */
        current_regstore_top = flush_reg_store();

#  endif /* __hpux */

        trace_mem_block(interp, mem_pools, base,
                (size_t)current_regstore_top);

#else /* !__ia64__ */

#  ifdef PARROT_HAS_HEADER_SETJMP
        /* A jump buffer that is used to store the current processor context.
           local variables like this are created on the stack. */
        Parrot_jump_buff env;

        /* Zero the Parrot_jump_buff, otherwise you will trace stale objects.
           Plus, optimizing compilers won't be so quick to optimize the data
           away if we're passing pointers around. */
        memset(&env, 0, sizeof (env));

        /* this should put registers in env, which then get marked in
         * trace_system_stack below
         */
        setjmp(env);
#  endif

#endif /* __ia64__ */
    }

    /* With the processor context accounted for above, we can trace the
       system stack here. */
    trace_system_stack(interp, mem_pools);
}

/*

=item C<static void trace_system_stack(PARROT_INTERP, const Memory_Pools
*mem_pools)>

Traces the memory block starting at C<< interp->lo_var_ptr >>. This should be
the address of a local variable which has been created on the stack early in
the interpreter's lifecycle. We trace until the address of another local stack
variable in this function, which should be at the "top" of the stack. For this
reason, this function must never be inlined.

=cut

*/

PARROT_NOINLINE
static void
trace_system_stack(PARROT_INTERP, ARGIN_NULLOK(const Memory_Pools *mem_pools))
{
    ASSERT_ARGS(trace_system_stack)
    /* Create a local variable on the system stack. This represents the
       "top" of the stack. A value stored in interp->lo_var_ptr represents
       the "bottom" of the stack. We must trace the entire area between the
       top and bottom. */
    const size_t lo_var_ptr = (size_t)interp->lo_var_ptr;
    PARROT_ASSERT(lo_var_ptr);

    trace_mem_block(interp, mem_pools, (size_t)lo_var_ptr,
            (size_t)&lo_var_ptr);
}

/*

=item C<static size_t get_max_buffer_address(PARROT_INTERP, const Memory_Pools
*mem_pools)>

Calculates the maximum buffer address and returns it. This is done by looping
through all the sized pools, and finding the pool whose C<end_arena_memory>
field is the highest. Notice that arenas in each pool are not necessarily
located directly next to each other in memory, and the last arena in the pool's
list may not be located at the highest memory address.

=cut

*/

PARROT_WARN_UNUSED_RESULT
static size_t
get_max_buffer_address(PARROT_INTERP, ARGIN_NULLOK(const Memory_Pools *mem_pools))
{
    ASSERT_ARGS(get_max_buffer_address)
    size_t         max        = 0;
    UINTVAL        i;

    if (interp->gc_sys->get_high_str_ptr)
        return (size_t)interp->gc_sys->get_high_str_ptr(interp);

    if (!mem_pools)
        return -1;

    /* FIXME Remove this code. And Memory_Pools. And old GC MS. */
    for (i = 0; i < mem_pools->num_sized; ++i) {
        if (mem_pools->sized_header_pools[i]) {
            if (mem_pools->sized_header_pools[i]->end_arena_memory > max)
                max = mem_pools->sized_header_pools[i]->end_arena_memory;
        }
    }

    return max;
}


/*

=item C<static size_t get_min_buffer_address(PARROT_INTERP, const Memory_Pools
*mem_pools)>

Calculates the minimum buffer address and returns it. Loops through all sized
pools, and finds the one with the smallest C<start_arena_memory> field. Notice
that the memory region between C<get_min_buffer_address> and
C<get_max_buffer_address> may be fragmented, and parts of it may not be
available for Parrot to use directly (such as bookkeeping data for the OS
memory manager).

=cut

*/

PARROT_WARN_UNUSED_RESULT
static size_t
get_min_buffer_address(PARROT_INTERP, ARGIN_NULLOK(const Memory_Pools *mem_pools))
{
    ASSERT_ARGS(get_min_buffer_address)
    size_t         min        = (size_t) 0;
    UINTVAL        i;

    if (interp->gc_sys->get_low_str_ptr)
        return (size_t)interp->gc_sys->get_low_str_ptr(interp);

    if (!mem_pools)
        return 0;

    for (i = 0; i < mem_pools->num_sized; ++i) {
        const Fixed_Size_Pool * const pool = mem_pools->sized_header_pools[i];
        if (pool && pool->start_arena_memory) {
            if (pool->start_arena_memory < min)
                min = pool->start_arena_memory;
        }
    }

    return min;
}


/*

=item C<static size_t get_max_pmc_address(PARROT_INTERP, const Memory_Pools
*mem_pools)>

Returns the maximum memory address used by the C<pmc_pool>.

=cut

*/

PARROT_WARN_UNUSED_RESULT
static size_t
get_max_pmc_address(PARROT_INTERP, ARGIN_NULLOK(const Memory_Pools *mem_pools))
{
    ASSERT_ARGS(get_max_pmc_address)

    if (interp->gc_sys->get_high_pmc_ptr)
        return (size_t)interp->gc_sys->get_high_pmc_ptr(interp);

    return mem_pools
            ? mem_pools->pmc_pool->end_arena_memory
            : (size_t)-1;
}


/*

=item C<static size_t get_min_pmc_address(PARROT_INTERP, const Memory_Pools
*mem_pools)>

Returns the minimum memory address used by the C<pmc_pool>. Notice that the
memory region between C<get_min_pmc_address> and C<get_max_pmc_address> may be
fragmented, and not all of it may be used directly by Parrot for storing PMCs.

=cut

*/

PARROT_WARN_UNUSED_RESULT
static size_t
get_min_pmc_address(PARROT_INTERP, ARGIN_NULLOK(const Memory_Pools *mem_pools))
{
    ASSERT_ARGS(get_min_pmc_address)

    if (interp->gc_sys->get_low_pmc_ptr)
        return (size_t)interp->gc_sys->get_low_pmc_ptr(interp);

    return mem_pools
           ? mem_pools->pmc_pool->start_arena_memory
           : 0;
}


#ifndef PLATFORM_STACK_WALK

/*

=item C<static size_t find_common_mask(PARROT_INTERP, size_t val1, size_t val2)>

Finds a mask covering the longest common bit-prefix of C<val1>
and C<val2>.

=cut

*/

PARROT_CONST_FUNCTION
static size_t
find_common_mask(PARROT_INTERP, size_t val1, size_t val2)
{
    ASSERT_ARGS(find_common_mask)
    int       i;
    const int bound = sizeof (size_t) * 8;

    /* Shifting a value by its size (in bits) or larger is undefined behaviour.
       So need an explicit check to return 0 if there is no prefix, rather than
       attempting to rely on (say) 0xFFFFFFFF << 32 being 0.  */
    for (i = 0; i < bound; ++i) {
        if (val1 == val2)
            return ~(size_t)0 << i;

        val1 >>= 1;
        val2 >>= 1;
    }

    if (val1 == val2) {
        PARROT_ASSERT(i == bound);
        return 0;
    }

    Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_INTERP_ERROR,
            "Unexpected condition in find_common_mask()!\n");
}

/*

=item C<static void trace_mem_block(PARROT_INTERP, const Memory_Pools
*mem_pools, size_t lo_var_ptr, size_t hi_var_ptr)>

Traces the memory block between C<lo_var_ptr> and C<hi_var_ptr>.
Attempt to find pointers to PObjs or buffers, and mark them as "alive"
if found. See src/cpu_dep.c for more information about tracing memory
areas.

=cut

*/

static void
trace_mem_block(PARROT_INTERP,
        ARGIN_NULLOK(const Memory_Pools *mem_pools),
        size_t lo_var_ptr, size_t hi_var_ptr)
{
    ASSERT_ARGS(trace_mem_block)
    size_t    prefix;
    ptrdiff_t cur_var_ptr;

    const size_t buffer_min = get_min_buffer_address(interp, mem_pools);
    const size_t buffer_max = get_max_buffer_address(interp, mem_pools);
    const size_t pmc_min    = get_min_pmc_address(interp, mem_pools);
    const size_t pmc_max    = get_max_pmc_address(interp, mem_pools);

    const size_t mask       =
        find_common_mask(interp,
                         buffer_min < pmc_min ? buffer_min : pmc_min,
                         buffer_max > pmc_max ? buffer_max : pmc_max);

    if (!lo_var_ptr || !hi_var_ptr)
        return;

    if (lo_var_ptr < hi_var_ptr) {
        const size_t tmp_ptr = hi_var_ptr;
        hi_var_ptr           = lo_var_ptr;
        lo_var_ptr           = tmp_ptr;
    }

    /* Get the expected prefix */
    prefix = mem_pools
                ? mask & buffer_min
                : 0;

    for (cur_var_ptr = hi_var_ptr;
        (ptrdiff_t)cur_var_ptr < (ptrdiff_t)lo_var_ptr;
        cur_var_ptr = (size_t)((ptrdiff_t)cur_var_ptr + sizeof (void *))) {
        const size_t ptr = *(size_t *)cur_var_ptr;

        if (!ptr)
            continue;

        /* Do a quick approximate range check by bit-masking */
        if ((ptr & mask) == prefix || !prefix) {
            /* Note that what we find via the stack or registers are not
             * guaranteed to be live pmcs/buffers, and could very well have
             * had their bufstart/vtable destroyed due to the linked list of
             * free headers... */
            if ((pmc_min <= ptr)
            &&  (ptr < pmc_max)
            &&  interp->gc_sys->is_pmc_ptr(interp, (void *)ptr)) {
                Parrot_gc_mark_PMC_alive(interp, (PMC *)ptr);
            }
            else if ((buffer_min <= ptr) && (ptr < buffer_max)
            &&        interp->gc_sys->is_string_ptr(interp, (void *)ptr)) {
                if (PObj_is_string_TEST((PObj *)ptr))
                    Parrot_gc_mark_STRING_alive(interp, (STRING *)ptr);
                else
                    PObj_live_SET((PObj *)ptr);
            }
        }
    }

    return;
}

/*

=item C<static int is_buffer_ptr(const Memory_Pools *mem_pools, const void
*ptr)>

Checks whether the given C<ptr> is located within one of the sized
header pools. Returns C<1> if it is, and C<0> if not.

=cut

*/

PARROT_WARN_UNUSED_RESULT
static int
is_buffer_ptr(ARGIN_NULLOK(const Memory_Pools *mem_pools), ARGIN(const void *ptr))
{
    ASSERT_ARGS(is_buffer_ptr)
    UINTVAL        i;

    if (!mem_pools)
        return 0;

    for (i = 0; i < mem_pools->num_sized; ++i) {
        if (mem_pools->sized_header_pools[i]
            &&  contained_in_pool(mem_pools->sized_header_pools[i], ptr))
            return 1;
    }

    return 0;
}

/*

=item C<static int is_pmc_ptr(const Memory_Pools *mem_pools, const void *ptr)>

Checks that C<ptr> is actually a PMC pointer. Returns C<1> if it is, C<0>
otherwise.

=cut

*/

PARROT_WARN_UNUSED_RESULT
static int
is_pmc_ptr(ARGIN(const Memory_Pools *mem_pools), ARGIN(const void *ptr))
{
    ASSERT_ARGS(is_pmc_ptr)
    return contained_in_pool(mem_pools->pmc_pool, ptr)
           && PObj_is_PMC_TEST((const PObj *)ptr);
}


#endif

/*

=back

=head1 SEE ALSO

F<src/gc/api.c> and F<include/parrot/gc_api.h>.

=cut

*/


/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4 cinoptions='\:2=2' :
 */
