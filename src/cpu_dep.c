/*
Copyright (C) 2001-2008, The Perl Foundation.
$Id$

=head1 NAME

src/cpu_dep.c - CPU-dependent functions

=head1 DESCRIPTION

These functions setup a trace of the current processor context and the
system stack. The trace is set up here in C<trace_system_areas>. This
function gets the current processor context and either traces it
directly or stores it on the system stack. C<trace_system_stack>
sets up a trace of the system stack using two marker addresses as
boundaries. The code to actually perform the trace of a memory block
between two boundaries is located in C<src/gc/dod.c:trace_mem_block>.

=head2 Functions

=over 4

=cut

*/

#include "parrot/parrot.h"

/* HEADERIZER HFILE: include/parrot/dod.h */

/* HEADERIZER BEGIN: static */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

static void trace_system_stack(PARROT_INTERP)
        __attribute__nonnull__(1);

#define ASSERT_ARGS_trace_system_stack __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp)
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: static */

#ifdef __ia64__

#  include <ucontext.h>
extern void *flush_reg_store(void);
#  define BACKING_STORE_BASE 0x80000fff80000000

#endif

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
    ASSERT_ARGS(trace_system_areas);
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
    ASSERT_ARGS(trace_system_stack);
    /* Create a local variable on the system stack. This represents the
       "top" of the stack. A value stored in interp->lo_var_ptr represents
       the "bottom" of the stack. We must trace the entire area between the
       top and bottom. */
    const size_t lo_var_ptr = (size_t)interp->lo_var_ptr;

    trace_mem_block(interp, (size_t)lo_var_ptr,
            (size_t)&lo_var_ptr);
}

/*

=back

=head1 SEE ALSO

F<src/gc/dod.c> and F<include/parrot/dod.h>.

=cut

*/


/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
