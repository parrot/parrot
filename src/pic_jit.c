/*
Copyright: 2006 The Perl Foundation.  All Rights Reserved.
$Id:$

=head1 NAME

src/pic_jit.c - Polymorphic Inline Cache to JIT compilation

=head1 DESCRIPTION

Some statically known and simple subroutines are replace by
their JITted variants, if

  - JIT is supported and can JIT subroutines
  - arguments passing is simple
  - the code is fully JITtable
  - and more such checks

=head2 Functions

=over 4

=cut

*/

#include "parrot/parrot.h"
#include "parrot/oplib/ops.h"
#include <assert.h>
#ifdef HAVE_COMPUTED_GOTO
#  include "parrot/oplib/core_ops_cgp.h"
#endif

#if HAS_JIT
#include "parrot/exec.h"
#include "parrot/jit.h"

#if PIC_TEST
/*
 * just for testing the whole scheme ...


.sub main :main
    .local int i
    i = 32
    i = __pic_test(i, 10)
    print i
    print "\n"
.end
.sub __pic_test
    .param int i
    .param int j
    $I0 = i + j
    .return ($I0)
.end
... prints 42, if PIC_TEST is 1, because the C function is called
    with -C and -S runcores.
*/

static opcode_t *
pic_test_func(Interp *interpreter, INTVAL *sig_bits, void **args)
{
    opcode_t *pc;
    INTVAL *result, i, j;

    result = (INTVAL*) args[0];
    i = (INTVAL) args[1];
    j = (INTVAL) args[2];
    *result = i + j;
    pc = args[3];
    return pc;
}
#endif

int
parrot_pic_is_save_to_jit(Interp *interpreter, PMC *sub,
	PMC *sig_args, PMC *sig_results)
{
    STRING *name;

    name = VTABLE_get_string(interpreter, sub);
    /* XXX test code */
    if (memcmp((char*) name->strstart, "__pic_test", 10) != 0)
	return 0;
    return 1;
}

funcptr_t 
parrot_pic_JIT_sub(Interp *interpreter, PMC *sub) {
#if PIC_TEST
    UNUSED(interpreter);
    UNUSED(sub);
    return (funcptr_t) pic_test_func;
#else
    /*
     * create JIT code - just a test
     */
    Parrot_jit_info_t *jit_info;
    opcode_t *base, *start, *end;

    base = interpreter->code->base.data;
    start = base + PMC_sub(sub)->start_offs;
    end   = base + PMC_sub(sub)->end_offs;
    /* TODO pass Sub */

    jit_info = parrot_build_asm(interpreter, start, end, NULL,
            JIT_CODE_SUB_REGS_ONLY_REC);
    if (!jit_info)
        return NULLfunc;
    return (funcptr_t) jit_info->arena.start;
#endif
}









#else

int
parrot_pic_is_save_to_jit(Interp *interpreter, PMC *sub,
	PMC *sig_args, PMC *sig_results)
{
    return 0;
}

funcptr_t 
parrot_pic_JIT_sub(Interp *interpreter, PMC *sub) {
    UNUSED(interpreter);
    UNUSED(sub);

    return NULLfunc;
}

#endif     /* HAS_JIT */
   

/*

=back

=head1 AUTHOR

Leopold Toetsch

=head1 SEE ALSO

F<src/pic.c>, F<src/jit.c>, F<ops/core_ops_cgp.c>,
F<include/parrot/pic.h>, F<ops/pic.ops>

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
