/*
Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
$Id$

=head1 NAME

src/cpu_dep.c - CPU-dependent functions

=head1 DESCRIPTION

These functions are called while stackwalking during dead object
destruction. They implement conditional CPU-specific behaviour related
to register windowing.

Register windowing is a technique which avoids having to empty registers
by moving a virtual window up/down the register stack restricting the
number of registers which are visible.

Remember you read something about it in F<docs/infant.dev>?

=head2 Functions

=over 4

=cut

*/

#include "parrot/parrot.h"

#ifdef __ia64__

#  include <ucontext.h>
extern void *flush_reg_store(void);
#  define BACKING_STORE_BASE 0x80000fff80000000

#endif

static void trace_system_stack(Interp *interpreter);

/*

=item C<void trace_system_areas(Interp *interpreter)>

Traces the system stack and any additional CPU-specific areas.

=cut

*/

void
trace_system_areas(Interp *interpreter)
{
#if defined(__sparc) /* Flush register windows */
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

    static void (*fn_ptr)(void) = (void (*)(void))&u.align_hack[0];
    fn_ptr();

#elif defined(__ia64__)

    struct ucontext ucp;
    void *current_regstore_top;

    getcontext(&ucp);
    current_regstore_top = flush_reg_store();

    trace_mem_block(interpreter, 0x80000fff80000000,
				(size_t)current_regstore_top);
#else

#  ifdef PARROT_HAS_HEADER_SETJMP
    Parrot_jump_buff env;

    /* Zero the Parrot_jump_buff, otherwise you will trace stale objects */
    memset(&env, 0, sizeof(env));

    /* this should put registers in env, which then get marked in
     * trace_system_stack below
     */
    setjmp(env);
#  endif

#endif


    trace_system_stack(interpreter);
}

/*

=item C<static void
trace_system_stack(Interp *interpreter)>

Traces the memory block starting at C<< interpreter->lo_var_ptr >>.

=cut

*/

static void
trace_system_stack(Interp *interpreter)
{
    size_t lo_var_ptr = (size_t)interpreter->lo_var_ptr;

    trace_mem_block(interpreter, (size_t)lo_var_ptr,
			   (size_t)&lo_var_ptr);
}

/*

=back

=head1 SEE ALSO

F<src/dod.c>, F<include/parrot/dod.h> and F<docs/infant.dev>.

=cut

*/

/*
 * Local variables:
 * c-indentation-style: bsd
 * c-basic-offset: 4
 * indent-tabs-mode: nil
 * End:
 *
 * vim: expandtab shiftwidth=4:
 */
