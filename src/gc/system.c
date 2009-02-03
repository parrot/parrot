/*
Copyright (C) 2001-2008, The Perl Foundation.
$Id$

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

=head2 Functions

=over 4

=cut

*/

#include "parrot/parrot.h"
#include "gc_private.h"

/* HEADERIZER HFILE: src/gc/gc_private.h */

/* HEADERIZER BEGIN: static */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

static void trace_system_stack(PARROT_INTERP)
        __attribute__nonnull__(1);

#define ASSERT_ARGS_trace_system_stack __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp)
#define ASSERT_ARGS_find_common_mask __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp)
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: static */

/*

=item C<void trace_system_areas>

Initiates a trace of the system stack, looking for pointers which are being
used by functions in the call chain, but which might not be marked as alive
in any other way. Setting the trace up, which involves storing the processor
context onto the stack, is highly system dependent. However, once stored,
tracing the stack is very straightforward.

=cut

*/

void
trace_system_areas(PARROT_INTERP)
{
    ASSERT_ARGS(trace_system_areas)
    {
#if defined(__sparc)
        /* Flush the register windows. For sparc systems, we use hand-coded
           assembly language to create a small function that flushes the
           register windows. Store the code in a union with a double to
           ensure proper memory alignment. */
        static union {
            unsigned int insns[4];
            double align_hack[2];
        } u = { {
#  ifdef __sparcv9
                            0x81580000, /* flushw */
#  else
                            0x91d02003, /* ta ST_FLUSH_WINDOWS */
#  endif
                            0x81c3e008, /* retl */
                            0x01000000  /* nop */
        } };

        /* Turn the array of machine code values above into a function pointer.
           Call the new function pointer to flush the register windows. */
        static void (*fn_ptr)(void) = (void (*)(void))&u.align_hack[0];
        fn_ptr();

#elif defined(__ia64__)

        /* On IA64 systems, we use the function getcontext() to get the current
           processor context. This function is located in <ucontext.h>, included
           above. */
        struct ucontext ucp;
        void *current_regstore_top;

        getcontext(&ucp);

        /* flush_reg_store() is defined in config/gen/platforms/ia64/asm.s.
           it calls the flushrs opcode to perform the register flush, and
           returns the address of the register backing stack. */
        current_regstore_top = flush_reg_store();

        /* Trace the memory block for the register backing stack, which
           is separate from the normal system stack. The register backing
           stack starts at memory address 0x80000FFF80000000 and ends at
           current_regstore_top. */
        trace_mem_block(interp, 0x80000fff80000000,
                (size_t)current_regstore_top);
#else

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

#endif
    }

    /* With the processor context accounted for above, we can trace the
       system stack here. */
    trace_system_stack(interp);
}

/*

=item C<static void trace_system_stack>

Traces the memory block starting at C<< interp->lo_var_ptr >>. This should be
the address of a local variable which has been created on the stack early in
the interpreter's lifecycle. We trace until the address of another local stack
variable in this function, which should be at the "top" of the stack.

=cut

*/

static void
trace_system_stack(PARROT_INTERP)
{
    ASSERT_ARGS(trace_system_stack)
    /* Create a local variable on the system stack. This represents the
       "top" of the stack. A value stored in interp->lo_var_ptr represents
       the "bottom" of the stack. We must trace the entire area between the
       top and bottom. */
    const size_t lo_var_ptr = (size_t)interp->lo_var_ptr;

    trace_mem_block(interp, (size_t)lo_var_ptr,
            (size_t)&lo_var_ptr);
}

#ifndef PLATFORM_STACK_WALK

/*

=item C<static size_t find_common_mask>

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
    for (i = 0; i < bound; i++) {
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

=item C<void trace_mem_block>

Traces the memory block between C<lo_var_ptr> and C<hi_var_ptr>.
Attempt to find pointers to PObjs or buffers, and mark them as "alive"
if found. See src/cpu_dep.c for more information about tracing memory
areas.

=cut

*/

void
trace_mem_block(PARROT_INTERP, size_t lo_var_ptr, size_t hi_var_ptr)
{
    ASSERT_ARGS(trace_mem_block)
    size_t    prefix;
    ptrdiff_t cur_var_ptr;

    const size_t buffer_min = get_min_buffer_address(interp);
    const size_t buffer_max = get_max_buffer_address(interp);
    const size_t pmc_min    = get_min_pmc_address(interp);
    const size_t pmc_max    = get_max_pmc_address(interp);

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
    prefix = mask & buffer_min;

    for (cur_var_ptr = hi_var_ptr;
            (ptrdiff_t)cur_var_ptr < (ptrdiff_t)lo_var_ptr;
            cur_var_ptr = (size_t)((ptrdiff_t)cur_var_ptr + sizeof (void *))) {
        const size_t ptr = *(size_t *)cur_var_ptr;

        /* Do a quick approximate range check by bit-masking */
        if ((ptr & mask) == prefix || !prefix) {
            /* Note that what we find via the stack or registers are not
             * guaranteed to be live pmcs/buffers, and could very well have
             * had their bufstart/vtable destroyed due to the linked list of
             * free headers... */
            if (pmc_min <= ptr && ptr < pmc_max &&
                    is_pmc_ptr(interp, (void *)ptr)) {
                /* ...so ensure that pobject_lives checks PObj_on_free_list_FLAG
                 * before adding it to the next_for_GC list, to have
                 * vtable->mark() called. */
                pobject_lives(interp, (PObj *)ptr);
            }
            else if (buffer_min <= ptr && ptr < buffer_max &&
                    is_buffer_ptr(interp, (void *)ptr)) {
                /* ...and since pobject_lives doesn't care about bufstart, it
                 * doesn't really matter if it sets a flag */
                pobject_lives(interp, (PObj *)ptr);
            }
        }
    }

    return;
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
 * vim: expandtab shiftwidth=4:
 */
