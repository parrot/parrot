/*
Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
$Id$

=head1 NAME

src/method_util.c - Utility functions for methods

=head1 DESCRIPTION

Utility functions to handle Parrot calling conventions, lookup methods, etc.

=head2 Functions

=over 4

=cut

*/

#include "parrot/parrot.h"
#include "parrot/method_util.h"

/*

=item C<PMC *
Parrot_new_csub(struct Parrot_Interp *interp, Parrot_csub_t func)>

Create a new native sub.

B<OBSOLETE> Use NCI instead. See F<ops/core.ops>CB<dlfunc> and
F<src/interpreter.c:Parrot_compreg()> for examples.

=cut

*/

PMC *
Parrot_new_csub(struct Parrot_Interp *interp, Parrot_csub_t func)
{
    PMC *ret = pmc_new(interp, enum_class_CSub);
    PMC_struct_val(ret) = (DPOINTER *)F2DPTR(func);
    return ret;
}

/*

=item C<void
Parrot_push_argv(struct Parrot_Interp *interp, INTVAL argc, PMC *argv[])>

Push non-prototyped arguments.

=cut

*/

void
Parrot_push_argv(struct Parrot_Interp *interp, INTVAL argc, PMC *argv[])
{
    interp->int_reg.registers[0] = 0;       /* no prototype */
    interp->int_reg.registers[1] = argc;
    while (argc--) {
        stack_push(interp, &(interp->ctx.user_stack), argv[argc],
                   STACK_ENTRY_PMC, STACK_CLEANUP_NULL);
    }
}

/*

=item C<INTVAL
Parrot_pop_argv(struct Parrot_Interp *interp, PMC ***argv)>

Pop non-prototyped arguments.

=cut

*/

INTVAL
Parrot_pop_argv(struct Parrot_Interp *interp, PMC ***argv)
{
    INTVAL i;
    INTVAL nret = interp->int_reg.registers[1];
    /* NOTE: not using GC'd memory -- free this yourself. */
    *argv = (PMC **)mem_sys_allocate(nret * sizeof(PMC *));

    for (i = 0; i < nret; i++) {
        stack_pop(interp, &(interp->ctx.user_stack), &((*argv)[i]),
                  STACK_ENTRY_PMC);
    }
    return nret;
}

/*

=item C<void
Parrot_push_proto(struct Parrot_Interp *interp,
                  INTVAL intc, INTVAL *intv,
                  INTVAL numc, FLOATVAL *numv,
                  INTVAL strc, STRING **strv, INTVAL pmcc, PMC **pmcv)>

Push prototyped arguments.

=cut

*/

/* XXX: blech, blech, blech.  This is ugly. */
#define push_these(npush, interp, regs, argc, arg, arg2, stacktype) { \
    int i; \
    int nthings = (argc) < 27 ? (argc) : 27; \
    for (i = 0; i < nthings; i++) { \
        (regs)[i + 5] = (arg); \
    } \
    for (i = nthings; i < (argc); i++) { \
        stack_push((interp), &((interp)->ctx.user_stack), (void*)(arg2), \
                   (stacktype), STACK_CLEANUP_NULL); \
    } \
    npush += (i < 27 ? 0 : i - 27); \
}

void
Parrot_push_proto(struct Parrot_Interp *interp,
                  INTVAL intc, INTVAL *intv,
                  INTVAL numc, FLOATVAL *numv,
                  INTVAL strc, STRING **strv, INTVAL pmcc, PMC **pmcv)
{
    int npush;                  /* overflow params */
    interp->int_reg.registers[0] = 1;       /* with proto */
    npush = 0;
    push_these(npush, interp, interp->int_reg.registers, intc, intv[i],
               &(intv[i]), STACK_ENTRY_INT);
    push_these(npush, interp, interp->num_reg.registers, numc, numv[i],
               &(numv[i]), STACK_ENTRY_FLOAT);
    push_these(npush, interp, interp->string_reg.registers, strc,
               strv[i], strv[i], STACK_ENTRY_STRING);
    push_these(npush, interp, interp->pmc_reg.registers, pmcc,
               pmcv[i], pmcv[i], STACK_ENTRY_PMC);

    interp->int_reg.registers[1] = npush;
}

/*

=item C<void
Parrot_init_stash(struct Parrot_Interp *interp, struct method_rec_t *recp,
                  struct Stash *stash)>

Initialize a method stash.

=cut

*/

void
Parrot_init_stash(struct Parrot_Interp *interp, struct method_rec_t *recp,
                  struct Stash *stash)
{
    PMC *k;
    PMC *hash = stash->stash_hash;

    if (hash != NULL)
        return;

    k = key_new(interp);
    stash->stash_hash = hash = pmc_new(interp, enum_class_PerlHash);
    while (recp->name != NULL) {
        PMC *csub = Parrot_new_csub(interp, recp->sub);
        STRING *name = string_make(interp, recp->name, strlen(recp->name),
                                   NULL, 0, NULL);
        key_set_string(interp, k, name);
        VTABLE_set_pmc_keyed(interp, hash, k, csub);
        ++recp;
    }
}

/*

=item C<PMC *
Parrot_find_method(struct Parrot_Interp *interp, struct Stash *stash,
                   PMC *key)>

Lookup a method in a method stash.

=cut

*/

PMC *
Parrot_find_method(struct Parrot_Interp *interp, struct Stash *stash, PMC *key)
{
    while (stash) {
        PMC *meth =
            VTABLE_get_pmc_keyed(interp, stash->stash_hash,
                                                     key);
        if (meth)
            return meth;
        stash = stash->parent_stash;
    }
    return NULL;
}

/*

=back

=head1 HISTORY

Initial revision by Sean, 2002/08/04.

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
